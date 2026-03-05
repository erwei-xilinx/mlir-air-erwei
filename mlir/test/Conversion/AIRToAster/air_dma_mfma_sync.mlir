//===- air_dma_mfma_sync.mlir -----------------------------------*- MLIR -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// A synchronous single-tile 16x16 MFMA matmul using air.dma_memcpy_nd ops
// (before channel conversion). This is the earliest AIR representation after
// tiling and DMA insertion but before any dependency analysis or channel
// conversion.
//
// Full pipeline:
//   [this file]  (sync AIR with DMAs, no channels, no tokens)
//     -> air-dependency              (auto-insert async tokens)
//     -> air-dependency-canonicalize (optimize token graph)
//     -> air-dma-to-channel          (split DMAs into channel put/get pairs)
//     -> air-to-aster                (annotate for Aster codegen)
//     -> [Python bridge]             (generate Aster MLIR)
//     -> aster-opt + aster-translate (assembly)
//
// RUN: air-opt %s \
// RUN:   -air-dependency \
// RUN:   -air-dependency-canonicalize \
// RUN:   -air-dma-to-channel \
// RUN:   -canonicalize -cse \
// RUN:   -air-to-aster="device=gfx942 wave-size=64" \
// RUN:   | FileCheck %s
//
// air-dma-to-channel should create channel declarations
// CHECK: air.channel @channel_{{.*}}
//
// Launch with Aster annotations
// CHECK: air.launch
// CHECK-SAME: aster.target = "gfx942"
//
// DMA split into channel.put at segment scope
// CHECK: air.channel.put
//
// Herd with wave mapping
// CHECK: air.herd
// CHECK-SAME: aster.wave_grid = [1, 1]
//
// L1 allocs as VGPR candidates (inside air.execute, before channel.get)
// CHECK: memref.alloc()
// CHECK-SAME: aster.vgpr_candidate
//
// Channel.get inside herd (data consumers)
// CHECK: air.channel.get

#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>

module {
  func.func @forward(%A: memref<16x16xf16>, %B: memref<16x16xf16>, %C: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f32

    air.launch (%arg0, %arg1) in (%arg2=%c1, %arg3=%c1)
        args(%arg4=%A, %arg5=%B, %arg6=%C)
        : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
      air.segment @seg_0 args(%seg_a=%arg4, %seg_b=%arg5, %seg_c=%arg6)
          : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
        %c0_s = arith.constant 0 : index
        %c1_s = arith.constant 1 : index
        %c16_s = arith.constant 16 : index
        %cst_s = arith.constant 0.000000e+00 : f32

        air.herd @herd_0 tile (%tx, %ty) in (%sx=%c1_s, %sy=%c1_s)
            args(%h_a=%seg_a, %h_b=%seg_b, %h_c=%seg_c)
            : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
          %c0_h = arith.constant 0 : index
          %c1_h = arith.constant 1 : index
          %c16_h = arith.constant 16 : index
          %cst_h = arith.constant 0.000000e+00 : f32

          // L1 allocations
          %a_l1 = memref.alloc() : memref<16x16xf16, 2>
          %b_l1 = memref.alloc() : memref<16x16xf16, 2>
          %c_l1 = memref.alloc() : memref<16x16xf32, 2>

          // DMA: load A tile from L3 to L1
          air.dma_memcpy_nd (%a_l1[] [] [], %h_a[%c0_h, %c0_h] [%c16_h, %c16_h] [%c16_h, %c1_h]) {id = 1 : i32} : (memref<16x16xf16, 2>, memref<16x16xf16>)
          // DMA: load B tile from L3 to L1
          air.dma_memcpy_nd (%b_l1[] [] [], %h_b[%c0_h, %c0_h] [%c16_h, %c16_h] [%c16_h, %c1_h]) {id = 2 : i32} : (memref<16x16xf16, 2>, memref<16x16xf16>)
          // DMA: load C tile from L3 to L1 (for accumulation)
          air.dma_memcpy_nd (%c_l1[] [] [], %h_c[%c0_h, %c0_h] [%c16_h, %c16_h] [%c16_h, %c1_h]) {id = 3 : i32} : (memref<16x16xf32, 2>, memref<16x16xf32>)

          // Matmul: C += A @ B^T (MFMA candidate)
          linalg.generic {
            indexing_maps = [#map, #map1, #map2],
            iterator_types = ["parallel", "parallel", "reduction"]
          } ins(%a_l1, %b_l1 : memref<16x16xf16, 2>, memref<16x16xf16, 2>)
            outs(%c_l1 : memref<16x16xf32, 2>) {
          ^bb0(%a_val: f16, %b_val: f16, %c_val: f32):
            %a_f32 = arith.extf %a_val : f16 to f32
            %b_f32 = arith.extf %b_val : f16 to f32
            %prod = arith.mulf %a_f32, %b_f32 : f32
            %sum = arith.addf %c_val, %prod : f32
            linalg.yield %sum : f32
          }

          // DMA: store C tile from L1 back to L3
          air.dma_memcpy_nd (%h_c[%c0_h, %c0_h] [%c16_h, %c16_h] [%c16_h, %c1_h], %c_l1[] [] []) {id = 4 : i32} : (memref<16x16xf32>, memref<16x16xf32, 2>)

          memref.dealloc %a_l1 : memref<16x16xf16, 2>
          memref.dealloc %b_l1 : memref<16x16xf16, 2>
          memref.dealloc %c_l1 : memref<16x16xf32, 2>
        }
      }
    }
    return
  }
}
