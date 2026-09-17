; ModuleID = '/home/erweiw/mlir-air/workspace/fleet-codegen/src/megakernel.cpp'
source_filename = "/home/erweiw/mlir-air/workspace/fleet-codegen/src/megakernel.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%"struct.mirage::runtime::RuntimeConfig" = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, ptr, i32, i8, ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr }
%"struct.mirage::runtime::TaskDesc" = type { i32, i32, i64, i64, [7 x ptr], [3 x ptr], %"union.mirage::runtime::FullTaskDesc::TaskMetadata" }
%"union.mirage::runtime::FullTaskDesc::TaskMetadata" = type { %struct.anon.1 }
%struct.anon.1 = type { i64 }
%"struct.mirage::runtime::EventDesc" = type { i32, i32, i64, i64 }

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19block_is_xcd_leader = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd = comdat any

$_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed = comdat any

$_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices = comdat any

@g_sink = protected addrspace(1) externally_initialized global i32 0, align 4
@_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE7my_role = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE5my_id = internal unnamed_addr addrspace(3) global i32 undef, align 4
@.str = private unnamed_addr addrspace(4) constant [55 x i8] c"[ELECTION] block=%d xcd=%d -> SCHEDULER (sched_id=%d)\0A\00", align 1
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage = linkonce_odr hidden local_unnamed_addr addrspace(3) global [1792 x i8] undef, comdat, align 16
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage = linkonce_odr hidden local_unnamed_addr addrspace(3) global [128 x i8] undef, comdat, align 8
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues = linkonce_odr hidden local_unnamed_addr addrspace(3) global [2 x ptr] undef, comdat, align 16
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids = linkonce_odr hidden local_unnamed_addr addrspace(3) global [2 x i32] undef, comdat, align 4
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos = linkonce_odr hidden local_unnamed_addr addrspace(3) global [2 x i64] undef, comdat, align 16
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos = linkonce_odr hidden local_unnamed_addr addrspace(3) global [2 x i64] undef, comdat, align 16
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id = linkonce_odr hidden local_unnamed_addr addrspace(3) global i32 undef, comdat, align 4
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19block_is_xcd_leader = linkonce_odr hidden local_unnamed_addr addrspace(3) global i32 undef, comdat, align 4
@.str.1 = private unnamed_addr addrspace(4) constant [43 x i8] c"[WORKER_XCD] worker_id=%d block=%d xcd=%d\0A\00", align 1
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank = linkonce_odr hidden local_unnamed_addr addrspace(3) global i32 undef, comdat, align 4
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd = linkonce_odr hidden local_unnamed_addr addrspace(3) global i32 undef, comdat, align 4
@_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed = linkonce_odr hidden local_unnamed_addr addrspace(3) global i32 undef, comdat, align 4
@.str.3 = private unnamed_addr addrspace(4) constant [54 x i8] c"[FWD_PASS] iter=%d time_ms=%.3f num_active_tokens=%d\0A\00", align 1
@.str.4 = private unnamed_addr addrspace(4) constant [59 x i8] c"[SCHED_XCD] sched_id=%d xcd=%d workers_on_xcd=%d block=%d\0A\00", align 1
@_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices = linkonce_odr hidden local_unnamed_addr addrspace(3) global [16 x i32] undef, comdat, align 16
@__hip_cuid_197155fbad4adabb = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [2 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_197155fbad4adabb to ptr), ptr addrspacecast (ptr addrspace(1) @g_sink to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define protected amdgpu_kernel void @_Z11init_kernelN6mirage7runtime13RuntimeConfigE(ptr addrspace(4) noundef readonly byref(%"struct.mirage::runtime::RuntimeConfig") align 8 captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 128
  %3 = load ptr, ptr addrspace(4) %2, align 8, !amdgpu.noclobber !9
  %4 = addrspacecast ptr %3 to ptr addrspace(1)
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 184
  %6 = load ptr, ptr addrspace(4) %5, align 8, !amdgpu.noclobber !9
  %7 = addrspacecast ptr %6 to ptr addrspace(1)
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 192
  %9 = load ptr, ptr addrspace(4) %8, align 8, !amdgpu.noclobber !9
  %10 = addrspacecast ptr %9 to ptr addrspace(1)
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 224
  %12 = load ptr, ptr addrspace(4) %11, align 8, !amdgpu.noclobber !9
  %13 = addrspacecast ptr %12 to ptr addrspace(1)
  %14 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 232
  %15 = load ptr, ptr addrspace(4) %14, align 8, !amdgpu.noclobber !9
  %16 = addrspacecast ptr %15 to ptr addrspace(1)
  %17 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 240
  %18 = load ptr, ptr addrspace(4) %17, align 8, !amdgpu.noclobber !9
  %19 = addrspacecast ptr %18 to ptr addrspace(1)
  %20 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 248
  %21 = load ptr, ptr addrspace(4) %20, align 8, !amdgpu.noclobber !9
  %22 = addrspacecast ptr %21 to ptr addrspace(1)
  %23 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 256
  %24 = load ptr, ptr addrspace(4) %23, align 8, !amdgpu.noclobber !9
  %25 = addrspacecast ptr %24 to ptr addrspace(1)
  %26 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 264
  %27 = load i32, ptr addrspace(4) %26, align 8, !amdgpu.noclobber !9
  %28 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %62

30:                                               ; preds = %1
  %31 = icmp sgt i32 %27, 0
  br i1 %31, label %32, label %46

32:                                               ; preds = %30
  %33 = icmp eq i32 %27, 1
  br i1 %33, label %44, label %34

34:                                               ; preds = %32
  %35 = and i32 %27, 2147483646
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %40, %36 ]
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds nuw i32, ptr addrspace(1) %4, i64 %38
  store <2 x i32> zeroinitializer, ptr addrspace(1) %39, align 4, !tbaa !5
  %40 = add nuw i32 %37, 2
  %41 = icmp eq i32 %40, %35
  br i1 %41, label %42, label %36, !llvm.loop !10

42:                                               ; preds = %36
  %43 = icmp eq i32 %27, %35
  br i1 %43, label %46, label %44

44:                                               ; preds = %32, %42
  %45 = phi i32 [ 0, %32 ], [ %35, %42 ]
  br label %56

46:                                               ; preds = %56, %42, %30
  store i32 0, ptr addrspace(1) %25, align 4, !tbaa !5
  store i32 -1, ptr addrspace(1) %13, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %7, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %10, align 4, !tbaa !5
  %47 = getelementptr inbounds nuw i8, ptr addrspace(1) %7, i64 4
  store i32 0, ptr addrspace(1) %47, align 4, !tbaa !5
  %48 = getelementptr inbounds nuw i8, ptr addrspace(1) %10, i64 4
  store i32 0, ptr addrspace(1) %48, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %19, align 4, !tbaa !5
  store i32 16, ptr addrspace(1) %22, align 4, !tbaa !5
  store <2 x i32> <i32 0, i32 1>, ptr addrspace(1) %16, align 4, !tbaa !5
  %49 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 8
  store <2 x i32> <i32 2, i32 3>, ptr addrspace(1) %49, align 4, !tbaa !5
  %50 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 16
  store <2 x i32> <i32 4, i32 5>, ptr addrspace(1) %50, align 4, !tbaa !5
  %51 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 24
  store <2 x i32> <i32 6, i32 7>, ptr addrspace(1) %51, align 4, !tbaa !5
  %52 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 32
  store <2 x i32> <i32 8, i32 9>, ptr addrspace(1) %52, align 4, !tbaa !5
  %53 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 40
  store <2 x i32> <i32 10, i32 11>, ptr addrspace(1) %53, align 4, !tbaa !5
  %54 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 48
  store <2 x i32> <i32 12, i32 13>, ptr addrspace(1) %54, align 4, !tbaa !5
  %55 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 56
  store <2 x i32> <i32 14, i32 15>, ptr addrspace(1) %55, align 4, !tbaa !5
  br label %62

56:                                               ; preds = %44, %56
  %57 = phi i32 [ %60, %56 ], [ %45, %44 ]
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr inbounds nuw i32, ptr addrspace(1) %4, i64 %58
  store i32 0, ptr addrspace(1) %59, align 4, !tbaa !5
  %60 = add nuw nsw i32 %57, 1
  %61 = icmp eq i32 %60, %27
  br i1 %61, label %46, label %56, !llvm.loop !13

62:                                               ; preds = %46, %1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(ptr addrspace(5) captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p5(ptr addrspace(5) captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define protected amdgpu_kernel void @_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi(ptr addrspace(4) noundef readonly byref(%"struct.mirage::runtime::RuntimeConfig") align 8 captures(none) %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = load i32, ptr addrspace(4) %0, align 8, !amdgpu.noclobber !9
  %4 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 4
  %5 = load i32, ptr addrspace(4) %4, align 4, !amdgpu.noclobber !9
  %6 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 8
  %7 = load i32, ptr addrspace(4) %6, align 8, !amdgpu.noclobber !9
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %9 = load i32, ptr addrspace(4) %8, align 8, !amdgpu.noclobber !9
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %11 = load ptr, ptr addrspace(4) %10, align 8, !amdgpu.noclobber !9
  %12 = addrspacecast ptr %11 to ptr addrspace(1)
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %14 = load ptr, ptr addrspace(4) %13, align 8, !amdgpu.noclobber !9
  %15 = addrspacecast ptr %14 to ptr addrspace(1)
  %16 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 64
  %17 = load ptr, ptr addrspace(4) %16, align 8, !amdgpu.noclobber !9
  %18 = addrspacecast ptr %17 to ptr addrspace(1)
  %19 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 72
  %20 = load ptr, ptr addrspace(4) %19, align 8, !amdgpu.noclobber !9
  %21 = addrspacecast ptr %20 to ptr addrspace(1)
  %22 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 112
  %23 = load ptr, ptr addrspace(4) %22, align 8, !amdgpu.noclobber !9
  %24 = addrspacecast ptr %23 to ptr addrspace(1)
  %25 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 304
  %26 = load ptr, ptr addrspace(4) %25, align 8, !amdgpu.noclobber !9
  %27 = addrspacecast ptr %26 to ptr addrspace(1)
  %28 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 312
  %29 = load ptr, ptr addrspace(4) %28, align 8, !amdgpu.noclobber !9
  %30 = addrspacecast ptr %29 to ptr addrspace(1)
  %31 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 320
  %32 = load i32, ptr addrspace(4) %31, align 8, !amdgpu.noclobber !9
  %33 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 328
  %34 = load ptr, ptr addrspace(4) %33, align 8, !amdgpu.noclobber !9
  %35 = addrspacecast ptr %34 to ptr addrspace(1)
  %36 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 336
  %37 = load ptr, ptr addrspace(4) %36, align 8, !amdgpu.noclobber !9
  %38 = addrspacecast ptr %37 to ptr addrspace(1)
  %39 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 344
  %40 = load ptr, ptr addrspace(4) %39, align 8, !amdgpu.noclobber !9
  %41 = addrspacecast ptr %40 to ptr addrspace(1)
  %42 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 352
  %43 = load ptr, ptr addrspace(4) %42, align 8, !amdgpu.noclobber !9
  %44 = addrspacecast ptr %43 to ptr addrspace(1)
  %45 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 360
  %46 = load ptr, ptr addrspace(4) %45, align 8, !amdgpu.noclobber !9
  %47 = addrspacecast ptr %46 to ptr addrspace(1)
  %48 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %49 = tail call align 8 dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %50 = getelementptr inbounds nuw i8, ptr addrspace(4) %49, i64 12
  %51 = load i16, ptr addrspace(4) %50, align 4, !range !15, !invariant.load !9, !noundef !9
  %52 = zext nneg i16 %51 to i32
  %53 = mul i32 %48, %52
  %54 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %55 = add i32 %53, %54
  %56 = shl nsw i32 %3, 1
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %63

58:                                               ; preds = %2
  %59 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %60 = getelementptr inbounds nuw i8, ptr addrspace(4) %59, i64 12
  %61 = load i32, ptr addrspace(4) %60, align 4, !range !16, !invariant.load !9
  %62 = mul i32 %61, %52
  br label %71

63:                                               ; preds = %71, %2
  %64 = add nsw i32 %7, %5
  %65 = icmp sgt i32 %55, %64
  br i1 %65, label %77, label %66

66:                                               ; preds = %63
  %67 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %68 = getelementptr inbounds nuw i8, ptr addrspace(4) %67, i64 12
  %69 = load i32, ptr addrspace(4) %68, align 4, !range !16, !invariant.load !9
  %70 = mul i32 %69, %52
  br label %84

71:                                               ; preds = %58, %71
  %72 = phi i32 [ %55, %58 ], [ %75, %71 ]
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i64, ptr addrspace(1) %12, i64 %73
  store i64 0, ptr addrspace(1) %74, align 8, !tbaa !17
  %75 = add i32 %62, %72
  %76 = icmp slt i32 %75, %56
  br i1 %76, label %71, label %63, !llvm.loop !19

77:                                               ; preds = %84, %63
  %78 = icmp slt i32 %55, %9
  br i1 %78, label %79, label %91

79:                                               ; preds = %77
  %80 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %81 = getelementptr inbounds nuw i8, ptr addrspace(4) %80, i64 12
  %82 = load i32, ptr addrspace(4) %81, align 4, !range !16, !invariant.load !9
  %83 = mul i32 %82, %52
  br label %93

84:                                               ; preds = %66, %84
  %85 = phi i32 [ %55, %66 ], [ %89, %84 ]
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i64, ptr addrspace(1) %15, i64 %86
  store i64 0, ptr addrspace(1) %87, align 8, !tbaa !17
  %88 = getelementptr inbounds i64, ptr addrspace(1) %18, i64 %86
  store i64 0, ptr addrspace(1) %88, align 8, !tbaa !17
  %89 = add i32 %70, %85
  %90 = icmp sgt i32 %89, %64
  br i1 %90, label %77, label %84, !llvm.loop !20

91:                                               ; preds = %93, %77
  %92 = icmp eq ptr addrspace(1) %27, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %92, label %113, label %99

93:                                               ; preds = %79, %93
  %94 = phi i32 [ %55, %79 ], [ %97, %93 ]
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i64, ptr addrspace(1) %21, i64 %95
  store i64 0, ptr addrspace(1) %96, align 8, !tbaa !17
  %97 = add i32 %83, %94
  %98 = icmp slt i32 %97, %9
  br i1 %98, label %93, label %91, !llvm.loop !21

99:                                               ; preds = %91
  %100 = mul nsw i32 %32, %9
  %101 = icmp slt i32 %55, %100
  br i1 %101, label %102, label %113

102:                                              ; preds = %99
  %103 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %104 = getelementptr inbounds nuw i8, ptr addrspace(4) %103, i64 12
  %105 = load i32, ptr addrspace(4) %104, align 4, !range !16, !invariant.load !9
  %106 = mul i32 %105, %52
  br label %107

107:                                              ; preds = %102, %107
  %108 = phi i32 [ %55, %102 ], [ %111, %107 ]
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i64, ptr addrspace(1) %27, i64 %109
  store i64 0, ptr addrspace(1) %110, align 8, !tbaa !17
  %111 = add i32 %106, %108
  %112 = icmp slt i32 %111, %100
  br i1 %112, label %107, label %113, !llvm.loop !22

113:                                              ; preds = %107, %99, %91
  %114 = icmp ne ptr addrspace(1) %30, addrspacecast (ptr null to ptr addrspace(1))
  %115 = icmp slt i32 %55, %32
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %117, label %128

117:                                              ; preds = %113
  %118 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %119 = getelementptr inbounds nuw i8, ptr addrspace(4) %118, i64 12
  %120 = load i32, ptr addrspace(4) %119, align 4, !range !16, !invariant.load !9
  %121 = mul i32 %120, %52
  br label %122

122:                                              ; preds = %117, %122
  %123 = phi i32 [ %55, %117 ], [ %126, %122 ]
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, ptr addrspace(1) %30, i64 %124
  store i32 -1, ptr addrspace(1) %125, align 4, !tbaa !5
  %126 = add i32 %121, %123
  %127 = icmp slt i32 %126, %32
  br i1 %127, label %122, label %128, !llvm.loop !23

128:                                              ; preds = %122, %113
  %129 = icmp ne ptr addrspace(1) %35, addrspacecast (ptr null to ptr addrspace(1))
  %130 = icmp slt i32 %55, %3
  %131 = select i1 %129, i1 %130, i1 false
  br i1 %131, label %132, label %143

132:                                              ; preds = %128
  %133 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %134 = getelementptr inbounds nuw i8, ptr addrspace(4) %133, i64 12
  %135 = load i32, ptr addrspace(4) %134, align 4, !range !16, !invariant.load !9
  %136 = mul i32 %135, %52
  br label %137

137:                                              ; preds = %132, %137
  %138 = phi i32 [ %55, %132 ], [ %141, %137 ]
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr addrspace(1) %35, i64 %139
  store i32 -1, ptr addrspace(1) %140, align 4, !tbaa !5
  %141 = add i32 %136, %138
  %142 = icmp slt i32 %141, %3
  br i1 %142, label %137, label %143, !llvm.loop !24

143:                                              ; preds = %137, %128
  %144 = icmp ne ptr addrspace(1) %38, addrspacecast (ptr null to ptr addrspace(1))
  %145 = or i32 %54, %48
  %146 = icmp eq i32 %145, 0
  %147 = and i1 %146, %144
  br i1 %147, label %148, label %149

148:                                              ; preds = %143
  store i32 0, ptr addrspace(1) %38, align 4, !tbaa !5
  br label %149

149:                                              ; preds = %148, %143
  %150 = icmp eq ptr addrspace(1) %41, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %150, label %165, label %151

151:                                              ; preds = %149
  %152 = mul nsw i32 %32, %9
  %153 = icmp slt i32 %55, %152
  br i1 %153, label %154, label %165

154:                                              ; preds = %151
  %155 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %156 = getelementptr inbounds nuw i8, ptr addrspace(4) %155, i64 12
  %157 = load i32, ptr addrspace(4) %156, align 4, !range !16, !invariant.load !9
  %158 = mul i32 %157, %52
  br label %159

159:                                              ; preds = %154, %159
  %160 = phi i32 [ %55, %154 ], [ %163, %159 ]
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, ptr addrspace(1) %41, i64 %161
  store i32 0, ptr addrspace(1) %162, align 4, !tbaa !5
  %163 = add i32 %158, %160
  %164 = icmp slt i32 %163, %152
  br i1 %164, label %159, label %165, !llvm.loop !25

165:                                              ; preds = %159, %151, %149
  %166 = icmp ne ptr addrspace(1) %44, addrspacecast (ptr null to ptr addrspace(1))
  %167 = icmp eq i32 %48, 0
  %168 = and i1 %167, %166
  %169 = icmp slt i32 %54, %32
  %170 = select i1 %168, i1 %169, i1 false
  br i1 %170, label %171, label %177

171:                                              ; preds = %165, %171
  %172 = phi i32 [ %175, %171 ], [ %54, %165 ]
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, ptr addrspace(1) %44, i64 %173
  store i32 -1, ptr addrspace(1) %174, align 4, !tbaa !5
  %175 = add i32 %172, %52
  %176 = icmp slt i32 %175, %32
  br i1 %176, label %171, label %177, !llvm.loop !26

177:                                              ; preds = %171, %165
  %178 = icmp ne ptr addrspace(1) %47, addrspacecast (ptr null to ptr addrspace(1))
  %179 = and i1 %146, %178
  br i1 %179, label %180, label %181

180:                                              ; preds = %177
  store i32 0, ptr addrspace(1) %47, align 4, !tbaa !5
  br label %181

181:                                              ; preds = %180, %177
  br i1 %146, label %182, label %186

182:                                              ; preds = %181
  store i64 1, ptr addrspace(1) %18, align 8, !tbaa !17
  %183 = sext i32 %1 to i64
  %184 = load ptr, ptr addrspace(1) %24, align 8, !tbaa !27, !amdgpu.noclobber !9
  %185 = addrspacecast ptr %184 to ptr addrspace(1)
  store i64 %183, ptr addrspace(1) %185, align 8, !tbaa !17
  store i64 1, ptr addrspace(1) %15, align 8, !tbaa !17
  br label %186

186:                                              ; preds = %182, %181
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE(ptr addrspace(4) noundef readonly byref(%"struct.mirage::runtime::RuntimeConfig") align 8 captures(none) %0) local_unnamed_addr #3 {
  %2 = alloca [128 x i32], align 16, addrspace(5)
  %3 = alloca [128 x i64], align 16, addrspace(5)
  %4 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 360
  %5 = load ptr, ptr addrspace(4) %4, align 8, !amdgpu.noclobber !9
  %6 = addrspacecast ptr %5 to ptr addrspace(1)
  %7 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 352
  %11 = load ptr, ptr addrspace(4) %10, align 8, !amdgpu.noclobber !9
  %12 = addrspacecast ptr %11 to ptr addrspace(1)
  %13 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %14
  %16 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %17 = cmpxchg ptr addrspace(1) %15, i32 -1, i32 %16 syncscope("agent") monotonic monotonic, align 4
  %18 = extractvalue { i32, i1 } %17, 1
  br i1 %18, label %21, label %19

19:                                               ; preds = %9
  %20 = atomicrmw add ptr addrspace(1) %6, i32 1 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  br label %21

21:                                               ; preds = %9, %19
  %22 = phi i32 [ 0, %19 ], [ 1, %9 ]
  %23 = phi i32 [ %20, %19 ], [ %13, %9 ]
  store i32 %22, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE7my_role, align 4, !tbaa !5
  store i32 %23, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE5my_id, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %21, %1
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %8, label %25, label %42

25:                                               ; preds = %24
  %26 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  %27 = load i32, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE7my_role, align 4, !tbaa !5
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %42

29:                                               ; preds = %25
  %30 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %31 = load i32, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE5my_id, align 4, !tbaa !5
  %32 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %33 = icmp eq ptr addrspace(4) @.str, addrspacecast (ptr null to ptr addrspace(4))
  %34 = select i1 %33, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str, i64 54) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str to ptr) to i64)), i64 1))
  %35 = tail call i64 @__ockl_printf_append_string_n(i64 %32, ptr addrspacecast (ptr addrspace(4) @.str to ptr), i64 %34, i32 0) #15
  %36 = zext i32 %30 to i64
  %37 = tail call i64 @__ockl_printf_append_args(i64 %35, i32 1, i64 %36, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %38 = zext i32 %26 to i64
  %39 = tail call i64 @__ockl_printf_append_args(i64 %37, i32 1, i64 %38, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %40 = zext i32 %31 to i64
  %41 = tail call i64 @__ockl_printf_append_args(i64 %39, i32 1, i64 %40, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %42

42:                                               ; preds = %25, %29, %24
  tail call void @llvm.amdgcn.s.barrier()
  %43 = load i32, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE7my_role, align 4, !tbaa !5
  %44 = icmp eq i32 %43, 0
  %45 = load i32, ptr addrspace(4) %0, align 8, !tbaa !5
  %46 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 4
  %47 = load <2 x i32>, ptr addrspace(4) %46, align 4, !tbaa !5
  %48 = extractelement <2 x i32> %47, i64 1
  %49 = extractelement <2 x i32> %47, i64 0
  br i1 %44, label %50, label %552

50:                                               ; preds = %42
  %51 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 16
  %52 = load i32, ptr addrspace(4) %51, align 8, !tbaa !5
  %53 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %54 = load i32, ptr addrspace(4) %53, align 8, !tbaa !5
  %55 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %56 = load i64, ptr addrspace(4) %55, align 8, !tbaa !17
  %57 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 40
  %58 = load i64, ptr addrspace(4) %57, align 8, !tbaa !17
  %59 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %60 = load ptr, ptr addrspace(4) %59, align 8, !tbaa !27
  %61 = addrspacecast ptr %60 to ptr addrspace(1)
  %62 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %63 = load ptr, ptr addrspace(4) %62, align 8, !tbaa !27
  %64 = addrspacecast ptr %63 to ptr addrspace(1)
  %65 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 64
  %66 = load ptr, ptr addrspace(4) %65, align 8, !tbaa !27
  %67 = addrspacecast ptr %66 to ptr addrspace(1)
  %68 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 72
  %69 = load ptr, ptr addrspace(4) %68, align 8, !tbaa !27
  %70 = addrspacecast ptr %69 to ptr addrspace(1)
  %71 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 80
  %72 = load ptr, ptr addrspace(4) %71, align 8, !tbaa !31
  %73 = addrspacecast ptr %72 to ptr addrspace(1)
  %74 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 88
  %75 = load ptr, ptr addrspace(4) %74, align 8, !tbaa !33
  %76 = addrspacecast ptr %75 to ptr addrspace(1)
  %77 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 96
  %78 = load ptr, ptr addrspace(4) %77, align 8, !tbaa !35
  %79 = addrspacecast ptr %78 to ptr addrspace(1)
  %80 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 104
  %81 = load ptr, ptr addrspace(4) %80, align 8, !tbaa !37
  %82 = addrspacecast ptr %81 to ptr addrspace(1)
  %83 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 112
  %84 = load ptr, ptr addrspace(4) %83, align 8, !tbaa !37
  %85 = addrspacecast ptr %84 to ptr addrspace(1)
  %86 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 184
  %87 = load ptr, ptr addrspace(4) %86, align 8, !tbaa !31
  %88 = addrspacecast ptr %87 to ptr addrspace(1)
  %89 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 304
  %90 = load ptr, ptr addrspace(4) %89, align 8, !tbaa !27
  %91 = addrspacecast ptr %90 to ptr addrspace(1)
  %92 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 312
  %93 = load ptr, ptr addrspace(4) %92, align 8, !tbaa !31
  %94 = addrspacecast ptr %93 to ptr addrspace(1)
  %95 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 328
  %96 = load ptr, ptr addrspace(4) %95, align 8, !tbaa !31
  %97 = addrspacecast ptr %96 to ptr addrspace(1)
  %98 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 336
  %99 = load ptr, ptr addrspace(4) %98, align 8, !tbaa !31
  %100 = addrspacecast ptr %99 to ptr addrspace(1)
  %101 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 344
  %102 = load ptr, ptr addrspace(4) %101, align 8, !tbaa !31
  %103 = addrspacecast ptr %102 to ptr addrspace(1)
  %104 = load i32, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE5my_id, align 4, !tbaa !5
  %105 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %106 = icmp slt i32 %104, 0
  %107 = select i1 %106, i32 %105, i32 %104
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds ptr, ptr addrspace(1) %82, i64 %108
  %110 = load ptr, ptr addrspace(1) %109, align 8, !tbaa !27
  store ptr %110, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, align 16, !tbaa !27
  store i32 %107, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, align 4, !tbaa !5
  %111 = icmp sgt i32 %52, 1
  br i1 %111, label %112, label %117

112:                                              ; preds = %50
  %113 = add nsw i32 %107, %45
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds ptr, ptr addrspace(1) %82, i64 %114
  %116 = load ptr, ptr addrspace(1) %115, align 8, !tbaa !27
  store ptr %116, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, i32 8), align 8, !tbaa !27
  store i32 %113, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, i32 4), align 4, !tbaa !5
  br label %117

117:                                              ; preds = %112, %50
  %118 = phi i32 [ 1, %112 ], [ 0, %50 ]
  br i1 %8, label %119, label %152

119:                                              ; preds = %117
  %120 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  store i32 %120, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  %121 = icmp eq ptr addrspace(1) %97, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %121, label %138, label %122

122:                                              ; preds = %119
  %123 = getelementptr inbounds i32, ptr addrspace(1) %97, i64 %108
  store i32 %120, ptr addrspace(1) %123, align 4, !tbaa !5
  %124 = icmp slt i32 %107, 8
  br i1 %124, label %125, label %136

125:                                              ; preds = %122
  %126 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %127 = icmp eq ptr addrspace(4) @.str.1, addrspacecast (ptr null to ptr addrspace(4))
  %128 = select i1 %127, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.1, i64 42) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr) to i64)), i64 1))
  %129 = tail call i64 @__ockl_printf_append_string_n(i64 %126, ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr), i64 %128, i32 0) #15
  %130 = zext i32 %107 to i64
  %131 = tail call i64 @__ockl_printf_append_args(i64 %129, i32 1, i64 %130, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %132 = zext i32 %105 to i64
  %133 = tail call i64 @__ockl_printf_append_args(i64 %131, i32 1, i64 %132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %134 = zext i32 %120 to i64
  %135 = tail call i64 @__ockl_printf_append_args(i64 %133, i32 1, i64 %134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %136

136:                                              ; preds = %125, %122
  fence syncscope("agent") release
  %137 = atomicrmw add ptr addrspace(1) %100, i32 1 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  br label %138

138:                                              ; preds = %136, %119
  %139 = icmp eq ptr addrspace(1) %94, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %139, label %150, label %140

140:                                              ; preds = %138
  %141 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, ptr addrspace(1) %94, i64 %142
  %144 = cmpxchg ptr addrspace(1) %143, i32 -1, i32 %107 syncscope("agent") monotonic monotonic, align 4
  %145 = extractvalue { i32, i1 } %144, 0
  %146 = extractvalue { i32, i1 } %144, 1
  %147 = icmp eq i32 %145, %107
  %148 = or i1 %146, %147
  %149 = zext i1 %148 to i32
  br label %150

150:                                              ; preds = %138, %140
  %151 = phi i32 [ %149, %140 ], [ 0, %138 ]
  store i32 %151, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19block_is_xcd_leader, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %150, %117
  tail call void @llvm.amdgcn.s.barrier()
  %153 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  br i1 %8, label %154, label %155

154:                                              ; preds = %152
  store i32 -1, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  store i32 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  store i64 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, align 16, !tbaa !40
  store i64 0, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 8), align 8, !tbaa !40
  store i64 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, align 16, !tbaa !40
  store i64 0, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 8), align 8, !tbaa !40
  br label %155

155:                                              ; preds = %154, %152
  tail call void @llvm.amdgcn.s.barrier()
  %156 = zext nneg i32 %7 to i64
  %157 = getelementptr inbounds nuw i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %7
  %158 = tail call align 8 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %159 = getelementptr inbounds nuw i8, ptr addrspace(4) %158, i64 12
  %160 = or i32 %107, %7
  %161 = icmp eq i32 %160, 0
  %162 = getelementptr inbounds nuw i8, ptr addrspace(1) %88, i64 4
  %163 = icmp eq ptr addrspace(4) @.str.3, addrspacecast (ptr null to ptr addrspace(4))
  %164 = icmp sgt i32 %45, 0
  %165 = mul nsw i32 %153, %54
  %166 = icmp eq ptr addrspace(1) %103, addrspacecast (ptr null to ptr addrspace(1))
  %167 = add nsw i32 %48, %49
  %168 = sext i32 %153 to i64
  %169 = getelementptr inbounds i64, ptr addrspace(1) %67, i64 %168
  %170 = getelementptr inbounds ptr, ptr addrspace(1) %85, i64 %168
  %171 = getelementptr inbounds i64, ptr addrspace(1) %64, i64 %168
  %172 = sext i32 %167 to i64
  %173 = getelementptr inbounds i64, ptr %66, i64 %172
  %174 = getelementptr inbounds ptr, ptr addrspace(1) %85, i64 %172
  %175 = getelementptr inbounds i64, ptr %63, i64 %172
  %176 = select i1 %163, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.3, i64 53) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr) to i64)), i64 1))
  %177 = icmp eq i32 %45, 1
  %178 = and i32 %45, 2147483646
  %179 = insertelement <2 x i32> poison, i32 %153, i64 0
  %180 = shufflevector <2 x i32> %179, <2 x i32> poison, <2 x i32> zeroinitializer
  %181 = insertelement <2 x i32> poison, i32 %107, i64 0
  %182 = shufflevector <2 x i32> %181, <2 x i32> poison, <2 x i32> zeroinitializer
  %183 = icmp eq i32 %45, %178
  br label %184

184:                                              ; preds = %550, %155
  %185 = phi i32 [ 0, %155 ], [ %451, %550 ]
  %186 = phi i64 [ 0, %155 ], [ %452, %550 ]
  %187 = phi i32 [ 0, %155 ], [ %264, %550 ]
  %188 = phi i32 [ 0, %155 ], [ %551, %550 ]
  %189 = icmp eq i32 %188, %187
  br i1 %189, label %190, label %263

190:                                              ; preds = %184
  br i1 %8, label %191, label %217

191:                                              ; preds = %190
  %192 = load i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, align 16, !tbaa !40
  %193 = load i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, align 16, !tbaa !40
  %194 = icmp eq i64 %192, %193
  br i1 %194, label %195, label %215

195:                                              ; preds = %191, %206
  %196 = phi ptr addrspace(3) [ %212, %206 ], [ @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, %191 ]
  %197 = phi i64 [ %211, %206 ], [ %192, %191 ]
  %198 = phi i32 [ %209, %206 ], [ 0, %191 ]
  %199 = getelementptr inbounds i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, i32 %198
  %200 = load i32, ptr addrspace(3) %199, align 4, !tbaa !5
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i64, ptr addrspace(1) %61, i64 %201
  %203 = addrspacecast ptr addrspace(1) %202 to ptr
  %204 = load volatile i64, ptr %203, align 8, !tbaa !17
  store i64 %204, ptr addrspace(3) %196, align 8, !tbaa !40
  %205 = icmp ult i64 %197, %204
  br i1 %205, label %215, label %206

206:                                              ; preds = %195
  %207 = icmp eq i32 %198, %118
  %208 = add nsw i32 %198, 1
  %209 = select i1 %207, i32 0, i32 %208
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %210 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 %209
  %211 = load i64, ptr addrspace(3) %210, align 8, !tbaa !40
  %212 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 %209
  %213 = load i64, ptr addrspace(3) %212, align 8, !tbaa !40
  %214 = icmp eq i64 %211, %213
  br i1 %214, label %195, label %215, !llvm.loop !42

215:                                              ; preds = %206, %195, %191
  %216 = phi i32 [ 0, %191 ], [ %209, %206 ], [ %198, %195 ]
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %217

217:                                              ; preds = %215, %190
  %218 = phi i32 [ %216, %215 ], [ 0, %190 ]
  tail call void @llvm.amdgcn.s.barrier()
  %219 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 %218
  %220 = load i64, ptr addrspace(3) %219, align 8, !tbaa !40
  %221 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 %218
  %222 = load i64, ptr addrspace(3) %221, align 8, !tbaa !40
  %223 = sub i64 %220, %222
  %224 = trunc i64 %223 to i32
  %225 = tail call noundef i32 @llvm.smin.i32(i32 %224, i32 16)
  %226 = icmp ult i32 %7, %225
  br i1 %226, label %227, label %234

227:                                              ; preds = %217
  %228 = getelementptr inbounds ptr, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, i32 %218
  %229 = load ptr, ptr addrspace(3) %228, align 8, !tbaa !27
  %230 = add i64 %222, %156
  %231 = urem i64 %230, %56
  %232 = getelementptr inbounds nuw i64, ptr %229, i64 %231
  %233 = load volatile i64, ptr %232, align 8, !tbaa !17
  store i64 %233, ptr addrspace(3) %157, align 8, !tbaa !17
  br label %234

234:                                              ; preds = %227, %217
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %8, label %235, label %239

235:                                              ; preds = %234
  %236 = sext i32 %225 to i64
  %237 = load i64, ptr addrspace(3) %221, align 8, !tbaa !40
  %238 = add i64 %237, %236
  store i64 %238, ptr addrspace(3) %221, align 8, !tbaa !40
  br label %239

239:                                              ; preds = %235, %234
  %240 = mul nsw i32 %225, 7
  %241 = icmp slt i32 %7, %240
  br i1 %241, label %242, label %245

242:                                              ; preds = %239
  %243 = load i16, ptr addrspace(4) %159, align 4, !range !15, !invariant.load !9, !noundef !9
  %244 = zext nneg i16 %243 to i32
  br label %246

245:                                              ; preds = %246, %239
  tail call void @llvm.amdgcn.s.barrier()
  br label %263

246:                                              ; preds = %242, %246
  %247 = phi i32 [ %7, %242 ], [ %261, %246 ]
  %248 = freeze i32 %247
  %249 = udiv i32 %248, 7
  %250 = mul i32 %249, 7
  %251 = sub i32 %248, %250
  %252 = shl nsw i32 %247, 4
  %253 = getelementptr inbounds nuw i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage, i32 %252
  %254 = getelementptr inbounds nuw i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %249
  %255 = load i64, ptr addrspace(3) %254, align 8, !tbaa !17
  %256 = and i64 %255, 4294967295
  %257 = getelementptr inbounds nuw %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %76, i64 %256
  %258 = shl nuw nsw i32 %251, 4
  %259 = zext nneg i32 %258 to i64
  %260 = getelementptr inbounds nuw i8, ptr addrspace(1) %257, i64 %259
  tail call void @llvm.memcpy.p3.p1.i64(ptr addrspace(3) noundef align 16 dereferenceable(32) %253, ptr addrspace(1) noundef align 16 dereferenceable(32) %260, i64 32, i1 false), !tbaa.struct !44
  %261 = add nuw nsw i32 %247, %244
  %262 = icmp slt i32 %261, %240
  br i1 %262, label %246, label %245, !llvm.loop !45

263:                                              ; preds = %245, %184
  %264 = phi i32 [ %225, %245 ], [ %187, %184 ]
  %265 = phi i32 [ 0, %245 ], [ %188, %184 ]
  %266 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage, i32 %265
  br i1 %8, label %267, label %290

267:                                              ; preds = %263
  %268 = getelementptr inbounds nuw i8, ptr addrspace(3) %266, i32 16
  %269 = load i64, ptr addrspace(3) %268, align 16, !tbaa !46
  %270 = icmp eq i64 %269, 9223372036854775806
  br i1 %270, label %290, label %271

271:                                              ; preds = %267
  %272 = and i64 %269, 4294967295
  %273 = getelementptr inbounds nuw i32, ptr addrspace(1) %73, i64 %272
  %274 = load i32, ptr addrspace(1) %273, align 4, !tbaa !5
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %265
  %277 = load i64, ptr addrspace(3) %276, align 8, !tbaa !17
  %278 = lshr i64 %277, 32
  %279 = mul nsw i64 %278, %275
  %280 = and i64 %269, 2161727821137838080
  %281 = icmp eq i64 %280, 0
  br i1 %281, label %282, label %290

282:                                              ; preds = %271
  %283 = getelementptr inbounds nuw i64, ptr addrspace(1) %70, i64 %272
  %284 = load atomic i64, ptr addrspace(1) %283 monotonic, align 8
  fence syncscope("agent") acquire
  %285 = icmp ult i64 %284, %279
  br i1 %285, label %286, label %290

286:                                              ; preds = %282, %286
  %287 = load atomic i64, ptr addrspace(1) %283 monotonic, align 8
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %288 = icmp ult i64 %287, %279
  br i1 %288, label %286, label %289, !llvm.loop !49

289:                                              ; preds = %286
  fence syncscope("agent") acquire
  br label %290

290:                                              ; preds = %289, %282, %271, %267, %263
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %8, label %291, label %292

291:                                              ; preds = %290
  store i32 1, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  br label %292

292:                                              ; preds = %291, %290
  %293 = load i32, ptr addrspace(3) %266, align 16, !tbaa !50
  switch i32 %293, label %319 [
    i32 0, label %1625
    i32 10, label %294
  ]

294:                                              ; preds = %292
  br i1 %161, label %295, label %450

295:                                              ; preds = %294
  %296 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %297 = mul i64 %296, 10
  %298 = load i32, ptr addrspace(1) %162, align 4, !tbaa !5
  %299 = icmp eq i64 %186, 0
  br i1 %299, label %317, label %300

300:                                              ; preds = %295
  %301 = icmp slt i32 %185, 10
  %302 = urem i32 %185, 50
  %303 = icmp eq i32 %302, 0
  %304 = or i1 %301, %303
  br i1 %304, label %305, label %317

305:                                              ; preds = %300
  %306 = sub i64 %297, %186
  %307 = uitofp i64 %306 to double
  %308 = fdiv contract double %307, 1.000000e+06
  %309 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %310 = tail call i64 @__ockl_printf_append_string_n(i64 %309, ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr), i64 %176, i32 0) #15
  %311 = zext i32 %185 to i64
  %312 = tail call i64 @__ockl_printf_append_args(i64 %310, i32 1, i64 %311, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %313 = bitcast double %308 to i64
  %314 = tail call i64 @__ockl_printf_append_args(i64 %312, i32 1, i64 %313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %315 = zext i32 %298 to i64
  %316 = tail call i64 @__ockl_printf_append_args(i64 %314, i32 1, i64 %315, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %317

317:                                              ; preds = %305, %300, %295
  %318 = add nsw i32 %185, 1
  br label %450

319:                                              ; preds = %292
  %320 = and i32 %293, -4
  %321 = icmp eq i32 %320, 136
  br i1 %321, label %326, label %322

322:                                              ; preds = %319
  switch i32 %293, label %323 [
    i32 183, label %326
    i32 175, label %326
    i32 174, label %326
    i32 148, label %326
    i32 147, label %326
    i32 146, label %326
    i32 145, label %326
    i32 144, label %326
    i32 143, label %326
    i32 142, label %326
    i32 184, label %326
  ]

323:                                              ; preds = %322
  %324 = load i32, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  %325 = add nsw i32 %324, %293
  store i32 %325, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  br label %450

326:                                              ; preds = %322, %322, %322, %322, %322, %322, %322, %322, %322, %322, %322, %319
  %327 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4
  %328 = icmp eq i32 %327, -1
  %329 = select i1 %8, i1 %328, i1 false
  br i1 %329, label %330, label %376

330:                                              ; preds = %326
  br i1 %164, label %331, label %357

331:                                              ; preds = %330
  br i1 %177, label %353, label %332

332:                                              ; preds = %331, %332
  %333 = phi i32 [ %347, %332 ], [ 0, %331 ]
  %334 = phi <2 x i32> [ %346, %332 ], [ zeroinitializer, %331 ]
  %335 = phi <2 x i32> [ %343, %332 ], [ zeroinitializer, %331 ]
  %336 = phi <2 x i32> [ %348, %332 ], [ <i32 0, i32 1>, %331 ]
  %337 = zext nneg i32 %333 to i64
  %338 = getelementptr inbounds nuw i32, ptr addrspace(1) %97, i64 %337
  %339 = load <2 x i32>, ptr addrspace(1) %338, align 4, !tbaa !5
  %340 = icmp eq <2 x i32> %339, %180
  %341 = icmp slt <2 x i32> %336, %182
  %342 = zext <2 x i1> %340 to <2 x i32>
  %343 = add <2 x i32> %335, %342
  %344 = and <2 x i1> %341, %340
  %345 = zext <2 x i1> %344 to <2 x i32>
  %346 = add <2 x i32> %334, %345
  %347 = add nuw i32 %333, 2
  %348 = add nuw nsw <2 x i32> %336, splat (i32 2)
  %349 = icmp eq i32 %347, %178
  br i1 %349, label %350, label %332, !llvm.loop !51

350:                                              ; preds = %332
  %351 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %346)
  %352 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %343)
  br i1 %183, label %357, label %353

353:                                              ; preds = %331, %350
  %354 = phi i32 [ 0, %331 ], [ %351, %350 ]
  %355 = phi i32 [ 0, %331 ], [ %352, %350 ]
  %356 = phi i32 [ 0, %331 ], [ %178, %350 ]
  br label %360

357:                                              ; preds = %360, %350, %330
  %358 = phi i32 [ 0, %330 ], [ %352, %350 ], [ %370, %360 ]
  %359 = phi i32 [ 0, %330 ], [ %351, %350 ], [ %373, %360 ]
  store i32 %359, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  store i32 %358, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  br label %376

360:                                              ; preds = %353, %360
  %361 = phi i32 [ %373, %360 ], [ %354, %353 ]
  %362 = phi i32 [ %370, %360 ], [ %355, %353 ]
  %363 = phi i32 [ %374, %360 ], [ %356, %353 ]
  %364 = zext nneg i32 %363 to i64
  %365 = getelementptr inbounds nuw i32, ptr addrspace(1) %97, i64 %364
  %366 = load i32, ptr addrspace(1) %365, align 4, !tbaa !5
  %367 = icmp eq i32 %366, %153
  %368 = icmp slt i32 %363, %107
  %369 = zext i1 %367 to i32
  %370 = add nuw nsw i32 %362, %369
  %371 = and i1 %368, %367
  %372 = zext i1 %371 to i32
  %373 = add nuw nsw i32 %361, %372
  %374 = add nuw nsw i32 %363, 1
  %375 = icmp eq i32 %374, %45
  br i1 %375, label %357, label %360, !llvm.loop !52

376:                                              ; preds = %357, %326
  tail call void @llvm.amdgcn.s.barrier()
  %377 = getelementptr inbounds nuw i8, ptr addrspace(3) %266, i32 106
  %378 = load i16, ptr addrspace(3) %377, align 2, !tbaa !53
  %379 = zext i16 %378 to i32
  %380 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  %381 = icmp slt i32 %380, %379
  br i1 %381, label %382, label %438

382:                                              ; preds = %376
  %383 = load i32, ptr addrspace(1) @g_sink, align 4
  %384 = getelementptr inbounds nuw i8, ptr addrspace(3) %266, i32 104
  %385 = load i16, ptr addrspace(3) %384, align 8, !tbaa !53
  %386 = zext i16 %385 to i32
  %387 = load i32, ptr addrspace(3) %266, align 16, !tbaa !50
  %388 = add i32 %387, %386
  %389 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  %390 = add nsw i32 %380, %389
  %391 = tail call i32 @llvm.smax.i32(i32 %390, i32 %379)
  %392 = icmp slt i32 %390, %379
  %393 = sext i1 %392 to i32
  %394 = select i1 %392, i32 2, i32 1
  %395 = add i32 %391, %393
  %396 = sub i32 %395, %390
  %397 = udiv i32 %396, %389
  %398 = add i32 %394, %397
  %399 = icmp ult i32 %398, 2
  br i1 %399, label %431, label %400

400:                                              ; preds = %382
  %401 = and i32 %398, -2
  %402 = mul i32 %401, %389
  %403 = add i32 %380, %402
  %404 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %383, i64 0
  %405 = insertelement <2 x i32> poison, i32 %388, i64 0
  %406 = shufflevector <2 x i32> %405, <2 x i32> poison, <2 x i32> zeroinitializer
  %407 = insertelement <2 x i32> poison, i32 %380, i64 0
  %408 = shufflevector <2 x i32> %407, <2 x i32> poison, <2 x i32> zeroinitializer
  %409 = insertelement <2 x i32> poison, i32 %389, i64 0
  %410 = shufflevector <2 x i32> %409, <2 x i32> poison, <2 x i32> zeroinitializer
  %411 = mul nuw nsw <2 x i32> %410, <i32 0, i32 1>
  %412 = add nsw <2 x i32> %408, %411
  %413 = shl nsw i32 %389, 1
  %414 = insertelement <2 x i32> poison, i32 %413, i64 0
  %415 = shufflevector <2 x i32> %414, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %416

416:                                              ; preds = %416, %400
  %417 = phi i32 [ 0, %400 ], [ %424, %416 ]
  %418 = phi <2 x i32> [ zeroinitializer, %400 ], [ %423, %416 ]
  %419 = phi <2 x i32> [ %412, %400 ], [ %425, %416 ]
  %420 = phi <2 x i32> [ %404, %400 ], [ %422, %416 ]
  %421 = add <2 x i32> %419, %406
  %422 = add <2 x i32> %421, %420
  %423 = add <2 x i32> %418, splat (i32 1)
  %424 = add nuw i32 %417, 2
  %425 = add nsw <2 x i32> %419, %415
  %426 = icmp eq i32 %424, %401
  br i1 %426, label %427, label %416, !llvm.loop !54

427:                                              ; preds = %416
  %428 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %423)
  %429 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %422)
  %430 = icmp eq i32 %398, %401
  br i1 %430, label %435, label %431

431:                                              ; preds = %382, %427
  %432 = phi i32 [ 0, %382 ], [ %428, %427 ]
  %433 = phi i32 [ %380, %382 ], [ %403, %427 ]
  %434 = phi i32 [ %383, %382 ], [ %429, %427 ]
  br label %440

435:                                              ; preds = %440, %427
  %436 = phi i32 [ %429, %427 ], [ %445, %440 ]
  %437 = phi i32 [ %428, %427 ], [ %446, %440 ]
  store i32 %436, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  br label %438

438:                                              ; preds = %435, %376
  %439 = phi i32 [ %437, %435 ], [ 0, %376 ]
  br i1 %8, label %449, label %450

440:                                              ; preds = %431, %440
  %441 = phi i32 [ %446, %440 ], [ %432, %431 ]
  %442 = phi i32 [ %447, %440 ], [ %433, %431 ]
  %443 = phi i32 [ %445, %440 ], [ %434, %431 ]
  %444 = add i32 %442, %388
  %445 = add nsw i32 %444, %443
  %446 = add nuw nsw i32 %441, 1
  %447 = add nsw i32 %389, %442
  %448 = icmp slt i32 %447, %379
  br i1 %448, label %440, label %435, !llvm.loop !55

449:                                              ; preds = %438
  store i32 %439, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  br label %450

450:                                              ; preds = %323, %449, %438, %317, %294
  %451 = phi i32 [ %318, %317 ], [ %185, %294 ], [ %185, %323 ], [ %185, %449 ], [ %185, %438 ]
  %452 = phi i64 [ %297, %317 ], [ %186, %294 ], [ %186, %323 ], [ %186, %449 ], [ %186, %438 ]
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %8, label %453, label %550

453:                                              ; preds = %450
  %454 = getelementptr inbounds nuw i8, ptr addrspace(3) %266, i32 8
  %455 = load i64, ptr addrspace(3) %454, align 8, !tbaa !56
  %456 = and i64 %455, 4294967295
  %457 = and i64 %455, 2161727821137838080
  %458 = icmp eq i64 %457, 0
  br i1 %458, label %459, label %550

459:                                              ; preds = %453
  %460 = getelementptr inbounds nuw i32, ptr addrspace(1) %73, i64 %456
  %461 = load i32, ptr addrspace(1) %460, align 4, !tbaa !5
  %462 = trunc i64 %455 to i32
  %463 = add nsw i32 %165, %462
  br i1 %166, label %468, label %464

464:                                              ; preds = %459
  %465 = sext i32 %463 to i64
  %466 = getelementptr inbounds i32, ptr addrspace(1) %103, i64 %465
  %467 = load i32, ptr addrspace(1) %466, align 4, !tbaa !5
  br label %468

468:                                              ; preds = %464, %459
  %469 = phi i32 [ %467, %464 ], [ 0, %459 ]
  %470 = icmp sgt i32 %469, 0
  br i1 %470, label %471, label %510

471:                                              ; preds = %468
  %472 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  %473 = icmp eq i32 %472, 0
  %474 = load i32, ptr addrspace(3) %266, align 16, !tbaa !50
  %475 = and i32 %474, -4
  %476 = icmp eq i32 %475, 136
  br i1 %473, label %477, label %479

477:                                              ; preds = %471
  br i1 %476, label %550, label %478

478:                                              ; preds = %477
  switch i32 %474, label %479 [
    i32 183, label %550
    i32 175, label %550
    i32 174, label %550
    i32 148, label %550
    i32 147, label %550
    i32 146, label %550
    i32 145, label %550
    i32 144, label %550
    i32 143, label %550
    i32 142, label %550
    i32 184, label %550
  ]

479:                                              ; preds = %471, %478
  %480 = phi i1 [ false, %478 ], [ %476, %471 ]
  br i1 %480, label %488, label %481

481:                                              ; preds = %479
  %482 = add i32 %474, -142
  %483 = icmp ult i32 %482, 43
  br i1 %483, label %484, label %488

484:                                              ; preds = %481
  %485 = zext nneg i32 %482 to i43
  %486 = lshr i43 -2186138353537, %485
  %487 = trunc i43 %486 to i1
  br label %488

488:                                              ; preds = %481, %484, %479
  %489 = phi i1 [ true, %479 ], [ %487, %484 ], [ false, %481 ]
  %490 = sext i32 %463 to i64
  %491 = getelementptr inbounds i64, ptr addrspace(1) %91, i64 %490
  %492 = sext i32 %472 to i64
  %493 = select i1 %489, i64 %492, i64 1
  %494 = atomicrmw add ptr addrspace(1) %491, i64 %493 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %495 = add i64 %494, %493
  %496 = zext nneg i32 %469 to i64
  %497 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %265
  %498 = load i64, ptr addrspace(3) %497, align 8, !tbaa !17
  %499 = lshr i64 %498, 32
  %500 = mul nuw nsw i64 %499, %496
  %501 = icmp eq i64 %495, %500
  br i1 %501, label %502, label %550

502:                                              ; preds = %488
  fence syncscope("agent") release
  br i1 %480, label %505, label %503

503:                                              ; preds = %502
  switch i32 %474, label %504 [
    i32 183, label %505
    i32 175, label %505
    i32 174, label %505
    i32 148, label %505
    i32 147, label %505
    i32 146, label %505
    i32 145, label %505
    i32 144, label %505
    i32 143, label %505
    i32 142, label %505
    i32 184, label %505
  ]

504:                                              ; preds = %503
  br label %505

505:                                              ; preds = %502, %503, %503, %503, %503, %503, %503, %503, %503, %503, %503, %503, %504
  %506 = phi i64 [ %496, %504 ], [ 1, %503 ], [ 1, %502 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ], [ 1, %503 ]
  %507 = getelementptr inbounds nuw i64, ptr %69, i64 %456
  %508 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %507, i64 range(i64 1, 2147483648) %506) #14, !srcloc !57
  %509 = add i64 %508, %506
  br label %515

510:                                              ; preds = %468
  fence syncscope("agent") release
  %511 = getelementptr inbounds nuw i64, ptr %69, i64 %456
  %512 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %511, i64 1) #14, !srcloc !57
  %513 = add i64 %512, 1
  %514 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %265
  br label %515

515:                                              ; preds = %510, %505
  %516 = phi ptr addrspace(3) [ %514, %510 ], [ %497, %505 ]
  %517 = phi i64 [ %513, %510 ], [ %509, %505 ]
  %518 = sext i32 %461 to i64
  %519 = load i64, ptr addrspace(3) %516, align 8, !tbaa !17
  %520 = lshr i64 %519, 32
  %521 = mul nsw i64 %520, %518
  %522 = icmp eq i64 %517, %521
  br i1 %522, label %523, label %550

523:                                              ; preds = %515
  %524 = getelementptr inbounds nuw %"struct.mirage::runtime::EventDesc", ptr addrspace(1) %79, i64 %456
  %525 = load i32, ptr addrspace(1) %524, align 8, !tbaa !58
  %526 = icmp eq i32 %525, 900
  br i1 %526, label %550, label %527

527:                                              ; preds = %523
  %528 = and i32 %525, -2
  %529 = icmp eq i32 %528, 902
  br i1 %529, label %530, label %541

530:                                              ; preds = %527
  %531 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %173, i64 1) #14, !srcloc !57
  %532 = load ptr, ptr addrspace(1) %174, align 8, !tbaa !27
  %533 = urem i64 %531, %58
  %534 = getelementptr inbounds nuw i64, ptr %532, i64 %533
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "v,v,~{memory}"(ptr %534, i64 range(i64 0, 4294967296) %456) #14, !srcloc !60
  fence syncscope("agent") release
  %535 = add i64 %531, 1
  %536 = insertelement <2 x i64> poison, i64 %535, i64 0
  %537 = insertelement <2 x i64> %536, i64 %531, i64 1
  br label %538

538:                                              ; preds = %538, %530
  %539 = tail call noundef i64 asm sideeffect "flat_atomic_cmpswap_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %175, <2 x i64> %537) #14, !srcloc !61
  %540 = icmp eq i64 %539, %531
  br i1 %540, label %550, label %538, !llvm.loop !62

541:                                              ; preds = %527
  %542 = atomicrmw add ptr addrspace(1) %169, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %543 = load ptr, ptr addrspace(1) %170, align 8, !tbaa !27
  %544 = urem i64 %542, %58
  %545 = getelementptr inbounds nuw i64, ptr %543, i64 %544
  store volatile i64 %456, ptr %545, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %546 = add i64 %542, 1
  br label %547

547:                                              ; preds = %547, %541
  %548 = cmpxchg ptr addrspace(1) %171, i64 %542, i64 %546 syncscope("agent") monotonic monotonic, align 8
  %549 = extractvalue { i64, i1 } %548, 1
  br i1 %549, label %550, label %547, !llvm.loop !63

550:                                              ; preds = %547, %538, %478, %478, %478, %478, %478, %478, %478, %478, %478, %478, %478, %477, %523, %515, %488, %453, %450
  %551 = add nsw i32 %265, 1
  br label %184, !llvm.loop !64

552:                                              ; preds = %42
  %553 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %554 = load i32, ptr addrspace(4) %553, align 8, !tbaa !5
  %555 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %556 = load i64, ptr addrspace(4) %555, align 8, !tbaa !17
  %557 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 40
  %558 = load i64, ptr addrspace(4) %557, align 8, !tbaa !17
  %559 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %560 = load ptr, ptr addrspace(4) %559, align 8, !tbaa !27
  %561 = addrspacecast ptr %560 to ptr addrspace(1)
  %562 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %563 = load ptr, ptr addrspace(4) %562, align 8, !tbaa !27
  %564 = addrspacecast ptr %563 to ptr addrspace(1)
  %565 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 64
  %566 = load ptr, ptr addrspace(4) %565, align 8, !tbaa !27
  %567 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 88
  %568 = load ptr, ptr addrspace(4) %567, align 8, !tbaa !33
  %569 = addrspacecast ptr %568 to ptr addrspace(1)
  %570 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 96
  %571 = load ptr, ptr addrspace(4) %570, align 8, !tbaa !35
  %572 = addrspacecast ptr %571 to ptr addrspace(1)
  %573 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 104
  %574 = load ptr, ptr addrspace(4) %573, align 8, !tbaa !37
  %575 = addrspacecast ptr %574 to ptr addrspace(1)
  %576 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 112
  %577 = load ptr, ptr addrspace(4) %576, align 8, !tbaa !37
  %578 = addrspacecast ptr %577 to ptr addrspace(1)
  %579 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 128
  %580 = load ptr, ptr addrspace(4) %579, align 8, !tbaa !31
  %581 = addrspacecast ptr %580 to ptr addrspace(1)
  %582 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 136
  %583 = load ptr, ptr addrspace(4) %582, align 8, !tbaa !27
  %584 = addrspacecast ptr %583 to ptr addrspace(1)
  %585 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 144
  %586 = load ptr, ptr addrspace(4) %585, align 8, !tbaa !27
  %587 = addrspacecast ptr %586 to ptr addrspace(1)
  %588 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 152
  %589 = load ptr, ptr addrspace(4) %588, align 8, !tbaa !27
  %590 = addrspacecast ptr %589 to ptr addrspace(1)
  %591 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 160
  %592 = load i64, ptr addrspace(4) %591, align 8, !tbaa !17
  %593 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 168
  %594 = load i32, ptr addrspace(4) %593, align 8, !tbaa !5
  %595 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 184
  %596 = load ptr, ptr addrspace(4) %595, align 8, !tbaa !31
  %597 = addrspacecast ptr %596 to ptr addrspace(1)
  %598 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 192
  %599 = load ptr, ptr addrspace(4) %598, align 8, !tbaa !31
  %600 = addrspacecast ptr %599 to ptr addrspace(1)
  %601 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 200
  %602 = load ptr, ptr addrspace(4) %601, align 8, !tbaa !31
  %603 = addrspacecast ptr %602 to ptr addrspace(1)
  %604 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 208
  %605 = load ptr, ptr addrspace(4) %604, align 8, !tbaa !31
  %606 = addrspacecast ptr %605 to ptr addrspace(1)
  %607 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 216
  %608 = load ptr, ptr addrspace(4) %607, align 8, !tbaa !31
  %609 = addrspacecast ptr %608 to ptr addrspace(1)
  %610 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 224
  %611 = load ptr, ptr addrspace(4) %610, align 8, !tbaa !31
  %612 = addrspacecast ptr %611 to ptr addrspace(1)
  %613 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 232
  %614 = load ptr, ptr addrspace(4) %613, align 8, !tbaa !31
  %615 = addrspacecast ptr %614 to ptr addrspace(1)
  %616 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 240
  %617 = load ptr, ptr addrspace(4) %616, align 8, !tbaa !31
  %618 = addrspacecast ptr %617 to ptr addrspace(1)
  %619 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 248
  %620 = load ptr, ptr addrspace(4) %619, align 8, !tbaa !31
  %621 = addrspacecast ptr %620 to ptr addrspace(1)
  %622 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 256
  %623 = load ptr, ptr addrspace(4) %622, align 8, !tbaa !31
  %624 = addrspacecast ptr %623 to ptr addrspace(1)
  %625 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 264
  %626 = load i32, ptr addrspace(4) %625, align 8, !tbaa !5
  %627 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 320
  %628 = load i32, ptr addrspace(4) %627, align 8, !tbaa !5
  %629 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 328
  %630 = load ptr, ptr addrspace(4) %629, align 8, !tbaa !31
  %631 = addrspacecast ptr %630 to ptr addrspace(1)
  %632 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 336
  %633 = load ptr, ptr addrspace(4) %632, align 8, !tbaa !31
  %634 = addrspacecast ptr %633 to ptr addrspace(1)
  %635 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 344
  %636 = load ptr, ptr addrspace(4) %635, align 8, !tbaa !31
  %637 = addrspacecast ptr %636 to ptr addrspace(1)
  %638 = add i32 %48, %49
  br i1 %8, label %639, label %1625

639:                                              ; preds = %552
  %640 = load i32, ptr addrspace(3) @_ZZ17persistent_kernelN6mirage7runtime13RuntimeConfigEE5my_id, align 4, !tbaa !5
  %641 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %642 = icmp slt i32 %640, 0
  %643 = select i1 %642, i32 %641, i32 %640
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds ptr, ptr addrspace(1) %578, i64 %644
  %646 = load ptr, ptr addrspace(1) %645, align 8, !tbaa !27
  %647 = insertelement <2 x ptr> <ptr poison, ptr null>, ptr %646, i64 0
  %648 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %643, i64 0
  call void @llvm.lifetime.start.p5(ptr addrspace(5) %2) #15
  %649 = icmp slt i32 %643, %49
  br i1 %649, label %650, label %739

650:                                              ; preds = %639
  %651 = sext i32 %638 to i64
  %652 = getelementptr inbounds ptr, ptr addrspace(1) %578, i64 %651
  %653 = load ptr, ptr addrspace(1) %652, align 8, !tbaa !27
  %654 = insertelement <2 x ptr> %647, ptr %653, i64 1
  %655 = insertelement <2 x i32> %648, i32 %638, i64 1
  %656 = icmp eq ptr addrspace(1) %631, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %656, label %660, label %657

657:                                              ; preds = %650
  %658 = atomicrmw or ptr addrspace(1) %634, i32 0 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %659 = icmp slt i32 %658, %45
  br i1 %659, label %697, label %700

660:                                              ; preds = %650
  %661 = icmp slt i32 %643, %45
  br i1 %661, label %662, label %794

662:                                              ; preds = %660
  %663 = add i32 %643, %49
  %664 = tail call i32 @llvm.smax.i32(i32 %45, i32 %663)
  %665 = icmp slt i32 %663, %45
  %666 = zext i1 %665 to i32
  %667 = add i32 %663, %666
  %668 = sub i32 %664, %667
  %669 = udiv i32 %668, %49
  %670 = add i32 %669, %666
  %671 = add i32 %670, 1
  %672 = icmp ult i32 %671, 2
  br i1 %672, label %694, label %673

673:                                              ; preds = %662
  %674 = and i32 %671, -2
  %675 = mul i32 %674, %49
  %676 = add i32 %643, %675
  %677 = insertelement <2 x i32> poison, i32 %643, i64 0
  %678 = shufflevector <2 x i32> %677, <2 x i32> poison, <2 x i32> zeroinitializer
  %679 = shufflevector <2 x i32> %47, <2 x i32> poison, <2 x i32> zeroinitializer
  %680 = mul nuw nsw <2 x i32> %679, <i32 0, i32 1>
  %681 = add nsw <2 x i32> %678, %680
  %682 = shl nsw i32 %49, 1
  %683 = insertelement <2 x i32> poison, i32 %682, i64 0
  %684 = shufflevector <2 x i32> %683, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %685

685:                                              ; preds = %685, %673
  %686 = phi i32 [ 0, %673 ], [ %689, %685 ]
  %687 = phi <2 x i32> [ %681, %673 ], [ %690, %685 ]
  %688 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %686
  store <2 x i32> %687, ptr addrspace(5) %688, align 8, !tbaa !5
  %689 = add nuw i32 %686, 2
  %690 = add nsw <2 x i32> %687, %684
  %691 = icmp eq i32 %689, %674
  br i1 %691, label %692, label %685, !llvm.loop !65

692:                                              ; preds = %685
  %693 = icmp eq i32 %671, %674
  br i1 %693, label %794, label %694

694:                                              ; preds = %662, %692
  %695 = phi i32 [ 0, %662 ], [ %674, %692 ]
  %696 = phi i32 [ %643, %662 ], [ %676, %692 ]
  br label %732

697:                                              ; preds = %657, %697
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %698 = atomicrmw or ptr addrspace(1) %634, i32 0 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %699 = icmp slt i32 %698, %45
  br i1 %699, label %697, label %700, !llvm.loop !66

700:                                              ; preds = %697, %657
  fence syncscope("agent") release
  %701 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  %702 = icmp sgt i32 %45, 0
  br i1 %702, label %718, label %703

703:                                              ; preds = %728, %700
  %704 = phi i32 [ 0, %700 ], [ %729, %728 ]
  %705 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %706 = icmp eq ptr addrspace(4) @.str.4, addrspacecast (ptr null to ptr addrspace(4))
  %707 = select i1 %706, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.4, i64 58) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.4 to ptr) to i64)), i64 1))
  %708 = tail call i64 @__ockl_printf_append_string_n(i64 %705, ptr addrspacecast (ptr addrspace(4) @.str.4 to ptr), i64 %707, i32 0) #15
  %709 = zext i32 %643 to i64
  %710 = tail call i64 @__ockl_printf_append_args(i64 %708, i32 1, i64 %709, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %711 = zext i32 %701 to i64
  %712 = tail call i64 @__ockl_printf_append_args(i64 %710, i32 1, i64 %711, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %713 = zext i32 %704 to i64
  %714 = tail call i64 @__ockl_printf_append_args(i64 %712, i32 1, i64 %713, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %715 = zext i32 %641 to i64
  %716 = tail call i64 @__ockl_printf_append_args(i64 %714, i32 1, i64 %715, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  %717 = mul nsw i32 %701, %554
  br label %794

718:                                              ; preds = %700, %728
  %719 = phi i32 [ %729, %728 ], [ 0, %700 ]
  %720 = phi i32 [ %730, %728 ], [ 0, %700 ]
  %721 = zext nneg i32 %720 to i64
  %722 = getelementptr inbounds nuw i32, ptr addrspace(1) %631, i64 %721
  %723 = load i32, ptr addrspace(1) %722, align 4, !tbaa !5
  %724 = icmp eq i32 %723, %701
  br i1 %724, label %725, label %728

725:                                              ; preds = %718
  %726 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %719
  %727 = add nsw i32 %719, 1
  store i32 %720, ptr addrspace(5) %726, align 4, !tbaa !5
  br label %728

728:                                              ; preds = %725, %718
  %729 = phi i32 [ %727, %725 ], [ %719, %718 ]
  %730 = add nuw nsw i32 %720, 1
  %731 = icmp eq i32 %730, %45
  br i1 %731, label %703, label %718, !llvm.loop !67

732:                                              ; preds = %694, %732
  %733 = phi i32 [ %735, %732 ], [ %695, %694 ]
  %734 = phi i32 [ %737, %732 ], [ %696, %694 ]
  %735 = add nuw nsw i32 %733, 1
  %736 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %733
  store i32 %734, ptr addrspace(5) %736, align 4, !tbaa !5
  %737 = add nsw i32 %734, %49
  %738 = icmp slt i32 %737, %45
  br i1 %738, label %732, label %794, !llvm.loop !68

739:                                              ; preds = %639
  %740 = sub nsw i32 %643, %49
  %741 = icmp slt i32 %740, %45
  br i1 %741, label %742, label %794

742:                                              ; preds = %739
  %743 = add i32 %643, %48
  %744 = sub i32 %743, %49
  %745 = tail call i32 @llvm.smax.i32(i32 %45, i32 %744)
  %746 = insertelement <2 x i32> poison, i32 %745, i64 0
  %747 = insertelement <2 x i32> %746, i32 %643, i64 1
  %748 = add <2 x i32> %47, %747
  %749 = extractelement <2 x i32> %748, i64 0
  %750 = extractelement <2 x i32> %748, i64 1
  %751 = icmp ne i32 %749, %750
  %752 = zext i1 %751 to i32
  %753 = add i32 %750, %752
  %754 = sub i32 %749, %753
  %755 = udiv i32 %754, %48
  %756 = add i32 %755, %752
  %757 = add i32 %756, 1
  %758 = icmp ult i32 %757, 2
  br i1 %758, label %783, label %759

759:                                              ; preds = %742
  %760 = and i32 %757, -2
  %761 = mul i32 %760, %48
  %762 = add i32 %740, %761
  %763 = insertelement <2 x i32> poison, i32 %45, i64 0
  %764 = shufflevector <2 x i32> %763, <2 x i32> poison, <2 x i32> zeroinitializer
  %765 = insertelement <2 x i32> poison, i32 %740, i64 0
  %766 = shufflevector <2 x i32> %765, <2 x i32> poison, <2 x i32> zeroinitializer
  %767 = shufflevector <2 x i32> %47, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %768 = mul nuw nsw <2 x i32> %767, <i32 0, i32 1>
  %769 = add nsw <2 x i32> %766, %768
  %770 = shl nsw i32 %48, 1
  %771 = insertelement <2 x i32> poison, i32 %770, i64 0
  %772 = shufflevector <2 x i32> %771, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %773

773:                                              ; preds = %773, %759
  %774 = phi i32 [ 0, %759 ], [ %778, %773 ]
  %775 = phi <2 x i32> [ %769, %759 ], [ %779, %773 ]
  %776 = add nsw <2 x i32> %775, %764
  %777 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %774
  store <2 x i32> %776, ptr addrspace(5) %777, align 8, !tbaa !5
  %778 = add nuw i32 %774, 2
  %779 = add nsw <2 x i32> %775, %772
  %780 = icmp eq i32 %778, %760
  br i1 %780, label %781, label %773, !llvm.loop !69

781:                                              ; preds = %773
  %782 = icmp eq i32 %757, %760
  br i1 %782, label %794, label %783

783:                                              ; preds = %742, %781
  %784 = phi i32 [ 0, %742 ], [ %760, %781 ]
  %785 = phi i32 [ %740, %742 ], [ %762, %781 ]
  br label %786

786:                                              ; preds = %783, %786
  %787 = phi i32 [ %790, %786 ], [ %784, %783 ]
  %788 = phi i32 [ %792, %786 ], [ %785, %783 ]
  %789 = add nsw i32 %788, %45
  %790 = add nuw nsw i32 %787, 1
  %791 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %787
  store i32 %789, ptr addrspace(5) %791, align 4, !tbaa !5
  %792 = add nsw i32 %788, %48
  %793 = icmp slt i32 %792, %45
  br i1 %793, label %786, label %794, !llvm.loop !70

794:                                              ; preds = %786, %732, %781, %692, %739, %660, %703
  %795 = phi <2 x ptr> [ %654, %703 ], [ %654, %660 ], [ %647, %739 ], [ %654, %692 ], [ %647, %781 ], [ %654, %732 ], [ %647, %786 ]
  %796 = phi <2 x i32> [ %655, %703 ], [ %655, %660 ], [ %648, %739 ], [ %655, %692 ], [ %648, %781 ], [ %655, %732 ], [ %648, %786 ]
  %797 = phi i32 [ %717, %703 ], [ 0, %660 ], [ 0, %739 ], [ 0, %692 ], [ 0, %781 ], [ 0, %732 ], [ 0, %786 ]
  %798 = phi i32 [ %704, %703 ], [ 0, %660 ], [ 0, %739 ], [ %674, %692 ], [ %760, %781 ], [ %735, %732 ], [ %790, %786 ]
  %799 = phi i32 [ 1, %703 ], [ 1, %660 ], [ 0, %739 ], [ 1, %692 ], [ 0, %781 ], [ 1, %732 ], [ 0, %786 ]
  call void @llvm.lifetime.start.p5(ptr addrspace(5) %3) #15
  %800 = icmp sgt i32 %798, 0
  br i1 %800, label %816, label %801

801:                                              ; preds = %816, %794
  %802 = extractelement <2 x i32> %796, i64 0
  %803 = sext i32 %802 to i64
  %804 = getelementptr inbounds i64, ptr addrspace(1) %564, i64 %803
  %805 = addrspacecast ptr addrspace(1) %804 to ptr
  %806 = extractelement <2 x ptr> %795, i64 0
  %807 = sext i32 %49 to i64
  %808 = icmp ne ptr addrspace(1) %637, addrspacecast (ptr null to ptr addrspace(1))
  %809 = sext i32 %45 to i64
  %810 = add nsw i64 %809, -1
  %811 = getelementptr inbounds nuw i8, ptr addrspace(1) %597, i64 4
  %812 = icmp eq ptr addrspace(4) @.str.3, addrspacecast (ptr null to ptr addrspace(4))
  %813 = getelementptr inbounds nuw i8, ptr addrspace(1) %600, i64 4
  %814 = icmp sgt i32 %638, 0
  %815 = select i1 %812, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.3, i64 53) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr) to i64)), i64 1))
  br label %821

816:                                              ; preds = %794, %816
  %817 = phi i32 [ %819, %816 ], [ 0, %794 ]
  %818 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %817
  store i64 0, ptr addrspace(5) %818, align 8, !tbaa !40
  %819 = add nuw nsw i32 %817, 1
  %820 = icmp eq i32 %819, %798
  br i1 %820, label %801, label %816, !llvm.loop !71

821:                                              ; preds = %801, %1618
  %822 = phi <2 x i64> [ %860, %1618 ], [ zeroinitializer, %801 ]
  %823 = phi <2 x i64> [ %1619, %1618 ], [ zeroinitializer, %801 ]
  %824 = phi i32 [ %858, %1618 ], [ 0, %801 ]
  %825 = phi i32 [ %1620, %1618 ], [ 0, %801 ]
  %826 = phi i32 [ %1621, %1618 ], [ 0, %801 ]
  %827 = phi i64 [ %1622, %1618 ], [ 0, %801 ]
  %828 = phi i64 [ %1623, %1618 ], [ 0, %801 ]
  %829 = extractelement <2 x i64> %823, i32 %824
  %830 = extractelement <2 x i64> %822, i32 %824
  %831 = icmp eq i64 %829, %830
  br i1 %831, label %832, label %857

832:                                              ; preds = %821, %850
  %833 = phi i64 [ %854, %850 ], [ %829, %821 ]
  %834 = phi i32 [ %853, %850 ], [ %824, %821 ]
  %835 = phi <2 x i64> [ %847, %850 ], [ %822, %821 ]
  %836 = icmp eq i32 %834, 0
  br i1 %836, label %837, label %840

837:                                              ; preds = %832
  %838 = load volatile i64, ptr %805, align 8, !tbaa !17
  %839 = insertelement <2 x i64> %835, i64 %838, i64 0
  br label %846

840:                                              ; preds = %832
  %841 = extractelement <2 x i32> %796, i32 %834
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds i64, ptr %563, i64 %842
  %844 = tail call noundef i64 asm sideeffect "global_load_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "=v,v,~{memory}"(ptr %843) #14, !srcloc !72
  %845 = insertelement <2 x i64> %835, i64 %844, i32 %834
  br label %846

846:                                              ; preds = %840, %837
  %847 = phi <2 x i64> [ %845, %840 ], [ %839, %837 ]
  %848 = extractelement <2 x i64> %847, i32 %834
  %849 = icmp ult i64 %833, %848
  br i1 %849, label %857, label %850

850:                                              ; preds = %846
  %851 = icmp eq i32 %834, %799
  %852 = add nsw i32 %834, 1
  %853 = select i1 %851, i32 0, i32 %852
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %854 = extractelement <2 x i64> %823, i32 %853
  %855 = extractelement <2 x i64> %847, i32 %853
  %856 = icmp eq i64 %854, %855
  br i1 %856, label %832, label %857, !llvm.loop !73

857:                                              ; preds = %850, %846, %821
  %858 = phi i32 [ %824, %821 ], [ %853, %850 ], [ %834, %846 ]
  %859 = phi i64 [ %829, %821 ], [ %854, %850 ], [ %833, %846 ]
  %860 = phi <2 x i64> [ %822, %821 ], [ %847, %846 ], [ %847, %850 ]
  %861 = icmp eq i32 %858, 0
  br i1 %861, label %862, label %867

862:                                              ; preds = %857
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %863 = extractelement <2 x i64> %823, i64 0
  %864 = urem i64 %863, %558
  %865 = getelementptr inbounds nuw i64, ptr %806, i64 %864
  %866 = load volatile i64, ptr %865, align 8, !tbaa !17
  br label %872

867:                                              ; preds = %857
  fence syncscope("agent") release
  %868 = extractelement <2 x ptr> %795, i32 %858
  %869 = urem i64 %859, %558
  %870 = getelementptr inbounds nuw i64, ptr %868, i64 %869
  %871 = tail call noundef i64 asm sideeffect "global_load_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "=v,v,~{memory}"(ptr %870) #14, !srcloc !72
  br label %872

872:                                              ; preds = %867, %862
  %873 = phi i64 [ %866, %862 ], [ %871, %867 ]
  %874 = getelementptr inbounds %"struct.mirage::runtime::EventDesc", ptr addrspace(1) %572, i64 %873
  %875 = getelementptr inbounds nuw i8, ptr addrspace(1) %874, i64 8
  %876 = load i64, ptr addrspace(1) %875, align 8, !tbaa !17
  %877 = getelementptr inbounds nuw i8, ptr addrspace(1) %874, i64 16
  %878 = load i64, ptr addrspace(1) %877, align 8, !tbaa !17
  %879 = icmp eq i64 %873, 0
  br i1 %879, label %880, label %898

880:                                              ; preds = %872
  br i1 %649, label %881, label %1618

881:                                              ; preds = %880
  br i1 %800, label %882, label %1618

882:                                              ; preds = %881, %882
  %883 = phi i32 [ %896, %882 ], [ 0, %881 ]
  %884 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %883
  %885 = load i32, ptr addrspace(5) %884, align 4, !tbaa !5
  %886 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %883
  %887 = load i64, ptr addrspace(5) %886, align 8, !tbaa !40
  %888 = add i64 %887, 1
  store i64 %888, ptr addrspace(5) %886, align 8, !tbaa !40
  %889 = sext i32 %885 to i64
  %890 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %889
  %891 = load ptr, ptr addrspace(1) %890, align 8, !tbaa !27
  %892 = urem i64 %887, %556
  %893 = getelementptr inbounds nuw i64, ptr %891, i64 %892
  store volatile i64 0, ptr %893, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %894 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %889
  %895 = atomicrmw add ptr addrspace(1) %894, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %896 = add nuw nsw i32 %883, 1
  %897 = icmp eq i32 %896, %798
  br i1 %897, label %1618, label %882, !llvm.loop !74

898:                                              ; preds = %872
  %899 = load i32, ptr addrspace(1) %874, align 8, !tbaa !58
  switch i32 %899, label %1525 [
    i32 910, label %900
    i32 903, label %1336
    i32 902, label %1504
  ]

900:                                              ; preds = %898
  %901 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %902 = mul i64 %901, 10
  %903 = load i32, ptr addrspace(1) %811, align 4, !tbaa !5
  %904 = icmp eq i64 %827, 0
  br i1 %904, label %922, label %905

905:                                              ; preds = %900
  %906 = icmp slt i32 %826, 10
  %907 = urem i32 %826, 100
  %908 = icmp eq i32 %907, 0
  %909 = or i1 %906, %908
  br i1 %909, label %910, label %922

910:                                              ; preds = %905
  %911 = sub i64 %902, %827
  %912 = uitofp i64 %911 to double
  %913 = fdiv contract double %912, 1.000000e+06
  %914 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %915 = tail call i64 @__ockl_printf_append_string_n(i64 %914, ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr), i64 %815, i32 0) #15
  %916 = zext i32 %826 to i64
  %917 = tail call i64 @__ockl_printf_append_args(i64 %915, i32 1, i64 %916, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %918 = bitcast double %913 to i64
  %919 = tail call i64 @__ockl_printf_append_args(i64 %917, i32 1, i64 %918, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %920 = zext i32 %903 to i64
  %921 = tail call i64 @__ockl_printf_append_args(i64 %919, i32 1, i64 %920, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %922

922:                                              ; preds = %910, %905, %900
  %923 = add nsw i32 %826, 1
  %924 = load i32, ptr addrspace(1) %618, align 4, !tbaa !5
  %925 = load i32, ptr addrspace(1) %621, align 4, !tbaa !5
  %926 = load i32, ptr addrspace(1) %612, align 4, !tbaa !5
  %927 = shl i32 %926, 16
  %928 = ashr exact i32 %927, 16
  %929 = icmp eq i32 %927, -65536
  br i1 %929, label %997, label %930

930:                                              ; preds = %922
  %931 = zext i32 %926 to i64
  %932 = shl i64 %931, 48
  %933 = ashr exact i64 %932, 48
  %934 = getelementptr inbounds i32, ptr addrspace(1) %581, i64 %933
  %935 = load i32, ptr addrspace(1) %934, align 4, !tbaa !5
  %936 = load <2 x i32>, ptr addrspace(1) %597, align 4, !tbaa !5
  %937 = extractelement <2 x i32> %936, i64 0
  %938 = extractelement <2 x i32> %936, i64 1
  %939 = sub nsw i32 %938, %937
  %940 = getelementptr inbounds i32, ptr addrspace(1) %609, i64 %933
  %941 = load i32, ptr addrspace(1) %940, align 4, !tbaa !5
  %942 = icmp sgt i32 %939, 0
  br i1 %942, label %943, label %947

943:                                              ; preds = %930
  %944 = add i32 %935, 1
  %945 = mul nsw i32 %928, 1200
  %946 = add nsw i32 %935, %945
  br label %951

947:                                              ; preds = %966, %930
  %948 = add i32 %939, %935
  store i32 %948, ptr addrspace(1) %934, align 4, !tbaa !5
  %949 = add nsw i32 %948, 1
  %950 = icmp slt i32 %949, %594
  br i1 %950, label %969, label %978

951:                                              ; preds = %943, %966
  %952 = phi i32 [ 0, %943 ], [ %967, %966 ]
  %953 = add i32 %944, %952
  %954 = icmp sge i32 %953, %941
  %955 = icmp slt i32 %953, %594
  %956 = select i1 %954, i1 %955, i1 false
  br i1 %956, label %957, label %966

957:                                              ; preds = %951
  %958 = add nsw i32 %952, %937
  %959 = sext i32 %958 to i64
  %960 = getelementptr inbounds i64, ptr addrspace(1) %590, i64 %959
  %961 = load i64, ptr addrspace(1) %960, align 8, !tbaa !17
  %962 = add nsw i32 %946, %952
  %963 = sext i32 %962 to i64
  %964 = getelementptr i64, ptr addrspace(1) %584, i64 %963
  %965 = getelementptr i8, ptr addrspace(1) %964, i64 8
  store i64 %961, ptr addrspace(1) %965, align 8, !tbaa !17
  br label %966

966:                                              ; preds = %957, %951
  %967 = add nuw nsw i32 %952, 1
  %968 = icmp slt i32 %967, %939
  br i1 %968, label %951, label %947, !llvm.loop !75

969:                                              ; preds = %947
  %970 = mul nsw i32 %928, 1200
  %971 = add i32 %948, %970
  %972 = sext i32 %971 to i64
  %973 = getelementptr inbounds i64, ptr addrspace(1) %584, i64 %972
  %974 = load i64, ptr addrspace(1) %973, align 8, !tbaa !17
  %975 = icmp ne i64 %974, %592
  %976 = icmp slt i32 %948, %941
  %977 = select i1 %975, i1 true, i1 %976
  br i1 %977, label %997, label %978

978:                                              ; preds = %969, %947
  store i32 -1, ptr addrspace(1) %612, align 4, !tbaa !5
  %979 = load <2 x i32>, ptr addrspace(1) %600, align 4, !tbaa !5
  %980 = extractelement <2 x i32> %979, i64 0
  %981 = extractelement <2 x i32> %979, i64 1
  %982 = sub nsw i32 %981, %980
  %983 = icmp sgt i32 %982, 0
  br i1 %983, label %984, label %997

984:                                              ; preds = %978, %984
  %985 = phi i32 [ %994, %984 ], [ %925, %978 ]
  %986 = phi i32 [ %995, %984 ], [ 0, %978 ]
  %987 = add nsw i32 %986, %980
  %988 = sext i32 %987 to i64
  %989 = getelementptr inbounds i32, ptr addrspace(1) %603, i64 %988
  %990 = load i32, ptr addrspace(1) %989, align 4, !tbaa !5
  %991 = srem i32 %985, 16
  %992 = sext i32 %991 to i64
  %993 = getelementptr inbounds i32, ptr addrspace(1) %615, i64 %992
  store i32 %990, ptr addrspace(1) %993, align 4, !tbaa !5
  %994 = add nsw i32 %985, 1
  %995 = add nuw nsw i32 %986, 1
  %996 = icmp slt i32 %995, %982
  br i1 %996, label %984, label %997, !llvm.loop !76

997:                                              ; preds = %984, %978, %969, %922
  %998 = phi i32 [ %925, %922 ], [ %925, %969 ], [ %925, %978 ], [ %994, %984 ]
  %999 = load i32, ptr addrspace(1) %813, align 4, !tbaa !5
  %1000 = icmp sgt i32 %999, 0
  br i1 %1000, label %1001, label %1084

1001:                                             ; preds = %997
  %1002 = icmp eq i32 %999, 1
  br i1 %1002, label %1074, label %1003

1003:                                             ; preds = %1001
  %1004 = and i32 %999, 2147483646
  %1005 = add nsw i32 %999, -2
  %1006 = lshr i32 %1005, 1
  %1007 = add nuw i32 %1006, 1
  %1008 = and i32 %1007, 7
  %1009 = icmp ult i32 %1005, 14
  br i1 %1009, label %1059, label %1010

1010:                                             ; preds = %1003
  %1011 = and i32 %1007, -8
  br label %1012

1012:                                             ; preds = %1012, %1010
  %1013 = phi i32 [ 0, %1010 ], [ %1054, %1012 ]
  %1014 = phi i32 [ 0, %1010 ], [ %1055, %1012 ]
  %1015 = zext nneg i32 %1013 to i64
  %1016 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1015
  %1017 = load <2 x i32>, ptr addrspace(1) %1016, align 4, !tbaa !5
  %1018 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1013
  store <2 x i32> %1017, ptr addrspace(3) %1018, align 16, !tbaa !5
  %1019 = or disjoint i32 %1013, 2
  %1020 = zext nneg i32 %1019 to i64
  %1021 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1020
  %1022 = load <2 x i32>, ptr addrspace(1) %1021, align 4, !tbaa !5
  %1023 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1019
  store <2 x i32> %1022, ptr addrspace(3) %1023, align 8, !tbaa !5
  %1024 = or disjoint i32 %1013, 4
  %1025 = zext nneg i32 %1024 to i64
  %1026 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1025
  %1027 = load <2 x i32>, ptr addrspace(1) %1026, align 4, !tbaa !5
  %1028 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1024
  store <2 x i32> %1027, ptr addrspace(3) %1028, align 16, !tbaa !5
  %1029 = or disjoint i32 %1013, 6
  %1030 = zext nneg i32 %1029 to i64
  %1031 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1030
  %1032 = load <2 x i32>, ptr addrspace(1) %1031, align 4, !tbaa !5
  %1033 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1029
  store <2 x i32> %1032, ptr addrspace(3) %1033, align 8, !tbaa !5
  %1034 = or disjoint i32 %1013, 8
  %1035 = zext nneg i32 %1034 to i64
  %1036 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1035
  %1037 = load <2 x i32>, ptr addrspace(1) %1036, align 4, !tbaa !5
  %1038 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1034
  store <2 x i32> %1037, ptr addrspace(3) %1038, align 16, !tbaa !5
  %1039 = or disjoint i32 %1013, 10
  %1040 = zext nneg i32 %1039 to i64
  %1041 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1040
  %1042 = load <2 x i32>, ptr addrspace(1) %1041, align 4, !tbaa !5
  %1043 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1039
  store <2 x i32> %1042, ptr addrspace(3) %1043, align 8, !tbaa !5
  %1044 = or disjoint i32 %1013, 12
  %1045 = zext nneg i32 %1044 to i64
  %1046 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1045
  %1047 = load <2 x i32>, ptr addrspace(1) %1046, align 4, !tbaa !5
  %1048 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1044
  store <2 x i32> %1047, ptr addrspace(3) %1048, align 16, !tbaa !5
  %1049 = or disjoint i32 %1013, 14
  %1050 = zext nneg i32 %1049 to i64
  %1051 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1050
  %1052 = load <2 x i32>, ptr addrspace(1) %1051, align 4, !tbaa !5
  %1053 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1049
  store <2 x i32> %1052, ptr addrspace(3) %1053, align 8, !tbaa !5
  %1054 = add nuw i32 %1013, 16
  %1055 = add i32 %1014, 8
  %1056 = icmp eq i32 %1055, %1011
  br i1 %1056, label %1057, label %1012, !llvm.loop !77

1057:                                             ; preds = %1012
  %1058 = icmp eq i32 %1008, 0
  br i1 %1058, label %1072, label %1059

1059:                                             ; preds = %1057, %1003
  %1060 = phi i32 [ 0, %1003 ], [ %1054, %1057 ]
  %1061 = icmp ne i32 %1008, 0
  tail call void @llvm.assume(i1 %1061)
  br label %1062

1062:                                             ; preds = %1062, %1059
  %1063 = phi i32 [ %1060, %1059 ], [ %1069, %1062 ]
  %1064 = phi i32 [ 0, %1059 ], [ %1070, %1062 ]
  %1065 = zext nneg i32 %1063 to i64
  %1066 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1065
  %1067 = load <2 x i32>, ptr addrspace(1) %1066, align 4, !tbaa !5
  %1068 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1063
  store <2 x i32> %1067, ptr addrspace(3) %1068, align 8, !tbaa !5
  %1069 = add nuw i32 %1063, 2
  %1070 = add i32 %1064, 1
  %1071 = icmp eq i32 %1070, %1008
  br i1 %1071, label %1072, label %1062, !llvm.loop !78

1072:                                             ; preds = %1062, %1057
  %1073 = icmp eq i32 %999, %1004
  br i1 %1073, label %1084, label %1074

1074:                                             ; preds = %1001, %1072
  %1075 = phi i32 [ 0, %1001 ], [ %1004, %1072 ]
  br label %1076

1076:                                             ; preds = %1074, %1076
  %1077 = phi i32 [ %1082, %1076 ], [ %1075, %1074 ]
  %1078 = zext nneg i32 %1077 to i64
  %1079 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1078
  %1080 = load i32, ptr addrspace(1) %1079, align 4, !tbaa !5
  %1081 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1077
  store i32 %1080, ptr addrspace(3) %1081, align 4, !tbaa !5
  %1082 = add nuw nsw i32 %1077, 1
  %1083 = icmp eq i32 %1082, %999
  br i1 %1083, label %1084, label %1076, !llvm.loop !80

1084:                                             ; preds = %1076, %1072, %997
  %1085 = load i32, ptr addrspace(1) %612, align 4, !tbaa !5
  %1086 = shl i32 %1085, 16
  %1087 = icmp eq i32 %1086, -65536
  br i1 %1087, label %1220, label %1088

1088:                                             ; preds = %1084
  %1089 = ashr exact i32 %1086, 16
  %1090 = zext i32 %1085 to i64
  %1091 = load i32, ptr addrspace(1) %600, align 4, !tbaa !5
  %1092 = sub i32 %999, %1091
  store i32 %1089, ptr addrspace(1) %612, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %597, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %600, align 4, !tbaa !5
  %1093 = shl i64 %1090, 48
  %1094 = ashr exact i64 %1093, 48
  %1095 = getelementptr inbounds i32, ptr addrspace(1) %581, i64 %1094
  %1096 = load i32, ptr addrspace(1) %1095, align 4, !tbaa !5
  %1097 = getelementptr inbounds i32, ptr addrspace(1) %609, i64 %1094
  %1098 = load i32, ptr addrspace(1) %1097, align 4, !tbaa !5
  %1099 = sub nsw i32 %1098, %1096
  %1100 = tail call i32 @llvm.smax.i32(i32 %1099, i32 1)
  %1101 = tail call i32 @llvm.umin.i32(i32 %1100, i32 8)
  %1102 = mul nsw i32 %1089, 1200
  %1103 = add nsw i32 %1096, %1102
  br label %1188

1104:                                             ; preds = %1188
  %1105 = add nsw i32 %1101, %1096
  %1106 = add nsw i32 %1105, 4095
  %1107 = sdiv i32 %1106, 4096
  %1108 = srem i32 %1105, 4096
  %1109 = icmp eq i32 %1108, 0
  %1110 = select i1 %1109, i32 4096, i32 %1108
  store i32 %1110, ptr addrspace(1) %606, align 4, !tbaa !5
  %1111 = icmp sgt i32 %1092, 0
  br i1 %1111, label %1112, label %1198

1112:                                             ; preds = %1104
  %1113 = getelementptr i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %1091
  %1114 = icmp eq i32 %1092, 1
  br i1 %1114, label %1186, label %1115

1115:                                             ; preds = %1112
  %1116 = and i32 %1092, 2147483646
  %1117 = add nsw i32 %1092, -2
  %1118 = lshr i32 %1117, 1
  %1119 = add nuw i32 %1118, 1
  %1120 = and i32 %1119, 7
  %1121 = icmp ult i32 %1117, 14
  br i1 %1121, label %1171, label %1122

1122:                                             ; preds = %1115
  %1123 = and i32 %1119, -8
  br label %1124

1124:                                             ; preds = %1124, %1122
  %1125 = phi i32 [ 0, %1122 ], [ %1166, %1124 ]
  %1126 = phi i32 [ 0, %1122 ], [ %1167, %1124 ]
  %1127 = getelementptr i32, ptr addrspace(3) %1113, i32 %1125
  %1128 = load <2 x i32>, ptr addrspace(3) %1127, align 4, !tbaa !5
  %1129 = zext nneg i32 %1125 to i64
  %1130 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1129
  store <2 x i32> %1128, ptr addrspace(1) %1130, align 4, !tbaa !5
  %1131 = or disjoint i32 %1125, 2
  %1132 = getelementptr i32, ptr addrspace(3) %1113, i32 %1131
  %1133 = load <2 x i32>, ptr addrspace(3) %1132, align 4, !tbaa !5
  %1134 = zext nneg i32 %1131 to i64
  %1135 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1134
  store <2 x i32> %1133, ptr addrspace(1) %1135, align 4, !tbaa !5
  %1136 = or disjoint i32 %1125, 4
  %1137 = getelementptr i32, ptr addrspace(3) %1113, i32 %1136
  %1138 = load <2 x i32>, ptr addrspace(3) %1137, align 4, !tbaa !5
  %1139 = zext nneg i32 %1136 to i64
  %1140 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1139
  store <2 x i32> %1138, ptr addrspace(1) %1140, align 4, !tbaa !5
  %1141 = or disjoint i32 %1125, 6
  %1142 = getelementptr i32, ptr addrspace(3) %1113, i32 %1141
  %1143 = load <2 x i32>, ptr addrspace(3) %1142, align 4, !tbaa !5
  %1144 = zext nneg i32 %1141 to i64
  %1145 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1144
  store <2 x i32> %1143, ptr addrspace(1) %1145, align 4, !tbaa !5
  %1146 = or disjoint i32 %1125, 8
  %1147 = getelementptr i32, ptr addrspace(3) %1113, i32 %1146
  %1148 = load <2 x i32>, ptr addrspace(3) %1147, align 4, !tbaa !5
  %1149 = zext nneg i32 %1146 to i64
  %1150 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1149
  store <2 x i32> %1148, ptr addrspace(1) %1150, align 4, !tbaa !5
  %1151 = or disjoint i32 %1125, 10
  %1152 = getelementptr i32, ptr addrspace(3) %1113, i32 %1151
  %1153 = load <2 x i32>, ptr addrspace(3) %1152, align 4, !tbaa !5
  %1154 = zext nneg i32 %1151 to i64
  %1155 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1154
  store <2 x i32> %1153, ptr addrspace(1) %1155, align 4, !tbaa !5
  %1156 = or disjoint i32 %1125, 12
  %1157 = getelementptr i32, ptr addrspace(3) %1113, i32 %1156
  %1158 = load <2 x i32>, ptr addrspace(3) %1157, align 4, !tbaa !5
  %1159 = zext nneg i32 %1156 to i64
  %1160 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1159
  store <2 x i32> %1158, ptr addrspace(1) %1160, align 4, !tbaa !5
  %1161 = or disjoint i32 %1125, 14
  %1162 = getelementptr i32, ptr addrspace(3) %1113, i32 %1161
  %1163 = load <2 x i32>, ptr addrspace(3) %1162, align 4, !tbaa !5
  %1164 = zext nneg i32 %1161 to i64
  %1165 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1164
  store <2 x i32> %1163, ptr addrspace(1) %1165, align 4, !tbaa !5
  %1166 = add nuw i32 %1125, 16
  %1167 = add i32 %1126, 8
  %1168 = icmp eq i32 %1167, %1123
  br i1 %1168, label %1169, label %1124, !llvm.loop !81

1169:                                             ; preds = %1124
  %1170 = icmp eq i32 %1120, 0
  br i1 %1170, label %1184, label %1171

1171:                                             ; preds = %1169, %1115
  %1172 = phi i32 [ 0, %1115 ], [ %1166, %1169 ]
  %1173 = icmp ne i32 %1120, 0
  tail call void @llvm.assume(i1 %1173)
  br label %1174

1174:                                             ; preds = %1174, %1171
  %1175 = phi i32 [ %1172, %1171 ], [ %1181, %1174 ]
  %1176 = phi i32 [ 0, %1171 ], [ %1182, %1174 ]
  %1177 = getelementptr i32, ptr addrspace(3) %1113, i32 %1175
  %1178 = load <2 x i32>, ptr addrspace(3) %1177, align 4, !tbaa !5
  %1179 = zext nneg i32 %1175 to i64
  %1180 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1179
  store <2 x i32> %1178, ptr addrspace(1) %1180, align 4, !tbaa !5
  %1181 = add nuw i32 %1175, 2
  %1182 = add i32 %1176, 1
  %1183 = icmp eq i32 %1182, %1120
  br i1 %1183, label %1184, label %1174, !llvm.loop !82

1184:                                             ; preds = %1174, %1169
  %1185 = icmp eq i32 %1092, %1116
  br i1 %1185, label %1198, label %1186

1186:                                             ; preds = %1112, %1184
  %1187 = phi i32 [ 0, %1112 ], [ %1116, %1184 ]
  br label %1200

1188:                                             ; preds = %1088, %1188
  %1189 = phi i32 [ 0, %1088 ], [ %1196, %1188 ]
  %1190 = add nsw i32 %1103, %1189
  %1191 = sext i32 %1190 to i64
  %1192 = getelementptr inbounds i64, ptr addrspace(1) %584, i64 %1191
  %1193 = load i64, ptr addrspace(1) %1192, align 8, !tbaa !17
  %1194 = zext nneg i32 %1189 to i64
  %1195 = getelementptr inbounds nuw i64, ptr addrspace(1) %587, i64 %1194
  store i64 %1193, ptr addrspace(1) %1195, align 8, !tbaa !17
  %1196 = add nuw nsw i32 %1189, 1
  %1197 = icmp eq i32 %1196, %1101
  br i1 %1197, label %1104, label %1188, !llvm.loop !83

1198:                                             ; preds = %1200, %1184, %1104
  %1199 = icmp slt i32 %1092, %1107
  br i1 %1199, label %1208, label %1220

1200:                                             ; preds = %1186, %1200
  %1201 = phi i32 [ %1206, %1200 ], [ %1187, %1186 ]
  %1202 = getelementptr i32, ptr addrspace(3) %1113, i32 %1201
  %1203 = load i32, ptr addrspace(3) %1202, align 4, !tbaa !5
  %1204 = zext nneg i32 %1201 to i64
  %1205 = getelementptr inbounds nuw i32, ptr addrspace(1) %603, i64 %1204
  store i32 %1203, ptr addrspace(1) %1205, align 4, !tbaa !5
  %1206 = add nuw nsw i32 %1201, 1
  %1207 = icmp slt i32 %1206, %1092
  br i1 %1207, label %1200, label %1198, !llvm.loop !84

1208:                                             ; preds = %1198, %1208
  %1209 = phi i32 [ %1217, %1208 ], [ %924, %1198 ]
  %1210 = phi i32 [ %1218, %1208 ], [ %1092, %1198 ]
  %1211 = srem i32 %1209, 16
  %1212 = sext i32 %1211 to i64
  %1213 = getelementptr inbounds i32, ptr addrspace(1) %615, i64 %1212
  %1214 = load i32, ptr addrspace(1) %1213, align 4, !tbaa !5
  %1215 = sext i32 %1210 to i64
  %1216 = getelementptr inbounds i32, ptr addrspace(1) %603, i64 %1215
  store i32 %1214, ptr addrspace(1) %1216, align 4, !tbaa !5
  %1217 = add nsw i32 %1209, 1
  %1218 = add nsw i32 %1210, 1
  %1219 = icmp slt i32 %1218, %1107
  br i1 %1219, label %1208, label %1220, !llvm.loop !85

1220:                                             ; preds = %1208, %1198, %1084
  %1221 = phi i32 [ 0, %1084 ], [ %1101, %1198 ], [ %1101, %1208 ]
  %1222 = phi i32 [ 0, %1084 ], [ 1, %1198 ], [ 1, %1208 ]
  %1223 = phi i32 [ 0, %1084 ], [ %1107, %1198 ], [ %1107, %1208 ]
  %1224 = phi i32 [ %924, %1084 ], [ %924, %1198 ], [ %1217, %1208 ]
  br label %1225

1225:                                             ; preds = %1220, %1276
  %1226 = phi i32 [ %1277, %1276 ], [ %1221, %1220 ]
  %1227 = phi i32 [ %1278, %1276 ], [ %1222, %1220 ]
  %1228 = phi i32 [ %1279, %1276 ], [ %1223, %1220 ]
  %1229 = phi i32 [ %1280, %1276 ], [ %1224, %1220 ]
  %1230 = icmp eq i32 %1227, 0
  %1231 = icmp slt i32 %1226, 8
  %1232 = select i1 %1230, i1 %1231, i1 false
  br i1 %1232, label %1233, label %1281

1233:                                             ; preds = %1225
  %1234 = load i32, ptr addrspace(1) %624, align 4, !tbaa !5
  %1235 = icmp slt i32 %1234, %626
  br i1 %1235, label %1236, label %1276

1236:                                             ; preds = %1233
  store i32 %1234, ptr addrspace(1) %612, align 4, !tbaa !5
  store i32 %1226, ptr addrspace(1) %597, align 4, !tbaa !5
  store i32 %1228, ptr addrspace(1) %600, align 4, !tbaa !5
  %1237 = sext i32 %1234 to i64
  %1238 = getelementptr inbounds i32, ptr addrspace(1) %609, i64 %1237
  %1239 = load i32, ptr addrspace(1) %1238, align 4, !tbaa !5
  %1240 = sub nsw i32 8, %1226
  %1241 = tail call i32 @llvm.umin.i32(i32 %1240, i32 8)
  %1242 = tail call noundef i32 @llvm.smin.i32(i32 %1239, i32 %1241)
  %1243 = icmp sgt i32 %1239, 0
  br i1 %1243, label %1244, label %1246

1244:                                             ; preds = %1236
  %1245 = mul nsw i32 %1234, 1200
  br label %1252

1246:                                             ; preds = %1252, %1236
  %1247 = add nsw i32 %1242, 4095
  %1248 = sdiv i32 %1247, 4096
  %1249 = srem i32 %1242, 4096
  %1250 = icmp eq i32 %1249, 0
  %1251 = select i1 %1250, i32 4096, i32 %1249
  store i32 %1251, ptr addrspace(1) %606, align 4, !tbaa !5
  br i1 %1243, label %1268, label %1263

1252:                                             ; preds = %1244, %1252
  %1253 = phi i32 [ 0, %1244 ], [ %1261, %1252 ]
  %1254 = add nuw nsw i32 %1253, %1245
  %1255 = sext i32 %1254 to i64
  %1256 = getelementptr inbounds i64, ptr addrspace(1) %584, i64 %1255
  %1257 = load i64, ptr addrspace(1) %1256, align 8, !tbaa !17
  %1258 = add nsw i32 %1253, %1226
  %1259 = sext i32 %1258 to i64
  %1260 = getelementptr inbounds i64, ptr addrspace(1) %587, i64 %1259
  store i64 %1257, ptr addrspace(1) %1260, align 8, !tbaa !17
  %1261 = add nuw nsw i32 %1253, 1
  %1262 = icmp eq i32 %1261, %1242
  br i1 %1262, label %1246, label %1252, !llvm.loop !86

1263:                                             ; preds = %1268, %1246
  %1264 = phi i32 [ %1229, %1246 ], [ %1275, %1268 ]
  %1265 = add nsw i32 %1242, %1226
  %1266 = add nsw i32 %1248, %1228
  %1267 = add nsw i32 %1234, 1
  store i32 %1267, ptr addrspace(1) %624, align 4, !tbaa !5
  br label %1276

1268:                                             ; preds = %1246
  %1269 = srem i32 %1229, 16
  %1270 = sext i32 %1269 to i64
  %1271 = getelementptr inbounds i32, ptr addrspace(1) %615, i64 %1270
  %1272 = load i32, ptr addrspace(1) %1271, align 4, !tbaa !5
  %1273 = sext i32 %1228 to i64
  %1274 = getelementptr inbounds i32, ptr addrspace(1) %603, i64 %1273
  store i32 %1272, ptr addrspace(1) %1274, align 4, !tbaa !5
  %1275 = add nsw i32 %1229, 1
  br label %1263

1276:                                             ; preds = %1263, %1233
  %1277 = phi i32 [ %1265, %1263 ], [ %1226, %1233 ]
  %1278 = phi i32 [ 1, %1263 ], [ 0, %1233 ]
  %1279 = phi i32 [ %1266, %1263 ], [ %1228, %1233 ]
  %1280 = phi i32 [ %1264, %1263 ], [ %1229, %1233 ]
  br i1 %1235, label %1225, label %1281

1281:                                             ; preds = %1276, %1225
  %1282 = phi i32 [ %1277, %1276 ], [ %1226, %1225 ]
  %1283 = phi i32 [ %1278, %1276 ], [ %1227, %1225 ]
  %1284 = phi i32 [ %1279, %1276 ], [ %1228, %1225 ]
  %1285 = phi i32 [ %1280, %1276 ], [ %1229, %1225 ]
  %1286 = icmp eq i32 %1283, 0
  br i1 %1286, label %1287, label %1288

1287:                                             ; preds = %1281
  store i32 -1, ptr addrspace(1) %612, align 4, !tbaa !5
  br label %1288

1288:                                             ; preds = %1281, %1287
  br label %1289

1289:                                             ; preds = %1288, %1289
  %1290 = phi i32 [ %1294, %1289 ], [ %1283, %1288 ]
  %1291 = sext i32 %1290 to i64
  %1292 = getelementptr inbounds i32, ptr addrspace(1) %597, i64 %1291
  store i32 %1282, ptr addrspace(1) %1292, align 4, !tbaa !5
  %1293 = getelementptr inbounds i32, ptr addrspace(1) %600, i64 %1291
  store i32 %1284, ptr addrspace(1) %1293, align 4, !tbaa !5
  %1294 = add nsw i32 %1290, 1
  %1295 = icmp slt i32 %1290, 1
  br i1 %1295, label %1289, label %1296, !llvm.loop !87

1296:                                             ; preds = %1289
  store i32 %1285, ptr addrspace(1) %618, align 4, !tbaa !5
  store i32 %998, ptr addrspace(1) %621, align 4, !tbaa !5
  %1297 = icmp eq i32 %1282, 0
  %1298 = tail call i64 @llvm.amdgcn.s.memrealtime()
  br i1 %1297, label %1299, label %1319

1299:                                             ; preds = %1296
  br i1 %814, label %1300, label %1611

1300:                                             ; preds = %1299, %1316
  %1301 = phi i32 [ %1317, %1316 ], [ 0, %1299 ]
  %1302 = zext nneg i32 %1301 to i64
  %1303 = getelementptr inbounds nuw i64, ptr %566, i64 %1302
  %1304 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %1303, i64 1) #14, !srcloc !57
  %1305 = getelementptr inbounds nuw ptr, ptr addrspace(1) %578, i64 %1302
  %1306 = load ptr, ptr addrspace(1) %1305, align 8, !tbaa !27
  %1307 = urem i64 %1304, %558
  %1308 = getelementptr inbounds nuw i64, ptr %1306, i64 %1307
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "v,v,~{memory}"(ptr %1308, i64 0) #14, !srcloc !60
  fence syncscope("agent") release
  %1309 = getelementptr inbounds nuw i64, ptr %563, i64 %1302
  %1310 = add i64 %1304, 1
  %1311 = insertelement <2 x i64> poison, i64 %1310, i64 0
  %1312 = insertelement <2 x i64> %1311, i64 %1304, i64 1
  br label %1313

1313:                                             ; preds = %1313, %1300
  %1314 = tail call noundef i64 asm sideeffect "flat_atomic_cmpswap_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %1309, <2 x i64> %1312) #14, !srcloc !61
  %1315 = icmp eq i64 %1314, %1304
  br i1 %1315, label %1316, label %1313, !llvm.loop !88

1316:                                             ; preds = %1313
  %1317 = add nuw nsw i32 %1301, 1
  %1318 = icmp eq i32 %1317, %638
  br i1 %1318, label %1611, label %1300, !llvm.loop !89

1319:                                             ; preds = %1296
  %1320 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %825
  %1321 = load i32, ptr addrspace(5) %1320, align 4, !tbaa !5
  %1322 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %825
  %1323 = load i64, ptr addrspace(5) %1322, align 8, !tbaa !40
  %1324 = add i64 %1323, 1
  store i64 %1324, ptr addrspace(5) %1322, align 8, !tbaa !40
  %1325 = sext i32 %1321 to i64
  %1326 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1325
  %1327 = load ptr, ptr addrspace(1) %1326, align 8, !tbaa !27
  %1328 = urem i64 %1323, %556
  %1329 = getelementptr inbounds nuw i64, ptr %1327, i64 %1328
  %1330 = shl i64 %828, 32
  %1331 = add i64 %1330, 4294967297
  store volatile i64 %1331, ptr %1329, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1332 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1325
  %1333 = atomicrmw add ptr addrspace(1) %1332, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1334 = add nsw i32 %825, 1
  %1335 = srem i32 %1334, %798
  br label %1611

1336:                                             ; preds = %898
  %1337 = add i64 %828, 1
  %1338 = sub i64 %878, %876
  %1339 = trunc i64 %1338 to i32
  %1340 = icmp sgt i32 %1339, 0
  %1341 = icmp eq i32 %628, %1339
  %1342 = select i1 %1340, i1 %1341, i1 false
  br i1 %1342, label %1343, label %1386

1343:                                             ; preds = %1336
  %1344 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %876
  %1345 = load i32, ptr addrspace(1) %1344, align 16, !tbaa !50
  %1346 = and i32 %1345, -4
  %1347 = icmp eq i32 %1346, 136
  br i1 %1347, label %1349, label %1348

1348:                                             ; preds = %1343
  switch i32 %1345, label %1386 [
    i32 183, label %1349
    i32 175, label %1349
    i32 174, label %1349
    i32 148, label %1349
    i32 147, label %1349
    i32 146, label %1349
    i32 145, label %1349
    i32 144, label %1349
    i32 143, label %1349
    i32 142, label %1349
    i32 184, label %1349
  ]

1349:                                             ; preds = %1348, %1348, %1348, %1348, %1348, %1348, %1348, %1348, %1348, %1348, %1348, %1343
  %1350 = add i64 %876, %644
  %1351 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %1350
  %1352 = getelementptr inbounds nuw i8, ptr addrspace(1) %1351, i64 106
  %1353 = load i16, ptr addrspace(1) %1352, align 2, !tbaa !53
  %1354 = zext i16 %1353 to i32
  %1355 = tail call i32 @llvm.smin.i32(i32 %798, i32 %1354)
  %1356 = icmp eq i64 %828, 0
  %1357 = select i1 %1356, i1 %808, i1 false
  br i1 %1357, label %1358, label %1365

1358:                                             ; preds = %1349
  %1359 = getelementptr inbounds nuw i8, ptr addrspace(1) %1351, i64 8
  %1360 = load i64, ptr addrspace(1) %1359, align 8, !tbaa !56
  %1361 = trunc i64 %1360 to i32
  %1362 = add nsw i32 %797, %1361
  %1363 = sext i32 %1362 to i64
  %1364 = getelementptr inbounds i32, ptr addrspace(1) %637, i64 %1363
  store i32 %1354, ptr addrspace(1) %1364, align 4, !tbaa !5
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1365

1365:                                             ; preds = %1358, %1349
  %1366 = icmp sgt i32 %1355, 0
  br i1 %1366, label %1367, label %1611

1367:                                             ; preds = %1365
  %1368 = shl i64 %1337, 32
  %1369 = or i64 %1350, %1368
  br label %1370

1370:                                             ; preds = %1367, %1370
  %1371 = phi i32 [ 0, %1367 ], [ %1384, %1370 ]
  %1372 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1371
  %1373 = load i32, ptr addrspace(5) %1372, align 4, !tbaa !5
  %1374 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %1371
  %1375 = load i64, ptr addrspace(5) %1374, align 8, !tbaa !40
  %1376 = add i64 %1375, 1
  store i64 %1376, ptr addrspace(5) %1374, align 8, !tbaa !40
  %1377 = sext i32 %1373 to i64
  %1378 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1377
  %1379 = load ptr, ptr addrspace(1) %1378, align 8, !tbaa !27
  %1380 = urem i64 %1375, %556
  %1381 = getelementptr inbounds nuw i64, ptr %1379, i64 %1380
  store volatile i64 %1369, ptr %1381, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1382 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1377
  %1383 = atomicrmw add ptr addrspace(1) %1382, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1384 = add nuw nsw i32 %1371, 1
  %1385 = icmp eq i32 %1384, %1355
  br i1 %1385, label %1611, label %1370, !llvm.loop !90

1386:                                             ; preds = %1348, %1336
  %1387 = icmp eq i64 %828, 0
  %1388 = select i1 %1387, i1 %808, i1 false
  %1389 = add i64 %810, %1338
  %1390 = udiv i64 %1389, %809
  br i1 %1388, label %1391, label %1432

1391:                                             ; preds = %1386
  %1392 = icmp ult i64 %1389, %809
  br i1 %1392, label %1398, label %1393

1393:                                             ; preds = %1391, %1399
  %1394 = phi i64 [ %1400, %1399 ], [ 0, %1391 ]
  br i1 %800, label %1395, label %1399

1395:                                             ; preds = %1393
  %1396 = mul i64 %1394, %809
  %1397 = add i64 %1396, %876
  br label %1402

1398:                                             ; preds = %1399, %1391
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1432

1399:                                             ; preds = %1429, %1393
  %1400 = add nuw i64 %1394, 1
  %1401 = icmp ult i64 %1400, %1390
  br i1 %1401, label %1393, label %1398, !llvm.loop !91

1402:                                             ; preds = %1395, %1429
  %1403 = phi i32 [ 0, %1395 ], [ %1430, %1429 ]
  %1404 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1403
  %1405 = load i32, ptr addrspace(5) %1404, align 4, !tbaa !5
  %1406 = sext i32 %1405 to i64
  %1407 = add i64 %1397, %1406
  %1408 = icmp ult i64 %1407, %878
  br i1 %1408, label %1409, label %1429

1409:                                             ; preds = %1402
  %1410 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %1407
  %1411 = getelementptr inbounds nuw i8, ptr addrspace(1) %1410, i64 8
  %1412 = load i64, ptr addrspace(1) %1411, align 8, !tbaa !56
  %1413 = trunc i64 %1412 to i32
  %1414 = load i32, ptr addrspace(1) %1410, align 16, !tbaa !50
  %1415 = and i32 %1414, -4
  %1416 = icmp eq i32 %1415, 136
  br i1 %1416, label %1418, label %1417

1417:                                             ; preds = %1409
  switch i32 %1414, label %1422 [
    i32 183, label %1418
    i32 175, label %1418
    i32 174, label %1418
    i32 148, label %1418
    i32 147, label %1418
    i32 146, label %1418
    i32 145, label %1418
    i32 144, label %1418
    i32 143, label %1418
    i32 142, label %1418
    i32 184, label %1418
  ]

1418:                                             ; preds = %1417, %1417, %1417, %1417, %1417, %1417, %1417, %1417, %1417, %1417, %1417, %1409
  %1419 = getelementptr inbounds nuw i8, ptr addrspace(1) %1410, i64 106
  %1420 = load i16, ptr addrspace(1) %1419, align 2, !tbaa !53
  %1421 = zext i16 %1420 to i32
  br label %1422

1422:                                             ; preds = %1417, %1418
  %1423 = phi i32 [ %1421, %1418 ], [ 1, %1417 ]
  %1424 = add nsw i32 %797, %1413
  %1425 = sext i32 %1424 to i64
  %1426 = getelementptr inbounds i32, ptr addrspace(1) %637, i64 %1425
  %1427 = load i32, ptr addrspace(1) %1426, align 4, !tbaa !5
  %1428 = add nsw i32 %1427, %1423
  store i32 %1428, ptr addrspace(1) %1426, align 4, !tbaa !5
  br label %1429

1429:                                             ; preds = %1422, %1402
  %1430 = add nuw nsw i32 %1403, 1
  %1431 = icmp eq i32 %1430, %798
  br i1 %1431, label %1399, label %1402, !llvm.loop !92

1432:                                             ; preds = %1386, %1398
  %1433 = icmp ult i64 %1389, %809
  br i1 %1433, label %1611, label %1434

1434:                                             ; preds = %1432
  %1435 = shl i64 %1337, 32
  br label %1436

1436:                                             ; preds = %1434, %1442
  %1437 = phi i32 [ %825, %1434 ], [ %1443, %1442 ]
  %1438 = phi i64 [ 0, %1434 ], [ %1444, %1442 ]
  br i1 %800, label %1439, label %1442

1439:                                             ; preds = %1436
  %1440 = mul i64 %1438, %809
  %1441 = add i64 %1440, %876
  br label %1446

1442:                                             ; preds = %1500, %1436
  %1443 = phi i32 [ %1437, %1436 ], [ %1501, %1500 ]
  %1444 = add nuw i64 %1438, 1
  %1445 = icmp ult i64 %1444, %1390
  br i1 %1445, label %1436, label %1611, !llvm.loop !93

1446:                                             ; preds = %1439, %1500
  %1447 = phi i32 [ %1437, %1439 ], [ %1501, %1500 ]
  %1448 = phi i32 [ 0, %1439 ], [ %1502, %1500 ]
  %1449 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1448
  %1450 = load i32, ptr addrspace(5) %1449, align 4, !tbaa !5
  %1451 = sext i32 %1450 to i64
  %1452 = add i64 %1441, %1451
  %1453 = icmp ult i64 %1452, %878
  br i1 %1453, label %1454, label %1500

1454:                                             ; preds = %1446
  %1455 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %1452
  %1456 = load i32, ptr addrspace(1) %1455, align 16, !tbaa !50
  %1457 = and i32 %1456, -4
  %1458 = icmp eq i32 %1457, 136
  br i1 %1458, label %1476, label %1459

1459:                                             ; preds = %1454
  switch i32 %1456, label %1460 [
    i32 183, label %1476
    i32 175, label %1476
    i32 174, label %1476
    i32 148, label %1476
    i32 147, label %1476
    i32 146, label %1476
    i32 145, label %1476
    i32 144, label %1476
    i32 143, label %1476
    i32 142, label %1476
    i32 184, label %1476
  ]

1460:                                             ; preds = %1459
  %1461 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %1447
  %1462 = load i32, ptr addrspace(5) %1461, align 4, !tbaa !5
  %1463 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %1447
  %1464 = load i64, ptr addrspace(5) %1463, align 8, !tbaa !40
  %1465 = add i64 %1464, 1
  store i64 %1465, ptr addrspace(5) %1463, align 8, !tbaa !40
  %1466 = sext i32 %1462 to i64
  %1467 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1466
  %1468 = load ptr, ptr addrspace(1) %1467, align 8, !tbaa !27
  %1469 = urem i64 %1464, %556
  %1470 = getelementptr inbounds nuw i64, ptr %1468, i64 %1469
  %1471 = or i64 %1452, %1435
  store volatile i64 %1471, ptr %1470, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1472 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1466
  %1473 = atomicrmw add ptr addrspace(1) %1472, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1474 = add nsw i32 %1447, 1
  %1475 = srem i32 %1474, %798
  br label %1500

1476:                                             ; preds = %1459, %1459, %1459, %1459, %1459, %1459, %1459, %1459, %1459, %1459, %1459, %1454
  %1477 = getelementptr inbounds nuw i8, ptr addrspace(1) %1455, i64 106
  %1478 = load i16, ptr addrspace(1) %1477, align 2, !tbaa !53
  %1479 = zext i16 %1478 to i32
  %1480 = tail call i32 @llvm.smin.i32(i32 %798, i32 %1479)
  %1481 = icmp eq i16 %1478, 0
  br i1 %1481, label %1500, label %1482

1482:                                             ; preds = %1476
  %1483 = or i64 %1452, %1435
  br label %1484

1484:                                             ; preds = %1482, %1484
  %1485 = phi i32 [ 0, %1482 ], [ %1498, %1484 ]
  %1486 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1485
  %1487 = load i32, ptr addrspace(5) %1486, align 4, !tbaa !5
  %1488 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %1485
  %1489 = load i64, ptr addrspace(5) %1488, align 8, !tbaa !40
  %1490 = add i64 %1489, 1
  store i64 %1490, ptr addrspace(5) %1488, align 8, !tbaa !40
  %1491 = sext i32 %1487 to i64
  %1492 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1491
  %1493 = load ptr, ptr addrspace(1) %1492, align 8, !tbaa !27
  %1494 = urem i64 %1489, %556
  %1495 = getelementptr inbounds nuw i64, ptr %1493, i64 %1494
  store volatile i64 %1483, ptr %1495, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1496 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1491
  %1497 = atomicrmw add ptr addrspace(1) %1496, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1498 = add nuw nsw i32 %1485, 1
  %1499 = icmp eq i32 %1498, %1480
  br i1 %1499, label %1500, label %1484, !llvm.loop !94

1500:                                             ; preds = %1484, %1476, %1460, %1446
  %1501 = phi i32 [ %1447, %1446 ], [ %1475, %1460 ], [ %1447, %1476 ], [ %1447, %1484 ]
  %1502 = add nuw nsw i32 %1448, 1
  %1503 = icmp eq i32 %1502, %798
  br i1 %1503, label %1442, label %1446, !llvm.loop !95

1504:                                             ; preds = %898
  %1505 = sub i64 %878, %876
  %1506 = freeze i64 %1505
  %1507 = freeze i64 %807
  %1508 = udiv i64 %1506, %1507
  %1509 = mul i64 %1508, %1507
  %1510 = sub i64 %1506, %1509
  %1511 = icmp ugt i64 %1510, %644
  br i1 %1511, label %1512, label %1516

1512:                                             ; preds = %1504
  %1513 = add i64 %1508, 1
  %1514 = mul i64 %1513, %644
  %1515 = add i64 %1513, %1514
  br label %1520

1516:                                             ; preds = %1504
  %1517 = mul i64 %1508, %644
  %1518 = add i64 %1517, %1510
  %1519 = add i64 %1518, %1508
  br label %1520

1520:                                             ; preds = %1512, %1516
  %1521 = phi i64 [ %1514, %1512 ], [ %1518, %1516 ]
  %1522 = phi i64 [ %1515, %1512 ], [ %1519, %1516 ]
  %1523 = add i64 %1521, %876
  %1524 = add i64 %1522, %876
  br label %1525

1525:                                             ; preds = %898, %1520
  %1526 = phi i64 [ %1524, %1520 ], [ %878, %898 ]
  %1527 = phi i64 [ %1523, %1520 ], [ %876, %898 ]
  %1528 = icmp ult i64 %1527, %1526
  br i1 %1528, label %1529, label %1570

1529:                                             ; preds = %1525
  %1530 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %1527
  %1531 = load i32, ptr addrspace(1) %1530, align 16, !tbaa !50
  %1532 = and i32 %1531, -4
  %1533 = icmp eq i32 %1532, 136
  br i1 %1533, label %1535, label %1534

1534:                                             ; preds = %1529
  switch i32 %1531, label %1570 [
    i32 183, label %1535
    i32 175, label %1535
    i32 174, label %1535
    i32 148, label %1535
    i32 147, label %1535
    i32 146, label %1535
    i32 145, label %1535
    i32 144, label %1535
    i32 143, label %1535
    i32 142, label %1535
    i32 184, label %1535
  ]

1535:                                             ; preds = %1534, %1534, %1534, %1534, %1534, %1534, %1534, %1534, %1534, %1534, %1534, %1529
  %1536 = getelementptr inbounds nuw i8, ptr addrspace(1) %1530, i64 106
  %1537 = load i16, ptr addrspace(1) %1536, align 2, !tbaa !53
  %1538 = zext i16 %1537 to i32
  %1539 = tail call i32 @llvm.smin.i32(i32 %798, i32 %1538)
  %1540 = icmp eq i64 %828, 1
  %1541 = select i1 %1540, i1 %808, i1 false
  br i1 %1541, label %1542, label %1549

1542:                                             ; preds = %1535
  %1543 = getelementptr inbounds nuw i8, ptr addrspace(1) %1530, i64 8
  %1544 = load i64, ptr addrspace(1) %1543, align 8, !tbaa !56
  %1545 = trunc i64 %1544 to i32
  %1546 = add nsw i32 %797, %1545
  %1547 = sext i32 %1546 to i64
  %1548 = getelementptr inbounds i32, ptr addrspace(1) %637, i64 %1547
  store i32 %1538, ptr addrspace(1) %1548, align 4, !tbaa !5
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1549

1549:                                             ; preds = %1542, %1535
  %1550 = icmp sgt i32 %1539, 0
  br i1 %1550, label %1551, label %1611

1551:                                             ; preds = %1549
  %1552 = shl i64 %828, 32
  %1553 = or i64 %1527, %1552
  br label %1554

1554:                                             ; preds = %1551, %1554
  %1555 = phi i32 [ 0, %1551 ], [ %1568, %1554 ]
  %1556 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1555
  %1557 = load i32, ptr addrspace(5) %1556, align 4, !tbaa !5
  %1558 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %1555
  %1559 = load i64, ptr addrspace(5) %1558, align 8, !tbaa !40
  %1560 = add i64 %1559, 1
  store i64 %1560, ptr addrspace(5) %1558, align 8, !tbaa !40
  %1561 = sext i32 %1557 to i64
  %1562 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1561
  %1563 = load ptr, ptr addrspace(1) %1562, align 8, !tbaa !27
  %1564 = urem i64 %1559, %556
  %1565 = getelementptr inbounds nuw i64, ptr %1563, i64 %1564
  store volatile i64 %1553, ptr %1565, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1566 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1561
  %1567 = atomicrmw add ptr addrspace(1) %1566, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1568 = add nuw nsw i32 %1555, 1
  %1569 = icmp eq i32 %1568, %1539
  br i1 %1569, label %1611, label %1554, !llvm.loop !96

1570:                                             ; preds = %1534, %1525
  %1571 = icmp eq i64 %828, 1
  %1572 = select i1 %1571, i1 %808, i1 false
  br i1 %1572, label %1573, label %1588

1573:                                             ; preds = %1570
  br i1 %1528, label %1575, label %1574

1574:                                             ; preds = %1575, %1573
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1588

1575:                                             ; preds = %1573, %1575
  %1576 = phi i64 [ %1586, %1575 ], [ %1527, %1573 ]
  %1577 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %569, i64 %1576
  %1578 = getelementptr inbounds nuw i8, ptr addrspace(1) %1577, i64 8
  %1579 = load i64, ptr addrspace(1) %1578, align 8, !tbaa !56
  %1580 = trunc i64 %1579 to i32
  %1581 = add nsw i32 %797, %1580
  %1582 = sext i32 %1581 to i64
  %1583 = getelementptr inbounds i32, ptr addrspace(1) %637, i64 %1582
  %1584 = load i32, ptr addrspace(1) %1583, align 4, !tbaa !5
  %1585 = add nsw i32 %1584, 1
  store i32 %1585, ptr addrspace(1) %1583, align 4, !tbaa !5
  %1586 = add nuw i64 %1576, 1
  %1587 = icmp ult i64 %1586, %1526
  br i1 %1587, label %1575, label %1574, !llvm.loop !97

1588:                                             ; preds = %1574, %1570
  br i1 %1528, label %1589, label %1611

1589:                                             ; preds = %1588
  %1590 = shl i64 %828, 32
  br label %1591

1591:                                             ; preds = %1589, %1591
  %1592 = phi i64 [ %1527, %1589 ], [ %1609, %1591 ]
  %1593 = phi i32 [ %825, %1589 ], [ %1608, %1591 ]
  %1594 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %1593
  %1595 = load i32, ptr addrspace(5) %1594, align 4, !tbaa !5
  %1596 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %1593
  %1597 = load i64, ptr addrspace(5) %1596, align 8, !tbaa !40
  %1598 = add i64 %1597, 1
  store i64 %1598, ptr addrspace(5) %1596, align 8, !tbaa !40
  %1599 = sext i32 %1595 to i64
  %1600 = getelementptr inbounds ptr, ptr addrspace(1) %575, i64 %1599
  %1601 = load ptr, ptr addrspace(1) %1600, align 8, !tbaa !27
  %1602 = urem i64 %1597, %556
  %1603 = getelementptr inbounds nuw i64, ptr %1601, i64 %1602
  %1604 = or i64 %1592, %1590
  store volatile i64 %1604, ptr %1603, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1605 = getelementptr inbounds i64, ptr addrspace(1) %561, i64 %1599
  %1606 = atomicrmw add ptr addrspace(1) %1605, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1607 = add nsw i32 %1593, 1
  %1608 = srem i32 %1607, %798
  %1609 = add nuw i64 %1592, 1
  %1610 = icmp ult i64 %1609, %1526
  br i1 %1610, label %1591, label %1611, !llvm.loop !98

1611:                                             ; preds = %1442, %1370, %1316, %1591, %1554, %1432, %1365, %1299, %1588, %1549, %1319
  %1612 = phi i32 [ %825, %1549 ], [ %825, %1299 ], [ %1335, %1319 ], [ %825, %1370 ], [ %825, %1365 ], [ %825, %1316 ], [ %825, %1588 ], [ %825, %1554 ], [ %1608, %1591 ], [ %825, %1432 ], [ %1443, %1442 ]
  %1613 = phi i32 [ %826, %1549 ], [ %923, %1299 ], [ %923, %1319 ], [ %826, %1370 ], [ %826, %1365 ], [ %923, %1316 ], [ %826, %1588 ], [ %826, %1554 ], [ %826, %1591 ], [ %826, %1432 ], [ %826, %1442 ]
  %1614 = phi i64 [ %827, %1549 ], [ %902, %1299 ], [ %902, %1319 ], [ %827, %1370 ], [ %827, %1365 ], [ %902, %1316 ], [ %827, %1588 ], [ %827, %1554 ], [ %827, %1591 ], [ %827, %1432 ], [ %827, %1442 ]
  %1615 = phi i64 [ %828, %1549 ], [ %828, %1299 ], [ %828, %1319 ], [ %1337, %1370 ], [ %1337, %1365 ], [ %828, %1316 ], [ %828, %1588 ], [ %828, %1554 ], [ %828, %1591 ], [ %1337, %1432 ], [ %1337, %1442 ]
  %1616 = add i64 %859, 1
  %1617 = insertelement <2 x i64> %823, i64 %1616, i32 %858
  br label %1618

1618:                                             ; preds = %882, %881, %1611, %880
  %1619 = phi <2 x i64> [ %1617, %1611 ], [ %823, %880 ], [ %823, %881 ], [ %823, %882 ]
  %1620 = phi i32 [ %1612, %1611 ], [ %825, %880 ], [ %825, %881 ], [ %825, %882 ]
  %1621 = phi i32 [ %1613, %1611 ], [ %826, %880 ], [ %826, %881 ], [ %826, %882 ]
  %1622 = phi i64 [ %1614, %1611 ], [ %827, %880 ], [ %827, %881 ], [ %827, %882 ]
  %1623 = phi i64 [ %1615, %1611 ], [ %828, %880 ], [ %828, %881 ], [ %828, %882 ]
  br i1 %879, label %1624, label %821, !llvm.loop !99

1624:                                             ; preds = %1618
  call void @llvm.lifetime.end.p5(ptr addrspace(5) %3) #15
  call void @llvm.lifetime.end.p5(ptr addrspace(5) %2) #15
  br label %1625

1625:                                             ; preds = %292, %1624, %552
  ret void
}

declare i64 @__ockl_printf_begin(i64) local_unnamed_addr #4

declare i64 @__ockl_printf_append_string_n(i64, ptr, i64, i32) local_unnamed_addr #4

declare i64 @__ockl_printf_append_args(i64, i32, i64, i64, i64, i64, i64, i64, i64, i32) local_unnamed_addr #4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13worker_kernelN6mirage7runtime13RuntimeConfigE(ptr addrspace(4) noundef readonly byref(%"struct.mirage::runtime::RuntimeConfig") align 8 captures(none) %0) local_unnamed_addr #3 {
  %2 = load i32, ptr addrspace(4) %0, align 8, !tbaa !5
  %3 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 4
  %4 = load i32, ptr addrspace(4) %3, align 4, !tbaa !5
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 8
  %6 = load i32, ptr addrspace(4) %5, align 8, !tbaa !5
  %7 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 16
  %8 = load i32, ptr addrspace(4) %7, align 8, !tbaa !5
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %10 = load i32, ptr addrspace(4) %9, align 8, !tbaa !5
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %12 = load i64, ptr addrspace(4) %11, align 8, !tbaa !17
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 40
  %14 = load i64, ptr addrspace(4) %13, align 8, !tbaa !17
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %16 = load ptr, ptr addrspace(4) %15, align 8, !tbaa !27
  %17 = addrspacecast ptr %16 to ptr addrspace(1)
  %18 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %19 = load ptr, ptr addrspace(4) %18, align 8, !tbaa !27
  %20 = addrspacecast ptr %19 to ptr addrspace(1)
  %21 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 64
  %22 = load ptr, ptr addrspace(4) %21, align 8, !tbaa !27
  %23 = addrspacecast ptr %22 to ptr addrspace(1)
  %24 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 72
  %25 = load ptr, ptr addrspace(4) %24, align 8, !tbaa !27
  %26 = addrspacecast ptr %25 to ptr addrspace(1)
  %27 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 80
  %28 = load ptr, ptr addrspace(4) %27, align 8, !tbaa !31
  %29 = addrspacecast ptr %28 to ptr addrspace(1)
  %30 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 88
  %31 = load ptr, ptr addrspace(4) %30, align 8, !tbaa !33
  %32 = addrspacecast ptr %31 to ptr addrspace(1)
  %33 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 96
  %34 = load ptr, ptr addrspace(4) %33, align 8, !tbaa !35
  %35 = addrspacecast ptr %34 to ptr addrspace(1)
  %36 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 104
  %37 = load ptr, ptr addrspace(4) %36, align 8, !tbaa !37
  %38 = addrspacecast ptr %37 to ptr addrspace(1)
  %39 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 112
  %40 = load ptr, ptr addrspace(4) %39, align 8, !tbaa !37
  %41 = addrspacecast ptr %40 to ptr addrspace(1)
  %42 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 184
  %43 = load ptr, ptr addrspace(4) %42, align 8, !tbaa !31
  %44 = addrspacecast ptr %43 to ptr addrspace(1)
  %45 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 304
  %46 = load ptr, ptr addrspace(4) %45, align 8, !tbaa !27
  %47 = addrspacecast ptr %46 to ptr addrspace(1)
  %48 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 312
  %49 = load ptr, ptr addrspace(4) %48, align 8, !tbaa !31
  %50 = addrspacecast ptr %49 to ptr addrspace(1)
  %51 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 328
  %52 = load ptr, ptr addrspace(4) %51, align 8, !tbaa !31
  %53 = addrspacecast ptr %52 to ptr addrspace(1)
  %54 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 336
  %55 = load ptr, ptr addrspace(4) %54, align 8, !tbaa !31
  %56 = addrspacecast ptr %55 to ptr addrspace(1)
  %57 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 344
  %58 = load ptr, ptr addrspace(4) %57, align 8, !tbaa !31
  %59 = addrspacecast ptr %58 to ptr addrspace(1)
  %60 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds ptr, ptr addrspace(1) %38, i64 %61
  %63 = load ptr, ptr addrspace(1) %62, align 8, !tbaa !27
  store ptr %63, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, align 16, !tbaa !27
  store i32 %60, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, align 4, !tbaa !5
  %64 = icmp sgt i32 %8, 1
  br i1 %64, label %65, label %70

65:                                               ; preds = %1
  %66 = add nsw i32 %2, %60
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr addrspace(1) %38, i64 %67
  %69 = load ptr, ptr addrspace(1) %68, align 8, !tbaa !27
  store ptr %69, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, i32 8), align 8, !tbaa !27
  store i32 %66, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, i32 4), align 4, !tbaa !5
  br label %70

70:                                               ; preds = %65, %1
  %71 = phi i32 [ 1, %65 ], [ 0, %1 ]
  %72 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %106

74:                                               ; preds = %70
  %75 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  store i32 %75, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  %76 = icmp eq ptr addrspace(1) %53, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %76, label %92, label %77

77:                                               ; preds = %74
  %78 = getelementptr inbounds i32, ptr addrspace(1) %53, i64 %61
  store i32 %75, ptr addrspace(1) %78, align 4, !tbaa !5
  %79 = icmp slt i32 %60, 8
  br i1 %79, label %80, label %90

80:                                               ; preds = %77
  %81 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %82 = icmp eq ptr addrspace(4) @.str.1, addrspacecast (ptr null to ptr addrspace(4))
  %83 = select i1 %82, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.1, i64 42) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr) to i64)), i64 1))
  %84 = tail call i64 @__ockl_printf_append_string_n(i64 %81, ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr), i64 %83, i32 0) #15
  %85 = zext i32 %60 to i64
  %86 = tail call i64 @__ockl_printf_append_args(i64 %84, i32 1, i64 %85, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %87 = tail call i64 @__ockl_printf_append_args(i64 %86, i32 1, i64 %85, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %88 = zext i32 %75 to i64
  %89 = tail call i64 @__ockl_printf_append_args(i64 %87, i32 1, i64 %88, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %90

90:                                               ; preds = %80, %77
  fence syncscope("agent") release
  %91 = atomicrmw add ptr addrspace(1) %56, i32 1 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  br label %92

92:                                               ; preds = %90, %74
  %93 = icmp eq ptr addrspace(1) %50, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %93, label %104, label %94

94:                                               ; preds = %92
  %95 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, ptr addrspace(1) %50, i64 %96
  %98 = cmpxchg ptr addrspace(1) %97, i32 -1, i32 %60 syncscope("agent") monotonic monotonic, align 4
  %99 = extractvalue { i32, i1 } %98, 0
  %100 = extractvalue { i32, i1 } %98, 1
  %101 = icmp eq i32 %99, %60
  %102 = or i1 %100, %101
  %103 = zext i1 %102 to i32
  br label %104

104:                                              ; preds = %92, %94
  %105 = phi i32 [ %103, %94 ], [ 0, %92 ]
  store i32 %105, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19block_is_xcd_leader, align 4, !tbaa !5
  br label %106

106:                                              ; preds = %104, %70
  tail call void @llvm.amdgcn.s.barrier()
  %107 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE12block_xcd_id, align 4, !tbaa !5
  br i1 %73, label %108, label %109

108:                                              ; preds = %106
  store i32 -1, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  store i32 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  store i64 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, align 16, !tbaa !40
  store i64 0, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 8), align 8, !tbaa !40
  store i64 0, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, align 16, !tbaa !40
  store i64 0, ptr addrspace(3) getelementptr inbounds nuw (i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 8), align 8, !tbaa !40
  br label %109

109:                                              ; preds = %108, %106
  tail call void @llvm.amdgcn.s.barrier()
  %110 = zext nneg i32 %72 to i64
  %111 = getelementptr inbounds nuw i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %72
  %112 = tail call align 8 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %113 = getelementptr inbounds nuw i8, ptr addrspace(4) %112, i64 12
  %114 = or i32 %72, %60
  %115 = icmp eq i32 %114, 0
  %116 = getelementptr inbounds nuw i8, ptr addrspace(1) %44, i64 4
  %117 = icmp eq ptr addrspace(4) @.str.3, addrspacecast (ptr null to ptr addrspace(4))
  %118 = icmp sgt i32 %2, 0
  %119 = mul nsw i32 %107, %10
  %120 = icmp eq ptr addrspace(1) %59, addrspacecast (ptr null to ptr addrspace(1))
  %121 = add nsw i32 %6, %4
  %122 = sext i32 %107 to i64
  %123 = getelementptr inbounds i64, ptr addrspace(1) %23, i64 %122
  %124 = getelementptr inbounds ptr, ptr addrspace(1) %41, i64 %122
  %125 = getelementptr inbounds i64, ptr addrspace(1) %20, i64 %122
  %126 = sext i32 %121 to i64
  %127 = getelementptr inbounds i64, ptr %22, i64 %126
  %128 = getelementptr inbounds ptr, ptr addrspace(1) %41, i64 %126
  %129 = getelementptr inbounds i64, ptr %19, i64 %126
  %130 = select i1 %117, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.3, i64 53) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr) to i64)), i64 1))
  %131 = icmp eq i32 %2, 1
  %132 = and i32 %2, 2147483646
  %133 = insertelement <2 x i32> poison, i32 %107, i64 0
  %134 = shufflevector <2 x i32> %133, <2 x i32> poison, <2 x i32> zeroinitializer
  %135 = insertelement <2 x i32> poison, i32 %60, i64 0
  %136 = shufflevector <2 x i32> %135, <2 x i32> poison, <2 x i32> zeroinitializer
  %137 = icmp eq i32 %2, %132
  br label %138

138:                                              ; preds = %504, %109
  %139 = phi i32 [ 0, %109 ], [ %405, %504 ]
  %140 = phi i64 [ 0, %109 ], [ %406, %504 ]
  %141 = phi i32 [ 0, %109 ], [ %218, %504 ]
  %142 = phi i32 [ 0, %109 ], [ %505, %504 ]
  %143 = icmp eq i32 %142, %141
  br i1 %143, label %144, label %217

144:                                              ; preds = %138
  br i1 %73, label %145, label %171

145:                                              ; preds = %144
  %146 = load i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, align 16, !tbaa !40
  %147 = load i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, align 16, !tbaa !40
  %148 = icmp eq i64 %146, %147
  br i1 %148, label %149, label %169

149:                                              ; preds = %145, %160
  %150 = phi ptr addrspace(3) [ %166, %160 ], [ @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, %145 ]
  %151 = phi i64 [ %165, %160 ], [ %146, %145 ]
  %152 = phi i32 [ %163, %160 ], [ 0, %145 ]
  %153 = getelementptr inbounds i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16worker_queue_ids, i32 %152
  %154 = load i32, ptr addrspace(3) %153, align 4, !tbaa !5
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %155
  %157 = addrspacecast ptr addrspace(1) %156 to ptr
  %158 = load volatile i64, ptr %157, align 8, !tbaa !17
  store i64 %158, ptr addrspace(3) %150, align 8, !tbaa !40
  %159 = icmp ult i64 %151, %158
  br i1 %159, label %169, label %160

160:                                              ; preds = %149
  %161 = icmp eq i32 %152, %71
  %162 = add nsw i32 %152, 1
  %163 = select i1 %161, i32 0, i32 %162
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %164 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 %163
  %165 = load i64, ptr addrspace(3) %164, align 8, !tbaa !40
  %166 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 %163
  %167 = load i64, ptr addrspace(3) %166, align 8, !tbaa !40
  %168 = icmp eq i64 %165, %167
  br i1 %168, label %149, label %169, !llvm.loop !42

169:                                              ; preds = %160, %149, %145
  %170 = phi i32 [ 0, %145 ], [ %163, %160 ], [ %152, %149 ]
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %171

171:                                              ; preds = %169, %144
  %172 = phi i32 [ %170, %169 ], [ 0, %144 ]
  tail call void @llvm.amdgcn.s.barrier()
  %173 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13last_task_pos, i32 %172
  %174 = load i64, ptr addrspace(3) %173, align 8, !tbaa !40
  %175 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13next_task_pos, i32 %172
  %176 = load i64, ptr addrspace(3) %175, align 8, !tbaa !40
  %177 = sub i64 %174, %176
  %178 = trunc i64 %177 to i32
  %179 = tail call noundef i32 @llvm.smin.i32(i32 %178, i32 16)
  %180 = icmp ult i32 %72, %179
  br i1 %180, label %181, label %188

181:                                              ; preds = %171
  %182 = getelementptr inbounds ptr, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE13worker_queues, i32 %172
  %183 = load ptr, ptr addrspace(3) %182, align 8, !tbaa !27
  %184 = add i64 %176, %110
  %185 = urem i64 %184, %12
  %186 = getelementptr inbounds nuw i64, ptr %183, i64 %185
  %187 = load volatile i64, ptr %186, align 8, !tbaa !17
  store i64 %187, ptr addrspace(3) %111, align 8, !tbaa !17
  br label %188

188:                                              ; preds = %181, %171
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %73, label %189, label %193

189:                                              ; preds = %188
  %190 = sext i32 %179 to i64
  %191 = load i64, ptr addrspace(3) %175, align 8, !tbaa !40
  %192 = add i64 %191, %190
  store i64 %192, ptr addrspace(3) %175, align 8, !tbaa !40
  br label %193

193:                                              ; preds = %189, %188
  %194 = mul nsw i32 %179, 7
  %195 = icmp slt i32 %72, %194
  br i1 %195, label %196, label %199

196:                                              ; preds = %193
  %197 = load i16, ptr addrspace(4) %113, align 4, !range !15, !invariant.load !9, !noundef !9
  %198 = zext nneg i16 %197 to i32
  br label %200

199:                                              ; preds = %200, %193
  tail call void @llvm.amdgcn.s.barrier()
  br label %217

200:                                              ; preds = %196, %200
  %201 = phi i32 [ %72, %196 ], [ %215, %200 ]
  %202 = freeze i32 %201
  %203 = udiv i32 %202, 7
  %204 = mul i32 %203, 7
  %205 = sub i32 %202, %204
  %206 = shl nsw i32 %201, 4
  %207 = getelementptr inbounds nuw i8, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage, i32 %206
  %208 = getelementptr inbounds nuw i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %203
  %209 = load i64, ptr addrspace(3) %208, align 8, !tbaa !17
  %210 = and i64 %209, 4294967295
  %211 = getelementptr inbounds nuw %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %32, i64 %210
  %212 = shl nuw nsw i32 %205, 4
  %213 = zext nneg i32 %212 to i64
  %214 = getelementptr inbounds nuw i8, ptr addrspace(1) %211, i64 %213
  tail call void @llvm.memcpy.p3.p1.i64(ptr addrspace(3) noundef align 16 dereferenceable(32) %207, ptr addrspace(1) noundef align 16 dereferenceable(32) %214, i64 32, i1 false), !tbaa.struct !44
  %215 = add nuw nsw i32 %201, %198
  %216 = icmp slt i32 %215, %194
  br i1 %216, label %200, label %199, !llvm.loop !45

217:                                              ; preds = %199, %138
  %218 = phi i32 [ %179, %199 ], [ %141, %138 ]
  %219 = phi i32 [ 0, %199 ], [ %142, %138 ]
  %220 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE18task_descs_storage, i32 %219
  br i1 %73, label %221, label %244

221:                                              ; preds = %217
  %222 = getelementptr inbounds nuw i8, ptr addrspace(3) %220, i32 16
  %223 = load i64, ptr addrspace(3) %222, align 16, !tbaa !46
  %224 = icmp eq i64 %223, 9223372036854775806
  br i1 %224, label %244, label %225

225:                                              ; preds = %221
  %226 = and i64 %223, 4294967295
  %227 = getelementptr inbounds nuw i32, ptr addrspace(1) %29, i64 %226
  %228 = load i32, ptr addrspace(1) %227, align 4, !tbaa !5
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %219
  %231 = load i64, ptr addrspace(3) %230, align 8, !tbaa !17
  %232 = lshr i64 %231, 32
  %233 = mul nsw i64 %232, %229
  %234 = and i64 %223, 2161727821137838080
  %235 = icmp eq i64 %234, 0
  br i1 %235, label %236, label %244

236:                                              ; preds = %225
  %237 = getelementptr inbounds nuw i64, ptr addrspace(1) %26, i64 %226
  %238 = load atomic i64, ptr addrspace(1) %237 monotonic, align 8
  fence syncscope("agent") acquire
  %239 = icmp ult i64 %238, %233
  br i1 %239, label %240, label %244

240:                                              ; preds = %236, %240
  %241 = load atomic i64, ptr addrspace(1) %237 monotonic, align 8
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %242 = icmp ult i64 %241, %233
  br i1 %242, label %240, label %243, !llvm.loop !49

243:                                              ; preds = %240
  fence syncscope("agent") acquire
  br label %244

244:                                              ; preds = %243, %236, %225, %221, %217
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %73, label %245, label %246

245:                                              ; preds = %244
  store i32 1, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  br label %246

246:                                              ; preds = %245, %244
  %247 = load i32, ptr addrspace(3) %220, align 16, !tbaa !50
  switch i32 %247, label %273 [
    i32 0, label %506
    i32 10, label %248
  ]

248:                                              ; preds = %246
  br i1 %115, label %249, label %404

249:                                              ; preds = %248
  %250 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %251 = mul i64 %250, 10
  %252 = load i32, ptr addrspace(1) %116, align 4, !tbaa !5
  %253 = icmp eq i64 %140, 0
  br i1 %253, label %271, label %254

254:                                              ; preds = %249
  %255 = icmp slt i32 %139, 10
  %256 = urem i32 %139, 50
  %257 = icmp eq i32 %256, 0
  %258 = or i1 %255, %257
  br i1 %258, label %259, label %271

259:                                              ; preds = %254
  %260 = sub i64 %251, %140
  %261 = uitofp i64 %260 to double
  %262 = fdiv contract double %261, 1.000000e+06
  %263 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %264 = tail call i64 @__ockl_printf_append_string_n(i64 %263, ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr), i64 %130, i32 0) #15
  %265 = zext i32 %139 to i64
  %266 = tail call i64 @__ockl_printf_append_args(i64 %264, i32 1, i64 %265, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %267 = bitcast double %262 to i64
  %268 = tail call i64 @__ockl_printf_append_args(i64 %266, i32 1, i64 %267, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %269 = zext i32 %252 to i64
  %270 = tail call i64 @__ockl_printf_append_args(i64 %268, i32 1, i64 %269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %271

271:                                              ; preds = %259, %254, %249
  %272 = add nsw i32 %139, 1
  br label %404

273:                                              ; preds = %246
  %274 = and i32 %247, -4
  %275 = icmp eq i32 %274, 136
  br i1 %275, label %280, label %276

276:                                              ; preds = %273
  switch i32 %247, label %277 [
    i32 183, label %280
    i32 175, label %280
    i32 174, label %280
    i32 148, label %280
    i32 147, label %280
    i32 146, label %280
    i32 145, label %280
    i32 144, label %280
    i32 143, label %280
    i32 142, label %280
    i32 184, label %280
  ]

277:                                              ; preds = %276
  %278 = load i32, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  %279 = add nsw i32 %278, %247
  store i32 %279, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  br label %404

280:                                              ; preds = %276, %276, %276, %276, %276, %276, %276, %276, %276, %276, %276, %273
  %281 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4
  %282 = icmp eq i32 %281, -1
  %283 = select i1 %73, i1 %282, i1 false
  br i1 %283, label %284, label %330

284:                                              ; preds = %280
  br i1 %118, label %285, label %311

285:                                              ; preds = %284
  br i1 %131, label %307, label %286

286:                                              ; preds = %285, %286
  %287 = phi i32 [ %301, %286 ], [ 0, %285 ]
  %288 = phi <2 x i32> [ %300, %286 ], [ zeroinitializer, %285 ]
  %289 = phi <2 x i32> [ %297, %286 ], [ zeroinitializer, %285 ]
  %290 = phi <2 x i32> [ %302, %286 ], [ <i32 0, i32 1>, %285 ]
  %291 = zext nneg i32 %287 to i64
  %292 = getelementptr inbounds nuw i32, ptr addrspace(1) %53, i64 %291
  %293 = load <2 x i32>, ptr addrspace(1) %292, align 4, !tbaa !5
  %294 = icmp eq <2 x i32> %293, %134
  %295 = icmp slt <2 x i32> %290, %136
  %296 = zext <2 x i1> %294 to <2 x i32>
  %297 = add <2 x i32> %289, %296
  %298 = and <2 x i1> %295, %294
  %299 = zext <2 x i1> %298 to <2 x i32>
  %300 = add <2 x i32> %288, %299
  %301 = add nuw i32 %287, 2
  %302 = add nuw nsw <2 x i32> %290, splat (i32 2)
  %303 = icmp eq i32 %301, %132
  br i1 %303, label %304, label %286, !llvm.loop !100

304:                                              ; preds = %286
  %305 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %300)
  %306 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %297)
  br i1 %137, label %311, label %307

307:                                              ; preds = %285, %304
  %308 = phi i32 [ 0, %285 ], [ %305, %304 ]
  %309 = phi i32 [ 0, %285 ], [ %306, %304 ]
  %310 = phi i32 [ 0, %285 ], [ %132, %304 ]
  br label %314

311:                                              ; preds = %314, %304, %284
  %312 = phi i32 [ 0, %284 ], [ %306, %304 ], [ %324, %314 ]
  %313 = phi i32 [ 0, %284 ], [ %305, %304 ], [ %327, %314 ]
  store i32 %313, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  store i32 %312, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  br label %330

314:                                              ; preds = %307, %314
  %315 = phi i32 [ %327, %314 ], [ %308, %307 ]
  %316 = phi i32 [ %324, %314 ], [ %309, %307 ]
  %317 = phi i32 [ %328, %314 ], [ %310, %307 ]
  %318 = zext nneg i32 %317 to i64
  %319 = getelementptr inbounds nuw i32, ptr addrspace(1) %53, i64 %318
  %320 = load i32, ptr addrspace(1) %319, align 4, !tbaa !5
  %321 = icmp eq i32 %320, %107
  %322 = icmp slt i32 %317, %60
  %323 = zext i1 %321 to i32
  %324 = add nuw nsw i32 %316, %323
  %325 = and i1 %322, %321
  %326 = zext i1 %325 to i32
  %327 = add nuw nsw i32 %315, %326
  %328 = add nuw nsw i32 %317, 1
  %329 = icmp eq i32 %328, %2
  br i1 %329, label %311, label %314, !llvm.loop !101

330:                                              ; preds = %311, %280
  tail call void @llvm.amdgcn.s.barrier()
  %331 = getelementptr inbounds nuw i8, ptr addrspace(3) %220, i32 106
  %332 = load i16, ptr addrspace(3) %331, align 2, !tbaa !53
  %333 = zext i16 %332 to i32
  %334 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_xcd_local_rank, align 4, !tbaa !5
  %335 = icmp slt i32 %334, %333
  br i1 %335, label %336, label %392

336:                                              ; preds = %330
  %337 = load i32, ptr addrspace(1) @g_sink, align 4
  %338 = getelementptr inbounds nuw i8, ptr addrspace(3) %220, i32 104
  %339 = load i16, ptr addrspace(3) %338, align 8, !tbaa !53
  %340 = zext i16 %339 to i32
  %341 = load i32, ptr addrspace(3) %220, align 16, !tbaa !50
  %342 = add i32 %341, %340
  %343 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE20block_workers_on_xcd, align 4, !tbaa !5
  %344 = add nsw i32 %334, %343
  %345 = tail call i32 @llvm.smax.i32(i32 %344, i32 %333)
  %346 = icmp slt i32 %344, %333
  %347 = sext i1 %346 to i32
  %348 = select i1 %346, i32 2, i32 1
  %349 = add i32 %345, %347
  %350 = sub i32 %349, %344
  %351 = udiv i32 %350, %343
  %352 = add i32 %348, %351
  %353 = icmp ult i32 %352, 2
  br i1 %353, label %385, label %354

354:                                              ; preds = %336
  %355 = and i32 %352, -2
  %356 = mul i32 %355, %343
  %357 = add i32 %334, %356
  %358 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %337, i64 0
  %359 = insertelement <2 x i32> poison, i32 %342, i64 0
  %360 = shufflevector <2 x i32> %359, <2 x i32> poison, <2 x i32> zeroinitializer
  %361 = insertelement <2 x i32> poison, i32 %334, i64 0
  %362 = shufflevector <2 x i32> %361, <2 x i32> poison, <2 x i32> zeroinitializer
  %363 = insertelement <2 x i32> poison, i32 %343, i64 0
  %364 = shufflevector <2 x i32> %363, <2 x i32> poison, <2 x i32> zeroinitializer
  %365 = mul nuw nsw <2 x i32> %364, <i32 0, i32 1>
  %366 = add nsw <2 x i32> %362, %365
  %367 = shl nsw i32 %343, 1
  %368 = insertelement <2 x i32> poison, i32 %367, i64 0
  %369 = shufflevector <2 x i32> %368, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %370

370:                                              ; preds = %370, %354
  %371 = phi i32 [ 0, %354 ], [ %378, %370 ]
  %372 = phi <2 x i32> [ zeroinitializer, %354 ], [ %377, %370 ]
  %373 = phi <2 x i32> [ %366, %354 ], [ %379, %370 ]
  %374 = phi <2 x i32> [ %358, %354 ], [ %376, %370 ]
  %375 = add <2 x i32> %373, %360
  %376 = add <2 x i32> %375, %374
  %377 = add <2 x i32> %372, splat (i32 1)
  %378 = add nuw i32 %371, 2
  %379 = add nsw <2 x i32> %373, %369
  %380 = icmp eq i32 %378, %355
  br i1 %380, label %381, label %370, !llvm.loop !102

381:                                              ; preds = %370
  %382 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %377)
  %383 = tail call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %376)
  %384 = icmp eq i32 %352, %355
  br i1 %384, label %389, label %385

385:                                              ; preds = %336, %381
  %386 = phi i32 [ 0, %336 ], [ %382, %381 ]
  %387 = phi i32 [ %334, %336 ], [ %357, %381 ]
  %388 = phi i32 [ %337, %336 ], [ %383, %381 ]
  br label %394

389:                                              ; preds = %394, %381
  %390 = phi i32 [ %383, %381 ], [ %399, %394 ]
  %391 = phi i32 [ %382, %381 ], [ %400, %394 ]
  store i32 %390, ptr addrspace(1) @g_sink, align 4, !tbaa !5
  br label %392

392:                                              ; preds = %389, %330
  %393 = phi i32 [ %391, %389 ], [ 0, %330 ]
  br i1 %73, label %403, label %404

394:                                              ; preds = %385, %394
  %395 = phi i32 [ %400, %394 ], [ %386, %385 ]
  %396 = phi i32 [ %401, %394 ], [ %387, %385 ]
  %397 = phi i32 [ %399, %394 ], [ %388, %385 ]
  %398 = add i32 %396, %342
  %399 = add nsw i32 %398, %397
  %400 = add nuw nsw i32 %395, 1
  %401 = add nsw i32 %343, %396
  %402 = icmp slt i32 %401, %333
  br i1 %402, label %394, label %389, !llvm.loop !103

403:                                              ; preds = %392
  store i32 %393, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  br label %404

404:                                              ; preds = %277, %403, %392, %271, %248
  %405 = phi i32 [ %272, %271 ], [ %139, %248 ], [ %139, %277 ], [ %139, %403 ], [ %139, %392 ]
  %406 = phi i64 [ %251, %271 ], [ %140, %248 ], [ %140, %277 ], [ %140, %403 ], [ %140, %392 ]
  tail call void @llvm.amdgcn.s.barrier()
  br i1 %73, label %407, label %504

407:                                              ; preds = %404
  %408 = getelementptr inbounds nuw i8, ptr addrspace(3) %220, i32 8
  %409 = load i64, ptr addrspace(3) %408, align 8, !tbaa !56
  %410 = and i64 %409, 4294967295
  %411 = and i64 %409, 2161727821137838080
  %412 = icmp eq i64 %411, 0
  br i1 %412, label %413, label %504

413:                                              ; preds = %407
  %414 = getelementptr inbounds nuw i32, ptr addrspace(1) %29, i64 %410
  %415 = load i32, ptr addrspace(1) %414, align 4, !tbaa !5
  %416 = trunc i64 %409 to i32
  %417 = add nsw i32 %119, %416
  br i1 %120, label %422, label %418

418:                                              ; preds = %413
  %419 = sext i32 %417 to i64
  %420 = getelementptr inbounds i32, ptr addrspace(1) %59, i64 %419
  %421 = load i32, ptr addrspace(1) %420, align 4, !tbaa !5
  br label %422

422:                                              ; preds = %418, %413
  %423 = phi i32 [ %421, %418 ], [ 0, %413 ]
  %424 = icmp sgt i32 %423, 0
  br i1 %424, label %425, label %464

425:                                              ; preds = %422
  %426 = load i32, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE19gang_tiles_executed, align 4, !tbaa !5
  %427 = icmp eq i32 %426, 0
  %428 = load i32, ptr addrspace(3) %220, align 16, !tbaa !50
  %429 = and i32 %428, -4
  %430 = icmp eq i32 %429, 136
  br i1 %427, label %431, label %433

431:                                              ; preds = %425
  br i1 %430, label %504, label %432

432:                                              ; preds = %431
  switch i32 %428, label %433 [
    i32 183, label %504
    i32 175, label %504
    i32 174, label %504
    i32 148, label %504
    i32 147, label %504
    i32 146, label %504
    i32 145, label %504
    i32 144, label %504
    i32 143, label %504
    i32 142, label %504
    i32 184, label %504
  ]

433:                                              ; preds = %425, %432
  %434 = phi i1 [ false, %432 ], [ %430, %425 ]
  br i1 %434, label %442, label %435

435:                                              ; preds = %433
  %436 = add i32 %428, -142
  %437 = icmp ult i32 %436, 43
  br i1 %437, label %438, label %442

438:                                              ; preds = %435
  %439 = zext nneg i32 %436 to i43
  %440 = lshr i43 -2186138353537, %439
  %441 = trunc i43 %440 to i1
  br label %442

442:                                              ; preds = %435, %438, %433
  %443 = phi i1 [ true, %433 ], [ %441, %438 ], [ false, %435 ]
  %444 = sext i32 %417 to i64
  %445 = getelementptr inbounds i64, ptr addrspace(1) %47, i64 %444
  %446 = sext i32 %426 to i64
  %447 = select i1 %443, i64 %446, i64 1
  %448 = atomicrmw add ptr addrspace(1) %445, i64 %447 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %449 = add i64 %448, %447
  %450 = zext nneg i32 %423 to i64
  %451 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %219
  %452 = load i64, ptr addrspace(3) %451, align 8, !tbaa !17
  %453 = lshr i64 %452, 32
  %454 = mul nuw nsw i64 %453, %450
  %455 = icmp eq i64 %449, %454
  br i1 %455, label %456, label %504

456:                                              ; preds = %442
  fence syncscope("agent") release
  br i1 %434, label %459, label %457

457:                                              ; preds = %456
  switch i32 %428, label %458 [
    i32 183, label %459
    i32 175, label %459
    i32 174, label %459
    i32 148, label %459
    i32 147, label %459
    i32 146, label %459
    i32 145, label %459
    i32 144, label %459
    i32 143, label %459
    i32 142, label %459
    i32 184, label %459
  ]

458:                                              ; preds = %457
  br label %459

459:                                              ; preds = %456, %457, %457, %457, %457, %457, %457, %457, %457, %457, %457, %457, %458
  %460 = phi i64 [ %450, %458 ], [ 1, %457 ], [ 1, %456 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ], [ 1, %457 ]
  %461 = getelementptr inbounds nuw i64, ptr %25, i64 %410
  %462 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %461, i64 range(i64 1, 2147483648) %460) #14, !srcloc !57
  %463 = add i64 %462, %460
  br label %469

464:                                              ; preds = %422
  fence syncscope("agent") release
  %465 = getelementptr inbounds nuw i64, ptr %25, i64 %410
  %466 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %465, i64 1) #14, !srcloc !57
  %467 = add i64 %466, 1
  %468 = getelementptr inbounds i64, ptr addrspace(3) @_ZZ14execute_workerN6mirage7runtime13RuntimeConfigEiE16task_ids_storage, i32 %219
  br label %469

469:                                              ; preds = %464, %459
  %470 = phi ptr addrspace(3) [ %468, %464 ], [ %451, %459 ]
  %471 = phi i64 [ %467, %464 ], [ %463, %459 ]
  %472 = sext i32 %415 to i64
  %473 = load i64, ptr addrspace(3) %470, align 8, !tbaa !17
  %474 = lshr i64 %473, 32
  %475 = mul nsw i64 %474, %472
  %476 = icmp eq i64 %471, %475
  br i1 %476, label %477, label %504

477:                                              ; preds = %469
  %478 = getelementptr inbounds nuw %"struct.mirage::runtime::EventDesc", ptr addrspace(1) %35, i64 %410
  %479 = load i32, ptr addrspace(1) %478, align 8, !tbaa !58
  %480 = icmp eq i32 %479, 900
  br i1 %480, label %504, label %481

481:                                              ; preds = %477
  %482 = and i32 %479, -2
  %483 = icmp eq i32 %482, 902
  br i1 %483, label %484, label %495

484:                                              ; preds = %481
  %485 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %127, i64 1) #14, !srcloc !57
  %486 = load ptr, ptr addrspace(1) %128, align 8, !tbaa !27
  %487 = urem i64 %485, %14
  %488 = getelementptr inbounds nuw i64, ptr %486, i64 %487
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "v,v,~{memory}"(ptr %488, i64 range(i64 0, 4294967296) %410) #14, !srcloc !60
  fence syncscope("agent") release
  %489 = add i64 %485, 1
  %490 = insertelement <2 x i64> poison, i64 %489, i64 0
  %491 = insertelement <2 x i64> %490, i64 %485, i64 1
  br label %492

492:                                              ; preds = %492, %484
  %493 = tail call noundef i64 asm sideeffect "flat_atomic_cmpswap_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %129, <2 x i64> %491) #14, !srcloc !61
  %494 = icmp eq i64 %493, %485
  br i1 %494, label %504, label %492, !llvm.loop !62

495:                                              ; preds = %481
  %496 = atomicrmw add ptr addrspace(1) %123, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %497 = load ptr, ptr addrspace(1) %124, align 8, !tbaa !27
  %498 = urem i64 %496, %14
  %499 = getelementptr inbounds nuw i64, ptr %497, i64 %498
  store volatile i64 %410, ptr %499, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %500 = add i64 %496, 1
  br label %501

501:                                              ; preds = %501, %495
  %502 = cmpxchg ptr addrspace(1) %125, i64 %496, i64 %500 syncscope("agent") monotonic monotonic, align 8
  %503 = extractvalue { i64, i1 } %502, 1
  br i1 %503, label %504, label %501, !llvm.loop !63

504:                                              ; preds = %501, %492, %432, %432, %432, %432, %432, %432, %432, %432, %432, %432, %432, %431, %477, %469, %442, %407, %404
  %505 = add nsw i32 %219, 1
  br label %138, !llvm.loop !64

506:                                              ; preds = %246
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE(ptr addrspace(4) noundef readonly byref(%"struct.mirage::runtime::RuntimeConfig") align 8 captures(none) %0) local_unnamed_addr #5 {
  %2 = alloca [128 x i32], align 16, addrspace(5)
  %3 = alloca [128 x i64], align 16, addrspace(5)
  %4 = load i32, ptr addrspace(4) %0, align 8, !tbaa !5
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 4
  %6 = load <2 x i32>, ptr addrspace(4) %5, align 4, !tbaa !5
  %7 = extractelement <2 x i32> %6, i64 1
  %8 = extractelement <2 x i32> %6, i64 0
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 24
  %10 = load i32, ptr addrspace(4) %9, align 8, !tbaa !5
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 32
  %12 = load i64, ptr addrspace(4) %11, align 8, !tbaa !17
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 40
  %14 = load i64, ptr addrspace(4) %13, align 8, !tbaa !17
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 48
  %16 = load ptr, ptr addrspace(4) %15, align 8, !tbaa !27
  %17 = addrspacecast ptr %16 to ptr addrspace(1)
  %18 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 56
  %19 = load ptr, ptr addrspace(4) %18, align 8, !tbaa !27
  %20 = addrspacecast ptr %19 to ptr addrspace(1)
  %21 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 64
  %22 = load ptr, ptr addrspace(4) %21, align 8, !tbaa !27
  %23 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 88
  %24 = load ptr, ptr addrspace(4) %23, align 8, !tbaa !33
  %25 = addrspacecast ptr %24 to ptr addrspace(1)
  %26 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 96
  %27 = load ptr, ptr addrspace(4) %26, align 8, !tbaa !35
  %28 = addrspacecast ptr %27 to ptr addrspace(1)
  %29 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 104
  %30 = load ptr, ptr addrspace(4) %29, align 8, !tbaa !37
  %31 = addrspacecast ptr %30 to ptr addrspace(1)
  %32 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 112
  %33 = load ptr, ptr addrspace(4) %32, align 8, !tbaa !37
  %34 = addrspacecast ptr %33 to ptr addrspace(1)
  %35 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 128
  %36 = load ptr, ptr addrspace(4) %35, align 8, !tbaa !31
  %37 = addrspacecast ptr %36 to ptr addrspace(1)
  %38 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 136
  %39 = load ptr, ptr addrspace(4) %38, align 8, !tbaa !27
  %40 = addrspacecast ptr %39 to ptr addrspace(1)
  %41 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 144
  %42 = load ptr, ptr addrspace(4) %41, align 8, !tbaa !27
  %43 = addrspacecast ptr %42 to ptr addrspace(1)
  %44 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 152
  %45 = load ptr, ptr addrspace(4) %44, align 8, !tbaa !27
  %46 = addrspacecast ptr %45 to ptr addrspace(1)
  %47 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 160
  %48 = load i64, ptr addrspace(4) %47, align 8, !tbaa !17
  %49 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 168
  %50 = load i32, ptr addrspace(4) %49, align 8, !tbaa !5
  %51 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 184
  %52 = load ptr, ptr addrspace(4) %51, align 8, !tbaa !31
  %53 = addrspacecast ptr %52 to ptr addrspace(1)
  %54 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 192
  %55 = load ptr, ptr addrspace(4) %54, align 8, !tbaa !31
  %56 = addrspacecast ptr %55 to ptr addrspace(1)
  %57 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 200
  %58 = load ptr, ptr addrspace(4) %57, align 8, !tbaa !31
  %59 = addrspacecast ptr %58 to ptr addrspace(1)
  %60 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 208
  %61 = load ptr, ptr addrspace(4) %60, align 8, !tbaa !31
  %62 = addrspacecast ptr %61 to ptr addrspace(1)
  %63 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 216
  %64 = load ptr, ptr addrspace(4) %63, align 8, !tbaa !31
  %65 = addrspacecast ptr %64 to ptr addrspace(1)
  %66 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 224
  %67 = load ptr, ptr addrspace(4) %66, align 8, !tbaa !31
  %68 = addrspacecast ptr %67 to ptr addrspace(1)
  %69 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 232
  %70 = load ptr, ptr addrspace(4) %69, align 8, !tbaa !31
  %71 = addrspacecast ptr %70 to ptr addrspace(1)
  %72 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 240
  %73 = load ptr, ptr addrspace(4) %72, align 8, !tbaa !31
  %74 = addrspacecast ptr %73 to ptr addrspace(1)
  %75 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 248
  %76 = load ptr, ptr addrspace(4) %75, align 8, !tbaa !31
  %77 = addrspacecast ptr %76 to ptr addrspace(1)
  %78 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 256
  %79 = load ptr, ptr addrspace(4) %78, align 8, !tbaa !31
  %80 = addrspacecast ptr %79 to ptr addrspace(1)
  %81 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 264
  %82 = load i32, ptr addrspace(4) %81, align 8, !tbaa !5
  %83 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 320
  %84 = load i32, ptr addrspace(4) %83, align 8, !tbaa !5
  %85 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 328
  %86 = load ptr, ptr addrspace(4) %85, align 8, !tbaa !31
  %87 = addrspacecast ptr %86 to ptr addrspace(1)
  %88 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 336
  %89 = load ptr, ptr addrspace(4) %88, align 8, !tbaa !31
  %90 = addrspacecast ptr %89 to ptr addrspace(1)
  %91 = getelementptr inbounds nuw i8, ptr addrspace(4) %0, i64 344
  %92 = load ptr, ptr addrspace(4) %91, align 8, !tbaa !31
  %93 = addrspacecast ptr %92 to ptr addrspace(1)
  %94 = add i32 %7, %8
  %95 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %1079

97:                                               ; preds = %1
  %98 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds ptr, ptr addrspace(1) %34, i64 %99
  %101 = load ptr, ptr addrspace(1) %100, align 8, !tbaa !27
  %102 = insertelement <2 x ptr> <ptr poison, ptr null>, ptr %101, i64 0
  %103 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %98, i64 0
  call void @llvm.lifetime.start.p5(ptr addrspace(5) %2) #15
  %104 = icmp slt i32 %98, %8
  br i1 %104, label %105, label %193

105:                                              ; preds = %97
  %106 = sext i32 %94 to i64
  %107 = getelementptr inbounds ptr, ptr addrspace(1) %34, i64 %106
  %108 = load ptr, ptr addrspace(1) %107, align 8, !tbaa !27
  %109 = insertelement <2 x ptr> %102, ptr %108, i64 1
  %110 = insertelement <2 x i32> %103, i32 %94, i64 1
  %111 = icmp eq ptr addrspace(1) %87, addrspacecast (ptr null to ptr addrspace(1))
  br i1 %111, label %115, label %112

112:                                              ; preds = %105
  %113 = atomicrmw or ptr addrspace(1) %90, i32 0 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %114 = icmp slt i32 %113, %4
  br i1 %114, label %152, label %155

115:                                              ; preds = %105
  %116 = icmp slt i32 %98, %4
  br i1 %116, label %117, label %248

117:                                              ; preds = %115
  %118 = add i32 %98, %8
  %119 = tail call i32 @llvm.smax.i32(i32 %4, i32 %118)
  %120 = icmp slt i32 %118, %4
  %121 = zext i1 %120 to i32
  %122 = add i32 %118, %121
  %123 = sub i32 %119, %122
  %124 = udiv i32 %123, %8
  %125 = add i32 %124, %121
  %126 = add i32 %125, 1
  %127 = icmp ult i32 %126, 2
  br i1 %127, label %149, label %128

128:                                              ; preds = %117
  %129 = and i32 %126, -2
  %130 = mul i32 %129, %8
  %131 = add i32 %98, %130
  %132 = insertelement <2 x i32> poison, i32 %98, i64 0
  %133 = shufflevector <2 x i32> %132, <2 x i32> poison, <2 x i32> zeroinitializer
  %134 = shufflevector <2 x i32> %6, <2 x i32> poison, <2 x i32> zeroinitializer
  %135 = mul nuw nsw <2 x i32> %134, <i32 0, i32 1>
  %136 = add nsw <2 x i32> %133, %135
  %137 = shl nsw i32 %8, 1
  %138 = insertelement <2 x i32> poison, i32 %137, i64 0
  %139 = shufflevector <2 x i32> %138, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %140

140:                                              ; preds = %140, %128
  %141 = phi i32 [ 0, %128 ], [ %144, %140 ]
  %142 = phi <2 x i32> [ %136, %128 ], [ %145, %140 ]
  %143 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %141
  store <2 x i32> %142, ptr addrspace(5) %143, align 8, !tbaa !5
  %144 = add nuw i32 %141, 2
  %145 = add nsw <2 x i32> %142, %139
  %146 = icmp eq i32 %144, %129
  br i1 %146, label %147, label %140, !llvm.loop !104

147:                                              ; preds = %140
  %148 = icmp eq i32 %126, %129
  br i1 %148, label %248, label %149

149:                                              ; preds = %117, %147
  %150 = phi i32 [ 0, %117 ], [ %129, %147 ]
  %151 = phi i32 [ %98, %117 ], [ %131, %147 ]
  br label %186

152:                                              ; preds = %112, %152
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %153 = atomicrmw or ptr addrspace(1) %90, i32 0 syncscope("agent") monotonic, align 4, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %154 = icmp slt i32 %153, %4
  br i1 %154, label %152, label %155, !llvm.loop !66

155:                                              ; preds = %152, %112
  fence syncscope("agent") release
  %156 = tail call noundef i32 asm sideeffect "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)", "=s"() #14, !srcloc !30
  %157 = icmp sgt i32 %4, 0
  br i1 %157, label %172, label %158

158:                                              ; preds = %182, %155
  %159 = phi i32 [ 0, %155 ], [ %183, %182 ]
  %160 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %161 = icmp eq ptr addrspace(4) @.str.4, addrspacecast (ptr null to ptr addrspace(4))
  %162 = select i1 %161, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.4, i64 58) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.4 to ptr) to i64)), i64 1))
  %163 = tail call i64 @__ockl_printf_append_string_n(i64 %160, ptr addrspacecast (ptr addrspace(4) @.str.4 to ptr), i64 %162, i32 0) #15
  %164 = zext i32 %98 to i64
  %165 = tail call i64 @__ockl_printf_append_args(i64 %163, i32 1, i64 %164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %166 = zext i32 %156 to i64
  %167 = tail call i64 @__ockl_printf_append_args(i64 %165, i32 1, i64 %166, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %168 = zext i32 %159 to i64
  %169 = tail call i64 @__ockl_printf_append_args(i64 %167, i32 1, i64 %168, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %170 = tail call i64 @__ockl_printf_append_args(i64 %169, i32 1, i64 %164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  %171 = mul nsw i32 %156, %10
  br label %248

172:                                              ; preds = %155, %182
  %173 = phi i32 [ %183, %182 ], [ 0, %155 ]
  %174 = phi i32 [ %184, %182 ], [ 0, %155 ]
  %175 = zext nneg i32 %174 to i64
  %176 = getelementptr inbounds nuw i32, ptr addrspace(1) %87, i64 %175
  %177 = load i32, ptr addrspace(1) %176, align 4, !tbaa !5
  %178 = icmp eq i32 %177, %156
  br i1 %178, label %179, label %182

179:                                              ; preds = %172
  %180 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %173
  %181 = add nsw i32 %173, 1
  store i32 %174, ptr addrspace(5) %180, align 4, !tbaa !5
  br label %182

182:                                              ; preds = %179, %172
  %183 = phi i32 [ %181, %179 ], [ %173, %172 ]
  %184 = add nuw nsw i32 %174, 1
  %185 = icmp eq i32 %184, %4
  br i1 %185, label %158, label %172, !llvm.loop !67

186:                                              ; preds = %149, %186
  %187 = phi i32 [ %189, %186 ], [ %150, %149 ]
  %188 = phi i32 [ %191, %186 ], [ %151, %149 ]
  %189 = add nuw nsw i32 %187, 1
  %190 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %187
  store i32 %188, ptr addrspace(5) %190, align 4, !tbaa !5
  %191 = add nsw i32 %188, %8
  %192 = icmp slt i32 %191, %4
  br i1 %192, label %186, label %248, !llvm.loop !105

193:                                              ; preds = %97
  %194 = sub nsw i32 %98, %8
  %195 = icmp slt i32 %194, %4
  br i1 %195, label %196, label %248

196:                                              ; preds = %193
  %197 = add i32 %98, %7
  %198 = sub i32 %197, %8
  %199 = tail call i32 @llvm.smax.i32(i32 %4, i32 %198)
  %200 = insertelement <2 x i32> poison, i32 %199, i64 0
  %201 = insertelement <2 x i32> %200, i32 %98, i64 1
  %202 = add <2 x i32> %6, %201
  %203 = extractelement <2 x i32> %202, i64 0
  %204 = extractelement <2 x i32> %202, i64 1
  %205 = icmp ne i32 %203, %204
  %206 = zext i1 %205 to i32
  %207 = add i32 %204, %206
  %208 = sub i32 %203, %207
  %209 = udiv i32 %208, %7
  %210 = add i32 %209, %206
  %211 = add i32 %210, 1
  %212 = icmp ult i32 %211, 2
  br i1 %212, label %237, label %213

213:                                              ; preds = %196
  %214 = and i32 %211, -2
  %215 = mul i32 %214, %7
  %216 = add i32 %194, %215
  %217 = insertelement <2 x i32> poison, i32 %4, i64 0
  %218 = shufflevector <2 x i32> %217, <2 x i32> poison, <2 x i32> zeroinitializer
  %219 = insertelement <2 x i32> poison, i32 %194, i64 0
  %220 = shufflevector <2 x i32> %219, <2 x i32> poison, <2 x i32> zeroinitializer
  %221 = shufflevector <2 x i32> %6, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %222 = mul nuw nsw <2 x i32> %221, <i32 0, i32 1>
  %223 = add nsw <2 x i32> %220, %222
  %224 = shl nsw i32 %7, 1
  %225 = insertelement <2 x i32> poison, i32 %224, i64 0
  %226 = shufflevector <2 x i32> %225, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %227

227:                                              ; preds = %227, %213
  %228 = phi i32 [ 0, %213 ], [ %232, %227 ]
  %229 = phi <2 x i32> [ %223, %213 ], [ %233, %227 ]
  %230 = add nsw <2 x i32> %229, %218
  %231 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %228
  store <2 x i32> %230, ptr addrspace(5) %231, align 8, !tbaa !5
  %232 = add nuw i32 %228, 2
  %233 = add nsw <2 x i32> %229, %226
  %234 = icmp eq i32 %232, %214
  br i1 %234, label %235, label %227, !llvm.loop !106

235:                                              ; preds = %227
  %236 = icmp eq i32 %211, %214
  br i1 %236, label %248, label %237

237:                                              ; preds = %196, %235
  %238 = phi i32 [ 0, %196 ], [ %214, %235 ]
  %239 = phi i32 [ %194, %196 ], [ %216, %235 ]
  br label %240

240:                                              ; preds = %237, %240
  %241 = phi i32 [ %244, %240 ], [ %238, %237 ]
  %242 = phi i32 [ %246, %240 ], [ %239, %237 ]
  %243 = add nsw i32 %242, %4
  %244 = add nuw nsw i32 %241, 1
  %245 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %241
  store i32 %243, ptr addrspace(5) %245, align 4, !tbaa !5
  %246 = add nsw i32 %242, %7
  %247 = icmp slt i32 %246, %4
  br i1 %247, label %240, label %248, !llvm.loop !107

248:                                              ; preds = %240, %186, %235, %147, %193, %115, %158
  %249 = phi <2 x ptr> [ %109, %158 ], [ %109, %115 ], [ %102, %193 ], [ %109, %147 ], [ %102, %235 ], [ %109, %186 ], [ %102, %240 ]
  %250 = phi <2 x i32> [ %110, %158 ], [ %110, %115 ], [ %103, %193 ], [ %110, %147 ], [ %103, %235 ], [ %110, %186 ], [ %103, %240 ]
  %251 = phi i32 [ %171, %158 ], [ 0, %115 ], [ 0, %193 ], [ 0, %147 ], [ 0, %235 ], [ 0, %186 ], [ 0, %240 ]
  %252 = phi i32 [ %159, %158 ], [ 0, %115 ], [ 0, %193 ], [ %129, %147 ], [ %214, %235 ], [ %189, %186 ], [ %244, %240 ]
  %253 = phi i32 [ 1, %158 ], [ 1, %115 ], [ 0, %193 ], [ 1, %147 ], [ 0, %235 ], [ 1, %186 ], [ 0, %240 ]
  call void @llvm.lifetime.start.p5(ptr addrspace(5) %3) #15
  %254 = icmp sgt i32 %252, 0
  br i1 %254, label %270, label %255

255:                                              ; preds = %270, %248
  %256 = extractelement <2 x i32> %250, i64 0
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i64, ptr addrspace(1) %20, i64 %257
  %259 = addrspacecast ptr addrspace(1) %258 to ptr
  %260 = extractelement <2 x ptr> %249, i64 0
  %261 = sext i32 %8 to i64
  %262 = icmp ne ptr addrspace(1) %93, addrspacecast (ptr null to ptr addrspace(1))
  %263 = sext i32 %4 to i64
  %264 = add nsw i64 %263, -1
  %265 = getelementptr inbounds nuw i8, ptr addrspace(1) %53, i64 4
  %266 = icmp eq ptr addrspace(4) @.str.3, addrspacecast (ptr null to ptr addrspace(4))
  %267 = getelementptr inbounds nuw i8, ptr addrspace(1) %56, i64 4
  %268 = icmp sgt i32 %94, 0
  %269 = select i1 %266, i64 0, i64 add (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @.str.3, i64 53) to ptr) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr) to i64)), i64 1))
  br label %275

270:                                              ; preds = %248, %270
  %271 = phi i32 [ %273, %270 ], [ 0, %248 ]
  %272 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %271
  store i64 0, ptr addrspace(5) %272, align 8, !tbaa !40
  %273 = add nuw nsw i32 %271, 1
  %274 = icmp eq i32 %273, %252
  br i1 %274, label %255, label %270, !llvm.loop !71

275:                                              ; preds = %255, %1072
  %276 = phi <2 x i64> [ %314, %1072 ], [ zeroinitializer, %255 ]
  %277 = phi <2 x i64> [ %1073, %1072 ], [ zeroinitializer, %255 ]
  %278 = phi i32 [ %312, %1072 ], [ 0, %255 ]
  %279 = phi i32 [ %1074, %1072 ], [ 0, %255 ]
  %280 = phi i32 [ %1075, %1072 ], [ 0, %255 ]
  %281 = phi i64 [ %1076, %1072 ], [ 0, %255 ]
  %282 = phi i64 [ %1077, %1072 ], [ 0, %255 ]
  %283 = extractelement <2 x i64> %277, i32 %278
  %284 = extractelement <2 x i64> %276, i32 %278
  %285 = icmp eq i64 %283, %284
  br i1 %285, label %286, label %311

286:                                              ; preds = %275, %304
  %287 = phi i64 [ %308, %304 ], [ %283, %275 ]
  %288 = phi i32 [ %307, %304 ], [ %278, %275 ]
  %289 = phi <2 x i64> [ %301, %304 ], [ %276, %275 ]
  %290 = icmp eq i32 %288, 0
  br i1 %290, label %291, label %294

291:                                              ; preds = %286
  %292 = load volatile i64, ptr %259, align 8, !tbaa !17
  %293 = insertelement <2 x i64> %289, i64 %292, i64 0
  br label %300

294:                                              ; preds = %286
  %295 = extractelement <2 x i32> %250, i32 %288
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds i64, ptr %19, i64 %296
  %298 = tail call noundef i64 asm sideeffect "global_load_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "=v,v,~{memory}"(ptr %297) #14, !srcloc !72
  %299 = insertelement <2 x i64> %289, i64 %298, i32 %288
  br label %300

300:                                              ; preds = %294, %291
  %301 = phi <2 x i64> [ %299, %294 ], [ %293, %291 ]
  %302 = extractelement <2 x i64> %301, i32 %288
  %303 = icmp ult i64 %287, %302
  br i1 %303, label %311, label %304

304:                                              ; preds = %300
  %305 = icmp eq i32 %288, %253
  %306 = add nsw i32 %288, 1
  %307 = select i1 %305, i32 0, i32 %306
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %308 = extractelement <2 x i64> %277, i32 %307
  %309 = extractelement <2 x i64> %301, i32 %307
  %310 = icmp eq i64 %308, %309
  br i1 %310, label %286, label %311, !llvm.loop !73

311:                                              ; preds = %304, %300, %275
  %312 = phi i32 [ %278, %275 ], [ %307, %304 ], [ %288, %300 ]
  %313 = phi i64 [ %283, %275 ], [ %308, %304 ], [ %287, %300 ]
  %314 = phi <2 x i64> [ %276, %275 ], [ %301, %300 ], [ %301, %304 ]
  %315 = icmp eq i32 %312, 0
  br i1 %315, label %316, label %321

316:                                              ; preds = %311
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %317 = extractelement <2 x i64> %277, i64 0
  %318 = urem i64 %317, %14
  %319 = getelementptr inbounds nuw i64, ptr %260, i64 %318
  %320 = load volatile i64, ptr %319, align 8, !tbaa !17
  br label %326

321:                                              ; preds = %311
  fence syncscope("agent") release
  %322 = extractelement <2 x ptr> %249, i32 %312
  %323 = urem i64 %313, %14
  %324 = getelementptr inbounds nuw i64, ptr %322, i64 %323
  %325 = tail call noundef i64 asm sideeffect "global_load_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "=v,v,~{memory}"(ptr %324) #14, !srcloc !72
  br label %326

326:                                              ; preds = %321, %316
  %327 = phi i64 [ %320, %316 ], [ %325, %321 ]
  %328 = getelementptr inbounds %"struct.mirage::runtime::EventDesc", ptr addrspace(1) %28, i64 %327
  %329 = getelementptr inbounds nuw i8, ptr addrspace(1) %328, i64 8
  %330 = load i64, ptr addrspace(1) %329, align 8, !tbaa !17
  %331 = getelementptr inbounds nuw i8, ptr addrspace(1) %328, i64 16
  %332 = load i64, ptr addrspace(1) %331, align 8, !tbaa !17
  %333 = icmp eq i64 %327, 0
  br i1 %333, label %334, label %352

334:                                              ; preds = %326
  br i1 %104, label %335, label %1072

335:                                              ; preds = %334
  br i1 %254, label %336, label %1072

336:                                              ; preds = %335, %336
  %337 = phi i32 [ %350, %336 ], [ 0, %335 ]
  %338 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %337
  %339 = load i32, ptr addrspace(5) %338, align 4, !tbaa !5
  %340 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %337
  %341 = load i64, ptr addrspace(5) %340, align 8, !tbaa !40
  %342 = add i64 %341, 1
  store i64 %342, ptr addrspace(5) %340, align 8, !tbaa !40
  %343 = sext i32 %339 to i64
  %344 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %343
  %345 = load ptr, ptr addrspace(1) %344, align 8, !tbaa !27
  %346 = urem i64 %341, %12
  %347 = getelementptr inbounds nuw i64, ptr %345, i64 %346
  store volatile i64 0, ptr %347, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %348 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %343
  %349 = atomicrmw add ptr addrspace(1) %348, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %350 = add nuw nsw i32 %337, 1
  %351 = icmp eq i32 %350, %252
  br i1 %351, label %1072, label %336, !llvm.loop !74

352:                                              ; preds = %326
  %353 = load i32, ptr addrspace(1) %328, align 8, !tbaa !58
  switch i32 %353, label %979 [
    i32 910, label %354
    i32 903, label %790
    i32 902, label %958
  ]

354:                                              ; preds = %352
  %355 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %356 = mul i64 %355, 10
  %357 = load i32, ptr addrspace(1) %265, align 4, !tbaa !5
  %358 = icmp eq i64 %281, 0
  br i1 %358, label %376, label %359

359:                                              ; preds = %354
  %360 = icmp slt i32 %280, 10
  %361 = urem i32 %280, 100
  %362 = icmp eq i32 %361, 0
  %363 = or i1 %360, %362
  br i1 %363, label %364, label %376

364:                                              ; preds = %359
  %365 = sub i64 %356, %281
  %366 = uitofp i64 %365 to double
  %367 = fdiv contract double %366, 1.000000e+06
  %368 = tail call i64 @__ockl_printf_begin(i64 0) #15
  %369 = tail call i64 @__ockl_printf_append_string_n(i64 %368, ptr addrspacecast (ptr addrspace(4) @.str.3 to ptr), i64 %269, i32 0) #15
  %370 = zext i32 %280 to i64
  %371 = tail call i64 @__ockl_printf_append_args(i64 %369, i32 1, i64 %370, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %372 = bitcast double %367 to i64
  %373 = tail call i64 @__ockl_printf_append_args(i64 %371, i32 1, i64 %372, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #15
  %374 = zext i32 %357 to i64
  %375 = tail call i64 @__ockl_printf_append_args(i64 %373, i32 1, i64 %374, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1) #15
  br label %376

376:                                              ; preds = %364, %359, %354
  %377 = add nsw i32 %280, 1
  %378 = load i32, ptr addrspace(1) %74, align 4, !tbaa !5
  %379 = load i32, ptr addrspace(1) %77, align 4, !tbaa !5
  %380 = load i32, ptr addrspace(1) %68, align 4, !tbaa !5
  %381 = shl i32 %380, 16
  %382 = ashr exact i32 %381, 16
  %383 = icmp eq i32 %381, -65536
  br i1 %383, label %451, label %384

384:                                              ; preds = %376
  %385 = zext i32 %380 to i64
  %386 = shl i64 %385, 48
  %387 = ashr exact i64 %386, 48
  %388 = getelementptr inbounds i32, ptr addrspace(1) %37, i64 %387
  %389 = load i32, ptr addrspace(1) %388, align 4, !tbaa !5
  %390 = load <2 x i32>, ptr addrspace(1) %53, align 4, !tbaa !5
  %391 = extractelement <2 x i32> %390, i64 0
  %392 = extractelement <2 x i32> %390, i64 1
  %393 = sub nsw i32 %392, %391
  %394 = getelementptr inbounds i32, ptr addrspace(1) %65, i64 %387
  %395 = load i32, ptr addrspace(1) %394, align 4, !tbaa !5
  %396 = icmp sgt i32 %393, 0
  br i1 %396, label %397, label %401

397:                                              ; preds = %384
  %398 = add i32 %389, 1
  %399 = mul nsw i32 %382, 1200
  %400 = add nsw i32 %389, %399
  br label %405

401:                                              ; preds = %420, %384
  %402 = add i32 %393, %389
  store i32 %402, ptr addrspace(1) %388, align 4, !tbaa !5
  %403 = add nsw i32 %402, 1
  %404 = icmp slt i32 %403, %50
  br i1 %404, label %423, label %432

405:                                              ; preds = %397, %420
  %406 = phi i32 [ 0, %397 ], [ %421, %420 ]
  %407 = add i32 %398, %406
  %408 = icmp sge i32 %407, %395
  %409 = icmp slt i32 %407, %50
  %410 = select i1 %408, i1 %409, i1 false
  br i1 %410, label %411, label %420

411:                                              ; preds = %405
  %412 = add nsw i32 %406, %391
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds i64, ptr addrspace(1) %46, i64 %413
  %415 = load i64, ptr addrspace(1) %414, align 8, !tbaa !17
  %416 = add nsw i32 %400, %406
  %417 = sext i32 %416 to i64
  %418 = getelementptr i64, ptr addrspace(1) %40, i64 %417
  %419 = getelementptr i8, ptr addrspace(1) %418, i64 8
  store i64 %415, ptr addrspace(1) %419, align 8, !tbaa !17
  br label %420

420:                                              ; preds = %411, %405
  %421 = add nuw nsw i32 %406, 1
  %422 = icmp slt i32 %421, %393
  br i1 %422, label %405, label %401, !llvm.loop !75

423:                                              ; preds = %401
  %424 = mul nsw i32 %382, 1200
  %425 = add i32 %402, %424
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds i64, ptr addrspace(1) %40, i64 %426
  %428 = load i64, ptr addrspace(1) %427, align 8, !tbaa !17
  %429 = icmp ne i64 %428, %48
  %430 = icmp slt i32 %402, %395
  %431 = select i1 %429, i1 true, i1 %430
  br i1 %431, label %451, label %432

432:                                              ; preds = %423, %401
  store i32 -1, ptr addrspace(1) %68, align 4, !tbaa !5
  %433 = load <2 x i32>, ptr addrspace(1) %56, align 4, !tbaa !5
  %434 = extractelement <2 x i32> %433, i64 0
  %435 = extractelement <2 x i32> %433, i64 1
  %436 = sub nsw i32 %435, %434
  %437 = icmp sgt i32 %436, 0
  br i1 %437, label %438, label %451

438:                                              ; preds = %432, %438
  %439 = phi i32 [ %448, %438 ], [ %379, %432 ]
  %440 = phi i32 [ %449, %438 ], [ 0, %432 ]
  %441 = add nsw i32 %440, %434
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds i32, ptr addrspace(1) %59, i64 %442
  %444 = load i32, ptr addrspace(1) %443, align 4, !tbaa !5
  %445 = srem i32 %439, 16
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds i32, ptr addrspace(1) %71, i64 %446
  store i32 %444, ptr addrspace(1) %447, align 4, !tbaa !5
  %448 = add nsw i32 %439, 1
  %449 = add nuw nsw i32 %440, 1
  %450 = icmp slt i32 %449, %436
  br i1 %450, label %438, label %451, !llvm.loop !76

451:                                              ; preds = %438, %432, %423, %376
  %452 = phi i32 [ %379, %376 ], [ %379, %423 ], [ %379, %432 ], [ %448, %438 ]
  %453 = load i32, ptr addrspace(1) %267, align 4, !tbaa !5
  %454 = icmp sgt i32 %453, 0
  br i1 %454, label %455, label %538

455:                                              ; preds = %451
  %456 = icmp eq i32 %453, 1
  br i1 %456, label %528, label %457

457:                                              ; preds = %455
  %458 = and i32 %453, 2147483646
  %459 = add nsw i32 %453, -2
  %460 = lshr i32 %459, 1
  %461 = add nuw i32 %460, 1
  %462 = and i32 %461, 7
  %463 = icmp ult i32 %459, 14
  br i1 %463, label %513, label %464

464:                                              ; preds = %457
  %465 = and i32 %461, -8
  br label %466

466:                                              ; preds = %466, %464
  %467 = phi i32 [ 0, %464 ], [ %508, %466 ]
  %468 = phi i32 [ 0, %464 ], [ %509, %466 ]
  %469 = zext nneg i32 %467 to i64
  %470 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %469
  %471 = load <2 x i32>, ptr addrspace(1) %470, align 4, !tbaa !5
  %472 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %467
  store <2 x i32> %471, ptr addrspace(3) %472, align 16, !tbaa !5
  %473 = or disjoint i32 %467, 2
  %474 = zext nneg i32 %473 to i64
  %475 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %474
  %476 = load <2 x i32>, ptr addrspace(1) %475, align 4, !tbaa !5
  %477 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %473
  store <2 x i32> %476, ptr addrspace(3) %477, align 8, !tbaa !5
  %478 = or disjoint i32 %467, 4
  %479 = zext nneg i32 %478 to i64
  %480 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %479
  %481 = load <2 x i32>, ptr addrspace(1) %480, align 4, !tbaa !5
  %482 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %478
  store <2 x i32> %481, ptr addrspace(3) %482, align 16, !tbaa !5
  %483 = or disjoint i32 %467, 6
  %484 = zext nneg i32 %483 to i64
  %485 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %484
  %486 = load <2 x i32>, ptr addrspace(1) %485, align 4, !tbaa !5
  %487 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %483
  store <2 x i32> %486, ptr addrspace(3) %487, align 8, !tbaa !5
  %488 = or disjoint i32 %467, 8
  %489 = zext nneg i32 %488 to i64
  %490 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %489
  %491 = load <2 x i32>, ptr addrspace(1) %490, align 4, !tbaa !5
  %492 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %488
  store <2 x i32> %491, ptr addrspace(3) %492, align 16, !tbaa !5
  %493 = or disjoint i32 %467, 10
  %494 = zext nneg i32 %493 to i64
  %495 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %494
  %496 = load <2 x i32>, ptr addrspace(1) %495, align 4, !tbaa !5
  %497 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %493
  store <2 x i32> %496, ptr addrspace(3) %497, align 8, !tbaa !5
  %498 = or disjoint i32 %467, 12
  %499 = zext nneg i32 %498 to i64
  %500 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %499
  %501 = load <2 x i32>, ptr addrspace(1) %500, align 4, !tbaa !5
  %502 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %498
  store <2 x i32> %501, ptr addrspace(3) %502, align 16, !tbaa !5
  %503 = or disjoint i32 %467, 14
  %504 = zext nneg i32 %503 to i64
  %505 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %504
  %506 = load <2 x i32>, ptr addrspace(1) %505, align 4, !tbaa !5
  %507 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %503
  store <2 x i32> %506, ptr addrspace(3) %507, align 8, !tbaa !5
  %508 = add nuw i32 %467, 16
  %509 = add i32 %468, 8
  %510 = icmp eq i32 %509, %465
  br i1 %510, label %511, label %466, !llvm.loop !108

511:                                              ; preds = %466
  %512 = icmp eq i32 %462, 0
  br i1 %512, label %526, label %513

513:                                              ; preds = %511, %457
  %514 = phi i32 [ 0, %457 ], [ %508, %511 ]
  %515 = icmp ne i32 %462, 0
  tail call void @llvm.assume(i1 %515)
  br label %516

516:                                              ; preds = %516, %513
  %517 = phi i32 [ %514, %513 ], [ %523, %516 ]
  %518 = phi i32 [ 0, %513 ], [ %524, %516 ]
  %519 = zext nneg i32 %517 to i64
  %520 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %519
  %521 = load <2 x i32>, ptr addrspace(1) %520, align 4, !tbaa !5
  %522 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %517
  store <2 x i32> %521, ptr addrspace(3) %522, align 8, !tbaa !5
  %523 = add nuw i32 %517, 2
  %524 = add i32 %518, 1
  %525 = icmp eq i32 %524, %462
  br i1 %525, label %526, label %516, !llvm.loop !109

526:                                              ; preds = %516, %511
  %527 = icmp eq i32 %453, %458
  br i1 %527, label %538, label %528

528:                                              ; preds = %455, %526
  %529 = phi i32 [ 0, %455 ], [ %458, %526 ]
  br label %530

530:                                              ; preds = %528, %530
  %531 = phi i32 [ %536, %530 ], [ %529, %528 ]
  %532 = zext nneg i32 %531 to i64
  %533 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %532
  %534 = load i32, ptr addrspace(1) %533, align 4, !tbaa !5
  %535 = getelementptr inbounds nuw i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %531
  store i32 %534, ptr addrspace(3) %535, align 4, !tbaa !5
  %536 = add nuw nsw i32 %531, 1
  %537 = icmp eq i32 %536, %453
  br i1 %537, label %538, label %530, !llvm.loop !110

538:                                              ; preds = %530, %526, %451
  %539 = load i32, ptr addrspace(1) %68, align 4, !tbaa !5
  %540 = shl i32 %539, 16
  %541 = icmp eq i32 %540, -65536
  br i1 %541, label %674, label %542

542:                                              ; preds = %538
  %543 = ashr exact i32 %540, 16
  %544 = zext i32 %539 to i64
  %545 = load i32, ptr addrspace(1) %56, align 4, !tbaa !5
  %546 = sub i32 %453, %545
  store i32 %543, ptr addrspace(1) %68, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %53, align 4, !tbaa !5
  store i32 0, ptr addrspace(1) %56, align 4, !tbaa !5
  %547 = shl i64 %544, 48
  %548 = ashr exact i64 %547, 48
  %549 = getelementptr inbounds i32, ptr addrspace(1) %37, i64 %548
  %550 = load i32, ptr addrspace(1) %549, align 4, !tbaa !5
  %551 = getelementptr inbounds i32, ptr addrspace(1) %65, i64 %548
  %552 = load i32, ptr addrspace(1) %551, align 4, !tbaa !5
  %553 = sub nsw i32 %552, %550
  %554 = tail call i32 @llvm.smax.i32(i32 %553, i32 1)
  %555 = tail call i32 @llvm.umin.i32(i32 %554, i32 8)
  %556 = mul nsw i32 %543, 1200
  %557 = add nsw i32 %550, %556
  br label %642

558:                                              ; preds = %642
  %559 = add nsw i32 %555, %550
  %560 = add nsw i32 %559, 4095
  %561 = sdiv i32 %560, 4096
  %562 = srem i32 %559, 4096
  %563 = icmp eq i32 %562, 0
  %564 = select i1 %563, i32 4096, i32 %562
  store i32 %564, ptr addrspace(1) %62, align 4, !tbaa !5
  %565 = icmp sgt i32 %546, 0
  br i1 %565, label %566, label %652

566:                                              ; preds = %558
  %567 = getelementptr i32, ptr addrspace(3) @_ZZ18prepare_next_batchRKN6mirage7runtime13RuntimeConfigEE15smem_kv_indices, i32 %545
  %568 = icmp eq i32 %546, 1
  br i1 %568, label %640, label %569

569:                                              ; preds = %566
  %570 = and i32 %546, 2147483646
  %571 = add nsw i32 %546, -2
  %572 = lshr i32 %571, 1
  %573 = add nuw i32 %572, 1
  %574 = and i32 %573, 7
  %575 = icmp ult i32 %571, 14
  br i1 %575, label %625, label %576

576:                                              ; preds = %569
  %577 = and i32 %573, -8
  br label %578

578:                                              ; preds = %578, %576
  %579 = phi i32 [ 0, %576 ], [ %620, %578 ]
  %580 = phi i32 [ 0, %576 ], [ %621, %578 ]
  %581 = getelementptr i32, ptr addrspace(3) %567, i32 %579
  %582 = load <2 x i32>, ptr addrspace(3) %581, align 4, !tbaa !5
  %583 = zext nneg i32 %579 to i64
  %584 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %583
  store <2 x i32> %582, ptr addrspace(1) %584, align 4, !tbaa !5
  %585 = or disjoint i32 %579, 2
  %586 = getelementptr i32, ptr addrspace(3) %567, i32 %585
  %587 = load <2 x i32>, ptr addrspace(3) %586, align 4, !tbaa !5
  %588 = zext nneg i32 %585 to i64
  %589 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %588
  store <2 x i32> %587, ptr addrspace(1) %589, align 4, !tbaa !5
  %590 = or disjoint i32 %579, 4
  %591 = getelementptr i32, ptr addrspace(3) %567, i32 %590
  %592 = load <2 x i32>, ptr addrspace(3) %591, align 4, !tbaa !5
  %593 = zext nneg i32 %590 to i64
  %594 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %593
  store <2 x i32> %592, ptr addrspace(1) %594, align 4, !tbaa !5
  %595 = or disjoint i32 %579, 6
  %596 = getelementptr i32, ptr addrspace(3) %567, i32 %595
  %597 = load <2 x i32>, ptr addrspace(3) %596, align 4, !tbaa !5
  %598 = zext nneg i32 %595 to i64
  %599 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %598
  store <2 x i32> %597, ptr addrspace(1) %599, align 4, !tbaa !5
  %600 = or disjoint i32 %579, 8
  %601 = getelementptr i32, ptr addrspace(3) %567, i32 %600
  %602 = load <2 x i32>, ptr addrspace(3) %601, align 4, !tbaa !5
  %603 = zext nneg i32 %600 to i64
  %604 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %603
  store <2 x i32> %602, ptr addrspace(1) %604, align 4, !tbaa !5
  %605 = or disjoint i32 %579, 10
  %606 = getelementptr i32, ptr addrspace(3) %567, i32 %605
  %607 = load <2 x i32>, ptr addrspace(3) %606, align 4, !tbaa !5
  %608 = zext nneg i32 %605 to i64
  %609 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %608
  store <2 x i32> %607, ptr addrspace(1) %609, align 4, !tbaa !5
  %610 = or disjoint i32 %579, 12
  %611 = getelementptr i32, ptr addrspace(3) %567, i32 %610
  %612 = load <2 x i32>, ptr addrspace(3) %611, align 4, !tbaa !5
  %613 = zext nneg i32 %610 to i64
  %614 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %613
  store <2 x i32> %612, ptr addrspace(1) %614, align 4, !tbaa !5
  %615 = or disjoint i32 %579, 14
  %616 = getelementptr i32, ptr addrspace(3) %567, i32 %615
  %617 = load <2 x i32>, ptr addrspace(3) %616, align 4, !tbaa !5
  %618 = zext nneg i32 %615 to i64
  %619 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %618
  store <2 x i32> %617, ptr addrspace(1) %619, align 4, !tbaa !5
  %620 = add nuw i32 %579, 16
  %621 = add i32 %580, 8
  %622 = icmp eq i32 %621, %577
  br i1 %622, label %623, label %578, !llvm.loop !111

623:                                              ; preds = %578
  %624 = icmp eq i32 %574, 0
  br i1 %624, label %638, label %625

625:                                              ; preds = %623, %569
  %626 = phi i32 [ 0, %569 ], [ %620, %623 ]
  %627 = icmp ne i32 %574, 0
  tail call void @llvm.assume(i1 %627)
  br label %628

628:                                              ; preds = %628, %625
  %629 = phi i32 [ %626, %625 ], [ %635, %628 ]
  %630 = phi i32 [ 0, %625 ], [ %636, %628 ]
  %631 = getelementptr i32, ptr addrspace(3) %567, i32 %629
  %632 = load <2 x i32>, ptr addrspace(3) %631, align 4, !tbaa !5
  %633 = zext nneg i32 %629 to i64
  %634 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %633
  store <2 x i32> %632, ptr addrspace(1) %634, align 4, !tbaa !5
  %635 = add nuw i32 %629, 2
  %636 = add i32 %630, 1
  %637 = icmp eq i32 %636, %574
  br i1 %637, label %638, label %628, !llvm.loop !112

638:                                              ; preds = %628, %623
  %639 = icmp eq i32 %546, %570
  br i1 %639, label %652, label %640

640:                                              ; preds = %566, %638
  %641 = phi i32 [ 0, %566 ], [ %570, %638 ]
  br label %654

642:                                              ; preds = %542, %642
  %643 = phi i32 [ 0, %542 ], [ %650, %642 ]
  %644 = add nsw i32 %557, %643
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds i64, ptr addrspace(1) %40, i64 %645
  %647 = load i64, ptr addrspace(1) %646, align 8, !tbaa !17
  %648 = zext nneg i32 %643 to i64
  %649 = getelementptr inbounds nuw i64, ptr addrspace(1) %43, i64 %648
  store i64 %647, ptr addrspace(1) %649, align 8, !tbaa !17
  %650 = add nuw nsw i32 %643, 1
  %651 = icmp eq i32 %650, %555
  br i1 %651, label %558, label %642, !llvm.loop !83

652:                                              ; preds = %654, %638, %558
  %653 = icmp slt i32 %546, %561
  br i1 %653, label %662, label %674

654:                                              ; preds = %640, %654
  %655 = phi i32 [ %660, %654 ], [ %641, %640 ]
  %656 = getelementptr i32, ptr addrspace(3) %567, i32 %655
  %657 = load i32, ptr addrspace(3) %656, align 4, !tbaa !5
  %658 = zext nneg i32 %655 to i64
  %659 = getelementptr inbounds nuw i32, ptr addrspace(1) %59, i64 %658
  store i32 %657, ptr addrspace(1) %659, align 4, !tbaa !5
  %660 = add nuw nsw i32 %655, 1
  %661 = icmp slt i32 %660, %546
  br i1 %661, label %654, label %652, !llvm.loop !113

662:                                              ; preds = %652, %662
  %663 = phi i32 [ %671, %662 ], [ %378, %652 ]
  %664 = phi i32 [ %672, %662 ], [ %546, %652 ]
  %665 = srem i32 %663, 16
  %666 = sext i32 %665 to i64
  %667 = getelementptr inbounds i32, ptr addrspace(1) %71, i64 %666
  %668 = load i32, ptr addrspace(1) %667, align 4, !tbaa !5
  %669 = sext i32 %664 to i64
  %670 = getelementptr inbounds i32, ptr addrspace(1) %59, i64 %669
  store i32 %668, ptr addrspace(1) %670, align 4, !tbaa !5
  %671 = add nsw i32 %663, 1
  %672 = add nsw i32 %664, 1
  %673 = icmp slt i32 %672, %561
  br i1 %673, label %662, label %674, !llvm.loop !85

674:                                              ; preds = %662, %652, %538
  %675 = phi i32 [ 0, %538 ], [ %555, %652 ], [ %555, %662 ]
  %676 = phi i32 [ 0, %538 ], [ 1, %652 ], [ 1, %662 ]
  %677 = phi i32 [ 0, %538 ], [ %561, %652 ], [ %561, %662 ]
  %678 = phi i32 [ %378, %538 ], [ %378, %652 ], [ %671, %662 ]
  br label %679

679:                                              ; preds = %674, %730
  %680 = phi i32 [ %731, %730 ], [ %675, %674 ]
  %681 = phi i32 [ %732, %730 ], [ %676, %674 ]
  %682 = phi i32 [ %733, %730 ], [ %677, %674 ]
  %683 = phi i32 [ %734, %730 ], [ %678, %674 ]
  %684 = icmp eq i32 %681, 0
  %685 = icmp slt i32 %680, 8
  %686 = select i1 %684, i1 %685, i1 false
  br i1 %686, label %687, label %735

687:                                              ; preds = %679
  %688 = load i32, ptr addrspace(1) %80, align 4, !tbaa !5
  %689 = icmp slt i32 %688, %82
  br i1 %689, label %690, label %730

690:                                              ; preds = %687
  store i32 %688, ptr addrspace(1) %68, align 4, !tbaa !5
  store i32 %680, ptr addrspace(1) %53, align 4, !tbaa !5
  store i32 %682, ptr addrspace(1) %56, align 4, !tbaa !5
  %691 = sext i32 %688 to i64
  %692 = getelementptr inbounds i32, ptr addrspace(1) %65, i64 %691
  %693 = load i32, ptr addrspace(1) %692, align 4, !tbaa !5
  %694 = sub nsw i32 8, %680
  %695 = tail call i32 @llvm.umin.i32(i32 %694, i32 8)
  %696 = tail call noundef i32 @llvm.smin.i32(i32 %693, i32 %695)
  %697 = icmp sgt i32 %693, 0
  br i1 %697, label %698, label %700

698:                                              ; preds = %690
  %699 = mul nsw i32 %688, 1200
  br label %706

700:                                              ; preds = %706, %690
  %701 = add nsw i32 %696, 4095
  %702 = sdiv i32 %701, 4096
  %703 = srem i32 %696, 4096
  %704 = icmp eq i32 %703, 0
  %705 = select i1 %704, i32 4096, i32 %703
  store i32 %705, ptr addrspace(1) %62, align 4, !tbaa !5
  br i1 %697, label %722, label %717

706:                                              ; preds = %698, %706
  %707 = phi i32 [ 0, %698 ], [ %715, %706 ]
  %708 = add nuw nsw i32 %707, %699
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds i64, ptr addrspace(1) %40, i64 %709
  %711 = load i64, ptr addrspace(1) %710, align 8, !tbaa !17
  %712 = add nsw i32 %707, %680
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds i64, ptr addrspace(1) %43, i64 %713
  store i64 %711, ptr addrspace(1) %714, align 8, !tbaa !17
  %715 = add nuw nsw i32 %707, 1
  %716 = icmp eq i32 %715, %696
  br i1 %716, label %700, label %706, !llvm.loop !86

717:                                              ; preds = %722, %700
  %718 = phi i32 [ %683, %700 ], [ %729, %722 ]
  %719 = add nsw i32 %696, %680
  %720 = add nsw i32 %702, %682
  %721 = add nsw i32 %688, 1
  store i32 %721, ptr addrspace(1) %80, align 4, !tbaa !5
  br label %730

722:                                              ; preds = %700
  %723 = srem i32 %683, 16
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds i32, ptr addrspace(1) %71, i64 %724
  %726 = load i32, ptr addrspace(1) %725, align 4, !tbaa !5
  %727 = sext i32 %682 to i64
  %728 = getelementptr inbounds i32, ptr addrspace(1) %59, i64 %727
  store i32 %726, ptr addrspace(1) %728, align 4, !tbaa !5
  %729 = add nsw i32 %683, 1
  br label %717

730:                                              ; preds = %717, %687
  %731 = phi i32 [ %719, %717 ], [ %680, %687 ]
  %732 = phi i32 [ 1, %717 ], [ 0, %687 ]
  %733 = phi i32 [ %720, %717 ], [ %682, %687 ]
  %734 = phi i32 [ %718, %717 ], [ %683, %687 ]
  br i1 %689, label %679, label %735

735:                                              ; preds = %730, %679
  %736 = phi i32 [ %731, %730 ], [ %680, %679 ]
  %737 = phi i32 [ %732, %730 ], [ %681, %679 ]
  %738 = phi i32 [ %733, %730 ], [ %682, %679 ]
  %739 = phi i32 [ %734, %730 ], [ %683, %679 ]
  %740 = icmp eq i32 %737, 0
  br i1 %740, label %741, label %742

741:                                              ; preds = %735
  store i32 -1, ptr addrspace(1) %68, align 4, !tbaa !5
  br label %742

742:                                              ; preds = %735, %741
  br label %743

743:                                              ; preds = %742, %743
  %744 = phi i32 [ %748, %743 ], [ %737, %742 ]
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds i32, ptr addrspace(1) %53, i64 %745
  store i32 %736, ptr addrspace(1) %746, align 4, !tbaa !5
  %747 = getelementptr inbounds i32, ptr addrspace(1) %56, i64 %745
  store i32 %738, ptr addrspace(1) %747, align 4, !tbaa !5
  %748 = add nsw i32 %744, 1
  %749 = icmp slt i32 %744, 1
  br i1 %749, label %743, label %750, !llvm.loop !87

750:                                              ; preds = %743
  store i32 %739, ptr addrspace(1) %74, align 4, !tbaa !5
  store i32 %452, ptr addrspace(1) %77, align 4, !tbaa !5
  %751 = icmp eq i32 %736, 0
  %752 = tail call i64 @llvm.amdgcn.s.memrealtime()
  br i1 %751, label %753, label %773

753:                                              ; preds = %750
  br i1 %268, label %754, label %1065

754:                                              ; preds = %753, %770
  %755 = phi i32 [ %771, %770 ], [ 0, %753 ]
  %756 = zext nneg i32 %755 to i64
  %757 = getelementptr inbounds nuw i64, ptr %22, i64 %756
  %758 = tail call noundef i64 asm sideeffect "flat_atomic_add_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %757, i64 1) #14, !srcloc !57
  %759 = getelementptr inbounds nuw ptr, ptr addrspace(1) %34, i64 %756
  %760 = load ptr, ptr addrspace(1) %759, align 8, !tbaa !27
  %761 = urem i64 %758, %14
  %762 = getelementptr inbounds nuw i64, ptr %760, i64 %761
  tail call void asm sideeffect "global_store_dwordx2 $0, $1, off nt\0As_waitcnt vmcnt(0)", "v,v,~{memory}"(ptr %762, i64 0) #14, !srcloc !60
  fence syncscope("agent") release
  %763 = getelementptr inbounds nuw i64, ptr %19, i64 %756
  %764 = add i64 %758, 1
  %765 = insertelement <2 x i64> poison, i64 %764, i64 0
  %766 = insertelement <2 x i64> %765, i64 %758, i64 1
  br label %767

767:                                              ; preds = %767, %754
  %768 = tail call noundef i64 asm sideeffect "flat_atomic_cmpswap_x2 $0, $1, $2 sc0 sc1\0As_waitcnt vmcnt(0) lgkmcnt(0)", "=v,v,v,~{memory}"(ptr %763, <2 x i64> %766) #14, !srcloc !61
  %769 = icmp eq i64 %768, %758
  br i1 %769, label %770, label %767, !llvm.loop !88

770:                                              ; preds = %767
  %771 = add nuw nsw i32 %755, 1
  %772 = icmp eq i32 %771, %94
  br i1 %772, label %1065, label %754, !llvm.loop !89

773:                                              ; preds = %750
  %774 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %279
  %775 = load i32, ptr addrspace(5) %774, align 4, !tbaa !5
  %776 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %279
  %777 = load i64, ptr addrspace(5) %776, align 8, !tbaa !40
  %778 = add i64 %777, 1
  store i64 %778, ptr addrspace(5) %776, align 8, !tbaa !40
  %779 = sext i32 %775 to i64
  %780 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %779
  %781 = load ptr, ptr addrspace(1) %780, align 8, !tbaa !27
  %782 = urem i64 %777, %12
  %783 = getelementptr inbounds nuw i64, ptr %781, i64 %782
  %784 = shl i64 %282, 32
  %785 = add i64 %784, 4294967297
  store volatile i64 %785, ptr %783, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %786 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %779
  %787 = atomicrmw add ptr addrspace(1) %786, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %788 = add nsw i32 %279, 1
  %789 = srem i32 %788, %252
  br label %1065

790:                                              ; preds = %352
  %791 = add i64 %282, 1
  %792 = sub i64 %332, %330
  %793 = trunc i64 %792 to i32
  %794 = icmp sgt i32 %793, 0
  %795 = icmp eq i32 %84, %793
  %796 = select i1 %794, i1 %795, i1 false
  br i1 %796, label %797, label %840

797:                                              ; preds = %790
  %798 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %330
  %799 = load i32, ptr addrspace(1) %798, align 16, !tbaa !50
  %800 = and i32 %799, -4
  %801 = icmp eq i32 %800, 136
  br i1 %801, label %803, label %802

802:                                              ; preds = %797
  switch i32 %799, label %840 [
    i32 183, label %803
    i32 175, label %803
    i32 174, label %803
    i32 148, label %803
    i32 147, label %803
    i32 146, label %803
    i32 145, label %803
    i32 144, label %803
    i32 143, label %803
    i32 142, label %803
    i32 184, label %803
  ]

803:                                              ; preds = %802, %802, %802, %802, %802, %802, %802, %802, %802, %802, %802, %797
  %804 = add i64 %330, %99
  %805 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %804
  %806 = getelementptr inbounds nuw i8, ptr addrspace(1) %805, i64 106
  %807 = load i16, ptr addrspace(1) %806, align 2, !tbaa !53
  %808 = zext i16 %807 to i32
  %809 = tail call i32 @llvm.smin.i32(i32 %252, i32 %808)
  %810 = icmp eq i64 %282, 0
  %811 = select i1 %810, i1 %262, i1 false
  br i1 %811, label %812, label %819

812:                                              ; preds = %803
  %813 = getelementptr inbounds nuw i8, ptr addrspace(1) %805, i64 8
  %814 = load i64, ptr addrspace(1) %813, align 8, !tbaa !56
  %815 = trunc i64 %814 to i32
  %816 = add nsw i32 %251, %815
  %817 = sext i32 %816 to i64
  %818 = getelementptr inbounds i32, ptr addrspace(1) %93, i64 %817
  store i32 %808, ptr addrspace(1) %818, align 4, !tbaa !5
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %819

819:                                              ; preds = %812, %803
  %820 = icmp sgt i32 %809, 0
  br i1 %820, label %821, label %1065

821:                                              ; preds = %819
  %822 = shl i64 %791, 32
  %823 = or i64 %804, %822
  br label %824

824:                                              ; preds = %821, %824
  %825 = phi i32 [ 0, %821 ], [ %838, %824 ]
  %826 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %825
  %827 = load i32, ptr addrspace(5) %826, align 4, !tbaa !5
  %828 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %825
  %829 = load i64, ptr addrspace(5) %828, align 8, !tbaa !40
  %830 = add i64 %829, 1
  store i64 %830, ptr addrspace(5) %828, align 8, !tbaa !40
  %831 = sext i32 %827 to i64
  %832 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %831
  %833 = load ptr, ptr addrspace(1) %832, align 8, !tbaa !27
  %834 = urem i64 %829, %12
  %835 = getelementptr inbounds nuw i64, ptr %833, i64 %834
  store volatile i64 %823, ptr %835, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %836 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %831
  %837 = atomicrmw add ptr addrspace(1) %836, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %838 = add nuw nsw i32 %825, 1
  %839 = icmp eq i32 %838, %809
  br i1 %839, label %1065, label %824, !llvm.loop !90

840:                                              ; preds = %802, %790
  %841 = icmp eq i64 %282, 0
  %842 = select i1 %841, i1 %262, i1 false
  %843 = add i64 %264, %792
  %844 = udiv i64 %843, %263
  br i1 %842, label %845, label %886

845:                                              ; preds = %840
  %846 = icmp ult i64 %843, %263
  br i1 %846, label %852, label %847

847:                                              ; preds = %845, %853
  %848 = phi i64 [ %854, %853 ], [ 0, %845 ]
  br i1 %254, label %849, label %853

849:                                              ; preds = %847
  %850 = mul i64 %848, %263
  %851 = add i64 %850, %330
  br label %856

852:                                              ; preds = %853, %845
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %886

853:                                              ; preds = %883, %847
  %854 = add nuw i64 %848, 1
  %855 = icmp ult i64 %854, %844
  br i1 %855, label %847, label %852, !llvm.loop !91

856:                                              ; preds = %849, %883
  %857 = phi i32 [ 0, %849 ], [ %884, %883 ]
  %858 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %857
  %859 = load i32, ptr addrspace(5) %858, align 4, !tbaa !5
  %860 = sext i32 %859 to i64
  %861 = add i64 %851, %860
  %862 = icmp ult i64 %861, %332
  br i1 %862, label %863, label %883

863:                                              ; preds = %856
  %864 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %861
  %865 = getelementptr inbounds nuw i8, ptr addrspace(1) %864, i64 8
  %866 = load i64, ptr addrspace(1) %865, align 8, !tbaa !56
  %867 = trunc i64 %866 to i32
  %868 = load i32, ptr addrspace(1) %864, align 16, !tbaa !50
  %869 = and i32 %868, -4
  %870 = icmp eq i32 %869, 136
  br i1 %870, label %872, label %871

871:                                              ; preds = %863
  switch i32 %868, label %876 [
    i32 183, label %872
    i32 175, label %872
    i32 174, label %872
    i32 148, label %872
    i32 147, label %872
    i32 146, label %872
    i32 145, label %872
    i32 144, label %872
    i32 143, label %872
    i32 142, label %872
    i32 184, label %872
  ]

872:                                              ; preds = %871, %871, %871, %871, %871, %871, %871, %871, %871, %871, %871, %863
  %873 = getelementptr inbounds nuw i8, ptr addrspace(1) %864, i64 106
  %874 = load i16, ptr addrspace(1) %873, align 2, !tbaa !53
  %875 = zext i16 %874 to i32
  br label %876

876:                                              ; preds = %871, %872
  %877 = phi i32 [ %875, %872 ], [ 1, %871 ]
  %878 = add nsw i32 %251, %867
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds i32, ptr addrspace(1) %93, i64 %879
  %881 = load i32, ptr addrspace(1) %880, align 4, !tbaa !5
  %882 = add nsw i32 %881, %877
  store i32 %882, ptr addrspace(1) %880, align 4, !tbaa !5
  br label %883

883:                                              ; preds = %876, %856
  %884 = add nuw nsw i32 %857, 1
  %885 = icmp eq i32 %884, %252
  br i1 %885, label %853, label %856, !llvm.loop !92

886:                                              ; preds = %840, %852
  %887 = icmp ult i64 %843, %263
  br i1 %887, label %1065, label %888

888:                                              ; preds = %886
  %889 = shl i64 %791, 32
  br label %890

890:                                              ; preds = %888, %896
  %891 = phi i32 [ %279, %888 ], [ %897, %896 ]
  %892 = phi i64 [ 0, %888 ], [ %898, %896 ]
  br i1 %254, label %893, label %896

893:                                              ; preds = %890
  %894 = mul i64 %892, %263
  %895 = add i64 %894, %330
  br label %900

896:                                              ; preds = %954, %890
  %897 = phi i32 [ %891, %890 ], [ %955, %954 ]
  %898 = add nuw i64 %892, 1
  %899 = icmp ult i64 %898, %844
  br i1 %899, label %890, label %1065, !llvm.loop !93

900:                                              ; preds = %893, %954
  %901 = phi i32 [ %891, %893 ], [ %955, %954 ]
  %902 = phi i32 [ 0, %893 ], [ %956, %954 ]
  %903 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %902
  %904 = load i32, ptr addrspace(5) %903, align 4, !tbaa !5
  %905 = sext i32 %904 to i64
  %906 = add i64 %895, %905
  %907 = icmp ult i64 %906, %332
  br i1 %907, label %908, label %954

908:                                              ; preds = %900
  %909 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %906
  %910 = load i32, ptr addrspace(1) %909, align 16, !tbaa !50
  %911 = and i32 %910, -4
  %912 = icmp eq i32 %911, 136
  br i1 %912, label %930, label %913

913:                                              ; preds = %908
  switch i32 %910, label %914 [
    i32 183, label %930
    i32 175, label %930
    i32 174, label %930
    i32 148, label %930
    i32 147, label %930
    i32 146, label %930
    i32 145, label %930
    i32 144, label %930
    i32 143, label %930
    i32 142, label %930
    i32 184, label %930
  ]

914:                                              ; preds = %913
  %915 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %901
  %916 = load i32, ptr addrspace(5) %915, align 4, !tbaa !5
  %917 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %901
  %918 = load i64, ptr addrspace(5) %917, align 8, !tbaa !40
  %919 = add i64 %918, 1
  store i64 %919, ptr addrspace(5) %917, align 8, !tbaa !40
  %920 = sext i32 %916 to i64
  %921 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %920
  %922 = load ptr, ptr addrspace(1) %921, align 8, !tbaa !27
  %923 = urem i64 %918, %12
  %924 = getelementptr inbounds nuw i64, ptr %922, i64 %923
  %925 = or i64 %906, %889
  store volatile i64 %925, ptr %924, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %926 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %920
  %927 = atomicrmw add ptr addrspace(1) %926, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %928 = add nsw i32 %901, 1
  %929 = srem i32 %928, %252
  br label %954

930:                                              ; preds = %913, %913, %913, %913, %913, %913, %913, %913, %913, %913, %913, %908
  %931 = getelementptr inbounds nuw i8, ptr addrspace(1) %909, i64 106
  %932 = load i16, ptr addrspace(1) %931, align 2, !tbaa !53
  %933 = zext i16 %932 to i32
  %934 = tail call i32 @llvm.smin.i32(i32 %252, i32 %933)
  %935 = icmp eq i16 %932, 0
  br i1 %935, label %954, label %936

936:                                              ; preds = %930
  %937 = or i64 %906, %889
  br label %938

938:                                              ; preds = %936, %938
  %939 = phi i32 [ 0, %936 ], [ %952, %938 ]
  %940 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %939
  %941 = load i32, ptr addrspace(5) %940, align 4, !tbaa !5
  %942 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %939
  %943 = load i64, ptr addrspace(5) %942, align 8, !tbaa !40
  %944 = add i64 %943, 1
  store i64 %944, ptr addrspace(5) %942, align 8, !tbaa !40
  %945 = sext i32 %941 to i64
  %946 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %945
  %947 = load ptr, ptr addrspace(1) %946, align 8, !tbaa !27
  %948 = urem i64 %943, %12
  %949 = getelementptr inbounds nuw i64, ptr %947, i64 %948
  store volatile i64 %937, ptr %949, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %950 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %945
  %951 = atomicrmw add ptr addrspace(1) %950, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %952 = add nuw nsw i32 %939, 1
  %953 = icmp eq i32 %952, %934
  br i1 %953, label %954, label %938, !llvm.loop !94

954:                                              ; preds = %938, %930, %914, %900
  %955 = phi i32 [ %901, %900 ], [ %929, %914 ], [ %901, %930 ], [ %901, %938 ]
  %956 = add nuw nsw i32 %902, 1
  %957 = icmp eq i32 %956, %252
  br i1 %957, label %896, label %900, !llvm.loop !95

958:                                              ; preds = %352
  %959 = sub i64 %332, %330
  %960 = freeze i64 %959
  %961 = freeze i64 %261
  %962 = udiv i64 %960, %961
  %963 = mul i64 %962, %961
  %964 = sub i64 %960, %963
  %965 = icmp ugt i64 %964, %99
  br i1 %965, label %966, label %970

966:                                              ; preds = %958
  %967 = add i64 %962, 1
  %968 = mul i64 %967, %99
  %969 = add i64 %967, %968
  br label %974

970:                                              ; preds = %958
  %971 = mul i64 %962, %99
  %972 = add i64 %971, %964
  %973 = add i64 %972, %962
  br label %974

974:                                              ; preds = %966, %970
  %975 = phi i64 [ %968, %966 ], [ %972, %970 ]
  %976 = phi i64 [ %969, %966 ], [ %973, %970 ]
  %977 = add i64 %975, %330
  %978 = add i64 %976, %330
  br label %979

979:                                              ; preds = %352, %974
  %980 = phi i64 [ %977, %974 ], [ %330, %352 ]
  %981 = phi i64 [ %978, %974 ], [ %332, %352 ]
  %982 = icmp ult i64 %980, %981
  br i1 %982, label %983, label %1024

983:                                              ; preds = %979
  %984 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %980
  %985 = load i32, ptr addrspace(1) %984, align 16, !tbaa !50
  %986 = and i32 %985, -4
  %987 = icmp eq i32 %986, 136
  br i1 %987, label %989, label %988

988:                                              ; preds = %983
  switch i32 %985, label %1024 [
    i32 183, label %989
    i32 175, label %989
    i32 174, label %989
    i32 148, label %989
    i32 147, label %989
    i32 146, label %989
    i32 145, label %989
    i32 144, label %989
    i32 143, label %989
    i32 142, label %989
    i32 184, label %989
  ]

989:                                              ; preds = %988, %988, %988, %988, %988, %988, %988, %988, %988, %988, %988, %983
  %990 = getelementptr inbounds nuw i8, ptr addrspace(1) %984, i64 106
  %991 = load i16, ptr addrspace(1) %990, align 2, !tbaa !53
  %992 = zext i16 %991 to i32
  %993 = tail call i32 @llvm.smin.i32(i32 %252, i32 %992)
  %994 = icmp eq i64 %282, 1
  %995 = select i1 %994, i1 %262, i1 false
  br i1 %995, label %996, label %1003

996:                                              ; preds = %989
  %997 = getelementptr inbounds nuw i8, ptr addrspace(1) %984, i64 8
  %998 = load i64, ptr addrspace(1) %997, align 8, !tbaa !56
  %999 = trunc i64 %998 to i32
  %1000 = add nsw i32 %251, %999
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds i32, ptr addrspace(1) %93, i64 %1001
  store i32 %992, ptr addrspace(1) %1002, align 4, !tbaa !5
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1003

1003:                                             ; preds = %996, %989
  %1004 = icmp sgt i32 %993, 0
  br i1 %1004, label %1005, label %1065

1005:                                             ; preds = %1003
  %1006 = shl i64 %282, 32
  %1007 = or i64 %980, %1006
  br label %1008

1008:                                             ; preds = %1005, %1008
  %1009 = phi i32 [ 0, %1005 ], [ %1022, %1008 ]
  %1010 = getelementptr inbounds nuw i32, ptr addrspace(5) %2, i32 %1009
  %1011 = load i32, ptr addrspace(5) %1010, align 4, !tbaa !5
  %1012 = getelementptr inbounds nuw i64, ptr addrspace(5) %3, i32 %1009
  %1013 = load i64, ptr addrspace(5) %1012, align 8, !tbaa !40
  %1014 = add i64 %1013, 1
  store i64 %1014, ptr addrspace(5) %1012, align 8, !tbaa !40
  %1015 = sext i32 %1011 to i64
  %1016 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %1015
  %1017 = load ptr, ptr addrspace(1) %1016, align 8, !tbaa !27
  %1018 = urem i64 %1013, %12
  %1019 = getelementptr inbounds nuw i64, ptr %1017, i64 %1018
  store volatile i64 %1007, ptr %1019, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1020 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %1015
  %1021 = atomicrmw add ptr addrspace(1) %1020, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1022 = add nuw nsw i32 %1009, 1
  %1023 = icmp eq i32 %1022, %993
  br i1 %1023, label %1065, label %1008, !llvm.loop !96

1024:                                             ; preds = %988, %979
  %1025 = icmp eq i64 %282, 1
  %1026 = select i1 %1025, i1 %262, i1 false
  br i1 %1026, label %1027, label %1042

1027:                                             ; preds = %1024
  br i1 %982, label %1029, label %1028

1028:                                             ; preds = %1029, %1027
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  br label %1042

1029:                                             ; preds = %1027, %1029
  %1030 = phi i64 [ %1040, %1029 ], [ %980, %1027 ]
  %1031 = getelementptr inbounds %"struct.mirage::runtime::TaskDesc", ptr addrspace(1) %25, i64 %1030
  %1032 = getelementptr inbounds nuw i8, ptr addrspace(1) %1031, i64 8
  %1033 = load i64, ptr addrspace(1) %1032, align 8, !tbaa !56
  %1034 = trunc i64 %1033 to i32
  %1035 = add nsw i32 %251, %1034
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds i32, ptr addrspace(1) %93, i64 %1036
  %1038 = load i32, ptr addrspace(1) %1037, align 4, !tbaa !5
  %1039 = add nsw i32 %1038, 1
  store i32 %1039, ptr addrspace(1) %1037, align 4, !tbaa !5
  %1040 = add nuw i64 %1030, 1
  %1041 = icmp ult i64 %1040, %981
  br i1 %1041, label %1029, label %1028, !llvm.loop !97

1042:                                             ; preds = %1028, %1024
  br i1 %982, label %1043, label %1065

1043:                                             ; preds = %1042
  %1044 = shl i64 %282, 32
  br label %1045

1045:                                             ; preds = %1043, %1045
  %1046 = phi i64 [ %980, %1043 ], [ %1063, %1045 ]
  %1047 = phi i32 [ %279, %1043 ], [ %1062, %1045 ]
  %1048 = getelementptr inbounds i32, ptr addrspace(5) %2, i32 %1047
  %1049 = load i32, ptr addrspace(5) %1048, align 4, !tbaa !5
  %1050 = getelementptr inbounds i64, ptr addrspace(5) %3, i32 %1047
  %1051 = load i64, ptr addrspace(5) %1050, align 8, !tbaa !40
  %1052 = add i64 %1051, 1
  store i64 %1052, ptr addrspace(5) %1050, align 8, !tbaa !40
  %1053 = sext i32 %1049 to i64
  %1054 = getelementptr inbounds ptr, ptr addrspace(1) %31, i64 %1053
  %1055 = load ptr, ptr addrspace(1) %1054, align 8, !tbaa !27
  %1056 = urem i64 %1051, %12
  %1057 = getelementptr inbounds nuw i64, ptr %1055, i64 %1056
  %1058 = or i64 %1046, %1044
  store volatile i64 %1058, ptr %1057, align 8, !tbaa !17
  tail call void asm sideeffect "", "~{memory}"() #14, !srcloc !43
  %1059 = getelementptr inbounds i64, ptr addrspace(1) %17, i64 %1053
  %1060 = atomicrmw add ptr addrspace(1) %1059, i64 1 syncscope("agent") monotonic, align 8, !amdgpu.no.fine.grained.memory !9, !amdgpu.no.remote.memory !9
  %1061 = add nsw i32 %1047, 1
  %1062 = srem i32 %1061, %252
  %1063 = add nuw i64 %1046, 1
  %1064 = icmp ult i64 %1063, %981
  br i1 %1064, label %1045, label %1065, !llvm.loop !98

1065:                                             ; preds = %896, %824, %770, %1045, %1008, %886, %819, %753, %1042, %1003, %773
  %1066 = phi i32 [ %279, %1003 ], [ %279, %753 ], [ %789, %773 ], [ %279, %824 ], [ %279, %819 ], [ %279, %770 ], [ %279, %1042 ], [ %279, %1008 ], [ %1062, %1045 ], [ %279, %886 ], [ %897, %896 ]
  %1067 = phi i32 [ %280, %1003 ], [ %377, %753 ], [ %377, %773 ], [ %280, %824 ], [ %280, %819 ], [ %377, %770 ], [ %280, %1042 ], [ %280, %1008 ], [ %280, %1045 ], [ %280, %886 ], [ %280, %896 ]
  %1068 = phi i64 [ %281, %1003 ], [ %356, %753 ], [ %356, %773 ], [ %281, %824 ], [ %281, %819 ], [ %356, %770 ], [ %281, %1042 ], [ %281, %1008 ], [ %281, %1045 ], [ %281, %886 ], [ %281, %896 ]
  %1069 = phi i64 [ %282, %1003 ], [ %282, %753 ], [ %282, %773 ], [ %791, %824 ], [ %791, %819 ], [ %282, %770 ], [ %282, %1042 ], [ %282, %1008 ], [ %282, %1045 ], [ %791, %886 ], [ %791, %896 ]
  %1070 = add i64 %313, 1
  %1071 = insertelement <2 x i64> %277, i64 %1070, i32 %312
  br label %1072

1072:                                             ; preds = %336, %335, %1065, %334
  %1073 = phi <2 x i64> [ %1071, %1065 ], [ %277, %334 ], [ %277, %335 ], [ %277, %336 ]
  %1074 = phi i32 [ %1066, %1065 ], [ %279, %334 ], [ %279, %335 ], [ %279, %336 ]
  %1075 = phi i32 [ %1067, %1065 ], [ %280, %334 ], [ %280, %335 ], [ %280, %336 ]
  %1076 = phi i64 [ %1068, %1065 ], [ %281, %334 ], [ %281, %335 ], [ %281, %336 ]
  %1077 = phi i64 [ %1069, %1065 ], [ %282, %334 ], [ %282, %335 ], [ %282, %336 ]
  br i1 %333, label %1078, label %275, !llvm.loop !99

1078:                                             ; preds = %1072
  call void @llvm.lifetime.end.p5(ptr addrspace(5) %3) #15
  call void @llvm.lifetime.end.p5(ptr addrspace(5) %2) #15
  br label %1079

1079:                                             ; preds = %1, %1078
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #6

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #9

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #10

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #10

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p3.p1.i64(ptr addrspace(3) noalias writeonly captures(none), ptr addrspace(1) noalias readonly captures(none), i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v2i32(<2 x i32>) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(write, inaccessiblemem: none, target_mem0: none, target_mem1: none) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #3 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #4 = { "uniform-work-group-size"="false" }
attributes #5 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx950" "target-features"="+16-bit-insts,+ashr-pk-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-buffer-pk-add-bf16-inst,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-fmin-fmax-global-f64,+atomic-global-pk-add-bf16-inst,+bf8-cvt-scale-insts,+bitop3-insts,+ci-insts,+cube-insts,+cvt-pknorm-vop2-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot12-insts,+dot13-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+f16bf16-to-fp6bf6-cvt-scale-insts,+f32-to-f16bf16-cvt-sr-insts,+fp4-cvt-scale-insts,+fp6bf6-cvt-scale-insts,+fp8-conversion-insts,+fp8-cvt-scale-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+gfx950-insts,+lerp-inst,+mai-insts,+permlane16-swap,+permlane32-swap,+prng-inst,+qsad-insts,+s-memrealtime,+s-memtime-inst,+sad-insts,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #6 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn }
attributes #10 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #14 = { convergent nounwind }
attributes #15 = { nounwind }

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
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !14, !12}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
!15 = !{i16 1, i16 1025}
!16 = !{i32 1, i32 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"long long", !7, i64 0}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !11}
!24 = distinct !{!24, !11}
!25 = distinct !{!25, !11}
!26 = distinct !{!26, !11}
!27 = !{!28, !28, i64 0}
!28 = !{!"p1 long long", !29, i64 0}
!29 = !{!"any pointer", !7, i64 0}
!30 = !{i64 79474}
!31 = !{!32, !32, i64 0}
!32 = !{!"p1 int", !29, i64 0}
!33 = !{!34, !34, i64 0}
!34 = !{!"p1 _ZTSN6mirage7runtime8TaskDescE", !29, i64 0}
!35 = !{!36, !36, i64 0}
!36 = !{!"p1 _ZTSN6mirage7runtime9EventDescE", !29, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"p2 long long", !39, i64 0}
!39 = !{!"any p2 pointer", !29, i64 0}
!40 = !{!41, !41, i64 0}
!41 = !{!"long", !7, i64 0}
!42 = distinct !{!42, !11}
!43 = !{i64 57084}
!44 = !{i64 0, i64 8, !40, i64 8, i64 8, !40, i64 16, i64 8, !40, i64 24, i64 8, !40}
!45 = distinct !{!45, !11}
!46 = !{!47, !18, i64 16}
!47 = !{!"_ZTSN6mirage7runtime8TaskDescE", !48, i64 0, !6, i64 4, !18, i64 8, !18, i64 16, !7, i64 24, !7, i64 80, !7, i64 104}
!48 = !{!"_ZTSN6mirage7runtime8TaskTypeE", !7, i64 0}
!49 = distinct !{!49, !11}
!50 = !{!47, !48, i64 0}
!51 = distinct !{!51, !11, !12}
!52 = distinct !{!52, !11, !14, !12}
!53 = !{!7, !7, i64 0}
!54 = distinct !{!54, !11, !12}
!55 = distinct !{!55, !11, !14, !12}
!56 = !{!47, !18, i64 8}
!57 = !{i64 51229, i64 51278}
!58 = !{!59, !59, i64 0}
!59 = !{!"_ZTSN6mirage7runtime9EventTypeE", !7, i64 0}
!60 = !{i64 47955, i64 48002}
!61 = !{i64 52514, i64 52567}
!62 = distinct !{!62, !11}
!63 = distinct !{!63, !11}
!64 = distinct !{!64, !11}
!65 = distinct !{!65, !11, !12}
!66 = distinct !{!66, !11}
!67 = distinct !{!67, !11}
!68 = distinct !{!68, !11, !14, !12}
!69 = distinct !{!69, !11, !12}
!70 = distinct !{!70, !11, !14, !12}
!71 = distinct !{!71, !11}
!72 = !{i64 47412, i64 47458}
!73 = distinct !{!73, !11}
!74 = distinct !{!74, !11}
!75 = distinct !{!75, !11}
!76 = distinct !{!76, !11}
!77 = distinct !{!77, !11, !12}
!78 = distinct !{!78, !79}
!79 = !{!"llvm.loop.unroll.disable"}
!80 = distinct !{!80, !11, !14, !12}
!81 = distinct !{!81, !11, !12}
!82 = distinct !{!82, !79}
!83 = distinct !{!83, !11}
!84 = distinct !{!84, !11, !14, !12}
!85 = distinct !{!85, !11}
!86 = distinct !{!86, !11}
!87 = distinct !{!87, !11}
!88 = distinct !{!88, !11}
!89 = distinct !{!89, !11}
!90 = distinct !{!90, !11}
!91 = distinct !{!91, !11}
!92 = distinct !{!92, !11}
!93 = distinct !{!93, !11}
!94 = distinct !{!94, !11}
!95 = distinct !{!95, !11}
!96 = distinct !{!96, !11}
!97 = distinct !{!97, !11}
!98 = distinct !{!98, !11}
!99 = distinct !{!99, !11}
!100 = distinct !{!100, !11, !12}
!101 = distinct !{!101, !11, !14, !12}
!102 = distinct !{!102, !11, !12}
!103 = distinct !{!103, !11, !14, !12}
!104 = distinct !{!104, !11, !12}
!105 = distinct !{!105, !11, !14, !12}
!106 = distinct !{!106, !11, !12}
!107 = distinct !{!107, !11, !14, !12}
!108 = distinct !{!108, !11, !12}
!109 = distinct !{!109, !79}
!110 = distinct !{!110, !11, !14, !12}
!111 = distinct !{!111, !11, !12}
!112 = distinct !{!112, !79}
!113 = distinct !{!113, !11, !14, !12}
