//===- air_channel_mfma.mlir ------------------------------------*- MLIR -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// A single-tile 16x16 MFMA matmul using AIR channels and async tokens.
// This represents what a real AIR pipeline produces after:
//   air-par-to-launch -> air-par-to-herd -> air-copy-to-dma ->
//   air-dependency -> air-dma-to-channel
//
// Structure:
//   air.channel @channel_a, @channel_b: L3 -> L1 data movement for A, B tiles
//   air.channel @channel_c:             L1 -> L3 result writeback
//   air.launch(1,1) -> air.segment -> air.herd(1,1)
//     Segment scope: channel.put from L3 into channels (data producer)
//     Herd scope:    channel.get into L1, matmul, channel.put result back
//     Segment scope: channel.get result from L1 to L3 (data consumer)
//
// Target Aster output: test_002_mfma.mlir format with:
//   async load_A/B -> read_token (from channel.get + L3 source)
//   mfma_f32_16x16x16_f16      (from matmul in herd body)
//   async store_C -> write_token (from channel.put + L3 dest)
//
// RUN: air-opt %s -air-to-aster="device=gfx942 wave-size=64" | FileCheck %s
//
// Launch with Aster target metadata
// CHECK: air.launch
// CHECK-SAME: aster.block_dims = [64, 1, 1]
// CHECK-SAME: aster.isa = "cdna3"
// CHECK-SAME: aster.target = "gfx942"
//
// Segment scope: channel puts from L3 (data producers)
// CHECK: air.channel.put async{{.*}}@channel_a
// CHECK: air.channel.put async{{.*}}@channel_b
//
// Herd with wave mapping
// CHECK: air.herd
// CHECK-SAME: aster.wave_grid = [1, 1]
//
// L1 allocations annotated as VGPR candidates
// CHECK: memref.alloc()
// CHECK-SAME: aster.vgpr_candidate
//
// Herd scope: channel gets into L1
// CHECK: air.channel.get async{{.*}}@channel_a
// CHECK: air.channel.get async{{.*}}@channel_b
//
// Herd scope: result channel put from L1
// CHECK: air.channel.put async{{.*}}@channel_c
//
// Segment scope: channel get result back to L3
// CHECK: air.channel.get async{{.*}}@channel_c

module {
  // Channel declarations: named half-DMA data movement
  air.channel @channel_a [1, 1]   // A tile: L3 -> L1
  air.channel @channel_b [1, 1]   // B tile: L3 -> L1
  air.channel @channel_c [1, 1]   // C tile: L1 -> L3

  func.func @forward(%A: memref<16x16xf16>, %B: memref<16x16xf16>, %C: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index

    air.launch (%arg0, %arg1) in (%arg2=%c1, %arg3=%c1)
        args(%arg4=%A, %arg5=%B, %arg6=%C)
        : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
      air.segment @seg_0 args(%seg_a=%arg4, %seg_b=%arg5, %seg_c=%arg6)
          : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
        %c0_s = arith.constant 0 : index
        %c1_s = arith.constant 1 : index
        %c16_s = arith.constant 16 : index

        // ---- Data producer: L3 -> channel (segment scope) ----
        // Put A tile from L3 into channel_a
        %tok_put_a = air.channel.put async @channel_a[] (%seg_a[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 1 : i32} : (memref<16x16xf16>)
        // Put B tile from L3 into channel_b
        %tok_put_b = air.channel.put async @channel_b[] (%seg_b[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 2 : i32} : (memref<16x16xf16>)

        // ---- Compute: herd scope (1 wave) ----
        air.herd @herd_0 tile (%tx, %ty) in (%sx=%c1_s, %sy=%c1_s) {
          %c0_h = arith.constant 0 : index
          %c1_h = arith.constant 1 : index
          %c16_h = arith.constant 16 : index
          %cst = arith.constant 0.0 : f32

          // L1 (VGPR) allocations
          %a_l1 = memref.alloc() : memref<16x16xf16, 2>
          %b_l1 = memref.alloc() : memref<16x16xf16, 2>
          %c_l1 = memref.alloc() : memref<16x16xf32, 2>

          // Initialize C accumulator to zero
          %tok_init = air.execute {
            scf.for %i = %c0_h to %c16_h step %c1_h {
              scf.for %j = %c0_h to %c16_h step %c1_h {
                memref.store %cst, %c_l1[%i, %j] : memref<16x16xf32, 2>
              }
            }
            air.execute_terminator
          }

          // Get A tile from channel into L1 (async)
          %tok_get_a = air.channel.get async @channel_a[] (%a_l1[] [] []) {id = 3 : i32} : (memref<16x16xf16, 2>)
          // Get B tile from channel into L1 (async)
          %tok_get_b = air.channel.get async @channel_b[] (%b_l1[] [] []) {id = 4 : i32} : (memref<16x16xf16, 2>)

          // Wait for all data to be ready
          %tok_ready = air.wait_all async [%tok_init, %tok_get_a, %tok_get_b]

          // Matmul: C += A @ B^T (MFMA candidate: 16x16x16 f16->f32)
          %tok_compute = air.execute [%tok_ready] {
            scf.for %i = %c0_h to %c16_h step %c1_h {
              scf.for %j = %c0_h to %c16_h step %c1_h {
                scf.for %k = %c0_h to %c16_h step %c1_h {
                  %a_val = memref.load %a_l1[%i, %k] : memref<16x16xf16, 2>
                  %b_val = memref.load %b_l1[%j, %k] : memref<16x16xf16, 2>
                  %c_val = memref.load %c_l1[%i, %j] : memref<16x16xf32, 2>
                  %a_f32 = arith.extf %a_val : f16 to f32
                  %b_f32 = arith.extf %b_val : f16 to f32
                  %prod = arith.mulf %a_f32, %b_f32 : f32
                  %sum = arith.addf %c_val, %prod : f32
                  memref.store %sum, %c_l1[%i, %j] : memref<16x16xf32, 2>
                }
              }
            }
            air.execute_terminator
          }

          // Put result C tile back into channel (async)
          %tok_put_c = air.channel.put async [%tok_compute] @channel_c[] (%c_l1[] [] []) {id = 5 : i32} : (memref<16x16xf32, 2>)

          air.wait_all [%tok_put_c]

          memref.dealloc %a_l1 : memref<16x16xf16, 2>
          memref.dealloc %b_l1 : memref<16x16xf16, 2>
          memref.dealloc %c_l1 : memref<16x16xf32, 2>
        }

        // ---- Data consumer: channel -> L3 (segment scope) ----
        // Get result C from channel back to L3
        %tok_get_c = air.channel.get async [%tok_put_a, %tok_put_b] @channel_c[] (%seg_c[%c0_s, %c0_s] [%c16_s, %c16_s] [%c16_s, %c1_s]) {id = 6 : i32} : (memref<16x16xf32>)

        air.wait_all [%tok_get_c]
      }
    }
    return
  }
}
