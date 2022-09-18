target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = external dso_local unnamed_addr constant [4 x i8]
@buffer_for_constant_17 = external constant [4 x i8], align 128
@1 = external dso_local unnamed_addr constant [4 x i8]
@buffer_for_constant_18 = external constant [4 x i8], align 128
@2 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache = external dso_local addrspace(3) global [1 x [1 x [20 x float]]]
@buffer_for_constant_1 = external constant [4 x i8], align 128

define void @broadcast_11(ptr noalias align 16 dereferenceable(2000) %alloc3, ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %loop.invar_address = alloca i32, align 4
  %0 = getelementptr inbounds i8, ptr %alloc3, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %broadcast_11.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %2 = icmp uge i32 %loop.indvar, 5000000
  br i1 %2, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 625000
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %3 = icmp eq i32 %loop.indvar, 0
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %6 = mul nuw nsw i32 %4, 250
  %linear_index = add nuw nsw i32 %6, %5
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !27
  %8 = mul nuw nsw i32 %7, 125
  %9 = add nuw nsw i32 %linear_index, %8
  %linear_index_in_range = icmp ult i32 %9, 156250
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %9, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %row_index = mul nuw nsw i32 %5, 4
  %10 = udiv i32 %linear_index_plus_base, 1
  %11 = urem i32 %10, 500
  %12 = udiv i32 %linear_index_plus_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %row_index_plus1 = add nuw nsw i32 %row_index, 1
  %13 = udiv i32 %linear_index1, 1
  %14 = urem i32 %13, 500
  %15 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %row_index_plus2 = add nuw nsw i32 %row_index, 2
  %16 = udiv i32 %linear_index2, 1
  %17 = urem i32 %16, 500
  %18 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %row_index_plus3 = add nuw nsw i32 %row_index, 3
  %19 = udiv i32 %linear_index3, 1
  %20 = urem i32 %19, 500
  %21 = udiv i32 %linear_index3, 500
  %22 = icmp ult i32 %linear_index_plus_base, 5000000
  br i1 %22, label %broadcast_11.in_bounds-true, label %broadcast_11.in_bounds-after

broadcast_11.in_bounds-after:                     ; preds = %broadcast_11.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !28

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

broadcast_11.in_bounds-true:                      ; preds = %loop.loop_body
  %23 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index
  %24 = load float, ptr %23, align 4, !invariant.load !30
  %25 = getelementptr inbounds float, ptr %1, i32 %linear_index_plus_base
  store float %24, ptr %25, align 4
  %26 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus1
  %27 = load float, ptr %26, align 4, !invariant.load !30
  %28 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %27, ptr %28, align 4
  %29 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus2
  %30 = load float, ptr %29, align 4, !invariant.load !30
  %31 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %30, ptr %31, align 4
  %32 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus3
  %33 = load float, ptr %32, align 4, !invariant.load !30
  %34 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %33, ptr %34, align 4
  br label %broadcast_11.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

define void @fusion_4(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %loop.invar_address = alloca i32, align 4
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_4.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %2 = icmp uge i32 %loop.indvar, 5000000
  br i1 %2, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 24576
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %3 = icmp eq i32 %loop.indvar, 0
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
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
  %19 = icmp ult i32 %linear_index_plus_base, 5000000
  br i1 %19, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %fusion_4.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !33

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_4.in_bounds-true:                          ; preds = %loop.loop_body
  %20 = getelementptr inbounds float, ptr %0, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4
  %region_0_5_constant_2 = load float, ptr @0, align 4
  %22 = fcmp oge float %21, %region_0_5_constant_2
  %23 = fcmp une float %21, %21
  %24 = or i1 %22, %23
  %maximum.4 = select i1 %24, float %21, float %region_0_5_constant_2
  %25 = getelementptr inbounds float, ptr %1, i32 %linear_index_plus_base
  store float %maximum.4, ptr %25, align 4
  %26 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %27 = load float, ptr %26, align 4
  %region_0_5_constant_21 = load float, ptr @0, align 4
  %28 = fcmp oge float %27, %region_0_5_constant_21
  %29 = fcmp une float %27, %27
  %30 = or i1 %28, %29
  %maximum.42 = select i1 %30, float %27, float %region_0_5_constant_21
  %31 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %maximum.42, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %33 = load float, ptr %32, align 4
  %region_0_5_constant_23 = load float, ptr @0, align 4
  %34 = fcmp oge float %33, %region_0_5_constant_23
  %35 = fcmp une float %33, %33
  %36 = or i1 %34, %35
  %maximum.44 = select i1 %36, float %33, float %region_0_5_constant_23
  %37 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %maximum.44, ptr %37, align 4
  %38 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %39 = load float, ptr %38, align 4
  %region_0_5_constant_25 = load float, ptr @0, align 4
  %40 = fcmp oge float %39, %region_0_5_constant_25
  %41 = fcmp une float %39, %39
  %42 = or i1 %40, %41
  %maximum.46 = select i1 %42, float %39, float %region_0_5_constant_25
  %43 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %maximum.46, ptr %43, align 4
  br label %fusion_4.in_bounds-after
}

define void @broadcast_37(ptr noalias align 16 dereferenceable(40) %alloc5, ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc5, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %4 = mul nuw nsw i32 %2, 256
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 25088
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
  %17 = icmp ult i32 %linear_index_base, 100000
  br i1 %17, label %broadcast_37.in_bounds-true, label %broadcast_37.in_bounds-after

broadcast_37.in_bounds-after:                     ; preds = %broadcast_37.in_bounds-true, %entry
  ret void

broadcast_37.in_bounds-true:                      ; preds = %entry
  %18 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %6
  %19 = load float, ptr %18, align 4, !invariant.load !30
  %20 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %9
  %22 = load float, ptr %21, align 4, !invariant.load !30
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %22, ptr %23, align 4
  %24 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %12
  %25 = load float, ptr %24, align 4, !invariant.load !30
  %26 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %15
  %28 = load float, ptr %27, align 4, !invariant.load !30
  %29 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %28, ptr %29, align 4
  br label %broadcast_37.in_bounds-after
}

define void @reduce_45(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %return_buffer31 = alloca float, align 4
  %parameter_buffer30 = alloca float, align 4
  %parameter_buffer29 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.126 = alloca i32, align 4
  %accumulator_022 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %parameter_buffer20 = alloca float, align 4
  %parameter_buffer19 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.116 = alloca i32, align 4
  %accumulator_012 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %parameter_buffer10 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.16 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %4 = mul nuw nsw i32 %2, 256
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 2560
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %5 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %7 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %8 = udiv i32 %linear_index3, 1
  %9 = icmp ult i32 %linear_index_base, 10000
  br i1 %9, label %reduce_45.in_bounds-true, label %reduce_45.in_bounds-after

reduce_45.in_bounds-after:                        ; preds = %reduce.7.inner.loop_exit.reduction_dim.123, %entry
  ret void

reduce_45.in_bounds-true:                         ; preds = %entry
  %10 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %10, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_header.reduction_dim.1:       ; preds = %reduce.7.inner.loop_body.reduction_dim.1, %reduce_45.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  %11 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.1, 10
  br i1 %11, label %reduce.7.inner.loop_exit.reduction_dim.1, label %reduce.7.inner.loop_body.reduction_dim.1

reduce.7.inner.loop_body.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %12 = load float, ptr %accumulator_0, align 4
  %13 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %5, i32 %reduce.7.inner.indvar.reduction_dim.1
  %14 = load float, ptr %13, align 4, !invariant.load !30
  store float %12, ptr %parameter_buffer, align 4
  store float %14, ptr %parameter_buffer1, align 4
  call void @region_1_3(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %15 = load float, ptr %return_buffer, align 4
  store float %15, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %16 = load float, ptr %accumulator_0, align 4
  %17 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %16, ptr %17, align 4
  %18 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %18, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_header.reduction_dim.14:      ; preds = %reduce.7.inner.loop_body.reduction_dim.15, %reduce.7.inner.loop_exit.reduction_dim.1
  %reduce.7.inner.indvar.reduction_dim.17 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  %19 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.17, 10
  br i1 %19, label %reduce.7.inner.loop_exit.reduction_dim.13, label %reduce.7.inner.loop_body.reduction_dim.15

reduce.7.inner.loop_body.reduction_dim.15:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %20 = load float, ptr %accumulator_02, align 4
  %21 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %6, i32 %reduce.7.inner.indvar.reduction_dim.17
  %22 = load float, ptr %21, align 4, !invariant.load !30
  store float %20, ptr %parameter_buffer9, align 4
  store float %22, ptr %parameter_buffer10, align 4
  call void @region_1_3(ptr %parameter_buffer9, ptr %parameter_buffer10, ptr %return_buffer11)
  %23 = load float, ptr %return_buffer11, align 4
  store float %23, ptr %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.17, 1
  store i32 %invar.inc8, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_exit.reduction_dim.13:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %24 = load float, ptr %accumulator_02, align 4
  %25 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %26, ptr %accumulator_012, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.116, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.114

reduce.7.inner.loop_header.reduction_dim.114:     ; preds = %reduce.7.inner.loop_body.reduction_dim.115, %reduce.7.inner.loop_exit.reduction_dim.13
  %reduce.7.inner.indvar.reduction_dim.117 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.116, align 4
  %27 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.117, 10
  br i1 %27, label %reduce.7.inner.loop_exit.reduction_dim.113, label %reduce.7.inner.loop_body.reduction_dim.115

reduce.7.inner.loop_body.reduction_dim.115:       ; preds = %reduce.7.inner.loop_header.reduction_dim.114
  %28 = load float, ptr %accumulator_012, align 4
  %29 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %7, i32 %reduce.7.inner.indvar.reduction_dim.117
  %30 = load float, ptr %29, align 4, !invariant.load !30
  store float %28, ptr %parameter_buffer19, align 4
  store float %30, ptr %parameter_buffer20, align 4
  call void @region_1_3(ptr %parameter_buffer19, ptr %parameter_buffer20, ptr %return_buffer21)
  %31 = load float, ptr %return_buffer21, align 4
  store float %31, ptr %accumulator_012, align 4
  %invar.inc18 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.117, 1
  store i32 %invar.inc18, ptr %reduce.7.inner.invar_address.reduction_dim.116, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.114

reduce.7.inner.loop_exit.reduction_dim.113:       ; preds = %reduce.7.inner.loop_header.reduction_dim.114
  %32 = load float, ptr %accumulator_012, align 4
  %33 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %32, ptr %33, align 4
  %34 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %34, ptr %accumulator_022, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.124

reduce.7.inner.loop_header.reduction_dim.124:     ; preds = %reduce.7.inner.loop_body.reduction_dim.125, %reduce.7.inner.loop_exit.reduction_dim.113
  %reduce.7.inner.indvar.reduction_dim.127 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.126, align 4
  %35 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.127, 10
  br i1 %35, label %reduce.7.inner.loop_exit.reduction_dim.123, label %reduce.7.inner.loop_body.reduction_dim.125

reduce.7.inner.loop_body.reduction_dim.125:       ; preds = %reduce.7.inner.loop_header.reduction_dim.124
  %36 = load float, ptr %accumulator_022, align 4
  %37 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %8, i32 %reduce.7.inner.indvar.reduction_dim.127
  %38 = load float, ptr %37, align 4, !invariant.load !30
  store float %36, ptr %parameter_buffer29, align 4
  store float %38, ptr %parameter_buffer30, align 4
  call void @region_1_3(ptr %parameter_buffer29, ptr %parameter_buffer30, ptr %return_buffer31)
  %39 = load float, ptr %return_buffer31, align 4
  store float %39, ptr %accumulator_022, align 4
  %invar.inc28 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.127, 1
  store i32 %invar.inc28, ptr %reduce.7.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.124

reduce.7.inner.loop_exit.reduction_dim.123:       ; preds = %reduce.7.inner.loop_header.reduction_dim.124
  %40 = load float, ptr %accumulator_022, align 4
  %41 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %40, ptr %41, align 4
  br label %reduce_45.in_bounds-after
}

define internal void @region_1_3(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %0 = fcmp oge float %Arg_0.4, %Arg_1.5
  %1 = fcmp une float %Arg_0.4, %Arg_0.4
  %2 = or i1 %0, %1
  %maximum.6 = select i1 %2, float %Arg_0.4, float %Arg_1.5
  store float %maximum.6, ptr %maximum.6.typed, align 4
  %load_ret_value = load float, ptr %maximum.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_7(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %return_buffer37 = alloca float, align 4
  %parameter_buffer36 = alloca float, align 4
  %parameter_buffer35 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.131 = alloca i32, align 4
  %accumulator_026 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.119 = alloca i32, align 4
  %accumulator_014 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %parameter_buffer11 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.17 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = getelementptr inbounds i8, ptr %temp_buf, i64 40064
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %5 = mul nuw nsw i32 %3, 256
  %linear_index = add nuw nsw i32 %5, %4
  %linear_index_in_range = icmp ult i32 %linear_index, 2560
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %6 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %7 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %8 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %9 = udiv i32 %linear_index3, 1
  %10 = icmp ult i32 %linear_index_base, 10000
  br i1 %10, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %reduce.11.inner.loop_exit.reduction_dim.128, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  store float %region_0_12_constant_6, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_header.reduction_dim.1:      ; preds = %reduce.11.inner.loop_body.reduction_dim.1, %fusion_7.in_bounds-true
  %reduce.11.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  %11 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.1, 10
  br i1 %11, label %reduce.11.inner.loop_exit.reduction_dim.1, label %reduce.11.inner.loop_body.reduction_dim.1

reduce.11.inner.loop_body.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %12 = load float, ptr %accumulator_0, align 4
  %13 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %6, i32 %reduce.11.inner.indvar.reduction_dim.1
  %14 = load float, ptr %13, align 4, !invariant.load !30
  %15 = getelementptr inbounds [10000 x float], ptr %1, i32 0, i32 %6
  %16 = load float, ptr %15, align 4, !invariant.load !30
  %subtract.4 = fsub float %14, %16
  %17 = call float @__nv_expf(float %subtract.4)
  store float %12, ptr %parameter_buffer, align 4
  store float %17, ptr %parameter_buffer1, align 4
  call void @region_1_7(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %18 = load float, ptr %return_buffer, align 4
  store float %18, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %19 = load float, ptr %accumulator_0, align 4
  %20 = getelementptr inbounds float, ptr %2, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %region_0_12_constant_63 = load float, ptr @1, align 4
  store float %region_0_12_constant_63, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_header.reduction_dim.15:     ; preds = %reduce.11.inner.loop_body.reduction_dim.16, %reduce.11.inner.loop_exit.reduction_dim.1
  %reduce.11.inner.indvar.reduction_dim.18 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  %21 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.18, 10
  br i1 %21, label %reduce.11.inner.loop_exit.reduction_dim.14, label %reduce.11.inner.loop_body.reduction_dim.16

reduce.11.inner.loop_body.reduction_dim.16:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %22 = load float, ptr %accumulator_02, align 4
  %23 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %7, i32 %reduce.11.inner.indvar.reduction_dim.18
  %24 = load float, ptr %23, align 4, !invariant.load !30
  %25 = getelementptr inbounds [10000 x float], ptr %1, i32 0, i32 %7
  %26 = load float, ptr %25, align 4, !invariant.load !30
  %subtract.410 = fsub float %24, %26
  %27 = call float @__nv_expf(float %subtract.410)
  store float %22, ptr %parameter_buffer11, align 4
  store float %27, ptr %parameter_buffer12, align 4
  call void @region_1_7(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %28 = load float, ptr %return_buffer13, align 4
  store float %28, ptr %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.18, 1
  store i32 %invar.inc9, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_exit.reduction_dim.14:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %29 = load float, ptr %accumulator_02, align 4
  %30 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  store float %29, ptr %30, align 4
  %region_0_12_constant_615 = load float, ptr @1, align 4
  store float %region_0_12_constant_615, ptr %accumulator_014, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_header.reduction_dim.117:    ; preds = %reduce.11.inner.loop_body.reduction_dim.118, %reduce.11.inner.loop_exit.reduction_dim.14
  %reduce.11.inner.indvar.reduction_dim.120 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.119, align 4
  %31 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.120, 10
  br i1 %31, label %reduce.11.inner.loop_exit.reduction_dim.116, label %reduce.11.inner.loop_body.reduction_dim.118

reduce.11.inner.loop_body.reduction_dim.118:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %32 = load float, ptr %accumulator_014, align 4
  %33 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %8, i32 %reduce.11.inner.indvar.reduction_dim.120
  %34 = load float, ptr %33, align 4, !invariant.load !30
  %35 = getelementptr inbounds [10000 x float], ptr %1, i32 0, i32 %8
  %36 = load float, ptr %35, align 4, !invariant.load !30
  %subtract.422 = fsub float %34, %36
  %37 = call float @__nv_expf(float %subtract.422)
  store float %32, ptr %parameter_buffer23, align 4
  store float %37, ptr %parameter_buffer24, align 4
  call void @region_1_7(ptr %parameter_buffer23, ptr %parameter_buffer24, ptr %return_buffer25)
  %38 = load float, ptr %return_buffer25, align 4
  store float %38, ptr %accumulator_014, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, ptr %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_exit.reduction_dim.116:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %39 = load float, ptr %accumulator_014, align 4
  %40 = getelementptr inbounds float, ptr %2, i32 %linear_index2
  store float %39, ptr %40, align 4
  %region_0_12_constant_627 = load float, ptr @1, align 4
  store float %region_0_12_constant_627, ptr %accumulator_026, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_header.reduction_dim.129:    ; preds = %reduce.11.inner.loop_body.reduction_dim.130, %reduce.11.inner.loop_exit.reduction_dim.116
  %reduce.11.inner.indvar.reduction_dim.132 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.131, align 4
  %41 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.132, 10
  br i1 %41, label %reduce.11.inner.loop_exit.reduction_dim.128, label %reduce.11.inner.loop_body.reduction_dim.130

reduce.11.inner.loop_body.reduction_dim.130:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %42 = load float, ptr %accumulator_026, align 4
  %43 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %9, i32 %reduce.11.inner.indvar.reduction_dim.132
  %44 = load float, ptr %43, align 4, !invariant.load !30
  %45 = getelementptr inbounds [10000 x float], ptr %1, i32 0, i32 %9
  %46 = load float, ptr %45, align 4, !invariant.load !30
  %subtract.434 = fsub float %44, %46
  %47 = call float @__nv_expf(float %subtract.434)
  store float %42, ptr %parameter_buffer35, align 4
  store float %47, ptr %parameter_buffer36, align 4
  call void @region_1_7(ptr %parameter_buffer35, ptr %parameter_buffer36, ptr %return_buffer37)
  %48 = load float, ptr %return_buffer37, align 4
  store float %48, ptr %accumulator_026, align 4
  %invar.inc33 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.132, 1
  store i32 %invar.inc33, ptr %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_exit.reduction_dim.128:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %49 = load float, ptr %accumulator_026, align 4
  %50 = getelementptr inbounds float, ptr %2, i32 %linear_index3
  store float %49, ptr %50, align 4
  br label %fusion_7.in_bounds-after
}

; Function Attrs: nounwind readnone
declare float @__nv_expf(float) #2

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, ptr %add.10.typed, align 4
  %load_ret_value = load float, ptr %add.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_2(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 40064
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %2 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %3 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %6 = mul nuw nsw i32 %4, 256
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 25088
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %7 = udiv i32 %linear_index_base, 1
  %8 = urem i32 %7, 10
  %9 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 10
  %12 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 10
  %15 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %16 = udiv i32 %linear_index3, 1
  %17 = urem i32 %16, 10
  %18 = udiv i32 %linear_index3, 10
  %19 = icmp ult i32 %linear_index_base, 100000
  br i1 %19, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %20 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  %21 = load float, ptr %20, align 4
  %22 = getelementptr inbounds [10000 x float], ptr %2, i32 0, i32 %9
  %23 = load float, ptr %22, align 4, !invariant.load !30
  %subtract.5 = fsub float %21, %23
  %24 = call float @__nv_expf(float %subtract.5)
  %25 = getelementptr inbounds [10000 x float], ptr %0, i32 0, i32 %9
  %26 = load float, ptr %25, align 4, !invariant.load !30
  %divide.8 = fdiv float %24, %26
  %27 = getelementptr inbounds float, ptr %3, i32 %linear_index_base
  store float %divide.8, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  %29 = load float, ptr %28, align 4
  %30 = getelementptr inbounds [10000 x float], ptr %2, i32 0, i32 %12
  %31 = load float, ptr %30, align 4, !invariant.load !30
  %subtract.51 = fsub float %29, %31
  %32 = call float @__nv_expf(float %subtract.51)
  %33 = getelementptr inbounds [10000 x float], ptr %0, i32 0, i32 %12
  %34 = load float, ptr %33, align 4, !invariant.load !30
  %divide.82 = fdiv float %32, %34
  %35 = getelementptr inbounds float, ptr %3, i32 %linear_index1
  store float %divide.82, ptr %35, align 4
  %36 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  %37 = load float, ptr %36, align 4
  %38 = getelementptr inbounds [10000 x float], ptr %2, i32 0, i32 %15
  %39 = load float, ptr %38, align 4, !invariant.load !30
  %subtract.53 = fsub float %37, %39
  %40 = call float @__nv_expf(float %subtract.53)
  %41 = getelementptr inbounds [10000 x float], ptr %0, i32 0, i32 %15
  %42 = load float, ptr %41, align 4, !invariant.load !30
  %divide.84 = fdiv float %40, %42
  %43 = getelementptr inbounds float, ptr %3, i32 %linear_index2
  store float %divide.84, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  %45 = load float, ptr %44, align 4
  %46 = getelementptr inbounds [10000 x float], ptr %2, i32 0, i32 %18
  %47 = load float, ptr %46, align 4, !invariant.load !30
  %subtract.55 = fsub float %45, %47
  %48 = call float @__nv_expf(float %subtract.55)
  %49 = getelementptr inbounds [10000 x float], ptr %0, i32 0, i32 %18
  %50 = load float, ptr %49, align 4, !invariant.load !30
  %divide.86 = fdiv float %48, %50
  %51 = getelementptr inbounds float, ptr %3, i32 %linear_index3
  store float %divide.86, ptr %51, align 4
  br label %fusion_2.in_bounds-after
}

define void @iota_65(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %3 = mul nuw nsw i32 %1, 256
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 25088
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
  %16 = icmp ult i32 %linear_index_base, 100000
  br i1 %16, label %iota_65.in_bounds-true, label %iota_65.in_bounds-after

iota_65.in_bounds-after:                          ; preds = %iota_65.in_bounds-true, %entry
  ret void

iota_65.in_bounds-true:                           ; preds = %entry
  %17 = mul nuw nsw i32 %5, 1
  %18 = add nuw nsw i32 0, %17
  %19 = getelementptr inbounds i32, ptr %0, i32 %linear_index_base
  store i32 %18, ptr %19, align 4
  %20 = mul nuw nsw i32 %8, 1
  %21 = add nuw nsw i32 0, %20
  %22 = getelementptr inbounds i32, ptr %0, i32 %linear_index1
  store i32 %21, ptr %22, align 4
  %23 = mul nuw nsw i32 %11, 1
  %24 = add nuw nsw i32 0, %23
  %25 = getelementptr inbounds i32, ptr %0, i32 %linear_index2
  store i32 %24, ptr %25, align 4
  %26 = mul nuw nsw i32 %14, 1
  %27 = add nuw nsw i32 0, %26
  %28 = getelementptr inbounds i32, ptr %0, i32 %linear_index3
  store i32 %27, ptr %28, align 4
  br label %iota_65.in_bounds-after
}

define void @reduce_78(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %tuple_element_0 = alloca float, align 4
  %tuple_element_1 = alloca i32, align 4
  %return_buffer = alloca [2 x ptr], align 8
  %parameter_buffer3 = alloca i32, align 4
  %parameter_buffer2 = alloca float, align 4
  %parameter_buffer1 = alloca i32, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.26.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 20000000
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = getelementptr inbounds i8, ptr %temp_buf, i64 440064
  %3 = getelementptr inbounds i8, ptr %temp_buf, i64 400000
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %6 = mul nuw nsw i32 %4, 1024
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 10240
  call void @llvm.assume(i1 %linear_index_in_range)
  %7 = udiv i32 %linear_index, 1
  %8 = icmp ult i32 %linear_index, 10000
  br i1 %8, label %reduce_78.in_bounds-true, label %reduce_78.in_bounds-after

reduce_78.in_bounds-after:                        ; preds = %reduce.26.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce_78.in_bounds-true:                         ; preds = %entry
  %9 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %9, ptr %accumulator_0, align 4
  %10 = load i32, ptr @buffer_for_constant_18, align 4, !invariant.load !30
  store i32 %10, ptr %accumulator_1, align 4
  store i32 0, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_header.reduction_dim.1:      ; preds = %reduce.26.inner.loop_body.reduction_dim.1, %reduce_78.in_bounds-true
  %reduce.26.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  %11 = icmp uge i32 %reduce.26.inner.indvar.reduction_dim.1, 10
  br i1 %11, label %reduce.26.inner.loop_exit.reduction_dim.1, label %reduce.26.inner.loop_body.reduction_dim.1

reduce.26.inner.loop_body.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %12 = load float, ptr %accumulator_0, align 4
  %13 = load i32, ptr %accumulator_1, align 4
  %14 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %7, i32 %reduce.26.inner.indvar.reduction_dim.1
  %15 = load float, ptr %14, align 4, !invariant.load !30
  %16 = getelementptr inbounds [10000 x [10 x i32]], ptr %1, i32 0, i32 %7, i32 %reduce.26.inner.indvar.reduction_dim.1
  %17 = load i32, ptr %16, align 4, !invariant.load !30
  store float %12, ptr %parameter_buffer, align 4
  store i32 %13, ptr %parameter_buffer1, align 4
  store float %15, ptr %parameter_buffer2, align 4
  store i32 %17, ptr %parameter_buffer3, align 4
  %18 = getelementptr inbounds [2 x ptr], ptr %return_buffer, i64 0, i64 0
  store ptr %tuple_element_0, ptr %18, align 8
  %19 = getelementptr inbounds [2 x ptr], ptr %return_buffer, i64 0, i64 1
  store ptr %tuple_element_1, ptr %19, align 8
  call void @region_1_17(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %parameter_buffer2, ptr %parameter_buffer3, ptr %return_buffer)
  %20 = load float, ptr %tuple_element_0, align 4
  %21 = load i32, ptr %tuple_element_1, align 4
  store float %20, ptr %accumulator_0, align 4
  store i32 %21, ptr %accumulator_1, align 4
  %invar.inc = add nuw nsw i32 %reduce.26.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %22 = load float, ptr %accumulator_0, align 4
  %23 = insertvalue { float, i32 } undef, float %22, 0
  %24 = load i32, ptr %accumulator_1, align 4
  %25 = insertvalue { float, i32 } %23, i32 %24, 1
  %26 = extractvalue { float, i32 } %25, 0
  %27 = getelementptr inbounds float, ptr %2, i32 %linear_index
  store float %26, ptr %27, align 4
  %28 = extractvalue { float, i32 } %25, 1
  %29 = getelementptr inbounds i32, ptr %3, i32 %linear_index
  store i32 %28, ptr %29, align 4
  br label %reduce_78.in_bounds-after
}

define internal void @region_1_17(ptr dereferenceable(4) %Arg_0.18.typed, ptr dereferenceable(4) %Arg_1.19.typed, ptr dereferenceable(4) %Arg_2.20.typed, ptr dereferenceable(4) %Arg_3.21.typed, ptr dereferenceable(16) %output_arg) {
entry:
  %fusion.22.typed4 = alloca [2 x ptr], align 8
  %fusion.22.typed3 = alloca [2 x ptr], align 8
  %fusion.22.typed = alloca [2 x ptr], align 8
  %tuple.25.typed2 = alloca [2 x ptr], align 8
  %tuple.25.typed1 = alloca [2 x ptr], align 8
  %tuple.25.typed = alloca [2 x ptr], align 8
  %Arg_0.18 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.20 = load float, ptr %Arg_2.20.typed, align 4
  %compare.10 = fcmp oeq float %Arg_0.18, %Arg_2.20
  %0 = zext i1 %compare.10 to i8
  %Arg_1.19 = load i32, ptr %Arg_1.19.typed, align 4
  %Arg_3.21 = load i32, ptr %Arg_3.21.typed, align 4
  %1 = icmp sle i32 %Arg_1.19, %Arg_3.21
  %2 = select i1 %1, i32 %Arg_1.19, i32 %Arg_3.21
  %Arg_0.185 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.206 = load float, ptr %Arg_2.20.typed, align 4
  %compare.12 = fcmp oge float %Arg_0.185, %Arg_2.206
  %3 = zext i1 %compare.12 to i8
  %Arg_1.197 = load i32, ptr %Arg_1.19.typed, align 4
  %Arg_3.218 = load i32, ptr %Arg_3.21.typed, align 4
  %4 = trunc i8 %3 to i1
  %5 = select i1 %4, i32 %Arg_1.197, i32 %Arg_3.218
  %6 = trunc i8 %0 to i1
  %7 = select i1 %6, i32 %2, i32 %5
  %8 = insertvalue { i32, float } undef, i32 %7, 0
  %Arg_0.189 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.2010 = load float, ptr %Arg_2.20.typed, align 4
  %9 = trunc i8 %3 to i1
  %10 = select i1 %9, float %Arg_0.189, float %Arg_2.2010
  %11 = insertvalue { i32, float } %8, float %10, 1
  %12 = extractvalue { i32, float } %11, 0
  store i32 %12, ptr %fusion.22.typed3, align 4
  %13 = extractvalue { i32, float } %11, 1
  store float %13, ptr %fusion.22.typed4, align 4
  %14 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 0
  store ptr %fusion.22.typed3, ptr %14, align 8
  %15 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 1
  store ptr %fusion.22.typed4, ptr %15, align 8
  %16 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 1
  %get-tuple-element.24.typed = load ptr, ptr %16, align 8, !dereferenceable !38, !align !39
  %17 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 0
  %get-tuple-element.23.typed = load ptr, ptr %17, align 8, !dereferenceable !38, !align !39
  %18 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 0
  store ptr %get-tuple-element.24.typed, ptr %18, align 8
  %19 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 1
  store ptr %get-tuple-element.23.typed, ptr %19, align 8
  %20 = getelementptr inbounds [2 x ptr], ptr %output_arg, i64 0, i64 0
  %21 = load ptr, ptr %20, align 8, !dereferenceable !38, !align !39
  %22 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 0
  %23 = load ptr, ptr %22, align 8, !dereferenceable !38, !align !39
  %24 = load float, ptr %23, align 4
  store float %24, ptr %21, align 4
  %25 = getelementptr inbounds [2 x ptr], ptr %output_arg, i64 0, i64 1
  %26 = load ptr, ptr %25, align 8, !dereferenceable !38, !align !39
  %27 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 1
  %28 = load ptr, ptr %27, align 8, !dereferenceable !38, !align !39
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %26, align 4
  ret void
}

define void @iota_19(ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %3 = mul nuw nsw i32 %1, 256
  %linear_index = add nuw nsw i32 %3, %2
  %linear_index_in_range = icmp ult i32 %linear_index, 25088
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
  %16 = icmp ult i32 %linear_index_base, 100000
  br i1 %16, label %iota_19.in_bounds-true, label %iota_19.in_bounds-after

iota_19.in_bounds-after:                          ; preds = %iota_19.in_bounds-true, %entry
  ret void

iota_19.in_bounds-true:                           ; preds = %entry
  %17 = mul nuw nsw i32 %5, 1
  %18 = add nuw nsw i32 0, %17
  %19 = getelementptr inbounds i32, ptr %0, i32 %linear_index_base
  store i32 %18, ptr %19, align 4
  %20 = mul nuw nsw i32 %8, 1
  %21 = add nuw nsw i32 0, %20
  %22 = getelementptr inbounds i32, ptr %0, i32 %linear_index1
  store i32 %21, ptr %22, align 4
  %23 = mul nuw nsw i32 %11, 1
  %24 = add nuw nsw i32 0, %23
  %25 = getelementptr inbounds i32, ptr %0, i32 %linear_index2
  store i32 %24, ptr %25, align 4
  %26 = mul nuw nsw i32 %14, 1
  %27 = add nuw nsw i32 0, %26
  %28 = getelementptr inbounds i32, ptr %0, i32 %linear_index3
  store i32 %27, ptr %28, align 4
  br label %iota_19.in_bounds-after
}

define void @reduce_32(ptr noalias align 16 dereferenceable(400000) %alloc1, ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %tuple_element_0 = alloca float, align 4
  %tuple_element_1 = alloca i32, align 4
  %return_buffer = alloca [2 x ptr], align 8
  %parameter_buffer3 = alloca i32, align 4
  %parameter_buffer2 = alloca float, align 4
  %parameter_buffer1 = alloca i32, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.26.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %alloc1, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = getelementptr inbounds i8, ptr %temp_buf, i64 480128
  %3 = getelementptr inbounds i8, ptr %temp_buf, i64 440064
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %6 = mul nuw nsw i32 %4, 1024
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 10240
  call void @llvm.assume(i1 %linear_index_in_range)
  %7 = udiv i32 %linear_index, 1
  %8 = icmp ult i32 %linear_index, 10000
  br i1 %8, label %reduce_32.in_bounds-true, label %reduce_32.in_bounds-after

reduce_32.in_bounds-after:                        ; preds = %reduce.26.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce_32.in_bounds-true:                         ; preds = %entry
  %9 = load float, ptr @buffer_for_constant_17, align 4, !invariant.load !30
  store float %9, ptr %accumulator_0, align 4
  %10 = load i32, ptr @buffer_for_constant_18, align 4, !invariant.load !30
  store i32 %10, ptr %accumulator_1, align 4
  store i32 0, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_header.reduction_dim.1:      ; preds = %reduce.26.inner.loop_body.reduction_dim.1, %reduce_32.in_bounds-true
  %reduce.26.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  %11 = icmp uge i32 %reduce.26.inner.indvar.reduction_dim.1, 10
  br i1 %11, label %reduce.26.inner.loop_exit.reduction_dim.1, label %reduce.26.inner.loop_body.reduction_dim.1

reduce.26.inner.loop_body.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %12 = load float, ptr %accumulator_0, align 4
  %13 = load i32, ptr %accumulator_1, align 4
  %14 = getelementptr inbounds [10000 x [10 x float]], ptr %0, i32 0, i32 %7, i32 %reduce.26.inner.indvar.reduction_dim.1
  %15 = load float, ptr %14, align 4, !invariant.load !30
  %16 = getelementptr inbounds [10000 x [10 x i32]], ptr %1, i32 0, i32 %7, i32 %reduce.26.inner.indvar.reduction_dim.1
  %17 = load i32, ptr %16, align 4, !invariant.load !30
  store float %12, ptr %parameter_buffer, align 4
  store i32 %13, ptr %parameter_buffer1, align 4
  store float %15, ptr %parameter_buffer2, align 4
  store i32 %17, ptr %parameter_buffer3, align 4
  %18 = getelementptr inbounds [2 x ptr], ptr %return_buffer, i64 0, i64 0
  store ptr %tuple_element_0, ptr %18, align 8
  %19 = getelementptr inbounds [2 x ptr], ptr %return_buffer, i64 0, i64 1
  store ptr %tuple_element_1, ptr %19, align 8
  call void @region_1_17__1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %parameter_buffer2, ptr %parameter_buffer3, ptr %return_buffer)
  %20 = load float, ptr %tuple_element_0, align 4
  %21 = load i32, ptr %tuple_element_1, align 4
  store float %20, ptr %accumulator_0, align 4
  store i32 %21, ptr %accumulator_1, align 4
  %invar.inc = add nuw nsw i32 %reduce.26.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %22 = load float, ptr %accumulator_0, align 4
  %23 = insertvalue { float, i32 } undef, float %22, 0
  %24 = load i32, ptr %accumulator_1, align 4
  %25 = insertvalue { float, i32 } %23, i32 %24, 1
  %26 = extractvalue { float, i32 } %25, 0
  %27 = getelementptr inbounds float, ptr %2, i32 %linear_index
  store float %26, ptr %27, align 4
  %28 = extractvalue { float, i32 } %25, 1
  %29 = getelementptr inbounds i32, ptr %3, i32 %linear_index
  store i32 %28, ptr %29, align 4
  br label %reduce_32.in_bounds-after
}

define internal void @region_1_17__1(ptr dereferenceable(4) %Arg_0.18.typed, ptr dereferenceable(4) %Arg_1.19.typed, ptr dereferenceable(4) %Arg_2.20.typed, ptr dereferenceable(4) %Arg_3.21.typed, ptr dereferenceable(16) %output_arg) {
entry:
  %fusion.22.typed4 = alloca [2 x ptr], align 8
  %fusion.22.typed3 = alloca [2 x ptr], align 8
  %fusion.22.typed = alloca [2 x ptr], align 8
  %tuple.25.typed2 = alloca [2 x ptr], align 8
  %tuple.25.typed1 = alloca [2 x ptr], align 8
  %tuple.25.typed = alloca [2 x ptr], align 8
  %Arg_0.18 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.20 = load float, ptr %Arg_2.20.typed, align 4
  %compare.10 = fcmp oeq float %Arg_0.18, %Arg_2.20
  %0 = zext i1 %compare.10 to i8
  %Arg_1.19 = load i32, ptr %Arg_1.19.typed, align 4
  %Arg_3.21 = load i32, ptr %Arg_3.21.typed, align 4
  %1 = icmp sle i32 %Arg_1.19, %Arg_3.21
  %2 = select i1 %1, i32 %Arg_1.19, i32 %Arg_3.21
  %Arg_0.185 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.206 = load float, ptr %Arg_2.20.typed, align 4
  %compare.12 = fcmp oge float %Arg_0.185, %Arg_2.206
  %3 = zext i1 %compare.12 to i8
  %Arg_1.197 = load i32, ptr %Arg_1.19.typed, align 4
  %Arg_3.218 = load i32, ptr %Arg_3.21.typed, align 4
  %4 = trunc i8 %3 to i1
  %5 = select i1 %4, i32 %Arg_1.197, i32 %Arg_3.218
  %6 = trunc i8 %0 to i1
  %7 = select i1 %6, i32 %2, i32 %5
  %8 = insertvalue { i32, float } undef, i32 %7, 0
  %Arg_0.189 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_2.2010 = load float, ptr %Arg_2.20.typed, align 4
  %9 = trunc i8 %3 to i1
  %10 = select i1 %9, float %Arg_0.189, float %Arg_2.2010
  %11 = insertvalue { i32, float } %8, float %10, 1
  %12 = extractvalue { i32, float } %11, 0
  store i32 %12, ptr %fusion.22.typed3, align 4
  %13 = extractvalue { i32, float } %11, 1
  store float %13, ptr %fusion.22.typed4, align 4
  %14 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 0
  store ptr %fusion.22.typed3, ptr %14, align 8
  %15 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 1
  store ptr %fusion.22.typed4, ptr %15, align 8
  %16 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 1
  %get-tuple-element.24.typed = load ptr, ptr %16, align 8, !dereferenceable !38, !align !39
  %17 = getelementptr inbounds [2 x ptr], ptr %fusion.22.typed, i64 0, i64 0
  %get-tuple-element.23.typed = load ptr, ptr %17, align 8, !dereferenceable !38, !align !39
  %18 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 0
  store ptr %get-tuple-element.24.typed, ptr %18, align 8
  %19 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 1
  store ptr %get-tuple-element.23.typed, ptr %19, align 8
  %20 = getelementptr inbounds [2 x ptr], ptr %output_arg, i64 0, i64 0
  %21 = load ptr, ptr %20, align 8, !dereferenceable !38, !align !39
  %22 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 0
  %23 = load ptr, ptr %22, align 8, !dereferenceable !38, !align !39
  %24 = load float, ptr %23, align 4
  store float %24, ptr %21, align 4
  %25 = getelementptr inbounds [2 x ptr], ptr %output_arg, i64 0, i64 1
  %26 = load ptr, ptr %25, align 8, !dereferenceable !38, !align !39
  %27 = getelementptr inbounds [2 x ptr], ptr %tuple.25.typed, i64 0, i64 1
  %28 = load ptr, ptr %27, align 8, !dereferenceable !38, !align !39
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %26, align 4
  ret void
}

define void @input_fusion_reduce(ptr noalias align 128 dereferenceable(4) %alloc6, ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane28 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer16 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %temp_buf, i64 440064
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 400000
  %2 = getelementptr inbounds i8, ptr %alloc6, i64 0
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !40
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_13_constant_7 = load float, ptr @2, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_13_constant_7, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %8 = urem i32 %6, 640
  %9 = udiv i32 %6, 640
  %10 = mul i32 %7, 1
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 1
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 640
  %thread_id.y = udiv i32 %8, 640
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %11, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %11, 1
  %block_origin.z = mul i32 %18, 1
  %19 = icmp eq i32 %17, 0
  %tile_bound = select i1 %19, i32 1, i32 1
  %20 = icmp eq i32 %15, 0
  %tile_bound1 = select i1 %20, i32 10000, i32 10240
  %tile_origin.1 = mul i32 %17, 1
  %tile_origin.2 = mul i32 %15, 10240
  %21 = mul i32 %thread_id.x, 1
  %22 = add i32 %tile_origin.2, %21
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %13
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %23 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %23, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %24 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %25 = icmp eq i32 10240, %tile_bound1
  br i1 %25, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !42

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result17 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 16, i32 31)
  store float %26, ptr %result_from_other_lane, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer18)
  %27 = load float, ptr %return_buffer18, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 8, i32 31)
  store float %28, ptr %result_from_other_lane19, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane19, ptr %return_buffer21)
  %29 = load float, ptr %return_buffer21, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 4, i32 31)
  store float %30, ptr %result_from_other_lane22, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %31 = load float, ptr %return_buffer24, align 4
  store float %31, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %32 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 2, i32 31)
  store float %32, ptr %result_from_other_lane25, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %33 = load float, ptr %return_buffer27, align 4
  store float %33, ptr %current_output, align 4
  %partial_reduction_result29 = load float, ptr %current_output, align 4
  %34 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 1, i32 31)
  store float %34, ptr %result_from_other_lane28, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane28, ptr %return_buffer30)
  %35 = load float, ptr %return_buffer30, align 4
  store float %35, ptr %current_output, align 4
  %36 = udiv i32 %thread_id.x, 32
  %37 = icmp eq i32 %lane_id, 0
  br i1 %37, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %38 = icmp eq i32 %36, 0
  br i1 %38, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %40 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %40, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %41 = icmp eq i32 %tile_loop.indvar, 0
  %42 = mul i32 %tile_loop.indvar, 1
  %43 = add i32 %42, 0
  %44 = mul i32 %tile_loop.indvar, 640
  %45 = add i32 %44, 0
  %x_loc = add i32 %45, %21
  %46 = mul i32 %tile_loop.indvar, 640
  %47 = add i32 %46, 0
  %48 = add i32 %22, %47
  %49 = mul nuw nsw i32 %48, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %39, 10000
  %52 = add nuw nsw i32 %50, %51
  %53 = mul nuw nsw i32 %block_origin.z, 10000
  %54 = add nuw nsw i32 %52, %53
  %55 = udiv i32 %54, 1
  %Arg_1.2 = getelementptr inbounds i32, ptr %1, i32 %54
  %Arg_1.23 = load i32, ptr %Arg_1.2, align 4, !invariant.load !30
  %56 = sext i32 %Arg_1.23 to i64
  %Arg_0.1 = getelementptr inbounds i32, ptr %0, i32 %54
  %Arg_0.14 = load i32, ptr %Arg_0.1, align 4, !invariant.load !30
  %57 = sext i32 %Arg_0.14 to i64
  %58 = icmp eq i64 %56, %57
  %59 = zext i1 %58 to i8
  %60 = uitofp i8 %59 to float
  store float %60, ptr %reduction_input_address, align 4
  %61 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %61, ptr %reduction_input_address, ptr %return_buffer)
  %62 = load float, ptr %return_buffer, align 4
  store float %62, ptr %61, align 4
  br label %tile_loop.loop_header, !llvm.loop !43

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %63 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %64 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %64, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %65 = icmp eq i32 %tile_loop.indvar9, 0
  %66 = mul i32 %tile_loop.indvar9, 1
  %67 = add i32 %66, 0
  %68 = mul i32 %tile_loop.indvar9, 640
  %69 = add i32 %68, 0
  %x_loc11 = add i32 %69, %21
  %70 = mul i32 %tile_loop.indvar9, 640
  %71 = add i32 %70, 0
  %72 = add i32 %22, %71
  %73 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %73, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !45

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %74 = mul nuw nsw i32 %72, 1
  %75 = add nuw nsw i32 0, %74
  %76 = mul nuw nsw i32 %63, 10000
  %77 = add nuw nsw i32 %75, %76
  %78 = mul nuw nsw i32 %block_origin.z, 10000
  %79 = add nuw nsw i32 %77, %78
  %80 = udiv i32 %79, 1
  %Arg_1.212 = getelementptr inbounds i32, ptr %1, i32 %79
  %Arg_1.213 = load i32, ptr %Arg_1.212, align 4, !invariant.load !30
  %81 = sext i32 %Arg_1.213 to i64
  %Arg_0.114 = getelementptr inbounds i32, ptr %0, i32 %79
  %Arg_0.115 = load i32, ptr %Arg_0.114, align 4, !invariant.load !30
  %82 = sext i32 %Arg_0.115 to i64
  %83 = icmp eq i64 %81, %82
  %84 = zext i1 %83 to i8
  %85 = uitofp i8 %84 to float
  store float %85, ptr %reduction_input_address, align 4
  %86 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %86, ptr %reduction_input_address, ptr %return_buffer16)
  %87 = load float, ptr %return_buffer16, align 4
  store float %87, ptr %86, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %88 = getelementptr inbounds [1 x [1 x [20 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 0, i32 %36
  %89 = addrspacecast ptr addrspace(3) %88 to ptr
  %90 = load float, ptr %current_output, align 4
  store float %90, ptr %89, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %91 = getelementptr inbounds [1 x [1 x [20 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 0, i32 %lane_id
  %92 = addrspacecast ptr addrspace(3) %91 to ptr
  store float %region_0_13_constant_7, ptr %initial_value_addr, align 4
  %93 = icmp ult i32 %thread_id.x, 20
  %94 = select i1 %93, ptr %92, ptr %initial_value_addr
  %partial_reduction_result32 = load float, ptr %94, align 4
  %95 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %95, ptr %result_from_other_lane31, align 4
  call void @region_1_8(ptr %94, ptr %result_from_other_lane31, ptr %return_buffer33)
  %96 = load float, ptr %return_buffer33, align 4
  store float %96, ptr %94, align 4
  %partial_reduction_result35 = load float, ptr %94, align 4
  %97 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 8, i32 31)
  store float %97, ptr %result_from_other_lane34, align 4
  call void @region_1_8(ptr %94, ptr %result_from_other_lane34, ptr %return_buffer36)
  %98 = load float, ptr %return_buffer36, align 4
  store float %98, ptr %94, align 4
  %partial_reduction_result38 = load float, ptr %94, align 4
  %99 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 4, i32 31)
  store float %99, ptr %result_from_other_lane37, align 4
  call void @region_1_8(ptr %94, ptr %result_from_other_lane37, ptr %return_buffer39)
  %100 = load float, ptr %return_buffer39, align 4
  store float %100, ptr %94, align 4
  %partial_reduction_result41 = load float, ptr %94, align 4
  %101 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %101, ptr %result_from_other_lane40, align 4
  call void @region_1_8(ptr %94, ptr %result_from_other_lane40, ptr %return_buffer42)
  %102 = load float, ptr %return_buffer42, align 4
  store float %102, ptr %94, align 4
  %partial_reduction_result44 = load float, ptr %94, align 4
  %103 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 1, i32 31)
  store float %103, ptr %result_from_other_lane43, align 4
  call void @region_1_8(ptr %94, ptr %result_from_other_lane43, ptr %return_buffer45)
  %104 = load float, ptr %return_buffer45, align 4
  store float %104, ptr %94, align 4
  %105 = icmp eq i32 %thread_id.x, 0
  br i1 %105, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %106 = mul i32 %thread_id.x, 1
  %107 = add i32 %tile_origin.1, %thread_id.y
  %108 = add i32 %tile_origin.2, %106
  %109 = add i32 %108, 0
  %output = load float, ptr %94, align 4
  store float %output, ptr %2, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_8(ptr dereferenceable(4) %Arg_0.9.typed, ptr dereferenceable(4) %Arg_1.10.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.11.typed = alloca float, align 4
  %Arg_0.9 = load float, ptr %Arg_0.9.typed, align 4
  %Arg_1.10 = load float, ptr %Arg_1.10.typed, align 4
  %add.11 = fadd float %Arg_0.9, %Arg_1.10
  store float %add.11, ptr %add.11.typed, align 4
  %load_ret_value = load float, ptr %add.11.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent inaccessiblememonly nocallback nounwind
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

define void @multiply(ptr noalias align 128 dereferenceable(4) %alloc6, ptr noalias align 128 dereferenceable(20400144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc6, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc6, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %4 = mul nuw nsw i32 %2, 1
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %5 = icmp ult i32 %linear_index, 1
  br i1 %5, label %multiply.in_bounds-true, label %multiply.in_bounds-after

multiply.in_bounds-after:                         ; preds = %multiply.in_bounds-true, %entry
  ret void

multiply.in_bounds-true:                          ; preds = %entry
  %6 = load float, ptr %0, align 4
  %7 = load float, ptr @buffer_for_constant_1, align 4, !invariant.load !30
  %multiply.3 = fmul float %6, %7
  store float %multiply.3, ptr %1, align 4
  br label %multiply.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent inaccessiblememonly nocallback nounwind }
attributes #4 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24}

!0 = !{ptr @broadcast_11, !"kernel", i32 1}
!1 = !{ptr @broadcast_11, !"reqntidx", i32 125}
!2 = !{ptr @broadcast_11, !"reqntidy", i32 2}
!3 = !{ptr @fusion_4, !"kernel", i32 1}
!4 = !{ptr @fusion_4, !"reqntidx", i32 128}
!5 = !{ptr @broadcast_37, !"kernel", i32 1}
!6 = !{ptr @broadcast_37, !"reqntidx", i32 256}
!7 = !{ptr @reduce_45, !"kernel", i32 1}
!8 = !{ptr @reduce_45, !"reqntidx", i32 256}
!9 = !{ptr @fusion_7, !"kernel", i32 1}
!10 = !{ptr @fusion_7, !"reqntidx", i32 256}
!11 = !{ptr @fusion_2, !"kernel", i32 1}
!12 = !{ptr @fusion_2, !"reqntidx", i32 256}
!13 = !{ptr @iota_65, !"kernel", i32 1}
!14 = !{ptr @iota_65, !"reqntidx", i32 256}
!15 = !{ptr @reduce_78, !"kernel", i32 1}
!16 = !{ptr @reduce_78, !"reqntidx", i32 1024}
!17 = !{ptr @iota_19, !"kernel", i32 1}
!18 = !{ptr @iota_19, !"reqntidx", i32 256}
!19 = !{ptr @reduce_32, !"kernel", i32 1}
!20 = !{ptr @reduce_32, !"reqntidx", i32 1024}
!21 = !{ptr @input_fusion_reduce, !"kernel", i32 1}
!22 = !{ptr @input_fusion_reduce, !"reqntidx", i32 640}
!23 = !{ptr @multiply, !"kernel", i32 1}
!24 = !{ptr @multiply, !"reqntidx", i32 1}
!25 = !{i32 0, i32 625}
!26 = !{i32 0, i32 125}
!27 = !{i32 0, i32 2}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.vectorize.enable", i1 false}
!30 = !{}
!31 = !{i32 0, i32 48}
!32 = !{i32 0, i32 128}
!33 = distinct !{!33, !29}
!34 = !{i32 0, i32 98}
!35 = !{i32 0, i32 256}
!36 = !{i32 0, i32 10}
!37 = !{i32 0, i32 1024}
!38 = !{i64 4}
!39 = !{i64 1}
!40 = !{i32 0, i32 1}
!41 = !{i32 0, i32 640}
!42 = distinct !{!42, !29}
!43 = distinct !{!43, !29, !44}
!44 = !{!"llvm.loop.unroll.full"}
!45 = distinct !{!45, !29, !44}
