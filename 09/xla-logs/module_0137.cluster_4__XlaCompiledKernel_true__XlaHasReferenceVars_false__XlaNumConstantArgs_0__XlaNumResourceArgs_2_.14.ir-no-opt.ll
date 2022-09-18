target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @fusion_2(ptr noalias align 16 dereferenceable(4) %alloc0, ptr noalias align 16 dereferenceable(4) %alloc1, ptr noalias align 16 dereferenceable(4) %alloc2, ptr noalias align 16 dereferenceable(4) %alloc3, ptr noalias align 128 dereferenceable(4) %alloc4, ptr noalias align 128 dereferenceable(4) %alloc5, ptr noalias align 128 dereferenceable(16) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc2, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc0, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc3, i64 0
  %3 = getelementptr inbounds i8, ptr %alloc1, i64 0
  %4 = getelementptr inbounds i8, ptr %alloc4, i64 0
  %5 = getelementptr inbounds i8, ptr %alloc5, i64 0
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = mul nuw nsw i32 %6, 2
  %linear_index = add nuw nsw i32 %8, %7
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %9 = udiv i32 %linear_index, 1
  %10 = icmp ult i32 %linear_index, 2
  br i1 %10, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %slice1-after, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %11 = phi i32 [ 0, %concatenate.pivot.0. ]
  %12 = sub nsw i32 %9, %11
  %13 = load float, ptr %0, align 4, !invariant.load !4
  %14 = load float, ptr %1, align 4, !invariant.load !4
  %multiply.5 = fmul float %13, %14
  br label %concatenate.9.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %15 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %16 = sub nsw i32 %9, %15
  %17 = load float, ptr %2, align 4, !invariant.load !4
  %18 = load float, ptr %3, align 4, !invariant.load !4
  %multiply.7 = fmul float %17, %18
  br label %concatenate.9.merge

concatenate.pivot.1.:                             ; preds = %fusion_2.in_bounds-true
  %19 = icmp ult i32 %9, 1
  br i1 %19, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.9.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %20 = phi float [ %multiply.5, %concat_index_from_operand_id0 ], [ %multiply.7, %concat_index_from_operand_id1 ]
  %21 = icmp sge i32 %9, 0
  %22 = icmp slt i32 %9, 1
  %23 = and i1 %21, %22
  br i1 %23, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.9.merge
  %24 = icmp sge i32 %9, 1
  %25 = icmp slt i32 %9, 2
  %26 = and i1 %24, %25
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.9.merge
  %27 = sub i32 %9, 0
  %28 = getelementptr inbounds [1 x float], ptr %4, i32 0, i32 0
  store float %20, ptr %28, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %29 = sub i32 %9, 1
  %30 = getelementptr inbounds [1 x float], ptr %5, i32 0, i32 0
  store float %20, ptr %30, align 4
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @fusion_2, !"kernel", i32 1}
!1 = !{ptr @fusion_2, !"reqntidx", i32 2}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 2}
!4 = !{}
