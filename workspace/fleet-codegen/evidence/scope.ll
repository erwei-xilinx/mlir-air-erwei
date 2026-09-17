target triple = "amdgcn-amd-amdhsa"
define amdgpu_kernel void @k_agent(ptr addrspace(1) %p) {
  fence syncscope("agent") release
  %v = atomicrmw add ptr addrspace(1) %p, i64 1 syncscope("agent") release
  ret void
}
define amdgpu_kernel void @k_wg(ptr addrspace(1) %p) {
  fence syncscope("workgroup") release
  %v = atomicrmw add ptr addrspace(1) %p, i64 1 syncscope("workgroup") release
  ret void
}
define amdgpu_kernel void @k_sys(ptr addrspace(1) %p) {
  fence release
  %v = atomicrmw add ptr addrspace(1) %p, i64 1 release
  ret void
}
