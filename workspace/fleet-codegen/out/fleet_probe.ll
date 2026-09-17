; ModuleID = '/home/erweiw/mlir-air/workspace/fleet-codegen/src/fleet_probe.cpp'
source_filename = "/home/erweiw/mlir-air/workspace/fleet-codegen/src/fleet_probe.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%struct.RuntimeConfig = type { i32, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }

@__hip_cuid_dc96c50f781fd977 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_dc96c50f781fd977 to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14k_xcd_identity13RuntimeConfigiPi(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, i32 noundef %1, ptr addrspace(1) noundef writeonly captures(none) initializes((0, 4)) %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %5 = load ptr, ptr addrspace(4) %4, align 8
  %6 = addrspacecast ptr %5 to ptr addrspace(1)
  %7 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %8 = load ptr, ptr addrspace(4) %7, align 8
  %9 = addrspacecast ptr %8 to ptr addrspace(1)
  %10 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #9, !srcloc !9
  %11 = sext i32 %1 to i64
  %12 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %11
  store i32 %10, ptr addrspace(1) %12, align 4, !tbaa !5
  fence syncscope("agent") release
  %13 = sext i32 %10 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %13
  %15 = cmpxchg ptr addrspace(1) %14, i32 -1, i32 %1 syncscope("agent") monotonic monotonic, align 4
  %16 = extractvalue { i32, i1 } %15, 0
  %17 = extractvalue { i32, i1 } %15, 1
  %18 = icmp eq i32 %16, %1
  %19 = or i1 %17, %18
  %20 = zext i1 %19 to i32
  store i32 %20, ptr addrspace(1) %2, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16k_gang_broadcast13RuntimeConfigiPiPyy(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, i32 noundef %1, ptr addrspace(1) noundef readonly captures(none) %2, ptr addrspace(1) noundef captures(none) %3, i64 noundef %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 8
  %7 = load i64, ptr addrspace(4) %6, align 8, !amdgpu.noclobber !10
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 16
  %9 = load ptr, ptr addrspace(4) %8, align 8, !amdgpu.noclobber !10
  %10 = addrspacecast ptr %9 to ptr addrspace(1)
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %12 = load ptr, ptr addrspace(4) %11, align 8, !amdgpu.noclobber !10
  %13 = addrspacecast ptr %12 to ptr addrspace(1)
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %16, %5
  ret void

16:                                               ; preds = %5, %16
  %17 = phi i32 [ %31, %16 ], [ 0, %5 ]
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds nuw i32, ptr addrspace(1) %2, i64 %18
  %20 = load i32, ptr addrspace(1) %19, align 4, !tbaa !5
  %21 = getelementptr inbounds nuw i64, ptr addrspace(1) %3, i64 %18
  %22 = load i64, ptr addrspace(1) %21, align 8, !tbaa !11
  %23 = add i64 %22, 1
  store i64 %23, ptr addrspace(1) %21, align 8, !tbaa !11
  %24 = sext i32 %20 to i64
  %25 = getelementptr inbounds ptr, ptr addrspace(1) %13, i64 %24
  %26 = load ptr, ptr addrspace(1) %25, align 8, !tbaa !13
  %27 = urem i64 %22, %7
  %28 = getelementptr inbounds nuw i64, ptr %26, i64 %27
  store volatile i64 %4, ptr %28, align 8, !tbaa !11
  tail call void asm sideeffect "", "~{memory}"() #9, !srcloc !16
  %29 = getelementptr inbounds i64, ptr addrspace(1) %10, i64 %24
  %30 = atomicrmw add ptr addrspace(1) %29, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !10, !amdgpu.no.remote.memory !10
  %31 = add nuw nsw i32 %17, 1
  %32 = icmp eq i32 %31, %1
  br i1 %32, label %15, label %16, !llvm.loop !17
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12k_gang_strip13RuntimeConfigPviiiiPi(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, ptr addrspace(1) noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, ptr addrspace(1) noundef writeonly captures(none) %6) local_unnamed_addr #1 {
  %8 = alloca %struct.RuntimeConfig, align 8, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  call void @llvm.memcpy.p5.p4.i64(ptr addrspace(5) noundef align 8 dereferenceable(80) %8, ptr addrspace(4) noundef align 8 dereferenceable(80) %0, i64 80, i1 false)
  %10 = ptrtoint ptr addrspace(1) %1 to i64
  %11 = inttoptr i64 %10 to ptr
  %12 = icmp slt i32 %2, %5
  br i1 %12, label %17, label %13

13:                                               ; preds = %17, %7
  %14 = phi i32 [ 0, %7 ], [ %21, %17 ]
  %15 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %24, label %25

17:                                               ; preds = %7, %17
  %18 = phi i32 [ %21, %17 ], [ 0, %7 ]
  %19 = phi i32 [ %22, %17 ], [ %2, %7 ]
  %20 = add nsw i32 %19, %4
  call void @_Z18_execute_gang_taskPvRK13RuntimeConfigi(ptr noundef %11, ptr noundef nonnull align 8 dereferenceable(80) %9, i32 noundef %20) #9
  %21 = add nuw nsw i32 %18, 1
  %22 = add nsw i32 %19, %3
  %23 = icmp slt i32 %22, %5
  br i1 %23, label %17, label %13, !llvm.loop !19

24:                                               ; preds = %13
  store i32 %14, ptr addrspace(1) %6, align 4, !tbaa !5
  br label %25

25:                                               ; preds = %24, %13
  ret void
}

; Function Attrs: convergent nounwind
declare hidden void @_Z18_execute_gang_taskPvRK13RuntimeConfigi(ptr noundef, ptr noundef nonnull align 8 dereferenceable(80), i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18k_two_level_signal13RuntimeConfigiiiiiyPi(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i64 noundef %6, ptr addrspace(1) noundef writeonly captures(none) initializes((0, 4)) %7) local_unnamed_addr #0 {
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %10 = load ptr, ptr addrspace(4) %9, align 8, !amdgpu.noclobber !10
  %11 = icmp eq i32 %5, 0
  br i1 %11, label %37, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 4
  %14 = load i32, ptr addrspace(4) %13, align 4, !amdgpu.noclobber !10
  %15 = mul nsw i32 %14, %1
  %16 = add nsw i32 %15, %2
  %17 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 72
  %18 = load ptr, ptr addrspace(4) %17, align 8, !amdgpu.noclobber !10
  %19 = addrspacecast ptr %18 to ptr addrspace(1)
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds i64, ptr addrspace(1) %19, i64 %20
  %22 = sext i32 %5 to i64
  %23 = atomicrmw add ptr addrspace(1) %21, i64 %22 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !10, !amdgpu.no.remote.memory !10
  %24 = add i64 %23, %22
  %25 = sext i32 %3 to i64
  %26 = mul i64 %6, %25
  %27 = icmp eq i64 %24, %26
  br i1 %27, label %28, label %37

28:                                               ; preds = %12
  fence syncscope("agent") release
  %29 = sext i32 %2 to i64
  %30 = getelementptr inbounds i64, ptr %10, i64 %29
  %31 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %30, i64 1) #9, !srcloc !20
  %32 = add i64 %31, 1
  %33 = sext i32 %4 to i64
  %34 = mul i64 %6, %33
  %35 = icmp eq i64 %32, %34
  %36 = zext i1 %35 to i32
  br label %37

37:                                               ; preds = %12, %28, %8
  %38 = phi i32 [ 0, %8 ], [ %36, %28 ], [ 0, %12 ]
  store i32 %38, ptr addrspace(1) %7, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define protected amdgpu_kernel void @_Z18k_mmajor_traversaliiiiPiS_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr addrspace(1) noundef writeonly captures(none) %4, ptr addrspace(1) noundef writeonly captures(none) %5) local_unnamed_addr #3 {
  %7 = icmp sgt i32 %2, 0
  %8 = tail call i32 @llvm.smin.i32(i32 %2, i32 %0)
  %9 = select i1 %7, i32 %8, i32 %0
  %10 = mul nsw i32 %9, %1
  %11 = sdiv i32 %3, %10
  %12 = mul nsw i32 %11, %9
  %13 = sub nsw i32 %0, %12
  %14 = tail call i32 @llvm.smin.i32(i32 %13, i32 %9)
  %15 = mul i32 %11, %10
  %16 = sub i32 %3, %15
  %17 = mul nsw i32 %14, %1
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %26

19:                                               ; preds = %6
  %20 = freeze i32 %16
  %21 = freeze i32 %14
  %22 = sdiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = add nsw i32 %24, %12
  store i32 %25, ptr addrspace(1) %4, align 4, !tbaa !5
  store i32 %22, ptr addrspace(1) %5, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %6, %19
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z17k_poll_vs_depwait13RuntimeConfigiiyPy(ptr addrspace(4) noundef readonly byref(%struct.RuntimeConfig) align 8 captures(none) %0, i32 noundef %1, i32 noundef %2, i64 noundef %3, ptr addrspace(1) noundef writeonly captures(none) %4) local_unnamed_addr #4 {
  %6 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 16
  %7 = load ptr, ptr addrspace(4) %6, align 8, !amdgpu.noclobber !10
  %8 = addrspacecast ptr %7 to ptr addrspace(1)
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %10 = load ptr, ptr addrspace(4) %9, align 8, !amdgpu.noclobber !10
  %11 = addrspacecast ptr %10 to ptr addrspace(1)
  %12 = sext i32 %1 to i64
  %13 = getelementptr inbounds i64, ptr addrspace(1) %8, i64 %12
  %14 = addrspacecast ptr addrspace(1) %13 to ptr
  %15 = load volatile i64, ptr %14, align 8, !tbaa !11
  %16 = sext i32 %2 to i64
  %17 = getelementptr inbounds i64, ptr addrspace(1) %11, i64 %16
  %18 = load atomic i64, ptr addrspace(1) %17 monotonic, align 8
  fence syncscope("agent") acquire
  %19 = icmp ult i64 %18, %3
  br i1 %19, label %20, label %23

20:                                               ; preds = %5, %20
  %21 = load atomic i64, ptr addrspace(1) %17 monotonic, align 8
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %22 = icmp ult i64 %21, %3
  br i1 %22, label %20, label %23, !llvm.loop !21

23:                                               ; preds = %20, %5
  %24 = phi i64 [ %18, %5 ], [ %21, %20 ]
  fence syncscope("agent") acquire
  %25 = add i64 %24, %15
  store i64 %25, ptr addrspace(1) %4, align 8, !tbaa !11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p5.p4.i64(ptr addrspace(5) noalias writeonly captures(none), ptr addrspace(4) noalias readonly captures(none), i64, i1 immarg) #7

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #8

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #2 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="false" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #4 = { mustprogress nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #6 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { convergent nounwind }

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
!9 = !{i64 637}
!10 = !{}
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !7, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"p1 long long", !15, i64 0}
!15 = !{!"any pointer", !7, i64 0}
!16 = !{i64 62290}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = !{i64 56435, i64 56484}
!21 = distinct !{!21, !18}
