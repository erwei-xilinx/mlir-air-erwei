module {
  func.func @coop(%arg0: memref<8xf32>) {
    %c1 = arith.constant 1 : index
    air.launch (%bx, %by) in (%nbx=%c1, %nby=%c1) args(%out=%arg0) : memref<8xf32> {
      air.segment @seg args(%s0=%out) : memref<8xf32> {
        %c1_s = arith.constant 1 : index
        %r = air.chiplet_block_id
        %n = air.chiplet_dim_blocks
        %f = arith.index_cast %r : index to i32
        %g = arith.sitofp %f : i32 to f32
        memref.store %g, %s0[%n] : memref<8xf32>
        air.herd @herd tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
