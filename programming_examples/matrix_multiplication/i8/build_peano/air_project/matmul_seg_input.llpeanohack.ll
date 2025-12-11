; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@buf0 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf1 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf2 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf3 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf4 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf5 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf6 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf7 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf8 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf9 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf10 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf11 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf12 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf13 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf14 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf15 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf16 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf17 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf18 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf19 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf20 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf21 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf22 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf23 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf24 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf25 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf26 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf27 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf28 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf29 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf30 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf31 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf32 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf33 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf34 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf35 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf36 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf37 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf38 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf39 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf40 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf41 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf42 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf43 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf44 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf45 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf46 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf47 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf48 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf49 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf50 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf51 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf52 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf53 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf54 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf55 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf56 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf57 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf58 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf59 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf60 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf61 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf62 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf63 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf64 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf65 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf66 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf67 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf68 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf69 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf70 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf71 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf72 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf73 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf74 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf75 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf76 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf77 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf78 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf79 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf80 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf81 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf82 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf83 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf84 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf85 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf86 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf87 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf88 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf89 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf90 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf91 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf92 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf93 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf94 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf95 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf96 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf97 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf98 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf99 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf100 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf101 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf102 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf103 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf104 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf105 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf106 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf107 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf108 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf109 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf110 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf111 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf112 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf113 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf114 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf115 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf116 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf117 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf118 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf119 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf120 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf121 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf122 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf123 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf124 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf125 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf126 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf127 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf128 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf129 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf130 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf131 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf132 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf133 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf134 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf135 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf136 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf137 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf138 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf139 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf140 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf141 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf142 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf143 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf144 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf145 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf146 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf147 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf148 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf149 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf150 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf151 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf152 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf153 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf154 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf155 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf156 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf157 = external global [1 x [1 x [8 x [4 x [8 x [8 x i8]]]]]]
@buf158 = external global [1 x [1 x [4 x [16 x [8 x [8 x i8]]]]]]
@buf159 = external global [1 x [1 x [8 x [16 x [8 x [8 x i16]]]]]]
@buf160 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf161 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf162 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf163 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf164 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf165 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf166 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf167 = external global [1 x [1 x [64 x [64 x i8]]]]
@buf168 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf169 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf170 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf171 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf172 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf173 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf174 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf175 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf176 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf177 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf178 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf179 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf180 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf181 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf182 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf183 = external global [1 x [1 x [128 x [64 x i8]]]]
@buf184 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf185 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf186 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf187 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf188 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf189 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf190 = external global [1 x [4 x [128 x [64 x i16]]]]
@buf191 = external global [1 x [4 x [128 x [64 x i16]]]]

declare void @debug_i32(i32)

; Unknown intrinsic
declare void @llvm.aie2p.event(i32)

; Unknown intrinsic
declare void @llvm.aie2p.put.ms(i32, i32)

; Unknown intrinsic
declare { i32, i32 } @llvm.aie2p.get.ss()

; Unknown intrinsic
declare void @llvm.aie2p.mcd.write.vec(<16 x i32>, i32)

; Unknown intrinsic
declare <16 x i32> @llvm.aie2p.scd.read.vec(i32)

; Unknown intrinsic
declare void @llvm.aie2p.acquire(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.release(i32, i32)

define void @core_0_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf4, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf4, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf4, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf4, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf4, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf1, i32 %26
  %81 = getelementptr i8, ptr @buf0, i32 %54
  %82 = getelementptr i8, ptr @buf0, i32 %55
  %83 = getelementptr i8, ptr @buf1, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf4, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf4, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf4, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf4, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf3, i32 %154
  %209 = getelementptr i8, ptr @buf2, i32 %182
  %210 = getelementptr i8, ptr @buf2, i32 %183
  %211 = getelementptr i8, ptr @buf3, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_1_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf9, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf9, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf9, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf9, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf9, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf6, i32 %26
  %81 = getelementptr i8, ptr @buf5, i32 %54
  %82 = getelementptr i8, ptr @buf5, i32 %55
  %83 = getelementptr i8, ptr @buf6, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf9, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf9, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf9, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf9, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf8, i32 %154
  %209 = getelementptr i8, ptr @buf7, i32 %182
  %210 = getelementptr i8, ptr @buf7, i32 %183
  %211 = getelementptr i8, ptr @buf8, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_2_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf14, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf14, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf14, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf14, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf14, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf11, i32 %26
  %81 = getelementptr i8, ptr @buf10, i32 %54
  %82 = getelementptr i8, ptr @buf10, i32 %55
  %83 = getelementptr i8, ptr @buf11, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf14, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf14, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf14, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf14, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf13, i32 %154
  %209 = getelementptr i8, ptr @buf12, i32 %182
  %210 = getelementptr i8, ptr @buf12, i32 %183
  %211 = getelementptr i8, ptr @buf13, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_3_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf19, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf19, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf19, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf19, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf19, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf16, i32 %26
  %81 = getelementptr i8, ptr @buf15, i32 %54
  %82 = getelementptr i8, ptr @buf15, i32 %55
  %83 = getelementptr i8, ptr @buf16, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf19, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf19, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf19, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf19, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf18, i32 %154
  %209 = getelementptr i8, ptr @buf17, i32 %182
  %210 = getelementptr i8, ptr @buf17, i32 %183
  %211 = getelementptr i8, ptr @buf18, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_4_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf24, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf24, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf24, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf24, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf24, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf21, i32 %26
  %81 = getelementptr i8, ptr @buf20, i32 %54
  %82 = getelementptr i8, ptr @buf20, i32 %55
  %83 = getelementptr i8, ptr @buf21, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf24, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf24, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf24, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf24, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf23, i32 %154
  %209 = getelementptr i8, ptr @buf22, i32 %182
  %210 = getelementptr i8, ptr @buf22, i32 %183
  %211 = getelementptr i8, ptr @buf23, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_5_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf29, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf29, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf29, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf29, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf29, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf26, i32 %26
  %81 = getelementptr i8, ptr @buf25, i32 %54
  %82 = getelementptr i8, ptr @buf25, i32 %55
  %83 = getelementptr i8, ptr @buf26, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf29, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf29, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf29, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf29, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf28, i32 %154
  %209 = getelementptr i8, ptr @buf27, i32 %182
  %210 = getelementptr i8, ptr @buf27, i32 %183
  %211 = getelementptr i8, ptr @buf28, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_6_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf34, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf34, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf34, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf34, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf34, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf31, i32 %26
  %81 = getelementptr i8, ptr @buf30, i32 %54
  %82 = getelementptr i8, ptr @buf30, i32 %55
  %83 = getelementptr i8, ptr @buf31, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf34, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf34, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf34, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf34, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf33, i32 %154
  %209 = getelementptr i8, ptr @buf32, i32 %182
  %210 = getelementptr i8, ptr @buf32, i32 %183
  %211 = getelementptr i8, ptr @buf33, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_7_2() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf39, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf39, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf39, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf39, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf39, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf36, i32 %26
  %81 = getelementptr i8, ptr @buf35, i32 %54
  %82 = getelementptr i8, ptr @buf35, i32 %55
  %83 = getelementptr i8, ptr @buf36, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf39, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf39, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf39, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf39, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf38, i32 %154
  %209 = getelementptr i8, ptr @buf37, i32 %182
  %210 = getelementptr i8, ptr @buf37, i32 %183
  %211 = getelementptr i8, ptr @buf38, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_0_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf44, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf44, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf44, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf44, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf44, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf41, i32 %26
  %81 = getelementptr i8, ptr @buf40, i32 %54
  %82 = getelementptr i8, ptr @buf40, i32 %55
  %83 = getelementptr i8, ptr @buf41, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf44, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf44, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf44, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf44, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf43, i32 %154
  %209 = getelementptr i8, ptr @buf42, i32 %182
  %210 = getelementptr i8, ptr @buf42, i32 %183
  %211 = getelementptr i8, ptr @buf43, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_1_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf49, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf49, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf49, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf49, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf49, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf46, i32 %26
  %81 = getelementptr i8, ptr @buf45, i32 %54
  %82 = getelementptr i8, ptr @buf45, i32 %55
  %83 = getelementptr i8, ptr @buf46, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf49, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf49, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf49, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf49, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf48, i32 %154
  %209 = getelementptr i8, ptr @buf47, i32 %182
  %210 = getelementptr i8, ptr @buf47, i32 %183
  %211 = getelementptr i8, ptr @buf48, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_2_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf54, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf54, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf54, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf54, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf54, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf51, i32 %26
  %81 = getelementptr i8, ptr @buf50, i32 %54
  %82 = getelementptr i8, ptr @buf50, i32 %55
  %83 = getelementptr i8, ptr @buf51, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf54, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf54, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf54, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf54, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf53, i32 %154
  %209 = getelementptr i8, ptr @buf52, i32 %182
  %210 = getelementptr i8, ptr @buf52, i32 %183
  %211 = getelementptr i8, ptr @buf53, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_3_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf59, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf59, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf59, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf59, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf59, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf56, i32 %26
  %81 = getelementptr i8, ptr @buf55, i32 %54
  %82 = getelementptr i8, ptr @buf55, i32 %55
  %83 = getelementptr i8, ptr @buf56, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf59, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf59, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf59, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf59, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf58, i32 %154
  %209 = getelementptr i8, ptr @buf57, i32 %182
  %210 = getelementptr i8, ptr @buf57, i32 %183
  %211 = getelementptr i8, ptr @buf58, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_4_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf64, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf64, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf64, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf64, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf64, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf61, i32 %26
  %81 = getelementptr i8, ptr @buf60, i32 %54
  %82 = getelementptr i8, ptr @buf60, i32 %55
  %83 = getelementptr i8, ptr @buf61, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf64, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf64, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf64, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf64, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf63, i32 %154
  %209 = getelementptr i8, ptr @buf62, i32 %182
  %210 = getelementptr i8, ptr @buf62, i32 %183
  %211 = getelementptr i8, ptr @buf63, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_5_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf69, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf69, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf69, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf69, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf69, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf66, i32 %26
  %81 = getelementptr i8, ptr @buf65, i32 %54
  %82 = getelementptr i8, ptr @buf65, i32 %55
  %83 = getelementptr i8, ptr @buf66, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf69, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf69, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf69, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf69, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf68, i32 %154
  %209 = getelementptr i8, ptr @buf67, i32 %182
  %210 = getelementptr i8, ptr @buf67, i32 %183
  %211 = getelementptr i8, ptr @buf68, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_6_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf74, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf74, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf74, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf74, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf74, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf71, i32 %26
  %81 = getelementptr i8, ptr @buf70, i32 %54
  %82 = getelementptr i8, ptr @buf70, i32 %55
  %83 = getelementptr i8, ptr @buf71, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf74, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf74, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf74, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf74, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf73, i32 %154
  %209 = getelementptr i8, ptr @buf72, i32 %182
  %210 = getelementptr i8, ptr @buf72, i32 %183
  %211 = getelementptr i8, ptr @buf73, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_7_3() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf79, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf79, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf79, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf79, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf79, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf76, i32 %26
  %81 = getelementptr i8, ptr @buf75, i32 %54
  %82 = getelementptr i8, ptr @buf75, i32 %55
  %83 = getelementptr i8, ptr @buf76, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf79, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf79, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf79, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf79, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf78, i32 %154
  %209 = getelementptr i8, ptr @buf77, i32 %182
  %210 = getelementptr i8, ptr @buf77, i32 %183
  %211 = getelementptr i8, ptr @buf78, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_0_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf84, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf84, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf84, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf84, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf84, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf81, i32 %26
  %81 = getelementptr i8, ptr @buf80, i32 %54
  %82 = getelementptr i8, ptr @buf80, i32 %55
  %83 = getelementptr i8, ptr @buf81, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf84, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf84, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf84, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf84, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf83, i32 %154
  %209 = getelementptr i8, ptr @buf82, i32 %182
  %210 = getelementptr i8, ptr @buf82, i32 %183
  %211 = getelementptr i8, ptr @buf83, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_1_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf89, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf89, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf89, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf89, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf89, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf86, i32 %26
  %81 = getelementptr i8, ptr @buf85, i32 %54
  %82 = getelementptr i8, ptr @buf85, i32 %55
  %83 = getelementptr i8, ptr @buf86, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf89, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf89, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf89, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf89, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf88, i32 %154
  %209 = getelementptr i8, ptr @buf87, i32 %182
  %210 = getelementptr i8, ptr @buf87, i32 %183
  %211 = getelementptr i8, ptr @buf88, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_2_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf94, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf94, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf94, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf94, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf94, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf91, i32 %26
  %81 = getelementptr i8, ptr @buf90, i32 %54
  %82 = getelementptr i8, ptr @buf90, i32 %55
  %83 = getelementptr i8, ptr @buf91, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf94, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf94, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf94, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf94, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf93, i32 %154
  %209 = getelementptr i8, ptr @buf92, i32 %182
  %210 = getelementptr i8, ptr @buf92, i32 %183
  %211 = getelementptr i8, ptr @buf93, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_3_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf99, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf99, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf99, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf99, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf99, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf96, i32 %26
  %81 = getelementptr i8, ptr @buf95, i32 %54
  %82 = getelementptr i8, ptr @buf95, i32 %55
  %83 = getelementptr i8, ptr @buf96, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf99, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf99, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf99, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf99, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf98, i32 %154
  %209 = getelementptr i8, ptr @buf97, i32 %182
  %210 = getelementptr i8, ptr @buf97, i32 %183
  %211 = getelementptr i8, ptr @buf98, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_4_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf104, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf104, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf104, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf104, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf104, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf101, i32 %26
  %81 = getelementptr i8, ptr @buf100, i32 %54
  %82 = getelementptr i8, ptr @buf100, i32 %55
  %83 = getelementptr i8, ptr @buf101, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf104, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf104, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf104, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf104, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf103, i32 %154
  %209 = getelementptr i8, ptr @buf102, i32 %182
  %210 = getelementptr i8, ptr @buf102, i32 %183
  %211 = getelementptr i8, ptr @buf103, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_5_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf109, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf109, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf109, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf109, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf109, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf106, i32 %26
  %81 = getelementptr i8, ptr @buf105, i32 %54
  %82 = getelementptr i8, ptr @buf105, i32 %55
  %83 = getelementptr i8, ptr @buf106, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf109, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf109, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf109, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf109, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf108, i32 %154
  %209 = getelementptr i8, ptr @buf107, i32 %182
  %210 = getelementptr i8, ptr @buf107, i32 %183
  %211 = getelementptr i8, ptr @buf108, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_6_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf114, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf114, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf114, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf114, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf114, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf111, i32 %26
  %81 = getelementptr i8, ptr @buf110, i32 %54
  %82 = getelementptr i8, ptr @buf110, i32 %55
  %83 = getelementptr i8, ptr @buf111, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf114, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf114, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf114, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf114, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf113, i32 %154
  %209 = getelementptr i8, ptr @buf112, i32 %182
  %210 = getelementptr i8, ptr @buf112, i32 %183
  %211 = getelementptr i8, ptr @buf113, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_7_4() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf119, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf119, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf119, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf119, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf119, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf116, i32 %26
  %81 = getelementptr i8, ptr @buf115, i32 %54
  %82 = getelementptr i8, ptr @buf115, i32 %55
  %83 = getelementptr i8, ptr @buf116, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf119, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf119, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf119, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf119, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf118, i32 %154
  %209 = getelementptr i8, ptr @buf117, i32 %182
  %210 = getelementptr i8, ptr @buf117, i32 %183
  %211 = getelementptr i8, ptr @buf118, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_0_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf124, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf124, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf124, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf124, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf124, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf121, i32 %26
  %81 = getelementptr i8, ptr @buf120, i32 %54
  %82 = getelementptr i8, ptr @buf120, i32 %55
  %83 = getelementptr i8, ptr @buf121, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf124, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf124, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf124, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf124, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf123, i32 %154
  %209 = getelementptr i8, ptr @buf122, i32 %182
  %210 = getelementptr i8, ptr @buf122, i32 %183
  %211 = getelementptr i8, ptr @buf123, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_1_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf129, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf129, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf129, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf129, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf129, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf126, i32 %26
  %81 = getelementptr i8, ptr @buf125, i32 %54
  %82 = getelementptr i8, ptr @buf125, i32 %55
  %83 = getelementptr i8, ptr @buf126, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf129, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf129, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf129, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf129, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf128, i32 %154
  %209 = getelementptr i8, ptr @buf127, i32 %182
  %210 = getelementptr i8, ptr @buf127, i32 %183
  %211 = getelementptr i8, ptr @buf128, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_2_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf134, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf134, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf134, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf134, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf134, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf131, i32 %26
  %81 = getelementptr i8, ptr @buf130, i32 %54
  %82 = getelementptr i8, ptr @buf130, i32 %55
  %83 = getelementptr i8, ptr @buf131, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf134, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf134, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf134, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf134, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf133, i32 %154
  %209 = getelementptr i8, ptr @buf132, i32 %182
  %210 = getelementptr i8, ptr @buf132, i32 %183
  %211 = getelementptr i8, ptr @buf133, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_3_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf139, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf139, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf139, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf139, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf139, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf136, i32 %26
  %81 = getelementptr i8, ptr @buf135, i32 %54
  %82 = getelementptr i8, ptr @buf135, i32 %55
  %83 = getelementptr i8, ptr @buf136, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf139, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf139, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf139, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf139, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf138, i32 %154
  %209 = getelementptr i8, ptr @buf137, i32 %182
  %210 = getelementptr i8, ptr @buf137, i32 %183
  %211 = getelementptr i8, ptr @buf138, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_4_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf144, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf144, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf144, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf144, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf144, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf141, i32 %26
  %81 = getelementptr i8, ptr @buf140, i32 %54
  %82 = getelementptr i8, ptr @buf140, i32 %55
  %83 = getelementptr i8, ptr @buf141, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf144, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf144, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf144, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf144, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf143, i32 %154
  %209 = getelementptr i8, ptr @buf142, i32 %182
  %210 = getelementptr i8, ptr @buf142, i32 %183
  %211 = getelementptr i8, ptr @buf143, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_5_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf149, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf149, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf149, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf149, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf149, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf146, i32 %26
  %81 = getelementptr i8, ptr @buf145, i32 %54
  %82 = getelementptr i8, ptr @buf145, i32 %55
  %83 = getelementptr i8, ptr @buf146, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf149, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf149, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf149, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf149, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf148, i32 %154
  %209 = getelementptr i8, ptr @buf147, i32 %182
  %210 = getelementptr i8, ptr @buf147, i32 %183
  %211 = getelementptr i8, ptr @buf148, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_6_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf154, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf154, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf154, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf154, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf154, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf151, i32 %26
  %81 = getelementptr i8, ptr @buf150, i32 %54
  %82 = getelementptr i8, ptr @buf150, i32 %55
  %83 = getelementptr i8, ptr @buf151, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf154, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf154, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf154, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf154, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf153, i32 %154
  %209 = getelementptr i8, ptr @buf152, i32 %182
  %210 = getelementptr i8, ptr @buf152, i32 %183
  %211 = getelementptr i8, ptr @buf153, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

define void @core_7_5() {
  br label %1

1:                                                ; preds = %279, %0
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi i32 [ %16, %15 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = mul i32 %3, 2048
  %7 = getelementptr i8, ptr @buf159, i32 %6
  br label %8

8:                                                ; preds = %12, %5
  %9 = phi i32 [ %14, %12 ], [ 0, %5 ]
  %10 = phi ptr [ %13, %12 ], [ %7, %5 ]
  %11 = icmp slt i32 %9, 16
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  store <64 x i16> zeroinitializer, ptr %10
  %13 = getelementptr i8, ptr %10, i32 128
  %14 = add i32 %9, 1
  br label %8

15:                                               ; preds = %8
  %16 = add i32 %3, 1
  br label %2, !llvm.loop !1

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %277, %17
  %19 = phi i32 [ %278, %277 ], [ 0, %17 ]
  %20 = icmp slt i32 %19, 16
  br i1 %20, label %21, label %279

21:                                               ; preds = %18
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %22

22:                                               ; preds = %147, %21
  %23 = phi i32 [ %148, %147 ], [ 0, %21 ]
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %149

25:                                               ; preds = %22
  %26 = mul nsw i32 %23, 64
  %27 = add i32 %26, 1024
  %28 = add i32 %26, 64
  %29 = add i32 %26, 1088
  %30 = mul i32 %23, 128
  %31 = getelementptr i8, ptr @buf159, i32 %30
  %32 = mul i32 %27, 2
  %33 = getelementptr i8, ptr @buf159, i32 %32
  %34 = mul i32 %28, 2
  %35 = getelementptr i8, ptr @buf159, i32 %34
  %36 = mul i32 %29, 2
  %37 = getelementptr i8, ptr @buf159, i32 %36
  br label %38

38:                                               ; preds = %121, %25
  %39 = phi i32 [ %146, %121 ], [ 0, %25 ]
  %40 = phi ptr [ %50, %121 ], [ %31, %25 ]
  %41 = phi ptr [ %51, %121 ], [ %33, %25 ]
  %42 = phi ptr [ %52, %121 ], [ %35, %25 ]
  %43 = phi ptr [ %53, %121 ], [ %37, %25 ]
  %44 = phi ptr [ %127, %121 ], [ %37, %25 ]
  %45 = phi ptr [ %133, %121 ], [ %35, %25 ]
  %46 = phi ptr [ %139, %121 ], [ %33, %25 ]
  %47 = phi ptr [ %145, %121 ], [ %31, %25 ]
  %48 = icmp slt i32 %39, 8
  br i1 %48, label %49, label %147

49:                                               ; preds = %38
  %50 = getelementptr i8, ptr %40, i32 4096
  %51 = getelementptr i8, ptr %41, i32 4096
  %52 = getelementptr i8, ptr %42, i32 4096
  %53 = getelementptr i8, ptr %43, i32 4096
  %54 = mul nsw i32 %39, 256
  %55 = add i32 %54, 256
  %56 = load <32 x i16>, ptr %40
  %57 = getelementptr i16, ptr %40, i32 32
  %58 = load <32 x i16>, ptr %57
  %59 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %56, i32 0, i32 1)
  %60 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %58, i32 0, i32 1)
  %61 = shufflevector <32 x i32> %59, <32 x i32> %60, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %62 = load <32 x i16>, ptr %41
  %63 = getelementptr i16, ptr %41, i32 32
  %64 = load <32 x i16>, ptr %63
  %65 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %62, i32 0, i32 1)
  %66 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %64, i32 0, i32 1)
  %67 = shufflevector <32 x i32> %65, <32 x i32> %66, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %68 = load <32 x i16>, ptr %42
  %69 = getelementptr i16, ptr %42, i32 32
  %70 = load <32 x i16>, ptr %69
  %71 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %68, i32 0, i32 1)
  %72 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %70, i32 0, i32 1)
  %73 = shufflevector <32 x i32> %71, <32 x i32> %72, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %74 = load <32 x i16>, ptr %43
  %75 = getelementptr i16, ptr %43, i32 32
  %76 = load <32 x i16>, ptr %75
  %77 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %74, i32 0, i32 1)
  %78 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %76, i32 0, i32 1)
  %79 = shufflevector <32 x i32> %77, <32 x i32> %78, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %80 = getelementptr i8, ptr @buf156, i32 %26
  %81 = getelementptr i8, ptr @buf155, i32 %54
  %82 = getelementptr i8, ptr @buf155, i32 %55
  %83 = getelementptr i8, ptr @buf156, i32 %28
  br label %84

84:                                               ; preds = %95, %49
  %85 = phi i32 [ %120, %95 ], [ 0, %49 ]
  %86 = phi <64 x i32> [ %104, %95 ], [ %61, %49 ]
  %87 = phi <64 x i32> [ %110, %95 ], [ %67, %49 ]
  %88 = phi <64 x i32> [ %116, %95 ], [ %73, %49 ]
  %89 = phi <64 x i32> [ %119, %95 ], [ %79, %49 ]
  %90 = phi ptr [ %97, %95 ], [ %80, %49 ]
  %91 = phi ptr [ %99, %95 ], [ %81, %49 ]
  %92 = phi ptr [ %106, %95 ], [ %82, %49 ]
  %93 = phi ptr [ %112, %95 ], [ %83, %49 ]
  %94 = icmp slt i32 %85, 4
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  %96 = load <64 x i8>, ptr %90
  %97 = getelementptr i8, ptr %90, i32 1024
  %98 = load <64 x i8>, ptr %91
  %99 = getelementptr i8, ptr %91, i32 64
  %100 = bitcast <64 x i8> %96 to <16 x i32>
  %101 = bitcast <64 x i8> %98 to <32 x i16>
  %102 = bitcast <64 x i32> %86 to <32 x i64>
  %103 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %101, <32 x i64> %102, i32 8)
  %104 = bitcast <32 x i64> %103 to <64 x i32>
  %105 = load <64 x i8>, ptr %92
  %106 = getelementptr i8, ptr %92, i32 64
  %107 = bitcast <64 x i8> %105 to <32 x i16>
  %108 = bitcast <64 x i32> %87 to <32 x i64>
  %109 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %100, <32 x i16> %107, <32 x i64> %108, i32 8)
  %110 = bitcast <32 x i64> %109 to <64 x i32>
  %111 = load <64 x i8>, ptr %93
  %112 = getelementptr i8, ptr %93, i32 1024
  %113 = bitcast <64 x i8> %111 to <16 x i32>
  %114 = bitcast <64 x i32> %88 to <32 x i64>
  %115 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %101, <32 x i64> %114, i32 8)
  %116 = bitcast <32 x i64> %115 to <64 x i32>
  %117 = bitcast <64 x i32> %89 to <32 x i64>
  %118 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %113, <32 x i16> %107, <32 x i64> %117, i32 8)
  %119 = bitcast <32 x i64> %118 to <64 x i32>
  %120 = add i32 %85, 1
  br label %84

121:                                              ; preds = %84
  %122 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %123 = shufflevector <64 x i32> %89, <64 x i32> %89, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %124 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %122, i32 0, i32 1)
  %125 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %123, i32 0, i32 1)
  store <32 x i16> %124, ptr %44
  %126 = getelementptr i16, ptr %44, i32 32
  store <32 x i16> %125, ptr %126
  %127 = getelementptr i8, ptr %44, i32 4096
  %128 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %129 = shufflevector <64 x i32> %88, <64 x i32> %88, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %130 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %128, i32 0, i32 1)
  %131 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %129, i32 0, i32 1)
  store <32 x i16> %130, ptr %45
  %132 = getelementptr i16, ptr %45, i32 32
  store <32 x i16> %131, ptr %132
  %133 = getelementptr i8, ptr %45, i32 4096
  %134 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = shufflevector <64 x i32> %87, <64 x i32> %87, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %136 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %134, i32 0, i32 1)
  %137 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %135, i32 0, i32 1)
  store <32 x i16> %136, ptr %46
  %138 = getelementptr i16, ptr %46, i32 32
  store <32 x i16> %137, ptr %138
  %139 = getelementptr i8, ptr %46, i32 4096
  %140 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %141 = shufflevector <64 x i32> %86, <64 x i32> %86, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %142 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %140, i32 0, i32 1)
  %143 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %141, i32 0, i32 1)
  store <32 x i16> %142, ptr %47
  %144 = getelementptr i16, ptr %47, i32 32
  store <32 x i16> %143, ptr %144
  %145 = getelementptr i8, ptr %47, i32 4096
  %146 = add i32 %39, 2
  br label %38

147:                                              ; preds = %38
  %148 = add i32 %23, 2
  br label %22, !llvm.loop !1

149:                                              ; preds = %22
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  br label %150

150:                                              ; preds = %275, %149
  %151 = phi i32 [ %276, %275 ], [ 0, %149 ]
  %152 = icmp slt i32 %151, 16
  br i1 %152, label %153, label %277

153:                                              ; preds = %150
  %154 = mul nsw i32 %151, 64
  %155 = add i32 %154, 1024
  %156 = add i32 %154, 64
  %157 = add i32 %154, 1088
  %158 = mul i32 %151, 128
  %159 = getelementptr i8, ptr @buf159, i32 %158
  %160 = mul i32 %155, 2
  %161 = getelementptr i8, ptr @buf159, i32 %160
  %162 = mul i32 %156, 2
  %163 = getelementptr i8, ptr @buf159, i32 %162
  %164 = mul i32 %157, 2
  %165 = getelementptr i8, ptr @buf159, i32 %164
  br label %166

166:                                              ; preds = %249, %153
  %167 = phi i32 [ %274, %249 ], [ 0, %153 ]
  %168 = phi ptr [ %178, %249 ], [ %159, %153 ]
  %169 = phi ptr [ %179, %249 ], [ %161, %153 ]
  %170 = phi ptr [ %180, %249 ], [ %163, %153 ]
  %171 = phi ptr [ %181, %249 ], [ %165, %153 ]
  %172 = phi ptr [ %255, %249 ], [ %165, %153 ]
  %173 = phi ptr [ %261, %249 ], [ %163, %153 ]
  %174 = phi ptr [ %267, %249 ], [ %161, %153 ]
  %175 = phi ptr [ %273, %249 ], [ %159, %153 ]
  %176 = icmp slt i32 %167, 8
  br i1 %176, label %177, label %275

177:                                              ; preds = %166
  %178 = getelementptr i8, ptr %168, i32 4096
  %179 = getelementptr i8, ptr %169, i32 4096
  %180 = getelementptr i8, ptr %170, i32 4096
  %181 = getelementptr i8, ptr %171, i32 4096
  %182 = mul nsw i32 %167, 256
  %183 = add i32 %182, 256
  %184 = load <32 x i16>, ptr %168
  %185 = getelementptr i16, ptr %168, i32 32
  %186 = load <32 x i16>, ptr %185
  %187 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %184, i32 0, i32 1)
  %188 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %186, i32 0, i32 1)
  %189 = shufflevector <32 x i32> %187, <32 x i32> %188, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %190 = load <32 x i16>, ptr %169
  %191 = getelementptr i16, ptr %169, i32 32
  %192 = load <32 x i16>, ptr %191
  %193 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %190, i32 0, i32 1)
  %194 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %192, i32 0, i32 1)
  %195 = shufflevector <32 x i32> %193, <32 x i32> %194, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %196 = load <32 x i16>, ptr %170
  %197 = getelementptr i16, ptr %170, i32 32
  %198 = load <32 x i16>, ptr %197
  %199 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %196, i32 0, i32 1)
  %200 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %198, i32 0, i32 1)
  %201 = shufflevector <32 x i32> %199, <32 x i32> %200, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %202 = load <32 x i16>, ptr %171
  %203 = getelementptr i16, ptr %171, i32 32
  %204 = load <32 x i16>, ptr %203
  %205 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %202, i32 0, i32 1)
  %206 = call <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16> %204, i32 0, i32 1)
  %207 = shufflevector <32 x i32> %205, <32 x i32> %206, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %208 = getelementptr i8, ptr @buf158, i32 %154
  %209 = getelementptr i8, ptr @buf157, i32 %182
  %210 = getelementptr i8, ptr @buf157, i32 %183
  %211 = getelementptr i8, ptr @buf158, i32 %156
  br label %212

212:                                              ; preds = %223, %177
  %213 = phi i32 [ %248, %223 ], [ 0, %177 ]
  %214 = phi <64 x i32> [ %232, %223 ], [ %189, %177 ]
  %215 = phi <64 x i32> [ %238, %223 ], [ %195, %177 ]
  %216 = phi <64 x i32> [ %244, %223 ], [ %201, %177 ]
  %217 = phi <64 x i32> [ %247, %223 ], [ %207, %177 ]
  %218 = phi ptr [ %225, %223 ], [ %208, %177 ]
  %219 = phi ptr [ %227, %223 ], [ %209, %177 ]
  %220 = phi ptr [ %234, %223 ], [ %210, %177 ]
  %221 = phi ptr [ %240, %223 ], [ %211, %177 ]
  %222 = icmp slt i32 %213, 4
  br i1 %222, label %223, label %249

223:                                              ; preds = %212
  %224 = load <64 x i8>, ptr %218
  %225 = getelementptr i8, ptr %218, i32 1024
  %226 = load <64 x i8>, ptr %219
  %227 = getelementptr i8, ptr %219, i32 64
  %228 = bitcast <64 x i8> %224 to <16 x i32>
  %229 = bitcast <64 x i8> %226 to <32 x i16>
  %230 = bitcast <64 x i32> %214 to <32 x i64>
  %231 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %229, <32 x i64> %230, i32 8)
  %232 = bitcast <32 x i64> %231 to <64 x i32>
  %233 = load <64 x i8>, ptr %220
  %234 = getelementptr i8, ptr %220, i32 64
  %235 = bitcast <64 x i8> %233 to <32 x i16>
  %236 = bitcast <64 x i32> %215 to <32 x i64>
  %237 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %228, <32 x i16> %235, <32 x i64> %236, i32 8)
  %238 = bitcast <32 x i64> %237 to <64 x i32>
  %239 = load <64 x i8>, ptr %221
  %240 = getelementptr i8, ptr %221, i32 1024
  %241 = bitcast <64 x i8> %239 to <16 x i32>
  %242 = bitcast <64 x i32> %216 to <32 x i64>
  %243 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %229, <32 x i64> %242, i32 8)
  %244 = bitcast <32 x i64> %243 to <64 x i32>
  %245 = bitcast <64 x i32> %217 to <32 x i64>
  %246 = call <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32> %241, <32 x i16> %235, <32 x i64> %245, i32 8)
  %247 = bitcast <32 x i64> %246 to <64 x i32>
  %248 = add i32 %213, 1
  br label %212

249:                                              ; preds = %212
  %250 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %251 = shufflevector <64 x i32> %217, <64 x i32> %217, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %252 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %250, i32 0, i32 1)
  %253 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %251, i32 0, i32 1)
  store <32 x i16> %252, ptr %172
  %254 = getelementptr i16, ptr %172, i32 32
  store <32 x i16> %253, ptr %254
  %255 = getelementptr i8, ptr %172, i32 4096
  %256 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %257 = shufflevector <64 x i32> %216, <64 x i32> %216, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %258 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %256, i32 0, i32 1)
  %259 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %257, i32 0, i32 1)
  store <32 x i16> %258, ptr %173
  %260 = getelementptr i16, ptr %173, i32 32
  store <32 x i16> %259, ptr %260
  %261 = getelementptr i8, ptr %173, i32 4096
  %262 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = shufflevector <64 x i32> %215, <64 x i32> %215, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %264 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %262, i32 0, i32 1)
  %265 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %263, i32 0, i32 1)
  store <32 x i16> %264, ptr %174
  %266 = getelementptr i16, ptr %174, i32 32
  store <32 x i16> %265, ptr %266
  %267 = getelementptr i8, ptr %174, i32 4096
  %268 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %269 = shufflevector <64 x i32> %214, <64 x i32> %214, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %270 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %268, i32 0, i32 1)
  %271 = call <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32> %269, i32 0, i32 1)
  store <32 x i16> %270, ptr %175
  %272 = getelementptr i16, ptr %175, i32 32
  store <32 x i16> %271, ptr %272
  %273 = getelementptr i8, ptr %175, i32 4096
  %274 = add i32 %167, 2
  br label %166

275:                                              ; preds = %166
  %276 = add i32 %151, 2
  br label %150, !llvm.loop !1

277:                                              ; preds = %150
  call void @llvm.aie2p.release(i32 53, i32 1)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %278 = add i32 %19, 1
  br label %18, !llvm.loop !1

279:                                              ; preds = %18
  call void @llvm.aie2p.release(i32 48, i32 1)
  br label %1
}

; Unknown intrinsic
declare <32 x i32> @llvm.aie2p.acc32.v32.I512.ups(<32 x i16>, i32, i32)

; Unknown intrinsic
declare <32 x i16> @llvm.aie2p.I512.v32.acc32.srs(<32 x i32>, i32, i32)

; Unknown intrinsic
declare <32 x i64> @llvm.aie2p.I512.I512.ACC2048.mac.conf(<16 x i32>, <32 x i16>, <32 x i64>, i32)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.mustprogress"}
