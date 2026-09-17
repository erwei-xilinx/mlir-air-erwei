; ModuleID = '/home/erweiw/mlir-air/workspace/fleet-codegen/src/fleet_probe2.cpp'
source_filename = "/home/erweiw/mlir-air/workspace/fleet-codegen/src/fleet_probe2.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%struct.RuntimeConfig = type { i32, ptr, ptr }

@__hip_cuid_4ca7cae16f02ec78 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_4ca7cae16f02ec78 to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14k_naive_signal13RuntimeConfigiiyPi(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, i32 noundef %1, i32 noundef %2, i64 noundef %3, ptr addrspace(1) noundef writeonly captures(none) initializes((0, 4)) %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 8
  %7 = load ptr, ptr addrspace(4) %6, align 8, !amdgpu.noclobber !9
  fence syncscope("agent") release
  %8 = sext i32 %1 to i64
  %9 = getelementptr inbounds i64, ptr %7, i64 %8
  %10 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %9, i64 1) #1, !srcloc !10
  %11 = add i64 %10, 1
  %12 = sext i32 %2 to i64
  %13 = mul i64 %3, %12
  %14 = icmp eq i64 %11, %13
  %15 = zext i1 %14 to i32
  store i32 %15, ptr addrspace(1) %4, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14k_nt_roundtripPyyS_(ptr addrspace(1) noundef %0, i64 noundef %1, ptr addrspace(1) noundef writeonly captures(none) initializes((0, 8)) %2) local_unnamed_addr #0 {
  %4 = ptrtoint ptr addrspace(1) %0 to i64
  %5 = inttoptr i64 %4 to ptr
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "v,v,~{memory}"(ptr %5, i64 %1) #1, !srcloc !11
  %6 = tail call noundef i64 asm sideeffect "global_load_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "=v,v,~{memory}"(ptr %5) #1, !srcloc !12
  store i64 %6, ptr addrspace(1) %2, align 8, !tbaa !13
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10k_wt_storePvy(ptr addrspace(1) noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = ptrtoint ptr addrspace(1) %0 to i64
  %4 = inttoptr i64 %3 to ptr
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off sc0 sc1", "v,v,~{memory}"(ptr %4, i64 %1) #1, !srcloc !15
  ret void
}

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i64 49667, i64 49716}
!11 = !{i64 46393, i64 46440}
!12 = !{i64 45850, i64 45896}
!13 = !{!14, !14, i64 0}
!14 = !{!"long long", !7, i64 0}
!15 = !{i64 47362}
