# ./python/test/compiler/linalg_op_stats.py -*- Python -*-

# Copyright (C) 2021=2022, Xilinx Inc.
# Copyright (C) 2022, Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

# RUN: %PYTHON %s | FileCheck %s
from air.ir import *
from air.dialects.air import module_builder
from air.dialects import func
from air.dialects import linalg
from air.dialects.linalg.opdsl.lang import *

from air.compiler.util import CostModel


def run(f):
    print("\nTEST:", f.__name__)
    f()
    return f


@linalg_structured_op
def matmul_mono(
    A=TensorDef(T, S.M, S.K),
    B=TensorDef(T, S.K, S.N),
    C=TensorDef(T, S.M, S.N, output=True),
):
    domain(D.m, D.n, D.k)
    C[D.m, D.n] += A[D.m, D.k] * B[D.k, D.n]


# CHECK-LABEL: TEST: matmul_on_buffers_test
# CHECK:"matmul_on_buffers": {
# CHECK:  "linalg.generic{{.*}}": {
# CHECK:    "arith.addf": 512,
# CHECK:    "arith.mulf": 512,
# CHECK:    "reads": 1536,
# CHECK:    "writes": 512
@run
def matmul_on_buffers_test():
    @module_builder
    def my_module():
        f32 = F32Type.get()

        @func.FuncOp.from_py_func(
            MemRefType.get((4, 16), f32),
            MemRefType.get((16, 8), f32),
            MemRefType.get((4, 8), f32),
        )
        def matmul_on_buffers(lhs, rhs, out):
            matmul_mono(lhs, rhs, outs=[out])

    module = my_module()
    print(CostModel().op_stats(module.operation))
