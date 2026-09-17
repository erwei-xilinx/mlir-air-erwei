module {
  gpu.module @m {
    gpu.func @k(%a: memref<8xf32>) kernel {
      %c0 = arith.constant 0 : index
      %w = arith.constant 64 : i32
      %o = arith.constant 1 : i32
      %v = memref.load %a[%c0] : memref<8xf32>
      %s, %p = gpu.shuffle xor %v, %o, %w : f32
      %r = arith.addf %v, %s : f32
      memref.store %r, %a[%c0] : memref<8xf32>
      gpu.return
    }
  }
}
