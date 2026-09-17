module {
  func.func @k(%a: memref<8xf32>) {
    %c1 = arith.constant 1 : index
    air.launch (%bx, %by) in (%nbx=%c1, %nby=%c1) args(%o=%a) : memref<8xf32> {
      air.segment @s args(%so=%o) : memref<8xf32> {
        %c0_s = arith.constant 0 : index
        %c1_s = arith.constant 1 : index
        %v = memref.load %so[%c0_s] : memref<8xf32>
        %e = math.exp %v : f32
        memref.store %e, %so[%c0_s] : memref<8xf32>
        air.herd @h tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
