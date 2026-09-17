module {
  memref.global "private" @scratch : memref<16xi32, 3>
  func.func @t(%a: memref<8xi32>) {
    %c0 = arith.constant 0 : index
    %v = memref.load %a[%c0] : memref<8xi32>
    %l = memref.get_global @scratch : memref<16xi32, 3>
    memref.store %v, %l[%c0] : memref<16xi32, 3>
    gpu.barrier
    %r = memref.load %l[%c0] : memref<16xi32, 3>
    memref.store %r, %a[%c0] : memref<8xi32>
    return
  }
}
