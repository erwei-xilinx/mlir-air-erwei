module {
  memref.global "private" @scratch : memref<64xi32> = uninitialized
  func.func @k(%arg0: memref<8xf32>) {
    %c1 = arith.constant 1 : index
    air.launch (%bx, %by) in (%nbx=%c1, %nby=%c1) args(%out=%arg0) : memref<8xf32> {
      air.segment @seg args(%s0=%out) : memref<8xf32> {
        %c1_s = arith.constant 1 : index
        %c0 = arith.constant 0 : index
        %g = memref.get_global @scratch : memref<64xi32>
        %v = memref.load %g[%c0] : memref<64xi32>
        %f = arith.sitofp %v : i32 to f32
        memref.store %f, %s0[%c0] : memref<8xf32>
        air.herd @herd tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
