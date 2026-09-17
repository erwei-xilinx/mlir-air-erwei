module {
  memref.global "private" @scratch : memref<16xi32, 3>
  func.func @main(%out: memref<16xi32>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    gpu.launch blocks(%bx,%by,%bz) in (%gx=%c1,%gy=%c1,%gz=%c1)
               threads(%tx,%ty,%tz) in (%bsx=%c2,%bsy=%c1,%bsz=%c1) {
      %l = memref.get_global @scratch : memref<16xi32, 3>
      %v = memref.load %out[%tx] : memref<16xi32>
      memref.store %v, %l[%tx] : memref<16xi32, 3>
      gpu.barrier
      %r = memref.load %l[%c0] : memref<16xi32, 3>
      memref.store %r, %out[%tx] : memref<16xi32>
      gpu.terminator
    }
    return
  }
}
