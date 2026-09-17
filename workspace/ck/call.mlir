module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %f0 = arith.constant 0.0 : f32
    %out = memref.alloc() : memref<4xf32>
    %dout = gpu.alloc() : memref<4xf32>
    scf.for %i = %c0 to %c4 step %c1 { memref.store %f0, %out[%i] : memref<4xf32> }
    gpu.memcpy %dout, %out : memref<4xf32>, memref<4xf32>
    gpu.launch blocks(%bx,%by,%bz) in (%gx=%c1,%gy=%c1,%gz=%c1)
               threads(%tx,%ty,%tz) in (%bsx=%c4,%bsy=%c1,%bsz=%c1) {
      %i32 = arith.index_cast %tx : index to i32
      %f = arith.sitofp %i32 : i32 to f32
      %two = arith.constant 2.0 : f32
      %r = llvm.call @air_ck_probe(%f, %two) : (f32, f32) -> f32
      memref.store %r, %dout[%tx] : memref<4xf32>
      gpu.terminator
    }
    gpu.memcpy %out, %dout : memref<4xf32>, memref<4xf32>
    %u = memref.cast %out : memref<4xf32> to memref<*xf32>
    call @printMemrefF32(%u) : (memref<*xf32>) -> ()
    return
  }
  llvm.func @air_ck_probe(f32, f32) -> f32
}
