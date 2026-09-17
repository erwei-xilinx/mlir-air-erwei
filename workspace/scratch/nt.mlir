module {
  func.func @stream(%arg0: memref<64xf32>, %arg1: memref<64xf32>) {
    %c1 = arith.constant 1 : index
    air.launch (%bx, %by) in (%nbx=%c1, %nby=%c1) args(%in=%arg0, %out=%arg1) : memref<64xf32>, memref<64xf32> {
      air.segment @seg args(%s0=%in, %s1=%out) : memref<64xf32>, memref<64xf32> {
        %c1_s = arith.constant 1 : index
        %c0 = arith.constant 0 : index
        %v = memref.load %s0[%c0] {nontemporal = true} : memref<64xf32>
        memref.store %v, %s1[%c0] {nontemporal = true} : memref<64xf32>
        air.herd @herd tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
