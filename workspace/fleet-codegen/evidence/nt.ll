target triple = "amdgcn-amd-amdhsa"
define amdgpu_kernel void @plain(ptr addrspace(1) %p, ptr addrspace(1) %o) {
  %v = load <2 x i32>, ptr addrspace(1) %p
  store <2 x i32> %v, ptr addrspace(1) %o
  ret void
}
define amdgpu_kernel void @nontemporal(ptr addrspace(1) %p, ptr addrspace(1) %o) {
  %v = load <2 x i32>, ptr addrspace(1) %p, !nontemporal !0
  store <2 x i32> %v, ptr addrspace(1) %o, !nontemporal !0
  ret void
}
!0 = !{i32 1}
