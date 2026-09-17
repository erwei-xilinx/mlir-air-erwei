// M=1 (a decode step), N=32, K=128, A and B all ones, so every element of C must be K = 128.
// The block is 256 threads because BlockWarps<4,1,1> is four wavefronts; the
// thread count is part of the CK type and has to be stated separately from the
// problem dimensions.
module {
  func.func private @printMemrefF32(memref<*xf32>)
  llvm.func @air_ck_gemm(!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32)
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cM = arith.constant 1 : index
    %cN = arith.constant 32 : index
    %cK = arith.constant 128 : index
    %cThreads = arith.constant 256 : index
    %one = arith.constant 1.0 : bf16
    %fz = arith.constant 0.0 : f32
    %A = memref.alloc() : memref<1x128xbf16>
    %B = memref.alloc() : memref<32x128xbf16>
    %C = memref.alloc() : memref<1x32xf32>
    scf.for %i = %c0 to %cM step %c1 {
      scf.for %k = %c0 to %cK step %c1 { memref.store %one, %A[%i, %k] : memref<1x128xbf16> }
      scf.for %j = %c0 to %cN step %c1 { memref.store %fz, %C[%i, %j] : memref<1x32xf32> }
    }
    scf.for %n = %c0 to %cN step %c1 {
      scf.for %k = %c0 to %cK step %c1 { memref.store %one, %B[%n, %k] : memref<32x128xbf16> }
    }
    %dA = gpu.alloc() : memref<1x128xbf16>
    %dB = gpu.alloc() : memref<32x128xbf16>
    %dC = gpu.alloc() : memref<1x32xf32>
    gpu.memcpy %dA, %A : memref<1x128xbf16>, memref<1x128xbf16>
    gpu.memcpy %dB, %B : memref<32x128xbf16>, memref<32x128xbf16>
    gpu.memcpy %dC, %C : memref<1x32xf32>, memref<1x32xf32>
    %m32 = arith.constant 1 : i32
    %k32 = arith.constant 128 : i32
    %ns32 = arith.constant 32 : i32
    gpu.launch blocks(%bx,%by,%bz) in (%gx=%c1,%gy=%c1,%gz=%c1)
               threads(%tx,%ty,%tz) in (%bsx=%cThreads,%bsy=%c1,%bsz=%c1) {
      %pa = memref.extract_aligned_pointer_as_index %dA : memref<1x128xbf16> -> index
      %pb = memref.extract_aligned_pointer_as_index %dB : memref<32x128xbf16> -> index
      %pc = memref.extract_aligned_pointer_as_index %dC : memref<1x32xf32> -> index
      %ia = arith.index_cast %pa : index to i64
      %ib = arith.index_cast %pb : index to i64
      %ic = arith.index_cast %pc : index to i64
      %qa = llvm.inttoptr %ia : i64 to !llvm.ptr
      %qb = llvm.inttoptr %ib : i64 to !llvm.ptr
      %qc = llvm.inttoptr %ic : i64 to !llvm.ptr
      llvm.call @air_ck_gemm(%qa, %qb, %qc, %m32, %k32, %ns32) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32) -> ()
      gpu.terminator
    }
    gpu.memcpy %C, %dC : memref<1x32xf32>, memref<1x32xf32>
    %u = memref.cast %C : memref<1x32xf32> to memref<*xf32>
    call @printMemrefF32(%u) : (memref<*xf32>) -> ()
    return
  }
}
