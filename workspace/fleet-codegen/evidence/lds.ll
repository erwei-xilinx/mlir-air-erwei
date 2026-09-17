target triple = "amdgcn-amd-amdhsa"
declare void @llvm.amdgcn.global.load.lds(ptr addrspace(1) nocapture, ptr addrspace(3) nocapture, i32 immarg, i32 immarg, i32 immarg)
define amdgpu_kernel void @aux0(ptr addrspace(1) %g, ptr addrspace(3) %l) {
  call void @llvm.amdgcn.global.load.lds(ptr addrspace(1) %g, ptr addrspace(3) %l, i32 4, i32 0, i32 0)
  ret void
}
define amdgpu_kernel void @aux18_sc1_nt(ptr addrspace(1) %g, ptr addrspace(3) %l) {
  call void @llvm.amdgcn.global.load.lds(ptr addrspace(1) %g, ptr addrspace(3) %l, i32 4, i32 0, i32 18)
  ret void
}
define amdgpu_kernel void @aux2_nt(ptr addrspace(1) %g, ptr addrspace(3) %l) {
  call void @llvm.amdgcn.global.load.lds(ptr addrspace(1) %g, ptr addrspace(3) %l, i32 4, i32 0, i32 2)
  ret void
}
