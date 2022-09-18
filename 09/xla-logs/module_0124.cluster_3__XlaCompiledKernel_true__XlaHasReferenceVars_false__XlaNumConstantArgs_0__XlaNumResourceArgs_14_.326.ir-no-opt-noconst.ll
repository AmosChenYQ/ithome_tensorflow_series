target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_298 = external constant [4 x i8], align 128
@buffer_for_constant_297 = external constant [4 x i8], align 128
@buffer_for_constant_61 = external constant [4 x i8], align 128
@buffer_for_constant_27 = external constant [4 x i8], align 128
@0 = external dso_local unnamed_addr constant [4 x i8]
@1 = external dso_local unnamed_addr constant [4 x i8]
@2 = external dso_local unnamed_addr constant [4 x i8]
@3 = external dso_local unnamed_addr constant [4 x i8]
@4 = external dso_local unnamed_addr constant [4 x i8]
@5 = external dso_local unnamed_addr constant [4 x i8]
@6 = external dso_local unnamed_addr constant [4 x i8]
@7 = external dso_local unnamed_addr constant [4 x i8]
@8 = external dso_local unnamed_addr constant [4 x i8]
@9 = external dso_local unnamed_addr constant [4 x i8]
@10 = external dso_local unnamed_addr constant [4 x i8]
@11 = external dso_local unnamed_addr constant [4 x i8]

define void @fusion_11(ptr noalias align 16 dereferenceable(4) %alloc6, ptr noalias align 16 dereferenceable(4) %alloc7, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc6, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc7, i64 0
  %2 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %5 = mul nuw nsw i32 %3, 1
  %linear_index = add nuw nsw i32 %5, %4
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %6 = icmp ult i32 %linear_index, 1
  br i1 %6, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %fusion_11.in_bounds-true, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  %region_0_10_constant_3 = load float, ptr @1, align 4
  %region_0_10_constant_4 = load float, ptr @0, align 4
  %7 = load float, ptr %1, align 4, !invariant.load !26
  %subtract.5 = fsub float %region_0_10_constant_4, %7
  %8 = call float @__nv_sqrtf(float %subtract.5)
  %multiply.7 = fmul float %region_0_10_constant_3, %8
  %region_0_10_constant_41 = load float, ptr @0, align 4
  %9 = load float, ptr %0, align 4, !invariant.load !26
  %subtract.8 = fsub float %region_0_10_constant_41, %9
  %divide.9 = fdiv float %multiply.7, %subtract.8
  store float %divide.9, ptr %2, align 4
  br label %fusion_11.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind readnone
declare float @__nv_sqrtf(float) #2

define void @broadcast_45(ptr noalias align 16 dereferenceable(40) %alloc5, ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc5, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %4 = mul nuw nsw i32 %2, 25
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 25
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
  %17 = icmp ult i32 %linear_index_base, 100
  br i1 %17, label %broadcast_45.in_bounds-true, label %broadcast_45.in_bounds-after

broadcast_45.in_bounds-after:                     ; preds = %broadcast_45.in_bounds-true, %entry
  ret void

broadcast_45.in_bounds-true:                      ; preds = %entry
  %18 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %6
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %20 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %9
  %22 = load float, ptr %21, align 4, !invariant.load !26
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %22, ptr %23, align 4
  %24 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %12
  %25 = load float, ptr %24, align 4, !invariant.load !26
  %26 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [10 x float], ptr %0, i32 0, i32 %15
  %28 = load float, ptr %27, align 4, !invariant.load !26
  %29 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %28, ptr %29, align 4
  br label %broadcast_45.in_bounds-after
}

define void @broadcast_25(ptr noalias align 16 dereferenceable(2000) %alloc3, ptr noalias align 128 dereferenceable(20000) %alloc21, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc3, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc21, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %4 = mul nuw nsw i32 %2, 250
  %linear_index = add nuw nsw i32 %4, %3
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !30
  %6 = mul nuw nsw i32 %5, 125
  %7 = add nuw nsw i32 %linear_index, %6
  %linear_index_in_range = icmp ult i32 %7, 1250
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %7, 4
  %row_index = mul nuw nsw i32 %3, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 500
  %10 = udiv i32 %linear_index_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %row_index_plus1 = add nuw nsw i32 %row_index, 1
  %11 = udiv i32 %linear_index1, 1
  %12 = urem i32 %11, 500
  %13 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %row_index_plus2 = add nuw nsw i32 %row_index, 2
  %14 = udiv i32 %linear_index2, 1
  %15 = urem i32 %14, 500
  %16 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %row_index_plus3 = add nuw nsw i32 %row_index, 3
  %17 = udiv i32 %linear_index3, 1
  %18 = urem i32 %17, 500
  %19 = udiv i32 %linear_index3, 500
  %20 = icmp ult i32 %linear_index_base, 5000
  br i1 %20, label %broadcast_25.in_bounds-true, label %broadcast_25.in_bounds-after

broadcast_25.in_bounds-after:                     ; preds = %broadcast_25.in_bounds-true, %entry
  ret void

broadcast_25.in_bounds-true:                      ; preds = %entry
  %21 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index
  %22 = load float, ptr %21, align 4, !invariant.load !26
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %22, ptr %23, align 4
  %24 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus1
  %25 = load float, ptr %24, align 4, !invariant.load !26
  %26 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus2
  %28 = load float, ptr %27, align 4, !invariant.load !26
  %29 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %28, ptr %29, align 4
  %30 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %row_index_plus3
  %31 = load float, ptr %30, align 4, !invariant.load !26
  %32 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %31, ptr %32, align 4
  br label %broadcast_25.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

define void @fusion_16(ptr noalias align 128 dereferenceable(20000) %alloc20, ptr noalias align 128 dereferenceable(20000) %alloc21, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc21, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc20, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
  %4 = mul nuw nsw i32 %2, 256
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 1280
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 500
  %7 = udiv i32 %linear_index_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 500
  %10 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 500
  %13 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 500
  %16 = udiv i32 %linear_index3, 500
  %17 = icmp ult i32 %linear_index_base, 5000
  br i1 %17, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %18 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %region_0_5_constant_2 = load float, ptr @2, align 4
  %20 = fcmp oge float %19, %region_0_5_constant_2
  %21 = fcmp une float %19, %19
  %22 = or i1 %20, %21
  %maximum.4 = select i1 %22, float %19, float %region_0_5_constant_2
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %maximum.4, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !26
  %region_0_5_constant_21 = load float, ptr @2, align 4
  %26 = fcmp oge float %25, %region_0_5_constant_21
  %27 = fcmp une float %25, %25
  %28 = or i1 %26, %27
  %maximum.42 = select i1 %28, float %25, float %region_0_5_constant_21
  %29 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %maximum.42, ptr %29, align 4
  %30 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !26
  %region_0_5_constant_23 = load float, ptr @2, align 4
  %32 = fcmp oge float %31, %region_0_5_constant_23
  %33 = fcmp une float %31, %31
  %34 = or i1 %32, %33
  %maximum.44 = select i1 %34, float %31, float %region_0_5_constant_23
  %35 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %maximum.44, ptr %35, align 4
  %36 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %37 = load float, ptr %36, align 4, !invariant.load !26
  %region_0_5_constant_25 = load float, ptr @2, align 4
  %38 = fcmp oge float %37, %region_0_5_constant_25
  %39 = fcmp une float %37, %37
  %40 = or i1 %38, %39
  %maximum.46 = select i1 %40, float %37, float %region_0_5_constant_25
  %41 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %maximum.46, ptr %41, align 4
  br label %fusion_16.in_bounds-after
}

define void @reduce_66(ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(40) %alloc27, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
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
  %0 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %4 = mul nuw nsw i32 %2, 5
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %5 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = icmp ult i32 %linear_index_base, 10
  br i1 %7, label %reduce_66.in_bounds-true, label %reduce_66.in_bounds-after

reduce_66.in_bounds-after:                        ; preds = %reduce.7.inner.loop_exit.reduction_dim.13, %entry
  ret void

reduce_66.in_bounds-true:                         ; preds = %entry
  %8 = load float, ptr @buffer_for_constant_61, align 4, !invariant.load !26
  store float %8, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_header.reduction_dim.1:       ; preds = %reduce.7.inner.loop_body.reduction_dim.1, %reduce_66.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.7.inner.loop_exit.reduction_dim.1, label %reduce.7.inner.loop_body.reduction_dim.1

reduce.7.inner.loop_body.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %10 = load float, ptr %accumulator_0, align 4
  %11 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %5, i32 %reduce.7.inner.indvar.reduction_dim.1
  %12 = load float, ptr %11, align 4, !invariant.load !26
  store float %10, ptr %parameter_buffer, align 4
  store float %12, ptr %parameter_buffer1, align 4
  call void @region_1_3(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %13 = load float, ptr %return_buffer, align 4
  store float %13, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %14 = load float, ptr %accumulator_0, align 4
  %15 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %14, ptr %15, align 4
  %16 = load float, ptr @buffer_for_constant_61, align 4, !invariant.load !26
  store float %16, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_header.reduction_dim.14:      ; preds = %reduce.7.inner.loop_body.reduction_dim.15, %reduce.7.inner.loop_exit.reduction_dim.1
  %reduce.7.inner.indvar.reduction_dim.17 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  %17 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.17, 10
  br i1 %17, label %reduce.7.inner.loop_exit.reduction_dim.13, label %reduce.7.inner.loop_body.reduction_dim.15

reduce.7.inner.loop_body.reduction_dim.15:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %18 = load float, ptr %accumulator_02, align 4
  %19 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %6, i32 %reduce.7.inner.indvar.reduction_dim.17
  %20 = load float, ptr %19, align 4, !invariant.load !26
  store float %18, ptr %parameter_buffer9, align 4
  store float %20, ptr %parameter_buffer10, align 4
  call void @region_1_3(ptr %parameter_buffer9, ptr %parameter_buffer10, ptr %return_buffer11)
  %21 = load float, ptr %return_buffer11, align 4
  store float %21, ptr %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.17, 1
  store i32 %invar.inc8, ptr %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_exit.reduction_dim.13:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %22 = load float, ptr %accumulator_02, align 4
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %22, ptr %23, align 4
  br label %reduce_66.in_bounds-after
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

define void @fusion_17(ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(40) %alloc26, ptr noalias align 128 dereferenceable(40) %alloc27, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
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
  %0 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc26, i64 0
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %5 = mul nuw nsw i32 %3, 5
  %linear_index = add nuw nsw i32 %5, %4
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %6 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %7 = udiv i32 %linear_index1, 1
  %8 = icmp ult i32 %linear_index_base, 10
  br i1 %8, label %fusion_17.in_bounds-true, label %fusion_17.in_bounds-after

fusion_17.in_bounds-after:                        ; preds = %reduce.11.inner.loop_exit.reduction_dim.14, %entry
  ret void

fusion_17.in_bounds-true:                         ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @3, align 4
  store float %region_0_12_constant_6, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_header.reduction_dim.1:      ; preds = %reduce.11.inner.loop_body.reduction_dim.1, %fusion_17.in_bounds-true
  %reduce.11.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.11.inner.loop_exit.reduction_dim.1, label %reduce.11.inner.loop_body.reduction_dim.1

reduce.11.inner.loop_body.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %10 = load float, ptr %accumulator_0, align 4
  %11 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %6, i32 %reduce.11.inner.indvar.reduction_dim.1
  %12 = load float, ptr %11, align 4, !invariant.load !26
  %13 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %6
  %14 = load float, ptr %13, align 4, !invariant.load !26
  %subtract.4 = fsub float %12, %14
  %15 = call float @__nv_expf(float %subtract.4)
  store float %10, ptr %parameter_buffer, align 4
  store float %15, ptr %parameter_buffer1, align 4
  call void @region_1_7(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %16 = load float, ptr %return_buffer, align 4
  store float %16, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %17 = load float, ptr %accumulator_0, align 4
  %18 = getelementptr inbounds float, ptr %2, i32 %linear_index_base
  store float %17, ptr %18, align 4
  %region_0_12_constant_63 = load float, ptr @3, align 4
  store float %region_0_12_constant_63, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_header.reduction_dim.15:     ; preds = %reduce.11.inner.loop_body.reduction_dim.16, %reduce.11.inner.loop_exit.reduction_dim.1
  %reduce.11.inner.indvar.reduction_dim.18 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  %19 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.18, 10
  br i1 %19, label %reduce.11.inner.loop_exit.reduction_dim.14, label %reduce.11.inner.loop_body.reduction_dim.16

reduce.11.inner.loop_body.reduction_dim.16:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %20 = load float, ptr %accumulator_02, align 4
  %21 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %7, i32 %reduce.11.inner.indvar.reduction_dim.18
  %22 = load float, ptr %21, align 4, !invariant.load !26
  %23 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %7
  %24 = load float, ptr %23, align 4, !invariant.load !26
  %subtract.410 = fsub float %22, %24
  %25 = call float @__nv_expf(float %subtract.410)
  store float %20, ptr %parameter_buffer11, align 4
  store float %25, ptr %parameter_buffer12, align 4
  call void @region_1_7(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %26 = load float, ptr %return_buffer13, align 4
  store float %26, ptr %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.18, 1
  store i32 %invar.inc9, ptr %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_exit.reduction_dim.14:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %27 = load float, ptr %accumulator_02, align 4
  %28 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  store float %27, ptr %28, align 4
  br label %fusion_17.in_bounds-after
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

define void @fusion_14(ptr noalias align 16 dereferenceable(400) %alloc1, ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(40) %alloc26, ptr noalias align 128 dereferenceable(40) %alloc27, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc1, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc26, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %3 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %4 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %7 = mul nuw nsw i32 %5, 25
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 25
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 10
  %10 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %11 = udiv i32 %linear_index1, 1
  %12 = urem i32 %11, 10
  %13 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %14 = udiv i32 %linear_index2, 1
  %15 = urem i32 %14, 10
  %16 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %17 = udiv i32 %linear_index3, 1
  %18 = urem i32 %17, 10
  %19 = udiv i32 %linear_index3, 10
  %20 = icmp ult i32 %linear_index_base, 100
  br i1 %20, label %fusion_14.in_bounds-true, label %fusion_14.in_bounds-after

fusion_14.in_bounds-after:                        ; preds = %fusion_14.in_bounds-true, %entry
  ret void

fusion_14.in_bounds-true:                         ; preds = %entry
  %region_0_14_constant_5 = load float, ptr @4, align 4
  %21 = getelementptr inbounds float, ptr %2, i32 %linear_index_base
  %22 = load float, ptr %21, align 4
  %23 = getelementptr inbounds [10 x float], ptr %3, i32 0, i32 %10
  %24 = load float, ptr %23, align 4, !invariant.load !26
  %subtract.8 = fsub float %22, %24
  %25 = call float @__nv_expf(float %subtract.8)
  %26 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %10
  %27 = load float, ptr %26, align 4, !invariant.load !26
  %divide.11 = fdiv float %25, %27
  %28 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  %29 = load float, ptr %28, align 4, !invariant.load !26
  %subtract.12 = fsub float %divide.11, %29
  %multiply.13 = fmul float %region_0_14_constant_5, %subtract.12
  %30 = getelementptr inbounds float, ptr %4, i32 %linear_index_base
  store float %multiply.13, ptr %30, align 4
  %region_0_14_constant_51 = load float, ptr @4, align 4
  %31 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  %32 = load float, ptr %31, align 4
  %33 = getelementptr inbounds [10 x float], ptr %3, i32 0, i32 %13
  %34 = load float, ptr %33, align 4, !invariant.load !26
  %subtract.82 = fsub float %32, %34
  %35 = call float @__nv_expf(float %subtract.82)
  %36 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %13
  %37 = load float, ptr %36, align 4, !invariant.load !26
  %divide.113 = fdiv float %35, %37
  %38 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %39 = load float, ptr %38, align 4, !invariant.load !26
  %subtract.124 = fsub float %divide.113, %39
  %multiply.135 = fmul float %region_0_14_constant_51, %subtract.124
  %40 = getelementptr inbounds float, ptr %4, i32 %linear_index1
  store float %multiply.135, ptr %40, align 4
  %region_0_14_constant_56 = load float, ptr @4, align 4
  %41 = getelementptr inbounds float, ptr %2, i32 %linear_index2
  %42 = load float, ptr %41, align 4
  %43 = getelementptr inbounds [10 x float], ptr %3, i32 0, i32 %16
  %44 = load float, ptr %43, align 4, !invariant.load !26
  %subtract.87 = fsub float %42, %44
  %45 = call float @__nv_expf(float %subtract.87)
  %46 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %16
  %47 = load float, ptr %46, align 4, !invariant.load !26
  %divide.118 = fdiv float %45, %47
  %48 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %49 = load float, ptr %48, align 4, !invariant.load !26
  %subtract.129 = fsub float %divide.118, %49
  %multiply.1310 = fmul float %region_0_14_constant_56, %subtract.129
  %50 = getelementptr inbounds float, ptr %4, i32 %linear_index2
  store float %multiply.1310, ptr %50, align 4
  %region_0_14_constant_511 = load float, ptr @4, align 4
  %51 = getelementptr inbounds float, ptr %2, i32 %linear_index3
  %52 = load float, ptr %51, align 4
  %53 = getelementptr inbounds [10 x float], ptr %3, i32 0, i32 %19
  %54 = load float, ptr %53, align 4, !invariant.load !26
  %subtract.812 = fsub float %52, %54
  %55 = call float @__nv_expf(float %subtract.812)
  %56 = getelementptr inbounds [10 x float], ptr %1, i32 0, i32 %19
  %57 = load float, ptr %56, align 4, !invariant.load !26
  %divide.1113 = fdiv float %55, %57
  %58 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %59 = load float, ptr %58, align 4, !invariant.load !26
  %subtract.1214 = fsub float %divide.1113, %59
  %multiply.1315 = fmul float %region_0_14_constant_511, %subtract.1214
  %60 = getelementptr inbounds float, ptr %4, i32 %linear_index3
  store float %multiply.1315, ptr %60, align 4
  br label %fusion_14.in_bounds-after
}

define void @reduce_158(ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(40) %alloc27, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %return_buffer11 = alloca float, align 4
  %parameter_buffer10 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.06 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %4 = mul nuw nsw i32 %2, 5
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %5 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = icmp ult i32 %linear_index_base, 10
  br i1 %7, label %reduce_158.in_bounds-true, label %reduce_158.in_bounds-after

reduce_158.in_bounds-after:                       ; preds = %reduce.7.inner.loop_exit.reduction_dim.03, %entry
  ret void

reduce_158.in_bounds-true:                        ; preds = %entry
  %8 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %8, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_header.reduction_dim.0:       ; preds = %reduce.7.inner.loop_body.reduction_dim.0, %reduce_158.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  %9 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.0, 10
  br i1 %9, label %reduce.7.inner.loop_exit.reduction_dim.0, label %reduce.7.inner.loop_body.reduction_dim.0

reduce.7.inner.loop_body.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %10 = load float, ptr %accumulator_0, align 4
  %11 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.0, i32 %5
  %12 = load float, ptr %11, align 4, !invariant.load !26
  store float %10, ptr %parameter_buffer, align 4
  store float %12, ptr %parameter_buffer1, align 4
  call void @region_1_3__1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %13 = load float, ptr %return_buffer, align 4
  store float %13, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_exit.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %14 = load float, ptr %accumulator_0, align 4
  %15 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %14, ptr %15, align 4
  %16 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %16, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_header.reduction_dim.04:      ; preds = %reduce.7.inner.loop_body.reduction_dim.05, %reduce.7.inner.loop_exit.reduction_dim.0
  %reduce.7.inner.indvar.reduction_dim.07 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  %17 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.07, 10
  br i1 %17, label %reduce.7.inner.loop_exit.reduction_dim.03, label %reduce.7.inner.loop_body.reduction_dim.05

reduce.7.inner.loop_body.reduction_dim.05:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %18 = load float, ptr %accumulator_02, align 4
  %19 = getelementptr inbounds [10 x [10 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.07, i32 %6
  %20 = load float, ptr %19, align 4, !invariant.load !26
  store float %18, ptr %parameter_buffer9, align 4
  store float %20, ptr %parameter_buffer10, align 4
  call void @region_1_3__1(ptr %parameter_buffer9, ptr %parameter_buffer10, ptr %return_buffer11)
  %21 = load float, ptr %return_buffer11, align 4
  store float %21, ptr %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.07, 1
  store i32 %invar.inc8, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_exit.reduction_dim.03:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %22 = load float, ptr %accumulator_02, align 4
  %23 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %22, ptr %23, align 4
  br label %reduce_158.in_bounds-after
}

define internal void @region_1_3__1(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, ptr %add.6.typed, align 4
  %load_ret_value = load float, ptr %add.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_13(ptr noalias align 128 dereferenceable(1568000) %alloc17, ptr noalias align 128 dereferenceable(20000) %alloc20, ptr noalias align 128 dereferenceable(20000) %alloc21, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc20, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc21, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc17, i64 0
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
  %5 = mul nuw nsw i32 %3, 256
  %linear_index = add nuw nsw i32 %5, %4
  %linear_index_in_range = icmp ult i32 %linear_index, 1280
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %6 = udiv i32 %linear_index_base, 1
  %7 = urem i32 %6, 500
  %8 = udiv i32 %linear_index_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %9 = udiv i32 %linear_index1, 1
  %10 = urem i32 %9, 500
  %11 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %12 = udiv i32 %linear_index2, 1
  %13 = urem i32 %12, 500
  %14 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %15 = udiv i32 %linear_index3, 1
  %16 = urem i32 %15, 500
  %17 = udiv i32 %linear_index3, 500
  %18 = icmp ult i32 %linear_index_base, 5000
  br i1 %18, label %fusion_13.in_bounds-true, label %fusion_13.in_bounds-after

fusion_13.in_bounds-after:                        ; preds = %fusion_13.in_bounds-true, %entry
  ret void

fusion_13.in_bounds-true:                         ; preds = %entry
  %19 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4, !invariant.load !26
  %region_0_8_constant_3 = load float, ptr @5, align 4
  %21 = fcmp oge float %20, %region_0_8_constant_3
  %22 = fcmp une float %20, %20
  %23 = or i1 %21, %22
  %maximum.5 = select i1 %23, float %20, float %region_0_8_constant_3
  %compare.6 = fcmp ogt float %maximum.5, %region_0_8_constant_3
  %24 = zext i1 %compare.6 to i8
  %25 = getelementptr inbounds float, ptr %0, i32 %linear_index_base
  %26 = load float, ptr %25, align 4, !invariant.load !26
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, float %26, float %region_0_8_constant_3
  %29 = getelementptr inbounds float, ptr %2, i32 %linear_index_base
  store float %28, ptr %29, align 4
  %30 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  %31 = load float, ptr %30, align 4, !invariant.load !26
  %region_0_8_constant_31 = load float, ptr @5, align 4
  %32 = fcmp oge float %31, %region_0_8_constant_31
  %33 = fcmp une float %31, %31
  %34 = or i1 %32, %33
  %maximum.52 = select i1 %34, float %31, float %region_0_8_constant_31
  %compare.63 = fcmp ogt float %maximum.52, %region_0_8_constant_31
  %35 = zext i1 %compare.63 to i8
  %36 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %37 = load float, ptr %36, align 4, !invariant.load !26
  %38 = trunc i8 %35 to i1
  %39 = select i1 %38, float %37, float %region_0_8_constant_31
  %40 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  store float %39, ptr %40, align 4
  %41 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  %42 = load float, ptr %41, align 4, !invariant.load !26
  %region_0_8_constant_34 = load float, ptr @5, align 4
  %43 = fcmp oge float %42, %region_0_8_constant_34
  %44 = fcmp une float %42, %42
  %45 = or i1 %43, %44
  %maximum.55 = select i1 %45, float %42, float %region_0_8_constant_34
  %compare.66 = fcmp ogt float %maximum.55, %region_0_8_constant_34
  %46 = zext i1 %compare.66 to i8
  %47 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %48 = load float, ptr %47, align 4, !invariant.load !26
  %49 = trunc i8 %46 to i1
  %50 = select i1 %49, float %48, float %region_0_8_constant_34
  %51 = getelementptr inbounds float, ptr %2, i32 %linear_index2
  store float %50, ptr %51, align 4
  %52 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  %53 = load float, ptr %52, align 4, !invariant.load !26
  %region_0_8_constant_37 = load float, ptr @5, align 4
  %54 = fcmp oge float %53, %region_0_8_constant_37
  %55 = fcmp une float %53, %53
  %56 = or i1 %54, %55
  %maximum.58 = select i1 %56, float %53, float %region_0_8_constant_37
  %compare.69 = fcmp ogt float %maximum.58, %region_0_8_constant_37
  %57 = zext i1 %compare.69 to i8
  %58 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %59 = load float, ptr %58, align 4, !invariant.load !26
  %60 = trunc i8 %57 to i1
  %61 = select i1 %60, float %59, float %region_0_8_constant_37
  %62 = getelementptr inbounds float, ptr %2, i32 %linear_index3
  store float %61, ptr %62, align 4
  br label %fusion_13.in_bounds-after
}

define void @reduce_178(ptr noalias align 128 dereferenceable(1568000) %alloc17, ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %return_buffer31 = alloca float, align 4
  %parameter_buffer30 = alloca float, align 4
  %parameter_buffer29 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.026 = alloca i32, align 4
  %accumulator_022 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %parameter_buffer20 = alloca float, align 4
  %parameter_buffer19 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.016 = alloca i32, align 4
  %accumulator_012 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %parameter_buffer10 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.06 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr %alloc17, i64 0
  %1 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %4 = mul nuw nsw i32 %2, 125
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 125
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %5 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %7 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %8 = udiv i32 %linear_index3, 1
  %9 = icmp ult i32 %linear_index_base, 500
  br i1 %9, label %reduce_178.in_bounds-true, label %reduce_178.in_bounds-after

reduce_178.in_bounds-after:                       ; preds = %reduce.7.inner.loop_exit.reduction_dim.023, %entry
  ret void

reduce_178.in_bounds-true:                        ; preds = %entry
  %10 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %10, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_header.reduction_dim.0:       ; preds = %reduce.7.inner.loop_body.reduction_dim.0, %reduce_178.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  %11 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.0, 10
  br i1 %11, label %reduce.7.inner.loop_exit.reduction_dim.0, label %reduce.7.inner.loop_body.reduction_dim.0

reduce.7.inner.loop_body.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %12 = load float, ptr %accumulator_0, align 4
  %13 = getelementptr inbounds [10 x [500 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.0, i32 %5
  %14 = load float, ptr %13, align 4, !invariant.load !26
  store float %12, ptr %parameter_buffer, align 4
  store float %14, ptr %parameter_buffer1, align 4
  call void @region_1_3__2(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %15 = load float, ptr %return_buffer, align 4
  store float %15, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_exit.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %16 = load float, ptr %accumulator_0, align 4
  %17 = getelementptr inbounds float, ptr %1, i32 %linear_index_base
  store float %16, ptr %17, align 4
  %18 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %18, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_header.reduction_dim.04:      ; preds = %reduce.7.inner.loop_body.reduction_dim.05, %reduce.7.inner.loop_exit.reduction_dim.0
  %reduce.7.inner.indvar.reduction_dim.07 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  %19 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.07, 10
  br i1 %19, label %reduce.7.inner.loop_exit.reduction_dim.03, label %reduce.7.inner.loop_body.reduction_dim.05

reduce.7.inner.loop_body.reduction_dim.05:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %20 = load float, ptr %accumulator_02, align 4
  %21 = getelementptr inbounds [10 x [500 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.07, i32 %6
  %22 = load float, ptr %21, align 4, !invariant.load !26
  store float %20, ptr %parameter_buffer9, align 4
  store float %22, ptr %parameter_buffer10, align 4
  call void @region_1_3__2(ptr %parameter_buffer9, ptr %parameter_buffer10, ptr %return_buffer11)
  %23 = load float, ptr %return_buffer11, align 4
  store float %23, ptr %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.07, 1
  store i32 %invar.inc8, ptr %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_exit.reduction_dim.03:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %24 = load float, ptr %accumulator_02, align 4
  %25 = getelementptr inbounds float, ptr %1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %26, ptr %accumulator_012, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.016, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.014

reduce.7.inner.loop_header.reduction_dim.014:     ; preds = %reduce.7.inner.loop_body.reduction_dim.015, %reduce.7.inner.loop_exit.reduction_dim.03
  %reduce.7.inner.indvar.reduction_dim.017 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.016, align 4
  %27 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.017, 10
  br i1 %27, label %reduce.7.inner.loop_exit.reduction_dim.013, label %reduce.7.inner.loop_body.reduction_dim.015

reduce.7.inner.loop_body.reduction_dim.015:       ; preds = %reduce.7.inner.loop_header.reduction_dim.014
  %28 = load float, ptr %accumulator_012, align 4
  %29 = getelementptr inbounds [10 x [500 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.017, i32 %7
  %30 = load float, ptr %29, align 4, !invariant.load !26
  store float %28, ptr %parameter_buffer19, align 4
  store float %30, ptr %parameter_buffer20, align 4
  call void @region_1_3__2(ptr %parameter_buffer19, ptr %parameter_buffer20, ptr %return_buffer21)
  %31 = load float, ptr %return_buffer21, align 4
  store float %31, ptr %accumulator_012, align 4
  %invar.inc18 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.017, 1
  store i32 %invar.inc18, ptr %reduce.7.inner.invar_address.reduction_dim.016, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.014

reduce.7.inner.loop_exit.reduction_dim.013:       ; preds = %reduce.7.inner.loop_header.reduction_dim.014
  %32 = load float, ptr %accumulator_012, align 4
  %33 = getelementptr inbounds float, ptr %1, i32 %linear_index2
  store float %32, ptr %33, align 4
  %34 = load float, ptr @buffer_for_constant_27, align 4, !invariant.load !26
  store float %34, ptr %accumulator_022, align 4
  store i32 0, ptr %reduce.7.inner.invar_address.reduction_dim.026, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.024

reduce.7.inner.loop_header.reduction_dim.024:     ; preds = %reduce.7.inner.loop_body.reduction_dim.025, %reduce.7.inner.loop_exit.reduction_dim.013
  %reduce.7.inner.indvar.reduction_dim.027 = load i32, ptr %reduce.7.inner.invar_address.reduction_dim.026, align 4
  %35 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.027, 10
  br i1 %35, label %reduce.7.inner.loop_exit.reduction_dim.023, label %reduce.7.inner.loop_body.reduction_dim.025

reduce.7.inner.loop_body.reduction_dim.025:       ; preds = %reduce.7.inner.loop_header.reduction_dim.024
  %36 = load float, ptr %accumulator_022, align 4
  %37 = getelementptr inbounds [10 x [500 x float]], ptr %0, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.027, i32 %8
  %38 = load float, ptr %37, align 4, !invariant.load !26
  store float %36, ptr %parameter_buffer29, align 4
  store float %38, ptr %parameter_buffer30, align 4
  call void @region_1_3__2(ptr %parameter_buffer29, ptr %parameter_buffer30, ptr %return_buffer31)
  %39 = load float, ptr %return_buffer31, align 4
  store float %39, ptr %accumulator_022, align 4
  %invar.inc28 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.027, 1
  store i32 %invar.inc28, ptr %reduce.7.inner.invar_address.reduction_dim.026, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.024

reduce.7.inner.loop_exit.reduction_dim.023:       ; preds = %reduce.7.inner.loop_header.reduction_dim.024
  %40 = load float, ptr %accumulator_022, align 4
  %41 = getelementptr inbounds float, ptr %1, i32 %linear_index3
  store float %40, ptr %41, align 4
  br label %reduce_178.in_bounds-after
}

define internal void @region_1_3__2(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, ptr %add.6.typed, align 4
  %load_ret_value = load float, ptr %add.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_18(ptr noalias align 16 dereferenceable(2000) %alloc3, ptr noalias align 16 dereferenceable(20000) %alloc4, ptr noalias align 16 dereferenceable(40) %alloc5, ptr noalias align 16 dereferenceable(2000) %alloc10, ptr noalias align 16 dereferenceable(2000) %alloc11, ptr noalias align 16 dereferenceable(20000) %alloc12, ptr noalias align 16 dereferenceable(20000) %alloc13, ptr noalias align 16 dereferenceable(40) %alloc14, ptr noalias align 16 dereferenceable(40) %alloc15, ptr noalias align 128 dereferenceable(20000) %alloc19, ptr noalias align 128 dereferenceable(20000) %alloc20, ptr noalias align 128 dereferenceable(20000) %alloc21, ptr noalias align 128 dereferenceable(2000) %alloc22, ptr noalias align 128 dereferenceable(2000) %alloc23, ptr noalias align 128 dereferenceable(2000) %alloc24, ptr noalias align 128 dereferenceable(40) %alloc25, ptr noalias align 128 dereferenceable(40) %alloc26, ptr noalias align 128 dereferenceable(40) %alloc27, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, ptr %alloc3, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc10, i64 0
  %3 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %4 = getelementptr inbounds i8, ptr %alloc11, i64 0
  %5 = getelementptr inbounds i8, ptr %alloc4, i64 0
  %6 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %7 = getelementptr inbounds i8, ptr %alloc12, i64 0
  %8 = getelementptr inbounds i8, ptr %alloc19, i64 0
  %9 = getelementptr inbounds i8, ptr %alloc13, i64 0
  %10 = getelementptr inbounds i8, ptr %alloc5, i64 0
  %11 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %12 = getelementptr inbounds i8, ptr %alloc14, i64 0
  %13 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %14 = getelementptr inbounds i8, ptr %alloc15, i64 0
  %15 = getelementptr inbounds i8, ptr %alloc22, i64 0
  %16 = getelementptr inbounds i8, ptr %alloc23, i64 0
  %17 = getelementptr inbounds i8, ptr %alloc24, i64 0
  %18 = getelementptr inbounds i8, ptr %alloc19, i64 0
  %19 = getelementptr inbounds i8, ptr %alloc20, i64 0
  %20 = getelementptr inbounds i8, ptr %alloc21, i64 0
  %21 = getelementptr inbounds i8, ptr %alloc25, i64 0
  %22 = getelementptr inbounds i8, ptr %alloc26, i64 0
  %23 = getelementptr inbounds i8, ptr %alloc27, i64 0
  %24 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %26 = mul nuw nsw i32 %24, 1024
  %linear_index = add nuw nsw i32 %26, %25
  %linear_index_in_range = icmp ult i32 %linear_index, 6144
  call void @llvm.assume(i1 %linear_index_in_range)
  %27 = udiv i32 %linear_index, 1
  %28 = icmp ult i32 %linear_index, 5510
  br i1 %28, label %fusion_18.in_bounds-true, label %fusion_18.in_bounds-after

fusion_18.in_bounds-after:                        ; preds = %slice8-after, %entry
  ret void

fusion_18.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.500.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %29 = phi i32 [ 0, %concatenate.pivot.0. ]
  %30 = sub nsw i32 %27, %29
  %31 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !26
  %33 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %30
  %34 = load float, ptr %33, align 4, !invariant.load !26
  %35 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %30
  %36 = load float, ptr %35, align 4
  %37 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %30
  %38 = load float, ptr %37, align 4, !invariant.load !26
  %subtract.16 = fsub float %36, %38
  %region_0_89_constant_17 = load float, ptr @8, align 4
  %multiply.19 = fmul float %subtract.16, %region_0_89_constant_17
  %add.20 = fadd float %34, %multiply.19
  %39 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.22 = fmul float %add.20, %39
  %40 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %30
  %41 = load float, ptr %40, align 4, !invariant.load !26
  %42 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %30
  %43 = load float, ptr %42, align 4
  %44 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %30
  %45 = load float, ptr %44, align 4
  %multiply.23 = fmul float %43, %45
  %46 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %30
  %47 = load float, ptr %46, align 4, !invariant.load !26
  %subtract.24 = fsub float %multiply.23, %47
  %region_0_89_constant_25 = load float, ptr @7, align 4
  %multiply.27 = fmul float %subtract.24, %region_0_89_constant_25
  %add.28 = fadd float %41, %multiply.27
  %48 = call float @__nv_sqrtf(float %add.28)
  %region_0_89_constant_30 = load float, ptr @6, align 4
  %add.32 = fadd float %48, %region_0_89_constant_30
  %divide.33 = fdiv float %multiply.22, %add.32
  %subtract.34 = fsub float %32, %divide.33
  br label %concatenate.70.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.500.7
  %49 = phi i32 [ 500, %concatenate.pivot.500.7 ]
  %50 = sub nsw i32 %27, %49
  %51 = mul nuw nsw i32 %50, 1
  %52 = add nuw nsw i32 0, %51
  %53 = urem i32 %52, 10
  %54 = udiv i32 %52, 10
  %55 = udiv i32 %54, 500
  %56 = getelementptr inbounds [500 x [10 x float]], ptr %5, i32 0, i32 %54, i32 %53
  %57 = load float, ptr %56, align 4, !invariant.load !26
  %58 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %54, i32 %53
  %59 = load float, ptr %58, align 4, !invariant.load !26
  %60 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %54, i32 %53
  %61 = load float, ptr %60, align 4
  %62 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %54, i32 %53
  %63 = load float, ptr %62, align 4, !invariant.load !26
  %subtract.36 = fsub float %61, %63
  %region_0_89_constant_171 = load float, ptr @8, align 4
  %multiply.38 = fmul float %subtract.36, %region_0_89_constant_171
  %add.39 = fadd float %59, %multiply.38
  %64 = load float, ptr %6, align 4, !invariant.load !26
  %multiply.41 = fmul float %add.39, %64
  %65 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %54, i32 %53
  %66 = load float, ptr %65, align 4, !invariant.load !26
  %67 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %54, i32 %53
  %68 = load float, ptr %67, align 4
  %69 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %54, i32 %53
  %70 = load float, ptr %69, align 4
  %multiply.42 = fmul float %68, %70
  %71 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %54, i32 %53
  %72 = load float, ptr %71, align 4, !invariant.load !26
  %subtract.43 = fsub float %multiply.42, %72
  %region_0_89_constant_252 = load float, ptr @7, align 4
  %multiply.45 = fmul float %subtract.43, %region_0_89_constant_252
  %add.46 = fadd float %66, %multiply.45
  %73 = call float @__nv_sqrtf(float %add.46)
  %region_0_89_constant_303 = load float, ptr @6, align 4
  %add.49 = fadd float %73, %region_0_89_constant_303
  %divide.50 = fdiv float %multiply.41, %add.49
  %subtract.51 = fsub float %57, %divide.50
  br label %concatenate.70.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.5500.8
  %74 = phi i32 [ 5500, %concatenate.pivot.5500.8 ]
  %75 = sub nsw i32 %27, %74
  %76 = getelementptr inbounds [10 x float], ptr %10, i32 0, i32 %75
  %77 = load float, ptr %76, align 4, !invariant.load !26
  %78 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %75
  %79 = load float, ptr %78, align 4, !invariant.load !26
  %80 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %75
  %81 = load float, ptr %80, align 4
  %82 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %75
  %83 = load float, ptr %82, align 4, !invariant.load !26
  %subtract.53 = fsub float %81, %83
  %region_0_89_constant_174 = load float, ptr @8, align 4
  %multiply.55 = fmul float %subtract.53, %region_0_89_constant_174
  %add.56 = fadd float %79, %multiply.55
  %84 = load float, ptr %11, align 4, !invariant.load !26
  %multiply.58 = fmul float %add.56, %84
  %85 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %75
  %86 = load float, ptr %85, align 4, !invariant.load !26
  %87 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %75
  %88 = load float, ptr %87, align 4
  %89 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %75
  %90 = load float, ptr %89, align 4
  %multiply.59 = fmul float %88, %90
  %91 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %75
  %92 = load float, ptr %91, align 4, !invariant.load !26
  %subtract.60 = fsub float %multiply.59, %92
  %region_0_89_constant_255 = load float, ptr @7, align 4
  %multiply.62 = fmul float %subtract.60, %region_0_89_constant_255
  %add.63 = fadd float %86, %multiply.62
  %93 = call float @__nv_sqrtf(float %add.63)
  %region_0_89_constant_306 = load float, ptr @6, align 4
  %add.66 = fadd float %93, %region_0_89_constant_306
  %divide.67 = fdiv float %multiply.58, %add.66
  %subtract.68 = fsub float %77, %divide.67
  br label %concatenate.70.merge

concatenate.pivot.500.:                           ; preds = %fusion_18.in_bounds-true
  %94 = icmp ult i32 %27, 500
  br i1 %94, label %concatenate.pivot.0., label %concatenate.pivot.5500.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.500.
  br label %concat_index_from_operand_id0

concatenate.pivot.5500.:                          ; preds = %concatenate.pivot.500.
  %95 = icmp ult i32 %27, 5500
  br i1 %95, label %concatenate.pivot.500.7, label %concatenate.pivot.5500.8

concatenate.pivot.500.7:                          ; preds = %concatenate.pivot.5500.
  br label %concat_index_from_operand_id1

concatenate.pivot.5500.8:                         ; preds = %concatenate.pivot.5500.
  br label %concat_index_from_operand_id2

concatenate.70.merge:                             ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %96 = phi float [ %subtract.34, %concat_index_from_operand_id0 ], [ %subtract.51, %concat_index_from_operand_id1 ], [ %subtract.68, %concat_index_from_operand_id2 ]
  br label %concatenate.pivot.500.24

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.25
  %97 = phi i32 [ 0, %concatenate.pivot.0.25 ]
  %98 = sub nsw i32 %27, %97
  %99 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %98
  %100 = load float, ptr %99, align 4, !invariant.load !26
  %101 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %98
  %102 = load float, ptr %101, align 4
  %103 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %98
  %104 = load float, ptr %103, align 4, !invariant.load !26
  %subtract.1610 = fsub float %102, %104
  %region_0_89_constant_1711 = load float, ptr @8, align 4
  %multiply.1912 = fmul float %subtract.1610, %region_0_89_constant_1711
  %add.2013 = fadd float %100, %multiply.1912
  br label %concatenate.75.merge

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.500.27
  %105 = phi i32 [ 500, %concatenate.pivot.500.27 ]
  %106 = sub nsw i32 %27, %105
  %107 = mul nuw nsw i32 %106, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 10
  %110 = udiv i32 %108, 10
  %111 = udiv i32 %110, 500
  %112 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %110, i32 %109
  %113 = load float, ptr %112, align 4, !invariant.load !26
  %114 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %110, i32 %109
  %115 = load float, ptr %114, align 4
  %116 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %110, i32 %109
  %117 = load float, ptr %116, align 4, !invariant.load !26
  %subtract.3615 = fsub float %115, %117
  %region_0_89_constant_1716 = load float, ptr @8, align 4
  %multiply.3817 = fmul float %subtract.3615, %region_0_89_constant_1716
  %add.3918 = fadd float %113, %multiply.3817
  br label %concatenate.75.merge

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.5500.28
  %118 = phi i32 [ 5500, %concatenate.pivot.5500.28 ]
  %119 = sub nsw i32 %27, %118
  %120 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %119
  %121 = load float, ptr %120, align 4, !invariant.load !26
  %122 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %119
  %123 = load float, ptr %122, align 4
  %124 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %119
  %125 = load float, ptr %124, align 4, !invariant.load !26
  %subtract.5320 = fsub float %123, %125
  %region_0_89_constant_1721 = load float, ptr @8, align 4
  %multiply.5522 = fmul float %subtract.5320, %region_0_89_constant_1721
  %add.5623 = fadd float %121, %multiply.5522
  br label %concatenate.75.merge

concatenate.pivot.500.24:                         ; preds = %concatenate.70.merge
  %126 = icmp ult i32 %27, 500
  br i1 %126, label %concatenate.pivot.0.25, label %concatenate.pivot.5500.26

concatenate.pivot.0.25:                           ; preds = %concatenate.pivot.500.24
  br label %concat_index_from_operand_id09

concatenate.pivot.5500.26:                        ; preds = %concatenate.pivot.500.24
  %127 = icmp ult i32 %27, 5500
  br i1 %127, label %concatenate.pivot.500.27, label %concatenate.pivot.5500.28

concatenate.pivot.500.27:                         ; preds = %concatenate.pivot.5500.26
  br label %concat_index_from_operand_id114

concatenate.pivot.5500.28:                        ; preds = %concatenate.pivot.5500.26
  br label %concat_index_from_operand_id219

concatenate.75.merge:                             ; preds = %concat_index_from_operand_id219, %concat_index_from_operand_id114, %concat_index_from_operand_id09
  %128 = phi float [ %add.2013, %concat_index_from_operand_id09 ], [ %add.3918, %concat_index_from_operand_id114 ], [ %add.5623, %concat_index_from_operand_id219 ]
  br label %concatenate.pivot.500.47

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.48
  %129 = phi i32 [ 0, %concatenate.pivot.0.48 ]
  %130 = sub nsw i32 %27, %129
  %131 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %130
  %132 = load float, ptr %131, align 4, !invariant.load !26
  %133 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %130
  %134 = load float, ptr %133, align 4
  %135 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %130
  %136 = load float, ptr %135, align 4
  %multiply.2330 = fmul float %134, %136
  %137 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %130
  %138 = load float, ptr %137, align 4, !invariant.load !26
  %subtract.2431 = fsub float %multiply.2330, %138
  %region_0_89_constant_2532 = load float, ptr @7, align 4
  %multiply.2733 = fmul float %subtract.2431, %region_0_89_constant_2532
  %add.2834 = fadd float %132, %multiply.2733
  br label %concatenate.80.merge

concat_index_from_operand_id135:                  ; preds = %concatenate.pivot.500.50
  %139 = phi i32 [ 500, %concatenate.pivot.500.50 ]
  %140 = sub nsw i32 %27, %139
  %141 = mul nuw nsw i32 %140, 1
  %142 = add nuw nsw i32 0, %141
  %143 = urem i32 %142, 10
  %144 = udiv i32 %142, 10
  %145 = udiv i32 %144, 500
  %146 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %144, i32 %143
  %147 = load float, ptr %146, align 4, !invariant.load !26
  %148 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %144, i32 %143
  %149 = load float, ptr %148, align 4
  %150 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %144, i32 %143
  %151 = load float, ptr %150, align 4
  %multiply.4236 = fmul float %149, %151
  %152 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %144, i32 %143
  %153 = load float, ptr %152, align 4, !invariant.load !26
  %subtract.4337 = fsub float %multiply.4236, %153
  %region_0_89_constant_2538 = load float, ptr @7, align 4
  %multiply.4539 = fmul float %subtract.4337, %region_0_89_constant_2538
  %add.4640 = fadd float %147, %multiply.4539
  br label %concatenate.80.merge

concat_index_from_operand_id241:                  ; preds = %concatenate.pivot.5500.51
  %154 = phi i32 [ 5500, %concatenate.pivot.5500.51 ]
  %155 = sub nsw i32 %27, %154
  %156 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %155
  %157 = load float, ptr %156, align 4, !invariant.load !26
  %158 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %155
  %159 = load float, ptr %158, align 4
  %160 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %155
  %161 = load float, ptr %160, align 4
  %multiply.5942 = fmul float %159, %161
  %162 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %155
  %163 = load float, ptr %162, align 4, !invariant.load !26
  %subtract.6043 = fsub float %multiply.5942, %163
  %region_0_89_constant_2544 = load float, ptr @7, align 4
  %multiply.6245 = fmul float %subtract.6043, %region_0_89_constant_2544
  %add.6346 = fadd float %157, %multiply.6245
  br label %concatenate.80.merge

concatenate.pivot.500.47:                         ; preds = %concatenate.75.merge
  %164 = icmp ult i32 %27, 500
  br i1 %164, label %concatenate.pivot.0.48, label %concatenate.pivot.5500.49

concatenate.pivot.0.48:                           ; preds = %concatenate.pivot.500.47
  br label %concat_index_from_operand_id029

concatenate.pivot.5500.49:                        ; preds = %concatenate.pivot.500.47
  %165 = icmp ult i32 %27, 5500
  br i1 %165, label %concatenate.pivot.500.50, label %concatenate.pivot.5500.51

concatenate.pivot.500.50:                         ; preds = %concatenate.pivot.5500.49
  br label %concat_index_from_operand_id135

concatenate.pivot.5500.51:                        ; preds = %concatenate.pivot.5500.49
  br label %concat_index_from_operand_id241

concatenate.80.merge:                             ; preds = %concat_index_from_operand_id241, %concat_index_from_operand_id135, %concat_index_from_operand_id029
  %166 = phi float [ %add.2834, %concat_index_from_operand_id029 ], [ %add.4640, %concat_index_from_operand_id135 ], [ %add.6346, %concat_index_from_operand_id241 ]
  br label %concatenate.pivot.500.98

concat_index_from_operand_id053:                  ; preds = %concatenate.pivot.0.99
  %167 = phi i32 [ 0, %concatenate.pivot.0.99 ]
  %168 = sub nsw i32 %27, %167
  %169 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %168
  %170 = load float, ptr %169, align 4, !invariant.load !26
  %171 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %168
  %172 = load float, ptr %171, align 4, !invariant.load !26
  %173 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %168
  %174 = load float, ptr %173, align 4
  %175 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %168
  %176 = load float, ptr %175, align 4, !invariant.load !26
  %subtract.1654 = fsub float %174, %176
  %region_0_89_constant_1755 = load float, ptr @8, align 4
  %multiply.1956 = fmul float %subtract.1654, %region_0_89_constant_1755
  %add.2057 = fadd float %172, %multiply.1956
  %177 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.2258 = fmul float %add.2057, %177
  %178 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %168
  %179 = load float, ptr %178, align 4, !invariant.load !26
  %180 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %168
  %181 = load float, ptr %180, align 4
  %182 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %168
  %183 = load float, ptr %182, align 4
  %multiply.2359 = fmul float %181, %183
  %184 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %168
  %185 = load float, ptr %184, align 4, !invariant.load !26
  %subtract.2460 = fsub float %multiply.2359, %185
  %region_0_89_constant_2561 = load float, ptr @7, align 4
  %multiply.2762 = fmul float %subtract.2460, %region_0_89_constant_2561
  %add.2863 = fadd float %179, %multiply.2762
  %186 = call float @__nv_sqrtf(float %add.2863)
  %region_0_89_constant_3064 = load float, ptr @6, align 4
  %add.3265 = fadd float %186, %region_0_89_constant_3064
  %divide.3366 = fdiv float %multiply.2258, %add.3265
  %subtract.3467 = fsub float %170, %divide.3366
  br label %concatenate.70.merge52

concat_index_from_operand_id168:                  ; preds = %concatenate.pivot.500.101
  %187 = phi i32 [ 500, %concatenate.pivot.500.101 ]
  %188 = sub nsw i32 %27, %187
  %189 = mul nuw nsw i32 %188, 1
  %190 = add nuw nsw i32 0, %189
  %191 = urem i32 %190, 10
  %192 = udiv i32 %190, 10
  %193 = udiv i32 %192, 500
  %194 = getelementptr inbounds [500 x [10 x float]], ptr %5, i32 0, i32 %192, i32 %191
  %195 = load float, ptr %194, align 4, !invariant.load !26
  %196 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %192, i32 %191
  %197 = load float, ptr %196, align 4, !invariant.load !26
  %198 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %192, i32 %191
  %199 = load float, ptr %198, align 4
  %200 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %192, i32 %191
  %201 = load float, ptr %200, align 4, !invariant.load !26
  %subtract.3669 = fsub float %199, %201
  %region_0_89_constant_1770 = load float, ptr @8, align 4
  %multiply.3871 = fmul float %subtract.3669, %region_0_89_constant_1770
  %add.3972 = fadd float %197, %multiply.3871
  %202 = load float, ptr %6, align 4, !invariant.load !26
  %multiply.4173 = fmul float %add.3972, %202
  %203 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %192, i32 %191
  %204 = load float, ptr %203, align 4, !invariant.load !26
  %205 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %192, i32 %191
  %206 = load float, ptr %205, align 4
  %207 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %192, i32 %191
  %208 = load float, ptr %207, align 4
  %multiply.4274 = fmul float %206, %208
  %209 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %192, i32 %191
  %210 = load float, ptr %209, align 4, !invariant.load !26
  %subtract.4375 = fsub float %multiply.4274, %210
  %region_0_89_constant_2576 = load float, ptr @7, align 4
  %multiply.4577 = fmul float %subtract.4375, %region_0_89_constant_2576
  %add.4678 = fadd float %204, %multiply.4577
  %211 = call float @__nv_sqrtf(float %add.4678)
  %region_0_89_constant_3079 = load float, ptr @6, align 4
  %add.4980 = fadd float %211, %region_0_89_constant_3079
  %divide.5081 = fdiv float %multiply.4173, %add.4980
  %subtract.5182 = fsub float %195, %divide.5081
  br label %concatenate.70.merge52

concat_index_from_operand_id283:                  ; preds = %concatenate.pivot.5500.102
  %212 = phi i32 [ 5500, %concatenate.pivot.5500.102 ]
  %213 = sub nsw i32 %27, %212
  %214 = getelementptr inbounds [10 x float], ptr %10, i32 0, i32 %213
  %215 = load float, ptr %214, align 4, !invariant.load !26
  %216 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %213
  %217 = load float, ptr %216, align 4, !invariant.load !26
  %218 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %213
  %219 = load float, ptr %218, align 4
  %220 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %213
  %221 = load float, ptr %220, align 4, !invariant.load !26
  %subtract.5384 = fsub float %219, %221
  %region_0_89_constant_1785 = load float, ptr @8, align 4
  %multiply.5586 = fmul float %subtract.5384, %region_0_89_constant_1785
  %add.5687 = fadd float %217, %multiply.5586
  %222 = load float, ptr %11, align 4, !invariant.load !26
  %multiply.5888 = fmul float %add.5687, %222
  %223 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %213
  %224 = load float, ptr %223, align 4, !invariant.load !26
  %225 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %213
  %226 = load float, ptr %225, align 4
  %227 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %213
  %228 = load float, ptr %227, align 4
  %multiply.5989 = fmul float %226, %228
  %229 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %213
  %230 = load float, ptr %229, align 4, !invariant.load !26
  %subtract.6090 = fsub float %multiply.5989, %230
  %region_0_89_constant_2591 = load float, ptr @7, align 4
  %multiply.6292 = fmul float %subtract.6090, %region_0_89_constant_2591
  %add.6393 = fadd float %224, %multiply.6292
  %231 = call float @__nv_sqrtf(float %add.6393)
  %region_0_89_constant_3094 = load float, ptr @6, align 4
  %add.6695 = fadd float %231, %region_0_89_constant_3094
  %divide.6796 = fdiv float %multiply.5888, %add.6695
  %subtract.6897 = fsub float %215, %divide.6796
  br label %concatenate.70.merge52

concatenate.pivot.500.98:                         ; preds = %concatenate.80.merge
  %232 = icmp ult i32 %27, 500
  br i1 %232, label %concatenate.pivot.0.99, label %concatenate.pivot.5500.100

concatenate.pivot.0.99:                           ; preds = %concatenate.pivot.500.98
  br label %concat_index_from_operand_id053

concatenate.pivot.5500.100:                       ; preds = %concatenate.pivot.500.98
  %233 = icmp ult i32 %27, 5500
  br i1 %233, label %concatenate.pivot.500.101, label %concatenate.pivot.5500.102

concatenate.pivot.500.101:                        ; preds = %concatenate.pivot.5500.100
  br label %concat_index_from_operand_id168

concatenate.pivot.5500.102:                       ; preds = %concatenate.pivot.5500.100
  br label %concat_index_from_operand_id283

concatenate.70.merge52:                           ; preds = %concat_index_from_operand_id283, %concat_index_from_operand_id168, %concat_index_from_operand_id053
  %234 = phi float [ %subtract.3467, %concat_index_from_operand_id053 ], [ %subtract.5182, %concat_index_from_operand_id168 ], [ %subtract.6897, %concat_index_from_operand_id283 ]
  br label %concatenate.pivot.500.119

concat_index_from_operand_id0104:                 ; preds = %concatenate.pivot.0.120
  %235 = phi i32 [ 0, %concatenate.pivot.0.120 ]
  %236 = sub nsw i32 %27, %235
  %237 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %236
  %238 = load float, ptr %237, align 4, !invariant.load !26
  %239 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %236
  %240 = load float, ptr %239, align 4
  %241 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %236
  %242 = load float, ptr %241, align 4, !invariant.load !26
  %subtract.16105 = fsub float %240, %242
  %region_0_89_constant_17106 = load float, ptr @8, align 4
  %multiply.19107 = fmul float %subtract.16105, %region_0_89_constant_17106
  %add.20108 = fadd float %238, %multiply.19107
  br label %concatenate.75.merge103

concat_index_from_operand_id1109:                 ; preds = %concatenate.pivot.500.122
  %243 = phi i32 [ 500, %concatenate.pivot.500.122 ]
  %244 = sub nsw i32 %27, %243
  %245 = mul nuw nsw i32 %244, 1
  %246 = add nuw nsw i32 0, %245
  %247 = urem i32 %246, 10
  %248 = udiv i32 %246, 10
  %249 = udiv i32 %248, 500
  %250 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %248, i32 %247
  %251 = load float, ptr %250, align 4, !invariant.load !26
  %252 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %248, i32 %247
  %253 = load float, ptr %252, align 4
  %254 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %248, i32 %247
  %255 = load float, ptr %254, align 4, !invariant.load !26
  %subtract.36110 = fsub float %253, %255
  %region_0_89_constant_17111 = load float, ptr @8, align 4
  %multiply.38112 = fmul float %subtract.36110, %region_0_89_constant_17111
  %add.39113 = fadd float %251, %multiply.38112
  br label %concatenate.75.merge103

concat_index_from_operand_id2114:                 ; preds = %concatenate.pivot.5500.123
  %256 = phi i32 [ 5500, %concatenate.pivot.5500.123 ]
  %257 = sub nsw i32 %27, %256
  %258 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %257
  %259 = load float, ptr %258, align 4, !invariant.load !26
  %260 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %257
  %261 = load float, ptr %260, align 4
  %262 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %257
  %263 = load float, ptr %262, align 4, !invariant.load !26
  %subtract.53115 = fsub float %261, %263
  %region_0_89_constant_17116 = load float, ptr @8, align 4
  %multiply.55117 = fmul float %subtract.53115, %region_0_89_constant_17116
  %add.56118 = fadd float %259, %multiply.55117
  br label %concatenate.75.merge103

concatenate.pivot.500.119:                        ; preds = %concatenate.70.merge52
  %264 = icmp ult i32 %27, 500
  br i1 %264, label %concatenate.pivot.0.120, label %concatenate.pivot.5500.121

concatenate.pivot.0.120:                          ; preds = %concatenate.pivot.500.119
  br label %concat_index_from_operand_id0104

concatenate.pivot.5500.121:                       ; preds = %concatenate.pivot.500.119
  %265 = icmp ult i32 %27, 5500
  br i1 %265, label %concatenate.pivot.500.122, label %concatenate.pivot.5500.123

concatenate.pivot.500.122:                        ; preds = %concatenate.pivot.5500.121
  br label %concat_index_from_operand_id1109

concatenate.pivot.5500.123:                       ; preds = %concatenate.pivot.5500.121
  br label %concat_index_from_operand_id2114

concatenate.75.merge103:                          ; preds = %concat_index_from_operand_id2114, %concat_index_from_operand_id1109, %concat_index_from_operand_id0104
  %266 = phi float [ %add.20108, %concat_index_from_operand_id0104 ], [ %add.39113, %concat_index_from_operand_id1109 ], [ %add.56118, %concat_index_from_operand_id2114 ]
  br label %concatenate.pivot.500.143

concat_index_from_operand_id0125:                 ; preds = %concatenate.pivot.0.144
  %267 = phi i32 [ 0, %concatenate.pivot.0.144 ]
  %268 = sub nsw i32 %27, %267
  %269 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %268
  %270 = load float, ptr %269, align 4, !invariant.load !26
  %271 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %268
  %272 = load float, ptr %271, align 4
  %273 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %268
  %274 = load float, ptr %273, align 4
  %multiply.23126 = fmul float %272, %274
  %275 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %268
  %276 = load float, ptr %275, align 4, !invariant.load !26
  %subtract.24127 = fsub float %multiply.23126, %276
  %region_0_89_constant_25128 = load float, ptr @7, align 4
  %multiply.27129 = fmul float %subtract.24127, %region_0_89_constant_25128
  %add.28130 = fadd float %270, %multiply.27129
  br label %concatenate.80.merge124

concat_index_from_operand_id1131:                 ; preds = %concatenate.pivot.500.146
  %277 = phi i32 [ 500, %concatenate.pivot.500.146 ]
  %278 = sub nsw i32 %27, %277
  %279 = mul nuw nsw i32 %278, 1
  %280 = add nuw nsw i32 0, %279
  %281 = urem i32 %280, 10
  %282 = udiv i32 %280, 10
  %283 = udiv i32 %282, 500
  %284 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %282, i32 %281
  %285 = load float, ptr %284, align 4, !invariant.load !26
  %286 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %282, i32 %281
  %287 = load float, ptr %286, align 4
  %288 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %282, i32 %281
  %289 = load float, ptr %288, align 4
  %multiply.42132 = fmul float %287, %289
  %290 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %282, i32 %281
  %291 = load float, ptr %290, align 4, !invariant.load !26
  %subtract.43133 = fsub float %multiply.42132, %291
  %region_0_89_constant_25134 = load float, ptr @7, align 4
  %multiply.45135 = fmul float %subtract.43133, %region_0_89_constant_25134
  %add.46136 = fadd float %285, %multiply.45135
  br label %concatenate.80.merge124

concat_index_from_operand_id2137:                 ; preds = %concatenate.pivot.5500.147
  %292 = phi i32 [ 5500, %concatenate.pivot.5500.147 ]
  %293 = sub nsw i32 %27, %292
  %294 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %293
  %295 = load float, ptr %294, align 4, !invariant.load !26
  %296 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %293
  %297 = load float, ptr %296, align 4
  %298 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %293
  %299 = load float, ptr %298, align 4
  %multiply.59138 = fmul float %297, %299
  %300 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %293
  %301 = load float, ptr %300, align 4, !invariant.load !26
  %subtract.60139 = fsub float %multiply.59138, %301
  %region_0_89_constant_25140 = load float, ptr @7, align 4
  %multiply.62141 = fmul float %subtract.60139, %region_0_89_constant_25140
  %add.63142 = fadd float %295, %multiply.62141
  br label %concatenate.80.merge124

concatenate.pivot.500.143:                        ; preds = %concatenate.75.merge103
  %302 = icmp ult i32 %27, 500
  br i1 %302, label %concatenate.pivot.0.144, label %concatenate.pivot.5500.145

concatenate.pivot.0.144:                          ; preds = %concatenate.pivot.500.143
  br label %concat_index_from_operand_id0125

concatenate.pivot.5500.145:                       ; preds = %concatenate.pivot.500.143
  %303 = icmp ult i32 %27, 5500
  br i1 %303, label %concatenate.pivot.500.146, label %concatenate.pivot.5500.147

concatenate.pivot.500.146:                        ; preds = %concatenate.pivot.5500.145
  br label %concat_index_from_operand_id1131

concatenate.pivot.5500.147:                       ; preds = %concatenate.pivot.5500.145
  br label %concat_index_from_operand_id2137

concatenate.80.merge124:                          ; preds = %concat_index_from_operand_id2137, %concat_index_from_operand_id1131, %concat_index_from_operand_id0125
  %304 = phi float [ %add.28130, %concat_index_from_operand_id0125 ], [ %add.46136, %concat_index_from_operand_id1131 ], [ %add.63142, %concat_index_from_operand_id2137 ]
  br label %concatenate.pivot.500.194

concat_index_from_operand_id0149:                 ; preds = %concatenate.pivot.0.195
  %305 = phi i32 [ 0, %concatenate.pivot.0.195 ]
  %306 = sub nsw i32 %27, %305
  %307 = getelementptr inbounds [500 x float], ptr %0, i32 0, i32 %306
  %308 = load float, ptr %307, align 4, !invariant.load !26
  %309 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %306
  %310 = load float, ptr %309, align 4, !invariant.load !26
  %311 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %306
  %312 = load float, ptr %311, align 4
  %313 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %306
  %314 = load float, ptr %313, align 4, !invariant.load !26
  %subtract.16150 = fsub float %312, %314
  %region_0_89_constant_17151 = load float, ptr @8, align 4
  %multiply.19152 = fmul float %subtract.16150, %region_0_89_constant_17151
  %add.20153 = fadd float %310, %multiply.19152
  %315 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.22154 = fmul float %add.20153, %315
  %316 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %306
  %317 = load float, ptr %316, align 4, !invariant.load !26
  %318 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %306
  %319 = load float, ptr %318, align 4
  %320 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %306
  %321 = load float, ptr %320, align 4
  %multiply.23155 = fmul float %319, %321
  %322 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %306
  %323 = load float, ptr %322, align 4, !invariant.load !26
  %subtract.24156 = fsub float %multiply.23155, %323
  %region_0_89_constant_25157 = load float, ptr @7, align 4
  %multiply.27158 = fmul float %subtract.24156, %region_0_89_constant_25157
  %add.28159 = fadd float %317, %multiply.27158
  %324 = call float @__nv_sqrtf(float %add.28159)
  %region_0_89_constant_30160 = load float, ptr @6, align 4
  %add.32161 = fadd float %324, %region_0_89_constant_30160
  %divide.33162 = fdiv float %multiply.22154, %add.32161
  %subtract.34163 = fsub float %308, %divide.33162
  br label %concatenate.70.merge148

concat_index_from_operand_id1164:                 ; preds = %concatenate.pivot.500.197
  %325 = phi i32 [ 500, %concatenate.pivot.500.197 ]
  %326 = sub nsw i32 %27, %325
  %327 = mul nuw nsw i32 %326, 1
  %328 = add nuw nsw i32 0, %327
  %329 = urem i32 %328, 10
  %330 = udiv i32 %328, 10
  %331 = udiv i32 %330, 500
  %332 = getelementptr inbounds [500 x [10 x float]], ptr %5, i32 0, i32 %330, i32 %329
  %333 = load float, ptr %332, align 4, !invariant.load !26
  %334 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %330, i32 %329
  %335 = load float, ptr %334, align 4, !invariant.load !26
  %336 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %330, i32 %329
  %337 = load float, ptr %336, align 4
  %338 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %330, i32 %329
  %339 = load float, ptr %338, align 4, !invariant.load !26
  %subtract.36165 = fsub float %337, %339
  %region_0_89_constant_17166 = load float, ptr @8, align 4
  %multiply.38167 = fmul float %subtract.36165, %region_0_89_constant_17166
  %add.39168 = fadd float %335, %multiply.38167
  %340 = load float, ptr %6, align 4, !invariant.load !26
  %multiply.41169 = fmul float %add.39168, %340
  %341 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %330, i32 %329
  %342 = load float, ptr %341, align 4, !invariant.load !26
  %343 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %330, i32 %329
  %344 = load float, ptr %343, align 4
  %345 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %330, i32 %329
  %346 = load float, ptr %345, align 4
  %multiply.42170 = fmul float %344, %346
  %347 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %330, i32 %329
  %348 = load float, ptr %347, align 4, !invariant.load !26
  %subtract.43171 = fsub float %multiply.42170, %348
  %region_0_89_constant_25172 = load float, ptr @7, align 4
  %multiply.45173 = fmul float %subtract.43171, %region_0_89_constant_25172
  %add.46174 = fadd float %342, %multiply.45173
  %349 = call float @__nv_sqrtf(float %add.46174)
  %region_0_89_constant_30175 = load float, ptr @6, align 4
  %add.49176 = fadd float %349, %region_0_89_constant_30175
  %divide.50177 = fdiv float %multiply.41169, %add.49176
  %subtract.51178 = fsub float %333, %divide.50177
  br label %concatenate.70.merge148

concat_index_from_operand_id2179:                 ; preds = %concatenate.pivot.5500.198
  %350 = phi i32 [ 5500, %concatenate.pivot.5500.198 ]
  %351 = sub nsw i32 %27, %350
  %352 = getelementptr inbounds [10 x float], ptr %10, i32 0, i32 %351
  %353 = load float, ptr %352, align 4, !invariant.load !26
  %354 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %351
  %355 = load float, ptr %354, align 4, !invariant.load !26
  %356 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %351
  %357 = load float, ptr %356, align 4
  %358 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %351
  %359 = load float, ptr %358, align 4, !invariant.load !26
  %subtract.53180 = fsub float %357, %359
  %region_0_89_constant_17181 = load float, ptr @8, align 4
  %multiply.55182 = fmul float %subtract.53180, %region_0_89_constant_17181
  %add.56183 = fadd float %355, %multiply.55182
  %360 = load float, ptr %11, align 4, !invariant.load !26
  %multiply.58184 = fmul float %add.56183, %360
  %361 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %351
  %362 = load float, ptr %361, align 4, !invariant.load !26
  %363 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %351
  %364 = load float, ptr %363, align 4
  %365 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %351
  %366 = load float, ptr %365, align 4
  %multiply.59185 = fmul float %364, %366
  %367 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %351
  %368 = load float, ptr %367, align 4, !invariant.load !26
  %subtract.60186 = fsub float %multiply.59185, %368
  %region_0_89_constant_25187 = load float, ptr @7, align 4
  %multiply.62188 = fmul float %subtract.60186, %region_0_89_constant_25187
  %add.63189 = fadd float %362, %multiply.62188
  %369 = call float @__nv_sqrtf(float %add.63189)
  %region_0_89_constant_30190 = load float, ptr @6, align 4
  %add.66191 = fadd float %369, %region_0_89_constant_30190
  %divide.67192 = fdiv float %multiply.58184, %add.66191
  %subtract.68193 = fsub float %353, %divide.67192
  br label %concatenate.70.merge148

concatenate.pivot.500.194:                        ; preds = %concatenate.80.merge124
  %370 = icmp ult i32 %27, 500
  br i1 %370, label %concatenate.pivot.0.195, label %concatenate.pivot.5500.196

concatenate.pivot.0.195:                          ; preds = %concatenate.pivot.500.194
  br label %concat_index_from_operand_id0149

concatenate.pivot.5500.196:                       ; preds = %concatenate.pivot.500.194
  %371 = icmp ult i32 %27, 5500
  br i1 %371, label %concatenate.pivot.500.197, label %concatenate.pivot.5500.198

concatenate.pivot.500.197:                        ; preds = %concatenate.pivot.5500.196
  br label %concat_index_from_operand_id1164

concatenate.pivot.5500.198:                       ; preds = %concatenate.pivot.5500.196
  br label %concat_index_from_operand_id2179

concatenate.70.merge148:                          ; preds = %concat_index_from_operand_id2179, %concat_index_from_operand_id1164, %concat_index_from_operand_id0149
  %372 = phi float [ %subtract.34163, %concat_index_from_operand_id0149 ], [ %subtract.51178, %concat_index_from_operand_id1164 ], [ %subtract.68193, %concat_index_from_operand_id2179 ]
  br label %concatenate.pivot.500.215

concat_index_from_operand_id0200:                 ; preds = %concatenate.pivot.0.216
  %373 = phi i32 [ 0, %concatenate.pivot.0.216 ]
  %374 = sub nsw i32 %27, %373
  %375 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %374
  %376 = load float, ptr %375, align 4, !invariant.load !26
  %377 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %374
  %378 = load float, ptr %377, align 4
  %379 = getelementptr inbounds [500 x float], ptr %2, i32 0, i32 %374
  %380 = load float, ptr %379, align 4, !invariant.load !26
  %subtract.16201 = fsub float %378, %380
  %region_0_89_constant_17202 = load float, ptr @8, align 4
  %multiply.19203 = fmul float %subtract.16201, %region_0_89_constant_17202
  %add.20204 = fadd float %376, %multiply.19203
  br label %concatenate.75.merge199

concat_index_from_operand_id1205:                 ; preds = %concatenate.pivot.500.218
  %381 = phi i32 [ 500, %concatenate.pivot.500.218 ]
  %382 = sub nsw i32 %27, %381
  %383 = mul nuw nsw i32 %382, 1
  %384 = add nuw nsw i32 0, %383
  %385 = urem i32 %384, 10
  %386 = udiv i32 %384, 10
  %387 = udiv i32 %386, 500
  %388 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %386, i32 %385
  %389 = load float, ptr %388, align 4, !invariant.load !26
  %390 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %386, i32 %385
  %391 = load float, ptr %390, align 4
  %392 = getelementptr inbounds [500 x [10 x float]], ptr %7, i32 0, i32 %386, i32 %385
  %393 = load float, ptr %392, align 4, !invariant.load !26
  %subtract.36206 = fsub float %391, %393
  %region_0_89_constant_17207 = load float, ptr @8, align 4
  %multiply.38208 = fmul float %subtract.36206, %region_0_89_constant_17207
  %add.39209 = fadd float %389, %multiply.38208
  br label %concatenate.75.merge199

concat_index_from_operand_id2210:                 ; preds = %concatenate.pivot.5500.219
  %394 = phi i32 [ 5500, %concatenate.pivot.5500.219 ]
  %395 = sub nsw i32 %27, %394
  %396 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %395
  %397 = load float, ptr %396, align 4, !invariant.load !26
  %398 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %395
  %399 = load float, ptr %398, align 4
  %400 = getelementptr inbounds [10 x float], ptr %12, i32 0, i32 %395
  %401 = load float, ptr %400, align 4, !invariant.load !26
  %subtract.53211 = fsub float %399, %401
  %region_0_89_constant_17212 = load float, ptr @8, align 4
  %multiply.55213 = fmul float %subtract.53211, %region_0_89_constant_17212
  %add.56214 = fadd float %397, %multiply.55213
  br label %concatenate.75.merge199

concatenate.pivot.500.215:                        ; preds = %concatenate.70.merge148
  %402 = icmp ult i32 %27, 500
  br i1 %402, label %concatenate.pivot.0.216, label %concatenate.pivot.5500.217

concatenate.pivot.0.216:                          ; preds = %concatenate.pivot.500.215
  br label %concat_index_from_operand_id0200

concatenate.pivot.5500.217:                       ; preds = %concatenate.pivot.500.215
  %403 = icmp ult i32 %27, 5500
  br i1 %403, label %concatenate.pivot.500.218, label %concatenate.pivot.5500.219

concatenate.pivot.500.218:                        ; preds = %concatenate.pivot.5500.217
  br label %concat_index_from_operand_id1205

concatenate.pivot.5500.219:                       ; preds = %concatenate.pivot.5500.217
  br label %concat_index_from_operand_id2210

concatenate.75.merge199:                          ; preds = %concat_index_from_operand_id2210, %concat_index_from_operand_id1205, %concat_index_from_operand_id0200
  %404 = phi float [ %add.20204, %concat_index_from_operand_id0200 ], [ %add.39209, %concat_index_from_operand_id1205 ], [ %add.56214, %concat_index_from_operand_id2210 ]
  br label %concatenate.pivot.500.239

concat_index_from_operand_id0221:                 ; preds = %concatenate.pivot.0.240
  %405 = phi i32 [ 0, %concatenate.pivot.0.240 ]
  %406 = sub nsw i32 %27, %405
  %407 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %406
  %408 = load float, ptr %407, align 4, !invariant.load !26
  %409 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %406
  %410 = load float, ptr %409, align 4
  %411 = getelementptr inbounds [500 x float], ptr %3, i32 0, i32 %406
  %412 = load float, ptr %411, align 4
  %multiply.23222 = fmul float %410, %412
  %413 = getelementptr inbounds [500 x float], ptr %4, i32 0, i32 %406
  %414 = load float, ptr %413, align 4, !invariant.load !26
  %subtract.24223 = fsub float %multiply.23222, %414
  %region_0_89_constant_25224 = load float, ptr @7, align 4
  %multiply.27225 = fmul float %subtract.24223, %region_0_89_constant_25224
  %add.28226 = fadd float %408, %multiply.27225
  br label %concatenate.80.merge220

concat_index_from_operand_id1227:                 ; preds = %concatenate.pivot.500.242
  %415 = phi i32 [ 500, %concatenate.pivot.500.242 ]
  %416 = sub nsw i32 %27, %415
  %417 = mul nuw nsw i32 %416, 1
  %418 = add nuw nsw i32 0, %417
  %419 = urem i32 %418, 10
  %420 = udiv i32 %418, 10
  %421 = udiv i32 %420, 500
  %422 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %420, i32 %419
  %423 = load float, ptr %422, align 4, !invariant.load !26
  %424 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %420, i32 %419
  %425 = load float, ptr %424, align 4
  %426 = getelementptr inbounds [500 x [10 x float]], ptr %8, i32 0, i32 %420, i32 %419
  %427 = load float, ptr %426, align 4
  %multiply.42228 = fmul float %425, %427
  %428 = getelementptr inbounds [500 x [10 x float]], ptr %9, i32 0, i32 %420, i32 %419
  %429 = load float, ptr %428, align 4, !invariant.load !26
  %subtract.43229 = fsub float %multiply.42228, %429
  %region_0_89_constant_25230 = load float, ptr @7, align 4
  %multiply.45231 = fmul float %subtract.43229, %region_0_89_constant_25230
  %add.46232 = fadd float %423, %multiply.45231
  br label %concatenate.80.merge220

concat_index_from_operand_id2233:                 ; preds = %concatenate.pivot.5500.243
  %430 = phi i32 [ 5500, %concatenate.pivot.5500.243 ]
  %431 = sub nsw i32 %27, %430
  %432 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %431
  %433 = load float, ptr %432, align 4, !invariant.load !26
  %434 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %431
  %435 = load float, ptr %434, align 4
  %436 = getelementptr inbounds [10 x float], ptr %13, i32 0, i32 %431
  %437 = load float, ptr %436, align 4
  %multiply.59234 = fmul float %435, %437
  %438 = getelementptr inbounds [10 x float], ptr %14, i32 0, i32 %431
  %439 = load float, ptr %438, align 4, !invariant.load !26
  %subtract.60235 = fsub float %multiply.59234, %439
  %region_0_89_constant_25236 = load float, ptr @7, align 4
  %multiply.62237 = fmul float %subtract.60235, %region_0_89_constant_25236
  %add.63238 = fadd float %433, %multiply.62237
  br label %concatenate.80.merge220

concatenate.pivot.500.239:                        ; preds = %concatenate.75.merge199
  %440 = icmp ult i32 %27, 500
  br i1 %440, label %concatenate.pivot.0.240, label %concatenate.pivot.5500.241

concatenate.pivot.0.240:                          ; preds = %concatenate.pivot.500.239
  br label %concat_index_from_operand_id0221

concatenate.pivot.5500.241:                       ; preds = %concatenate.pivot.500.239
  %441 = icmp ult i32 %27, 5500
  br i1 %441, label %concatenate.pivot.500.242, label %concatenate.pivot.5500.243

concatenate.pivot.500.242:                        ; preds = %concatenate.pivot.5500.241
  br label %concat_index_from_operand_id1227

concatenate.pivot.5500.243:                       ; preds = %concatenate.pivot.5500.241
  br label %concat_index_from_operand_id2233

concatenate.80.merge220:                          ; preds = %concat_index_from_operand_id2233, %concat_index_from_operand_id1227, %concat_index_from_operand_id0221
  %442 = phi float [ %add.28226, %concat_index_from_operand_id0221 ], [ %add.46232, %concat_index_from_operand_id1227 ], [ %add.63238, %concat_index_from_operand_id2233 ]
  %443 = icmp sge i32 %27, 0
  %444 = icmp slt i32 %27, 500
  %445 = and i1 %443, %444
  br i1 %445, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.80.merge220
  %446 = icmp sge i32 %27, 0
  %447 = icmp slt i32 %27, 500
  %448 = and i1 %446, %447
  br i1 %448, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %449 = icmp sge i32 %27, 0
  %450 = icmp slt i32 %27, 500
  %451 = and i1 %449, %450
  br i1 %451, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %452 = icmp sge i32 %27, 500
  %453 = icmp slt i32 %27, 5500
  %454 = and i1 %452, %453
  br i1 %454, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  %455 = icmp sge i32 %27, 500
  %456 = icmp slt i32 %27, 5500
  %457 = and i1 %455, %456
  br i1 %457, label %slice4-true, label %slice4-after

slice4-after:                                     ; preds = %slice4-true, %slice3-after
  %458 = icmp sge i32 %27, 500
  %459 = icmp slt i32 %27, 5500
  %460 = and i1 %458, %459
  br i1 %460, label %slice5-true, label %slice5-after

slice5-after:                                     ; preds = %slice5-true, %slice4-after
  %461 = icmp sge i32 %27, 5500
  %462 = icmp slt i32 %27, 5510
  %463 = and i1 %461, %462
  br i1 %463, label %slice6-true, label %slice6-after

slice6-after:                                     ; preds = %slice6-true, %slice5-after
  %464 = icmp sge i32 %27, 5500
  %465 = icmp slt i32 %27, 5510
  %466 = and i1 %464, %465
  br i1 %466, label %slice7-true, label %slice7-after

slice7-after:                                     ; preds = %slice7-true, %slice6-after
  %467 = icmp sge i32 %27, 5500
  %468 = icmp slt i32 %27, 5510
  %469 = and i1 %467, %468
  br i1 %469, label %slice8-true, label %slice8-after

slice8-after:                                     ; preds = %slice8-true, %slice7-after
  br label %fusion_18.in_bounds-after

slice0-true:                                      ; preds = %concatenate.80.merge220
  %470 = sub i32 %27, 0
  %471 = getelementptr inbounds [500 x float], ptr %15, i32 0, i32 %470
  store float %96, ptr %471, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %472 = sub i32 %27, 0
  %473 = getelementptr inbounds [500 x float], ptr %16, i32 0, i32 %472
  store float %128, ptr %473, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %474 = sub i32 %27, 0
  %475 = getelementptr inbounds [500 x float], ptr %17, i32 0, i32 %474
  store float %166, ptr %475, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %476 = sub i32 %27, 500
  %477 = getelementptr inbounds [5000 x float], ptr %18, i32 0, i32 %476
  store float %234, ptr %477, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %478 = sub i32 %27, 500
  %479 = getelementptr inbounds [5000 x float], ptr %19, i32 0, i32 %478
  store float %266, ptr %479, align 4
  br label %slice4-after

slice5-true:                                      ; preds = %slice4-after
  %480 = sub i32 %27, 500
  %481 = getelementptr inbounds [5000 x float], ptr %20, i32 0, i32 %480
  store float %304, ptr %481, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %482 = sub i32 %27, 5500
  %483 = getelementptr inbounds [10 x float], ptr %21, i32 0, i32 %482
  store float %372, ptr %483, align 4
  br label %slice6-after

slice7-true:                                      ; preds = %slice6-after
  %484 = sub i32 %27, 5500
  %485 = getelementptr inbounds [10 x float], ptr %22, i32 0, i32 %484
  store float %404, ptr %485, align 4
  br label %slice7-after

slice8-true:                                      ; preds = %slice7-after
  %486 = sub i32 %27, 5500
  %487 = getelementptr inbounds [10 x float], ptr %23, i32 0, i32 %486
  store float %442, ptr %487, align 4
  br label %slice8-after
}

define void @fusion_9(ptr noalias align 16 dereferenceable(1568000) %alloc2, ptr noalias align 16 dereferenceable(1568000) %alloc8, ptr noalias align 16 dereferenceable(1568000) %alloc9, ptr noalias align 128 dereferenceable(1568000) %alloc16, ptr noalias align 128 dereferenceable(1568000) %alloc17, ptr noalias align 128 dereferenceable(1568000) %alloc18, ptr noalias align 128 dereferenceable(328) %temp_buf) {
entry:
  %loop.invar_address = alloca i32, align 4
  %0 = getelementptr inbounds i8, ptr %alloc2, i64 0
  %1 = getelementptr inbounds i8, ptr %temp_buf, i64 0
  %2 = getelementptr inbounds i8, ptr %alloc8, i64 0
  %3 = getelementptr inbounds i8, ptr %alloc18, i64 0
  %4 = getelementptr inbounds i8, ptr %alloc9, i64 0
  %5 = getelementptr inbounds i8, ptr %alloc16, i64 0
  %6 = getelementptr inbounds i8, ptr %alloc17, i64 0
  %7 = getelementptr inbounds i8, ptr %alloc18, i64 0
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_9.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %8 = icmp uge i32 %loop.indvar, 392000
  br i1 %8, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 24576
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %9 = icmp eq i32 %loop.indvar, 0
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %12 = mul nuw nsw i32 %10, 128
  %linear_index = add nuw nsw i32 %12, %11
  %linear_index_in_range = icmp ult i32 %linear_index, 6144
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %13 = udiv i32 %linear_index_plus_base, 1
  %14 = urem i32 %13, 500
  %15 = udiv i32 %linear_index_plus_base, 500
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %16 = udiv i32 %linear_index1, 1
  %17 = urem i32 %16, 500
  %18 = udiv i32 %linear_index1, 500
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 500
  %21 = udiv i32 %linear_index2, 500
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %22 = udiv i32 %linear_index3, 1
  %23 = urem i32 %22, 500
  %24 = udiv i32 %linear_index3, 500
  %25 = icmp ult i32 %linear_index_plus_base, 392000
  br i1 %25, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !36

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_9.in_bounds-true:                          ; preds = %loop.loop_body
  %26 = getelementptr inbounds float, ptr %0, i32 %linear_index_plus_base
  %27 = load float, ptr %26, align 4, !invariant.load !26
  %28 = getelementptr inbounds float, ptr %2, i32 %linear_index_plus_base
  %29 = load float, ptr %28, align 4, !invariant.load !26
  %30 = getelementptr inbounds float, ptr %3, i32 %linear_index_plus_base
  %31 = load float, ptr %30, align 4
  %32 = getelementptr inbounds float, ptr %2, i32 %linear_index_plus_base
  %33 = load float, ptr %32, align 4, !invariant.load !26
  %subtract.6 = fsub float %31, %33
  %region_0_26_constant_7 = load float, ptr @10, align 4
  %multiply.9 = fmul float %subtract.6, %region_0_26_constant_7
  %add.10 = fadd float %29, %multiply.9
  %34 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.12 = fmul float %add.10, %34
  %35 = getelementptr inbounds float, ptr %4, i32 %linear_index_plus_base
  %36 = load float, ptr %35, align 4, !invariant.load !26
  %37 = getelementptr inbounds float, ptr %3, i32 %linear_index_plus_base
  %38 = load float, ptr %37, align 4
  %39 = getelementptr inbounds float, ptr %3, i32 %linear_index_plus_base
  %40 = load float, ptr %39, align 4
  %multiply.13 = fmul float %38, %40
  %41 = getelementptr inbounds float, ptr %4, i32 %linear_index_plus_base
  %42 = load float, ptr %41, align 4, !invariant.load !26
  %subtract.14 = fsub float %multiply.13, %42
  %region_0_26_constant_15 = load float, ptr @9, align 4
  %multiply.17 = fmul float %subtract.14, %region_0_26_constant_15
  %add.18 = fadd float %36, %multiply.17
  %43 = call float @__nv_sqrtf(float %add.18)
  %region_0_26_constant_20 = load float, ptr @11, align 4
  %add.22 = fadd float %43, %region_0_26_constant_20
  %divide.23 = fdiv float %multiply.12, %add.22
  %subtract.24 = fsub float %27, %divide.23
  %44 = insertvalue { float, float, float } undef, float %subtract.24, 0
  %45 = insertvalue { float, float, float } %44, float %add.10, 1
  %46 = insertvalue { float, float, float } %45, float %add.18, 2
  %47 = extractvalue { float, float, float } %46, 0
  %48 = getelementptr inbounds float, ptr %5, i32 %linear_index_plus_base
  store float %47, ptr %48, align 4
  %49 = extractvalue { float, float, float } %46, 1
  %50 = getelementptr inbounds float, ptr %6, i32 %linear_index_plus_base
  store float %49, ptr %50, align 4
  %51 = extractvalue { float, float, float } %46, 2
  %52 = getelementptr inbounds float, ptr %7, i32 %linear_index_plus_base
  store float %51, ptr %52, align 4
  %53 = getelementptr inbounds float, ptr %0, i32 %linear_index1
  %54 = load float, ptr %53, align 4, !invariant.load !26
  %55 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  %56 = load float, ptr %55, align 4, !invariant.load !26
  %57 = getelementptr inbounds float, ptr %3, i32 %linear_index1
  %58 = load float, ptr %57, align 4
  %59 = getelementptr inbounds float, ptr %2, i32 %linear_index1
  %60 = load float, ptr %59, align 4, !invariant.load !26
  %subtract.61 = fsub float %58, %60
  %region_0_26_constant_72 = load float, ptr @10, align 4
  %multiply.93 = fmul float %subtract.61, %region_0_26_constant_72
  %add.104 = fadd float %56, %multiply.93
  %61 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.125 = fmul float %add.104, %61
  %62 = getelementptr inbounds float, ptr %4, i32 %linear_index1
  %63 = load float, ptr %62, align 4, !invariant.load !26
  %64 = getelementptr inbounds float, ptr %3, i32 %linear_index1
  %65 = load float, ptr %64, align 4
  %66 = getelementptr inbounds float, ptr %3, i32 %linear_index1
  %67 = load float, ptr %66, align 4
  %multiply.136 = fmul float %65, %67
  %68 = getelementptr inbounds float, ptr %4, i32 %linear_index1
  %69 = load float, ptr %68, align 4, !invariant.load !26
  %subtract.147 = fsub float %multiply.136, %69
  %region_0_26_constant_158 = load float, ptr @9, align 4
  %multiply.179 = fmul float %subtract.147, %region_0_26_constant_158
  %add.1810 = fadd float %63, %multiply.179
  %70 = call float @__nv_sqrtf(float %add.1810)
  %region_0_26_constant_2011 = load float, ptr @11, align 4
  %add.2212 = fadd float %70, %region_0_26_constant_2011
  %divide.2313 = fdiv float %multiply.125, %add.2212
  %subtract.2414 = fsub float %54, %divide.2313
  %71 = insertvalue { float, float, float } undef, float %subtract.2414, 0
  %72 = insertvalue { float, float, float } %71, float %add.104, 1
  %73 = insertvalue { float, float, float } %72, float %add.1810, 2
  %74 = extractvalue { float, float, float } %73, 0
  %75 = getelementptr inbounds float, ptr %5, i32 %linear_index1
  store float %74, ptr %75, align 4
  %76 = extractvalue { float, float, float } %73, 1
  %77 = getelementptr inbounds float, ptr %6, i32 %linear_index1
  store float %76, ptr %77, align 4
  %78 = extractvalue { float, float, float } %73, 2
  %79 = getelementptr inbounds float, ptr %7, i32 %linear_index1
  store float %78, ptr %79, align 4
  %80 = getelementptr inbounds float, ptr %0, i32 %linear_index2
  %81 = load float, ptr %80, align 4, !invariant.load !26
  %82 = getelementptr inbounds float, ptr %2, i32 %linear_index2
  %83 = load float, ptr %82, align 4, !invariant.load !26
  %84 = getelementptr inbounds float, ptr %3, i32 %linear_index2
  %85 = load float, ptr %84, align 4
  %86 = getelementptr inbounds float, ptr %2, i32 %linear_index2
  %87 = load float, ptr %86, align 4, !invariant.load !26
  %subtract.615 = fsub float %85, %87
  %region_0_26_constant_716 = load float, ptr @10, align 4
  %multiply.917 = fmul float %subtract.615, %region_0_26_constant_716
  %add.1018 = fadd float %83, %multiply.917
  %88 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.1219 = fmul float %add.1018, %88
  %89 = getelementptr inbounds float, ptr %4, i32 %linear_index2
  %90 = load float, ptr %89, align 4, !invariant.load !26
  %91 = getelementptr inbounds float, ptr %3, i32 %linear_index2
  %92 = load float, ptr %91, align 4
  %93 = getelementptr inbounds float, ptr %3, i32 %linear_index2
  %94 = load float, ptr %93, align 4
  %multiply.1320 = fmul float %92, %94
  %95 = getelementptr inbounds float, ptr %4, i32 %linear_index2
  %96 = load float, ptr %95, align 4, !invariant.load !26
  %subtract.1421 = fsub float %multiply.1320, %96
  %region_0_26_constant_1522 = load float, ptr @9, align 4
  %multiply.1723 = fmul float %subtract.1421, %region_0_26_constant_1522
  %add.1824 = fadd float %90, %multiply.1723
  %97 = call float @__nv_sqrtf(float %add.1824)
  %region_0_26_constant_2025 = load float, ptr @11, align 4
  %add.2226 = fadd float %97, %region_0_26_constant_2025
  %divide.2327 = fdiv float %multiply.1219, %add.2226
  %subtract.2428 = fsub float %81, %divide.2327
  %98 = insertvalue { float, float, float } undef, float %subtract.2428, 0
  %99 = insertvalue { float, float, float } %98, float %add.1018, 1
  %100 = insertvalue { float, float, float } %99, float %add.1824, 2
  %101 = extractvalue { float, float, float } %100, 0
  %102 = getelementptr inbounds float, ptr %5, i32 %linear_index2
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float } %100, 1
  %104 = getelementptr inbounds float, ptr %6, i32 %linear_index2
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float } %100, 2
  %106 = getelementptr inbounds float, ptr %7, i32 %linear_index2
  store float %105, ptr %106, align 4
  %107 = getelementptr inbounds float, ptr %0, i32 %linear_index3
  %108 = load float, ptr %107, align 4, !invariant.load !26
  %109 = getelementptr inbounds float, ptr %2, i32 %linear_index3
  %110 = load float, ptr %109, align 4, !invariant.load !26
  %111 = getelementptr inbounds float, ptr %3, i32 %linear_index3
  %112 = load float, ptr %111, align 4
  %113 = getelementptr inbounds float, ptr %2, i32 %linear_index3
  %114 = load float, ptr %113, align 4, !invariant.load !26
  %subtract.629 = fsub float %112, %114
  %region_0_26_constant_730 = load float, ptr @10, align 4
  %multiply.931 = fmul float %subtract.629, %region_0_26_constant_730
  %add.1032 = fadd float %110, %multiply.931
  %115 = load float, ptr %1, align 4, !invariant.load !26
  %multiply.1233 = fmul float %add.1032, %115
  %116 = getelementptr inbounds float, ptr %4, i32 %linear_index3
  %117 = load float, ptr %116, align 4, !invariant.load !26
  %118 = getelementptr inbounds float, ptr %3, i32 %linear_index3
  %119 = load float, ptr %118, align 4
  %120 = getelementptr inbounds float, ptr %3, i32 %linear_index3
  %121 = load float, ptr %120, align 4
  %multiply.1334 = fmul float %119, %121
  %122 = getelementptr inbounds float, ptr %4, i32 %linear_index3
  %123 = load float, ptr %122, align 4, !invariant.load !26
  %subtract.1435 = fsub float %multiply.1334, %123
  %region_0_26_constant_1536 = load float, ptr @9, align 4
  %multiply.1737 = fmul float %subtract.1435, %region_0_26_constant_1536
  %add.1838 = fadd float %117, %multiply.1737
  %124 = call float @__nv_sqrtf(float %add.1838)
  %region_0_26_constant_2039 = load float, ptr @11, align 4
  %add.2240 = fadd float %124, %region_0_26_constant_2039
  %divide.2341 = fdiv float %multiply.1233, %add.2240
  %subtract.2442 = fsub float %108, %divide.2341
  %125 = insertvalue { float, float, float } undef, float %subtract.2442, 0
  %126 = insertvalue { float, float, float } %125, float %add.1032, 1
  %127 = insertvalue { float, float, float } %126, float %add.1838, 2
  %128 = extractvalue { float, float, float } %127, 0
  %129 = getelementptr inbounds float, ptr %5, i32 %linear_index3
  store float %128, ptr %129, align 4
  %130 = extractvalue { float, float, float } %127, 1
  %131 = getelementptr inbounds float, ptr %6, i32 %linear_index3
  store float %130, ptr %131, align 4
  %132 = extractvalue { float, float, float } %127, 2
  %133 = getelementptr inbounds float, ptr %7, i32 %linear_index3
  store float %132, ptr %133, align 4
  br label %fusion_9.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24}

!0 = !{ptr @fusion_11, !"kernel", i32 1}
!1 = !{ptr @fusion_11, !"reqntidx", i32 1}
!2 = !{ptr @broadcast_45, !"kernel", i32 1}
!3 = !{ptr @broadcast_45, !"reqntidx", i32 25}
!4 = !{ptr @broadcast_25, !"kernel", i32 1}
!5 = !{ptr @broadcast_25, !"reqntidx", i32 125}
!6 = !{ptr @broadcast_25, !"reqntidy", i32 2}
!7 = !{ptr @fusion_16, !"kernel", i32 1}
!8 = !{ptr @fusion_16, !"reqntidx", i32 256}
!9 = !{ptr @reduce_66, !"kernel", i32 1}
!10 = !{ptr @reduce_66, !"reqntidx", i32 5}
!11 = !{ptr @fusion_17, !"kernel", i32 1}
!12 = !{ptr @fusion_17, !"reqntidx", i32 5}
!13 = !{ptr @fusion_14, !"kernel", i32 1}
!14 = !{ptr @fusion_14, !"reqntidx", i32 25}
!15 = !{ptr @reduce_158, !"kernel", i32 1}
!16 = !{ptr @reduce_158, !"reqntidx", i32 5}
!17 = !{ptr @fusion_13, !"kernel", i32 1}
!18 = !{ptr @fusion_13, !"reqntidx", i32 256}
!19 = !{ptr @reduce_178, !"kernel", i32 1}
!20 = !{ptr @reduce_178, !"reqntidx", i32 125}
!21 = !{ptr @fusion_18, !"kernel", i32 1}
!22 = !{ptr @fusion_18, !"reqntidx", i32 1024}
!23 = !{ptr @fusion_9, !"kernel", i32 1}
!24 = !{ptr @fusion_9, !"reqntidx", i32 128}
!25 = !{i32 0, i32 1}
!26 = !{}
!27 = !{i32 0, i32 25}
!28 = !{i32 0, i32 5}
!29 = !{i32 0, i32 125}
!30 = !{i32 0, i32 2}
!31 = !{i32 0, i32 256}
!32 = !{i32 0, i32 6}
!33 = !{i32 0, i32 1024}
!34 = !{i32 0, i32 48}
!35 = !{i32 0, i32 128}
!36 = distinct !{!36, !37}
!37 = !{!"llvm.loop.vectorize.enable", i1 false}
