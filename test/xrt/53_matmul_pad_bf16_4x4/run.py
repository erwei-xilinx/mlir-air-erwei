# Copyright (C) 2026, Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

# Test: i32 matmul with DMA padding — A:[K,M]=A:[16,500], B:[16,512], C:[512,512]
#
# A is stored transposed [K,M] so M=500 is contiguous, enabling
# element-level DMA padding (125->128 per herd slot) at the memtile BD.
# i32 data allows non-unit innermost DMA stride and word-aligned padding.
# K=16 (small) to keep scalar compute fast (no HW matmul for i32).
# B: host zero-pads from [16,500] to [16,512].
# 4x4 AIE herd, scalar linalg.generic matmul.

import argparse
import sys

import numpy as np

from air.ir import *
from air.dialects.affine import apply as affine_apply
from air.dialects.linalg import fill
from air.dialects.air import *
from air.dialects.arith import ConstantOp
from air.dialects.memref import AllocOp, DeallocOp
from air.dialects.func import FuncOp
from air.dialects.scf import for_, yield_
from air.backend.xrt_runner import XRTRunner, type_mapper
from air.extras import types as extrasT
from air.dialects.linalg.opdsl.lang import *
import air.dialects.linalg.opdsl.lang as linalg_lang

np.random.seed(42)
range_ = for_

M_RAW = 500
K = 16  # small K for scalar compute
N_RAW = 500
N = 512

TILE_M = 128
TILE_N = 64
HERD_M = 4
HERD_N = 4
LAUNCH_N = N // (TILE_N * HERD_N)

M_PAD = TILE_M * HERD_M
M_REAL_PER_SLOT = M_RAW // HERD_M
M_PAD_PER_SLOT = TILE_M - M_REAL_PER_SLOT

INPUT_DATATYPE = np.int32
OUTPUT_DATATYPE = np.int32


# C[m,n] += A[k,m] * B[k,n]  (A is K-major)
@linalg_structured_op()
def matmul_km(
    A=TensorDef(linalg_lang.TV.T1, S.K, S.M),
    B=TensorDef(linalg_lang.TV.T2, S.K, S.N),
    C=TensorDef(linalg_lang.TV.U, S.M, S.N, output=True),
):
    domain(D.m, D.n, D.k)
    C[D.m, D.n] += TypeFn.cast_signed(
        linalg_lang.TV.U, A[D.k, D.m]
    ) * TypeFn.cast_signed(linalg_lang.TV.U, B[D.k, D.n])


@module_builder
def build_module():
    xrt_dtype = type_mapper(INPUT_DATATYPE)

    memrefTyA = MemRefType.get([K, M_RAW], xrt_dtype)
    memrefTyB = MemRefType.get([K, N], xrt_dtype)
    memrefTyOut = MemRefType.get([M_PAD, N], xrt_dtype)

    l1_mem = IntegerAttr.get(extrasT.i32(), MemorySpace.L1)
    l1TyA = MemRefType.get([K, TILE_M], xrt_dtype, memory_space=l1_mem)
    l1TyB = MemRefType.get([K, TILE_N], xrt_dtype, memory_space=l1_mem)
    l1TyC = MemRefType.get([TILE_M, TILE_N], xrt_dtype, memory_space=l1_mem)

    @FuncOp.from_py_func(memrefTyA, memrefTyB, memrefTyOut)
    def matmul_pad(arg0, arg1, arg2):

        @launch(operands=[arg0, arg1, arg2], sizes=[1, LAUNCH_N])
        def launch_body(lvx, lvy, lsx, lsy, l3_a, l3_b, l3_c):
            @segment(name="seg", operands=[lvy, l3_a, l3_b, l3_c])
            def segment_body(lvy_s, l3_a_s, l3_b_s, l3_c_s):
                l2_mem = IntegerAttr.get(extrasT.i32(), MemorySpace.L2)
                l2TyA = MemRefType.get(
                    [HERD_M, K, M_REAL_PER_SLOT], xrt_dtype, memory_space=l2_mem
                )
                l2TyB = MemRefType.get(
                    [HERD_N, K, TILE_N], xrt_dtype, memory_space=l2_mem
                )
                l2TyC = MemRefType.get(
                    [HERD_M, HERD_N, TILE_M, TILE_N],
                    xrt_dtype,
                    memory_space=l2_mem,
                )

                l2_a = AllocOp(l2TyA, [], [])
                l2_b = AllocOp(l2TyB, [], [])
                l2_c = AllocOp(l2TyC, [], [])

                n_off_map = AffineMap.get(
                    0,
                    1,
                    [
                        AffineExpr.get_mul(
                            AffineSymbolExpr.get(0),
                            AffineConstantExpr.get(TILE_N * HERD_N),
                        )
                    ],
                )
                n_off = affine_apply(n_off_map, [lvy_s])

                # L3->L2 A: [K,M] layout, herd_m groups of 125 M cols
                dma_memcpy_nd(
                    l2_a,
                    l3_a_s,
                    src_offsets=[0, 0, 0],
                    src_sizes=[HERD_M, K, M_REAL_PER_SLOT],
                    src_strides=[M_REAL_PER_SLOT, M_RAW, 1],
                )

                # L3->L2 B
                dma_memcpy_nd(
                    l2_b,
                    l3_b_s,
                    src_offsets=[0, 0, n_off],
                    src_sizes=[HERD_N, K, TILE_N],
                    src_strides=[TILE_N, N, 1],
                )

                @herd(
                    name="herd_0",
                    sizes=[HERD_M, HERD_N],
                    operands=[l2_a, l2_b, l2_c],
                )
                def herd_body(_tx, _ty, _sx, _sy, _l2_a, _l2_b, _l2_c):
                    l1_a = AllocOp(l1TyA, [], [])
                    l1_b = AllocOp(l1TyB, [], [])
                    l1_c = AllocOp(l1TyC, [], [])

                    # L2->L1 A with M padding (125->128)
                    dma_memcpy_nd(
                        l1_a,
                        _l2_a,
                        src_offsets=[_tx, 0, 0],
                        src_sizes=[1, K, M_REAL_PER_SLOT],
                        src_strides=[K * M_REAL_PER_SLOT, M_REAL_PER_SLOT, 1],
                        pad_before=[0, 0, 0],
                        pad_after=[0, 0, M_PAD_PER_SLOT],
                    )

                    # L2->L1 B (no padding)
                    dma_memcpy_nd(
                        l1_b,
                        _l2_b,
                        src_offsets=[_ty, 0, 0],
                        src_sizes=[1, K, TILE_N],
                        src_strides=[K * TILE_N, TILE_N, 1],
                    )

                    # Init + matmul
                    zero = ConstantOp(IntegerAttr.get(xrt_dtype, 0), None)
                    fill(zero, outs=[l1_c])
                    matmul_km(l1_a, l1_b, outs=[l1_c])

                    # L1->L2 C
                    dma_memcpy_nd(
                        _l2_c,
                        l1_c,
                        dst_offsets=[_tx, _ty, 0, 0],
                        dst_sizes=[1, 1, TILE_M, TILE_N],
                        dst_strides=[
                            HERD_N * TILE_M * TILE_N,
                            TILE_M * TILE_N,
                            TILE_N,
                            1,
                        ],
                    )

                    DeallocOp(l1_a)
                    DeallocOp(l1_b)
                    DeallocOp(l1_c)

                # L2->L3 C
                dma_memcpy_nd(
                    l3_c_s,
                    l2_c,
                    dst_offsets=[0, n_off],
                    dst_sizes=[M_PAD, HERD_N * TILE_N],
                    dst_strides=[N, 1],
                    src_offsets=[0, 0, 0, 0],
                    src_sizes=[HERD_M, TILE_M, HERD_N, TILE_N],
                    src_strides=[
                        TILE_M * HERD_N * TILE_N,
                        TILE_N,
                        TILE_M * TILE_N,
                        1,
                    ],
                )

                DeallocOp(l2_a)
                DeallocOp(l2_b)
                DeallocOp(l2_c)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="run.py",
        description="i32 matmul A[16,500]*B[16,500] with DMA padding on 4x4 herd",
    )
    parser.add_argument("-v", "--verbose", action="store_true")
    parser.add_argument("-p", "--print-module-only", action="store_true")

    args = parser.parse_args()

    mlir_module = build_module()

    if args.print_module_only:
        print(mlir_module)
        sys.exit(0)

    input_a = (
        (np.arange(0, K * M_RAW, dtype=np.int64) % 8)
        .astype(INPUT_DATATYPE)
        .reshape(K, M_RAW)
    )
    input_b_raw = (
        (np.arange(0, K * N_RAW, dtype=np.int64) % 8)
        .astype(INPUT_DATATYPE)
        .reshape(K, N_RAW)
    )
    input_b = np.zeros((K, N), dtype=INPUT_DATATYPE)
    input_b[:, :N_RAW] = input_b_raw

    num_samples = 100
    sampled_indices = np.vstack(
        [
            np.random.randint(0, M_RAW, num_samples),
            np.random.randint(0, N_RAW, num_samples),
        ]
    )
    sampled_values = np.array(
        [
            np.sum(
                input_a[:, i].astype(np.int64) * input_b_raw[:, j].astype(np.int64),
                dtype=np.int64,
            )
            for i, j in zip(*sampled_indices)
        ],
        dtype=OUTPUT_DATATYPE,
    )

    sampled_data = {
        "shape": (M_PAD, N),
        "indices": sampled_indices,
        "values": sampled_values,
    }

    runner = XRTRunner(
        verbose=args.verbose,
        omit_while_true_loop=False,
        runtime_loop_tiling_sizes=[1, 2],
        instance_name="matmul_pad",
    )
    exit(
        runner.run_test(
            mlir_module,
            inputs=[input_a, input_b],
            stochastic_expected_outputs=[sampled_data],
        )
    )
