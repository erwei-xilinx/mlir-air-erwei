//===- air_mfma_single_tile.mlir --------------------------------*- MLIR -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// A single-tile 16x16 MFMA matmul expressed in AIR dialect, targeting Aster's
// test_002_mfma.mlir output format. This test exercises the air-to-aster pass
// with the wave-centric mapping (herd tile = 1 wavefront).
//
// AIR input:
//   air.launch(1,1)             -> 1x1 GPU grid (single workgroup)
//     air.segment               -> workgroup scope
//       air.herd(1,1)           -> single wave (64 threads on CDNA)
//         L1 allocs (space=2)   -> VGPR registers
//         async dma L3->L1      -> global_load with read_token
//         matmul compute        -> MFMA candidate
//         async dma L1->L3      -> global_store with write_token
//
// Expected Aster output:
//   amdgcn.module target=gfx942 {
//     amdgcn.kernel @forward arguments <[read_only, read_only, write_only]>
//       attributes {block_dims = [64,1,1]} {
//       load_arg 0,1,2 -> SGPR pairs
//       async global_load A -> read_token
//       async global_load B -> read_token
//       wait for loads
//       mfma_f32_16x16x16_f16
//       global_store C -> write_token
//       wait for store
//     }
//   }
//
// RUN: air-opt %s \
// RUN:   -air-dma-to-channel \
// RUN:   -canonicalize -cse \
// RUN:   -air-to-aster="device=gfx942 wave-size=64" \
// RUN:   | FileCheck %s
//
// air-dma-to-channel converts DMAs to channel put/get pairs.
// air-to-aster annotates with GPU target metadata and generates Aster MLIR.
//
// CHECK: air.channel @channel_{{.*}}
//
// CHECK: air.launch
// CHECK-SAME: aster.block_dims = [64, 1, 1]
// CHECK-SAME: aster.target = "gfx942"
//
// CHECK: air.channel.put
//
// CHECK: air.herd
// CHECK-SAME: aster.wave_grid = [1, 1]
//
// CHECK: memref.alloc()
// CHECK-SAME: aster.vgpr_candidate
//
// CHECK: air.channel.get

module {
  func.func @forward(%A: memref<16x16xf16>, %B: memref<16x16xf16>, %C: memref<16x16xf32>) {
    %c1 = arith.constant 1 : index
    air.launch (%arg0, %arg1) in (%arg2=%c1, %arg3=%c1) args(%arg4=%A, %arg5=%B, %arg6=%C) : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
      air.segment @forward_0 args(%arg7=%arg4, %arg8=%arg5, %arg9=%arg6) : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
        %c1_0 = arith.constant 1 : index
        air.herd @herd_0 tile (%tx, %ty) in (%sx=%c1_0, %sy=%c1_0) args(%harg0=%arg7, %harg1=%arg8, %harg2=%arg9) : memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32> {
          // L1 (register) allocations for A, B fragments and C accumulator
          %a_l1 = memref.alloc() : memref<16x16xf16, 2>
          %b_l1 = memref.alloc() : memref<16x16xf16, 2>
          %c_l1 = memref.alloc() : memref<16x16xf32, 2>

          // Initialize C accumulator to zero
          %cst = arith.constant 0.0 : f32
          %c0 = arith.constant 0 : index
          %c16 = arith.constant 16 : index
          %c1_1 = arith.constant 1 : index
          scf.for %i = %c0 to %c16 step %c1_1 {
            scf.for %j = %c0 to %c16 step %c1_1 {
              memref.store %cst, %c_l1[%i, %j] : memref<16x16xf32, 2>
            }
          }

          // Async DMA: global -> L1 (registers)
          %tok_a = air.dma_memcpy_nd async (%a_l1[] [] [], %harg0[] [] []) {id = 1 : i32} : (memref<16x16xf16, 2>, memref<16x16xf16>)
          %tok_b = air.dma_memcpy_nd async (%b_l1[] [] [], %harg1[] [] []) {id = 2 : i32} : (memref<16x16xf16, 2>, memref<16x16xf16>)

          // Wait for loads to complete
          %tok_wait = air.wait_all async [%tok_a, %tok_b]

          // Matmul: C = A @ B^T (MFMA candidate)
          // This nested loop computes a 16x16 matmul and should be recognized
          // as a candidate for v_mfma_f32_16x16x16_f16
          %tok_compute = air.execute [%tok_wait] {
            scf.for %i = %c0 to %c16 step %c1_1 {
              scf.for %j = %c0 to %c16 step %c1_1 {
                scf.for %k = %c0 to %c16 step %c1_1 {
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

          // Async DMA: L1 (registers) -> global
          %tok_store = air.dma_memcpy_nd async [%tok_compute] (%harg2[] [] [], %c_l1[] [] []) {id = 3 : i32} : (memref<16x16xf32>, memref<16x16xf32, 2>)

          // Wait for store
          air.wait_all [%tok_store]

          memref.dealloc %a_l1 : memref<16x16xf16, 2>
          memref.dealloc %b_l1 : memref<16x16xf16, 2>
          memref.dealloc %c_l1 : memref<16x16xf32, 2>
        }
      }
    }
    return
  }
}
