module {
  func.func private @printMemrefF32(memref<*xf32>)
  llvm.func @air_ck_gemm(!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32)
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 1024 : index
    %one = arith.constant 1.0 : bf16
    %fz = arith.constant 0.0 : f32
    %A = memref.alloc() : memref<16x1024xbf16>
    %B = memref.alloc() : memref<64x1024xbf16>
    %C = memref.alloc() : memref<16x64xf32>
    scf.for %i = %c0 to %c16 step %c1 {
      scf.for %k = %c0 to %c256 step %c1 { memref.store %one, %A[%i, %k] : memref<16x1024xbf16> }
      scf.for %j = %c0 to %c64 step %c1 { memref.store %fz, %C[%i, %j] : memref<16x64xf32> }
    }
    scf.for %n = %c0 to %c64 step %c1 {
      scf.for %k = %c0 to %c256 step %c1 { memref.store %one, %B[%n, %k] : memref<64x1024xbf16> }
    }
    %dA = gpu.alloc() : memref<16x1024xbf16>
    %dB = gpu.alloc() : memref<64x1024xbf16>
    %dC = gpu.alloc() : memref<16x64xf32>
    gpu.memcpy %dA, %A : memref<16x1024xbf16>, memref<16x1024xbf16>
    gpu.memcpy %dB, %B : memref<64x1024xbf16>, memref<64x1024xbf16>
    gpu.memcpy %dC, %C : memref<16x64xf32>, memref<16x64xf32>
    %m32 = arith.constant 16 : i32
    %k32 = arith.constant 1024 : i32
    %ns32 = arith.constant 64 : i32
    // 256 threads = 4 warps, which is what BlockWarps<1,4> assumes.
    gpu.launch blocks(%bx,%by,%bz) in (%gx=%c1,%gy=%c1,%gz=%c1)
               threads(%tx,%ty,%tz) in (%bsx=%c256,%bsy=%c1,%bsz=%c1) {
      %pa = memref.extract_aligned_pointer_as_index %dA : memref<16x1024xbf16> -> index
      %pb = memref.extract_aligned_pointer_as_index %dB : memref<64x1024xbf16> -> index
      %pc = memref.extract_aligned_pointer_as_index %dC : memref<16x64xf32> -> index
      %ia = arith.index_cast %pa : index to i64
      %ib = arith.index_cast %pb : index to i64
      %ic = arith.index_cast %pc : index to i64
      %qa = llvm.inttoptr %ia : i64 to !llvm.ptr
      %qb = llvm.inttoptr %ib : i64 to !llvm.ptr
      %qc = llvm.inttoptr %ic : i64 to !llvm.ptr
      llvm.call @air_ck_gemm(%qa, %qb, %qc, %m32, %k32, %ns32) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32) -> ()
      gpu.terminator
    }
    gpu.memcpy %C, %dC : memref<16x64xf32>, memref<16x64xf32>
    %u = memref.cast %C : memref<16x64xf32> to memref<*xf32>
    call @printMemrefF32(%u) : (memref<*xf32>) -> ()
    return
  }
}
