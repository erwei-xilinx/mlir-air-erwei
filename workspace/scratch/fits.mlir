module {
  func.func @fits(%arg0: memref<8xf32>) {
    %c2 = arith.constant 2 : index
    air.launch (%bx, %by) in (%nbx=%c2, %nby=%c2) args(%out=%arg0) : memref<8xf32> {
      air.segment @seg args(%s0=%out) : memref<8xf32> {
        %c1_s = arith.constant 1 : index
        %n = air.chiplet_dim_blocks
        %f = arith.constant 1.0 : f32
        memref.store %f, %s0[%n] : memref<8xf32>
        air.herd @herd tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
