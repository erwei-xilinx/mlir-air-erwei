//===- air_channel_mfma_sync.mlir -------------------------------*- MLIR -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// A synchronous (no async tokens) single-tile 16x16 MFMA matmul using AIR
// channels. This represents what the AIR frontend produces BEFORE air-dependency
// runs. The full pipeline is:
//
//   [this file]  (sync AIR with channels, no tokens)
//     -> air-dependency            (auto-insert async tokens from data deps)
//     -> air-dependency-canonicalize  (optimize token graph)
//     -> air-to-aster              (annotate for Aster codegen)
//     -> [Python bridge]           (generate Aster MLIR)
//     -> aster-opt                 (full pipeline to register-allocated IR)
//     -> aster-translate           (emit gfx942 assembly)
//
// RUN: air-opt %s -air-dependency -air-dependency-canonicalize -air-to-aster="device=gfx942 wave-size=64" | FileCheck %s
//
// air-dependency should insert async tokens on all operations
// CHECK: air.launch
// CHECK-SAME: aster.block_dims = [64, 1, 1]
// CHECK-SAME: aster.target = "gfx942"
//
// Channel puts should have async tokens after air-dependency
// CHECK: air.channel.put async
// CHECK-SAME: @channel_a
// CHECK: air.channel.put async
// CHECK-SAME: @channel_b
//
// Herd should have wave mapping from air-to-aster
// CHECK: air.herd
// CHECK-SAME: aster.wave_grid = [1, 1]
//
// L1 allocs annotated as VGPR candidates
// CHECK: memref.alloc()
// CHECK-SAME: aster.vgpr_candidate
//
// Channel gets inside herd should have async tokens
// CHECK: air.channel.get async
// CHECK-SAME: @channel_a
// CHECK: air.channel.get async
// CHECK-SAME: @channel_b
//
// Matmul compute inside air.execute with dependency on gets
// CHECK: air.execute
//
// Result put back via channel
// CHECK: air.channel.put async
// CHECK-SAME: @channel_c
//
// Segment-scope: get result back to L3
// CHECK: air.channel.get async
// CHECK-SAME: @channel_c

#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>

module {
  // Channel declarations
  air.channel @channel_a [1, 1]   // A tile: L3 -> herd L1
  air.channel @channel_b [1, 1]   // B tile: L3 -> herd L1
  air.channel @channel_c [1, 1]   // C tile: herd L1 -> L3

  func.func @forward(%A: memref<16x16xf16>, %B: memref<16x16xf16>, %C: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index

    // No 'async' keyword — air-dependency will add tokens
    air.launch (%arg0, %arg1) in (%arg2=%c1, %arg3=%c1)
        args(%arg4=%A, %arg5=%B, %arg6=%C)
        : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
      air.segment @seg_0 args(%seg_a=%arg4, %seg_b=%arg5, %seg_c=%arg6)
          : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
        %c0_s = arith.constant 0 : index
        %c1_s = arith.constant 1 : index
        %c16_s = arith.constant 16 : index

        // ---- Data producer: L3 -> channel (no async) ----
        air.channel.put @channel_a[] (%seg_a[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 1 : i32} : (memref<16x16xf16>)
        air.channel.put @channel_b[] (%seg_b[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 2 : i32} : (memref<16x16xf16>)

        // ---- Compute herd (no async) ----
        air.herd @herd_0 tile (%tx, %ty) in (%sx=%c1_s, %sy=%c1_s) {
          %c0_h = arith.constant 0 : index
          %c1_h = arith.constant 1 : index
          %c16_h = arith.constant 16 : index
          %cst = arith.constant 0.000000e+00 : f32

          // L1 (VGPR) allocations — plain, air-dependency wraps in air.execute
          %a_l1 = memref.alloc() : memref<16x16xf16, 2>
          %b_l1 = memref.alloc() : memref<16x16xf16, 2>
          %c_l1 = memref.alloc() : memref<16x16xf32, 2>

          // Zero initialize C
          linalg.fill ins(%cst : f32) outs(%c_l1 : memref<16x16xf32, 2>)

          // Get A and B tiles from channels into L1 (no async)
          air.channel.get @channel_a[] (%a_l1[] [] []) {id = 3 : i32} : (memref<16x16xf16, 2>)
          air.channel.get @channel_b[] (%b_l1[] [] []) {id = 4 : i32} : (memref<16x16xf16, 2>)

          // Matmul: C += A @ B^T  (MFMA candidate)
          // Using linalg.generic for a clean representation
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

          // Put result back into channel (no async)
          air.channel.put @channel_c[] (%c_l1[] [] []) {id = 5 : i32} : (memref<16x16xf32, 2>)

          memref.dealloc %a_l1 : memref<16x16xf16, 2>
          memref.dealloc %b_l1 : memref<16x16xf16, 2>
          memref.dealloc %c_l1 : memref<16x16xf32, 2>
        }

        // ---- Data consumer: channel -> L3 (no async) ----
        air.channel.get @channel_c[] (%seg_c[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 6 : i32} : (memref<16x16xf32>)
      }
    }
    return
  }
}
