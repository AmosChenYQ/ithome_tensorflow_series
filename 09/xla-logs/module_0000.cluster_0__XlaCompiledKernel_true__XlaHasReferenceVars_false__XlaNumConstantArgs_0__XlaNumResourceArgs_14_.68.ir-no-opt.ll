target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_38 = constant [4 x i8] c"w\BE\7F?", align 128
@buffer_for_constant_37 = constant [4 x i8] c"fff?", align 128
@buffer_for_constant_7 = constant [4 x i8] zeroinitializer, align 128
@buffer_for_constant_5 = constant [4 x i8] c"\CD\CC\CC=", align 128
@0 = private unnamed_addr constant [4 x i8] c"\CD\CC\CC="
@1 = private unnamed_addr constant [4 x i8] c"\CD\CC\CC="

define void @broadcast_24(ptr noalias align 128 dereferenceable(40) %alloc12) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc12, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %3 = mul nuw nsw i32 %1, 5
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %4 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %5 = udiv i32 %linear_index1, 1
  %6 = icmp ult i32 %linear_index_base, 10
  br i1 %6, label %broadcast_24.in_bounds-true, label %broadcast_24.in_bounds-after

broadcast_24.in_bounds-after:                     ; preds = %broadcast_24.in_bounds-true, %entry
  ret void

broadcast_24.in_bounds-true:                      ; preds = %entry
  %7 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %8 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  store float %7, ptr %8, align 4
  %9 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %10 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %9, ptr %10, align 4
  br label %broadcast_24.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

define void @broadcast_22(ptr noalias align 128 dereferenceable(40) %alloc11) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc11, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %3 = mul nuw nsw i32 %1, 5
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %4 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %5 = udiv i32 %linear_index1, 1
  %6 = icmp ult i32 %linear_index_base, 10
  br i1 %6, label %broadcast_22.in_bounds-true, label %broadcast_22.in_bounds-after

broadcast_22.in_bounds-after:                     ; preds = %broadcast_22.in_bounds-true, %entry
  ret void

broadcast_22.in_bounds-true:                      ; preds = %entry
  %7 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %8 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  store float %7, ptr %8, align 4
  %9 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %10 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %9, ptr %10, align 4
  br label %broadcast_22.in_bounds-after
}

define void @broadcast_8(ptr noalias align 128 dereferenceable(2000) %alloc9) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc9, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %3 = mul nuw nsw i32 %1, 125
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 125
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %4 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %5 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %6 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %7 = udiv i32 %linear_index3, 1
  %8 = icmp ult i32 %linear_index_base, 500
  br i1 %8, label %broadcast_8.in_bounds-true, label %broadcast_8.in_bounds-after

broadcast_8.in_bounds-after:                      ; preds = %broadcast_8.in_bounds-true, %entry
  ret void

broadcast_8.in_bounds-true:                       ; preds = %entry
  %9 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %10 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  store float %9, ptr %10, align 4
  %11 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %12 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %11, ptr %12, align 4
  %13 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %14 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  store float %13, ptr %14, align 4
  %15 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %16 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  store float %15, ptr %16, align 4
  br label %broadcast_8.in_bounds-after
}

define void @broadcast_6(ptr noalias align 128 dereferenceable(2000) %alloc8) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc8, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %3 = mul nuw nsw i32 %1, 125
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 125
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %4 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %5 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %6 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %7 = udiv i32 %linear_index3, 1
  %8 = icmp ult i32 %linear_index_base, 500
  br i1 %8, label %broadcast_6.in_bounds-true, label %broadcast_6.in_bounds-after

broadcast_6.in_bounds-after:                      ; preds = %broadcast_6.in_bounds-true, %entry
  ret void

broadcast_6.in_bounds-true:                       ; preds = %entry
  %9 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %10 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  store float %9, ptr %10, align 4
  %11 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %12 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %11, ptr %12, align 4
  %13 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %14 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  store float %13, ptr %14, align 4
  %15 = load float, ptr @buffer_for_constant_5, align 4, !invariant.load !18
  %16 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  store float %15, ptr %16, align 4
  br label %broadcast_6.in_bounds-after
}

define void @broadcast_34(ptr noalias align 128 dereferenceable(20000) %alloc6) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc6, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %3 = mul nuw nsw i32 %1, 256
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 1280
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %4 = udiv i32 %linear_index_base, 1
  %5 = urem i32 %4, 10
  %6 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %7 = udiv i32 %linear_index1, 1
  %8 = urem i32 %7, 10
  %9 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %10 = udiv i32 %linear_index2, 1
  %11 = urem i32 %10, 10
  %12 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %13 = udiv i32 %linear_index3, 1
  %14 = urem i32 %13, 10
  %15 = udiv i32 %linear_index3, 10
  %16 = icmp ult i32 %linear_index_base, 5000
  br i1 %16, label %broadcast_34.in_bounds-true, label %broadcast_34.in_bounds-after

broadcast_34.in_bounds-after:                     ; preds = %broadcast_34.in_bounds-true, %entry
  ret void

broadcast_34.in_bounds-true:                      ; preds = %entry
  %17 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %18 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  store float %17, ptr %18, align 4
  %19 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %20 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %19, ptr %20, align 4
  %21 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %22 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  store float %21, ptr %22, align 4
  %23 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %24 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  store float %23, ptr %24, align 4
  br label %broadcast_34.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(20000) %alloc1, ptr noalias align 128 dereferenceable(20000) %alloc5) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc1, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc5, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %4 = mul nuw nsw i32 %2, 256
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 1280
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 10
  %7 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 10
  %10 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 10
  %13 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 10
  %16 = udiv i32 %linear_index3, 10
  %17 = icmp ult i32 %linear_index_base, 5000
  br i1 %17, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %18 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  %19 = load float, ptr %18, align 4, !invariant.load !18
  %region_0_5_constant_2 = load float, ptr @0, align 4
  %multiply.4 = fmul float %19, %region_0_5_constant_2
  %20 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %multiply.4, ptr %20, align 4
  %21 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %22 = load float, ptr %21, align 4, !invariant.load !18
  %region_0_5_constant_21 = load float, ptr @0, align 4
  %multiply.42 = fmul float %22, %region_0_5_constant_21
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %multiply.42, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %25 = load float, ptr %24, align 4, !invariant.load !18
  %region_0_5_constant_23 = load float, ptr @0, align 4
  %multiply.44 = fmul float %25, %region_0_5_constant_23
  %26 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %multiply.44, ptr %26, align 4
  %27 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %28 = load float, ptr %27, align 4, !invariant.load !18
  %region_0_5_constant_25 = load float, ptr @0, align 4
  %multiply.46 = fmul float %28, %region_0_5_constant_25
  %29 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %multiply.46, ptr %29, align 4
  br label %fusion.in_bounds-after
}

define void @broadcast_18(ptr noalias align 128 dereferenceable(1568000) %alloc3) {
entry:
  %loop.invar_address = alloca i32, align 4
  %0 = getelementptr inbounds i8, ptr %alloc3, i64 0
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %broadcast_18.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %1 = icmp uge i32 %loop.indvar, 392000
  br i1 %1, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 24576
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %2 = icmp eq i32 %loop.indvar, 0
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %5 = mul nuw nsw i32 %3, 128
  %linear_index = add nuw nsw i32 %5, %4
  %linear_index_in_range = icmp ult i32 %linear_index, 6144
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %6 = udiv i32 %linear_index_plus_base, 1
  %7 = urem i32 %6, 500
  %8 = udiv i32 %linear_index_plus_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %9 = udiv i32 %linear_index1, 1
  %10 = urem i32 %9, 500
  %11 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %12 = udiv i32 %linear_index2, 1
  %13 = urem i32 %12, 500
  %14 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %15 = udiv i32 %linear_index3, 1
  %16 = urem i32 %15, 500
  %17 = udiv i32 %linear_index3, 500
  %18 = icmp ult i32 %linear_index_plus_base, 392000
  br i1 %18, label %broadcast_18.in_bounds-true, label %broadcast_18.in_bounds-after

broadcast_18.in_bounds-after:                     ; preds = %broadcast_18.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !23

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

broadcast_18.in_bounds-true:                      ; preds = %loop.loop_body
  %19 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %20 = getelementptr inbounds float, ptr %0, i32 %linear_index_plus_base
  store float %19, ptr %20, align 4
  %21 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %22 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  store float %21, ptr %22, align 4
  %23 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %24 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  store float %23, ptr %24, align 4
  %25 = load float, ptr @buffer_for_constant_7, align 4, !invariant.load !18
  %26 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  store float %25, ptr %26, align 4
  br label %broadcast_18.in_bounds-after
}

define void @fusion_1(ptr noalias align 16 dereferenceable(1568000) %alloc0, ptr noalias align 128 dereferenceable(1568000) %alloc2) {
entry:
  %loop.invar_address = alloca i32, align 4
  %0 = getelementptr inbounds i8, ptr %alloc0, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc2, i64 0
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_1.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %2 = icmp uge i32 %loop.indvar, 392000
  br i1 %2, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 24576
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %3 = icmp eq i32 %loop.indvar, 0
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %6 = mul nuw nsw i32 %4, 128
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 6144
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %7 = udiv i32 %linear_index_plus_base, 1
  %8 = urem i32 %7, 500
  %9 = udiv i32 %linear_index_plus_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 500
  %12 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 500
  %15 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %16 = udiv i32 %linear_index3, 1
  %17 = urem i32 %16, 500
  %18 = udiv i32 %linear_index3, 500
  %19 = icmp ult i32 %linear_index_plus_base, 392000
  br i1 %19, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !25

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_1.in_bounds-true:                          ; preds = %loop.loop_body
  %20 = getelementptr inbounds float, ptr %0, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !18
  %region_0_5_constant_2 = load float, ptr @1, align 4
  %multiply.4 = fmul float %21, %region_0_5_constant_2
  %22 = getelementptr inbounds float, ptr %1, i32 %linear_index_plus_base
  store float %multiply.4, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %24 = load float, ptr %23, align 4, !invariant.load !18
  %region_0_5_constant_21 = load float, ptr @1, align 4
  %multiply.42 = fmul float %24, %region_0_5_constant_21
  %25 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %multiply.42, ptr %25, align 4
  %26 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %27 = load float, ptr %26, align 4, !invariant.load !18
  %region_0_5_constant_23 = load float, ptr @1, align 4
  %multiply.44 = fmul float %27, %region_0_5_constant_23
  %28 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %multiply.44, ptr %28, align 4
  %29 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %30 = load float, ptr %29, align 4, !invariant.load !18
  %region_0_5_constant_25 = load float, ptr @1, align 4
  %multiply.46 = fmul float %30, %region_0_5_constant_25
  %31 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %multiply.46, ptr %31, align 4
  br label %fusion_1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}

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
!16 = !{i32 0, i32 1}
!17 = !{i32 0, i32 5}
!18 = !{}
!19 = !{i32 0, i32 125}
!20 = !{i32 0, i32 256}
!21 = !{i32 0, i32 48}
!22 = !{i32 0, i32 128}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.vectorize.enable", i1 false}
!25 = distinct !{!25, !24}
