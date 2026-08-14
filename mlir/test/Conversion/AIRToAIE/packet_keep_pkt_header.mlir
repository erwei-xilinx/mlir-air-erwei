//===- packet_keep_pkt_header.mlir -----------------------------*- MLIR -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

// RUN: air-opt %s -air-to-aie="row-offset=3 col-offset=2 device=xcve2802" -split-input-file | FileCheck %s

// The two header markers are INDEPENDENT, and air-to-aie reads each for its own
// question:
//
//   air.src_writes_pkt_header  SOURCE-side. The payload already contains the
//                              routing word, so do NOT stamp a pkt_id on the
//                              producer BD -- that would prepend a second
//                              header and shift the payload.
//   keep_pkt_header            DESTINATION-side. Emit the aie.packet_flow with
//                              {keep_pkt_header = true} so the switchbox
//                              delivers the header word instead of stripping
//                              it.
//
// keep_pkt_header used to imply the first as well. It cannot: whether the
// receiver sees the header says nothing about who wrote it. Every design
// predating the `dest` operand happened to want both, which made the two look
// equivalent and left the other combinations unreachable. This module is
// both-on; the one below is keep-only, which now means a DMA-stamped id the
// receiver can read back.

// CHECK: aie.dma_bd({{.*}}memref<8xbf16, 2> offset = 0 len = 8) {task_id = 0 : i32}
// CHECK-NOT: packet = #aie.packet_info
// CHECK: aie.packet_flow(0) {
// CHECK-NEXT: aie.packet_source<%{{.*}}, DMA : 0>
// CHECK-NEXT: aie.packet_dest<%{{.*}}, DMA : 0>
// CHECK-NEXT: } {keep_pkt_header = true}

air.channel @k [1, 1] {air.src_writes_pkt_header, channel_type = "npu_dma_packet", keep_pkt_header}
func.func @f() {
  %c1 = arith.constant 1 : index
  air.launch (%a, %b) in (%c=%c1, %d=%c1) {
    air.segment @seg {
      %c1_0 = arith.constant 1 : index
      %t, %l2 = air.execute -> (memref<8xbf16, 1>) {
        %alloc = memref.alloc() : memref<8xbf16, 1>
        air.execute_terminator %alloc : memref<8xbf16, 1>
      }
      air.channel.get @k[] (%l2[] [] []) : (memref<8xbf16, 1>)
      %d_ = air.execute { memref.dealloc %l2 : memref<8xbf16, 1> }
      air.herd @h tile (%tx, %ty) in (%sx=%c1_0, %sy=%c1_0)
            attributes {x_loc = 2 : i64, y_loc = 3 : i64} {
        %tok, %l1 = air.execute -> (memref<8xbf16, 2>) {
          %aa = memref.alloc() : memref<8xbf16, 2>
          air.execute_terminator %aa : memref<8xbf16, 2>
        }
        air.channel.put @k[] (%l1[] [] []) : (memref<8xbf16, 2>)
        %d0 = air.execute {memref.dealloc %l1 : memref<8xbf16, 2>}
      }
    }
  }
  return
}

// -----

// keep_pkt_header ALONE: nothing says the source writes the header, so the DMA
// stamps it as usual -- and the switchbox still delivers it, because that is a
// separate decision. The receiver gets [id | payload] and can tell which
// producer sent it.
//
// This combination was unreachable while keep_pkt_header doubled as the
// source-side marker: asking to keep the header suppressed the only thing that
// would have written one, so the flow carried no id at all.

// CHECK: aie.dma_bd({{.*}}) {packet = #aie.packet_info<pkt_type = 0, pkt_id = {{[0-9]+}}>
// CHECK: aie.packet_flow
// CHECK: {keep_pkt_header = true}

air.channel @stamped [1, 1] {channel_type = "npu_dma_packet", keep_pkt_header}
func.func @g() {
  %c1 = arith.constant 1 : index
  air.launch (%a, %b) in (%c=%c1, %d=%c1) {
    air.segment @seg {
      %c1_0 = arith.constant 1 : index
      %t, %l2 = air.execute -> (memref<8xbf16, 1>) {
        %alloc = memref.alloc() : memref<8xbf16, 1>
        air.execute_terminator %alloc : memref<8xbf16, 1>
      }
      air.channel.get @stamped[] (%l2[] [] []) : (memref<8xbf16, 1>)
      %d_ = air.execute { memref.dealloc %l2 : memref<8xbf16, 1> }
      air.herd @h tile (%tx, %ty) in (%sx=%c1_0, %sy=%c1_0)
            attributes {x_loc = 2 : i64, y_loc = 3 : i64} {
        %tok, %l1 = air.execute -> (memref<8xbf16, 2>) {
          %aa = memref.alloc() : memref<8xbf16, 2>
          air.execute_terminator %aa : memref<8xbf16, 2>
        }
        air.channel.put @stamped[] (%l1[] [] []) : (memref<8xbf16, 2>)
        %dd = air.execute { memref.dealloc %l1 : memref<8xbf16, 2> }
      }
    }
  }
  return
}
