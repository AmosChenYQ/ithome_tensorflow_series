target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_38 = local_unnamed_addr addrspace(1) constant [4 x i8] c"w\BE\7F?", align 128
@buffer_for_constant_37 = local_unnamed_addr addrspace(1) constant [4 x i8] c"fff?", align 128
@buffer_for_constant_7 = local_unnamed_addr addrspace(1) constant [4 x i8] zeroinitializer, align 128
@buffer_for_constant_5 = local_unnamed_addr addrspace(1) constant [4 x i8] c"\CD\CC\CC=", align 128

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @broadcast_24(ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc12) local_unnamed_addr #0 {
entry:
  %alloc121 = addrspacecast ptr %alloc12 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %linear_index_base = shl nuw nsw i32 %0, 1
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr float, ptr addrspace(1) %alloc121, i64 %1
  store <2 x float> zeroinitializer, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @broadcast_22(ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc11) local_unnamed_addr #0 {
entry:
  %alloc111 = addrspacecast ptr %alloc11 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %linear_index_base = shl nuw nsw i32 %0, 1
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr float, ptr addrspace(1) %alloc111, i64 %1
  store <2 x float> <float 0x3FB99999A0000000, float 0x3FB99999A0000000>, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @broadcast_8(ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc9) local_unnamed_addr #0 {
entry:
  %alloc91 = addrspacecast ptr %alloc9 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !18
  %linear_index_base = shl nuw nsw i32 %0, 2
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr float, ptr addrspace(1) %alloc91, i64 %1
  store <4 x float> zeroinitializer, ptr addrspace(1) %2, align 16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @broadcast_6(ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc8) local_unnamed_addr #0 {
entry:
  %alloc81 = addrspacecast ptr %alloc8 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !18
  %linear_index_base = shl nuw nsw i32 %0, 2
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr float, ptr addrspace(1) %alloc81, i64 %1
  store <4 x float> <float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000>, ptr addrspace(1) %2, align 16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @broadcast_34(ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc6) local_unnamed_addr #0 {
entry:
  %alloc61 = addrspacecast ptr %alloc6 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 5000
  br i1 %4, label %broadcast_34.in_bounds-true, label %broadcast_34.in_bounds-after

broadcast_34.in_bounds-after:                     ; preds = %broadcast_34.in_bounds-true, %entry
  ret void

broadcast_34.in_bounds-true:                      ; preds = %entry
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %alloc61, i64 %5
  store <4 x float> zeroinitializer, ptr addrspace(1) %6, align 16
  br label %broadcast_34.in_bounds-after
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(20000) %alloc1, ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc5) local_unnamed_addr #2 {
entry:
  %alloc59 = addrspacecast ptr %alloc5 to ptr addrspace(1)
  %alloc17 = addrspacecast ptr %alloc1 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 5000
  br i1 %4, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %alloc17, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !20
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %multiply.4 = fmul float %8, 0x3FB99999A0000000
  %12 = getelementptr float, ptr addrspace(1) %alloc59, i64 %5
  %multiply.42 = fmul float %9, 0x3FB99999A0000000
  %multiply.44 = fmul float %10, 0x3FB99999A0000000
  %multiply.46 = fmul float %11, 0x3FB99999A0000000
  %13 = insertelement <4 x float> poison, float %multiply.4, i32 0
  %14 = insertelement <4 x float> %13, float %multiply.42, i32 1
  %15 = insertelement <4 x float> %14, float %multiply.44, i32 2
  %16 = insertelement <4 x float> %15, float %multiply.46, i32 3
  store <4 x float> %16, ptr addrspace(1) %12, align 16
  br label %fusion.in_bounds-after
}

; Function Attrs: argmemonly nofree nosync nounwind writeonly
define void @broadcast_18(ptr noalias nocapture writeonly align 128 dereferenceable(1568000) %alloc3) local_unnamed_addr #3 {
entry:
  %alloc32 = addrspacecast ptr %alloc3 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 98316
  %uglygep = getelementptr i8, ptr addrspace(1) %alloc32, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %broadcast_18.in_bounds-after.1, %entry
  %lsr.iv18 = phi ptr addrspace(1) [ %uglygep19, %broadcast_18.in_bounds-after.1 ], [ %uglygep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %broadcast_18.in_bounds-after.1 ], [ 24576, %entry ]
  %uglygep21 = getelementptr i8, ptr addrspace(1) %lsr.iv18, i64 -98316
  store <4 x float> zeroinitializer, ptr addrspace(1) %uglygep21, align 16
  %7 = add i32 %linear_index_base, %lsr.iv
  %8 = icmp ult i32 %7, 392000
  br i1 %8, label %broadcast_18.in_bounds-true.1, label %broadcast_18.in_bounds-after.1

broadcast_18.in_bounds-true.1:                    ; preds = %loop.loop_body
  %uglygep20 = getelementptr i8, ptr addrspace(1) %lsr.iv18, i64 -12
  store <4 x float> zeroinitializer, ptr addrspace(1) %uglygep20, align 16
  br label %broadcast_18.in_bounds-after.1

broadcast_18.in_bounds-after.1:                   ; preds = %broadcast_18.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 49152
  %9 = add i32 %lsr.iv.next, -73728
  %uglygep19 = getelementptr i8, ptr addrspace(1) %lsr.iv18, i64 196608
  %10 = icmp ugt i32 %9, 342847
  br i1 %10, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !23

loop.loop_exit:                                   ; preds = %broadcast_18.in_bounds-after.1
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(1568000) %alloc0, ptr noalias nocapture writeonly align 128 dereferenceable(1568000) %alloc2) local_unnamed_addr #4 {
entry:
  %alloc210 = addrspacecast ptr %alloc2 to ptr addrspace(1)
  %alloc08 = addrspacecast ptr %alloc0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 98316
  %uglygep = getelementptr i8, ptr addrspace(1) %alloc08, i64 %6
  %uglygep49 = getelementptr i8, ptr addrspace(1) %alloc210, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %fusion_1.in_bounds-after.1, %entry
  %lsr.iv50 = phi ptr addrspace(1) [ %uglygep51, %fusion_1.in_bounds-after.1 ], [ %uglygep49, %entry ]
  %lsr.iv40 = phi ptr addrspace(1) [ %uglygep41, %fusion_1.in_bounds-after.1 ], [ %uglygep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %fusion_1.in_bounds-after.1 ], [ 24576, %entry ]
  %uglygep42 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 -98316
  %7 = load <4 x float>, ptr addrspace(1) %uglygep42, align 16, !invariant.load !20
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %multiply.4 = fmul float %8, 0x3FB99999A0000000
  %uglygep53 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -98316
  %multiply.42 = fmul float %9, 0x3FB99999A0000000
  %multiply.44 = fmul float %10, 0x3FB99999A0000000
  %multiply.46 = fmul float %11, 0x3FB99999A0000000
  %12 = insertelement <4 x float> poison, float %multiply.4, i32 0
  %13 = insertelement <4 x float> %12, float %multiply.42, i32 1
  %14 = insertelement <4 x float> %13, float %multiply.44, i32 2
  %15 = insertelement <4 x float> %14, float %multiply.46, i32 3
  store <4 x float> %15, ptr addrspace(1) %uglygep53, align 16
  %16 = add i32 %linear_index_base, %lsr.iv
  %17 = icmp ult i32 %16, 392000
  br i1 %17, label %fusion_1.in_bounds-true.1, label %fusion_1.in_bounds-after.1

fusion_1.in_bounds-true.1:                        ; preds = %loop.loop_body
  %uglygep46 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 -12
  %18 = load <4 x float>, ptr addrspace(1) %uglygep46, align 16, !invariant.load !20
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %multiply.4.1 = fmul float %19, 0x3FB99999A0000000
  %uglygep52 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -12
  %multiply.42.1 = fmul float %20, 0x3FB99999A0000000
  %multiply.44.1 = fmul float %21, 0x3FB99999A0000000
  %multiply.46.1 = fmul float %22, 0x3FB99999A0000000
  %23 = insertelement <4 x float> poison, float %multiply.4.1, i32 0
  %24 = insertelement <4 x float> %23, float %multiply.42.1, i32 1
  %25 = insertelement <4 x float> %24, float %multiply.44.1, i32 2
  %26 = insertelement <4 x float> %25, float %multiply.46.1, i32 3
  store <4 x float> %26, ptr addrspace(1) %uglygep52, align 16
  br label %fusion_1.in_bounds-after.1

fusion_1.in_bounds-after.1:                       ; preds = %fusion_1.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 49152
  %27 = add i32 %lsr.iv.next, -73728
  %uglygep41 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 196608
  %uglygep51 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 196608
  %28 = icmp ugt i32 %27, 342847
  br i1 %28, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !25

loop.loop_exit:                                   ; preds = %fusion_1.in_bounds-after.1
  ret void
}

attributes #0 = { argmemonly mustprogress nofree nosync nounwind willreturn writeonly }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nosync nounwind writeonly }
attributes #4 = { argmemonly nofree nosync nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}
!llvm.module.flags = !{!16}

!0 = !{ptr @broadcast_24, !"kernel", i32 1}
!1 = !{ptr @broadcast_24, !"reqntidx", i32 5}
!2 = !{ptr @broadcast_22, !"kernel", i32 1}
!3 = !{ptr @broadcast_22, !"reqntidx", i32 5}
!4 = !{ptr @broadcast_8, !"kernel", i32 1}
!5 = !{ptr @broadcast_8, !"reqntidx", i32 125}
!6 = !{ptr @broadcast_6, !"kernel", i32 1}
!7 = !{ptr @broadcast_6, !"reqntidx", i32 125}
!8 = !{ptr @broadcast_34, !"kernel", i32 1}
!9 = !{ptr @broadcast_34, !"reqntidx", i32 256}
!10 = !{ptr @fusion, !"kernel", i32 1}
!11 = !{ptr @fusion, !"reqntidx", i32 256}
!12 = !{ptr @broadcast_18, !"kernel", i32 1}
!13 = !{ptr @broadcast_18, !"reqntidx", i32 128}
!14 = !{ptr @fusion_1, !"kernel", i32 1}
!15 = !{ptr @fusion_1, !"reqntidx", i32 128}
!16 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!17 = !{i32 0, i32 5}
!18 = !{i32 0, i32 125}
!19 = !{i32 0, i32 256}
!20 = !{}
!21 = !{i32 0, i32 48}
!22 = !{i32 0, i32 128}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.vectorize.enable", i1 false}
!25 = distinct !{!25, !24}
