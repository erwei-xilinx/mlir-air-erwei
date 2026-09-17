module {
  func.func @t(%a: memref<8xf32>) {
    %c0 = arith.constant 0 : index
    %v = memref.load %a[%c0] : memref<8xf32>
    %s = gpu.subgroup_reduce add %v : (f32) -> f32
    memref.store %s, %a[%c0] : memref<8xf32>
    return
  }
}
