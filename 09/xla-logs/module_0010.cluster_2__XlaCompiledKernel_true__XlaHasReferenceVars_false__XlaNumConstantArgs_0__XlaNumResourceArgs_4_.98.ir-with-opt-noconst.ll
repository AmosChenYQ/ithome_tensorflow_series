target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_17 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128
@buffer_for_constant_18 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128
@shared_cache = external dso_local unnamed_addr addrspace(3) global [1 x [1 x [20 x float]]]
@buffer_for_constant_1 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128

; Function Attrs: argmemonly nofree nosync nounwind
define void @broadcast_11(ptr noalias nocapture readonly align 16 dereferenceable(2000) %alloc3, ptr noalias nocapture writeonly align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf4 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc32 = addrspacecast ptr %alloc3 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %2 = mul nuw nsw i32 %0, 250
  %linear_index = add nuw nsw i32 %2, %1
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !29
  %4 = mul nuw nsw i32 %3, 125
  %5 = add nuw nsw i32 %linear_index, %4
  %linear_index_base = shl nuw nsw i32 %5, 2
  %row_index = shl nuw nsw i32 %1, 2
  %6 = zext i32 %row_index to i64
  %7 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc32, i64 0, i64 %6
  %8 = load <4 x float>, ptr addrspace(1) %7, align 16, !invariant.load !30
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %temp_buf4, i64 %13
  %15 = getelementptr inbounds float, ptr addrspace(1) %14, i64 1
  %16 = getelementptr inbounds float, ptr addrspace(1) %14, i64 2
  %17 = getelementptr inbounds float, ptr addrspace(1) %14, i64 3
  %18 = insertelement <4 x float> poison, float %9, i32 0
  %19 = insertelement <4 x float> %18, float %10, i32 1
  %20 = insertelement <4 x float> %19, float %11, i32 2
  %21 = insertelement <4 x float> %20, float %12, i32 3
  store <4 x float> %21, ptr addrspace(1) %14, align 16
  %22 = getelementptr inbounds float, ptr addrspace(1) %14, i64 625000
  %23 = insertelement <4 x float> poison, float %9, i32 0
  %24 = insertelement <4 x float> %23, float %10, i32 1
  %25 = insertelement <4 x float> %24, float %11, i32 2
  %26 = insertelement <4 x float> %25, float %12, i32 3
  store <4 x float> %26, ptr addrspace(1) %22, align 16
  %27 = getelementptr inbounds float, ptr addrspace(1) %14, i64 1250000
  %28 = insertelement <4 x float> poison, float %9, i32 0
  %29 = insertelement <4 x float> %28, float %10, i32 1
  %30 = insertelement <4 x float> %29, float %11, i32 2
  %31 = insertelement <4 x float> %30, float %12, i32 3
  store <4 x float> %31, ptr addrspace(1) %27, align 16
  %32 = getelementptr inbounds float, ptr addrspace(1) %14, i64 1875000
  %33 = insertelement <4 x float> poison, float %9, i32 0
  %34 = insertelement <4 x float> %33, float %10, i32 1
  %35 = insertelement <4 x float> %34, float %11, i32 2
  %36 = insertelement <4 x float> %35, float %12, i32 3
  store <4 x float> %36, ptr addrspace(1) %32, align 16
  %37 = getelementptr inbounds float, ptr addrspace(1) %14, i64 2500000
  %38 = insertelement <4 x float> poison, float %9, i32 0
  %39 = insertelement <4 x float> %38, float %10, i32 1
  %40 = insertelement <4 x float> %39, float %11, i32 2
  %41 = insertelement <4 x float> %40, float %12, i32 3
  store <4 x float> %41, ptr addrspace(1) %37, align 16
  %42 = getelementptr inbounds float, ptr addrspace(1) %14, i64 3125000
  %43 = insertelement <4 x float> poison, float %9, i32 0
  %44 = insertelement <4 x float> %43, float %10, i32 1
  %45 = insertelement <4 x float> %44, float %11, i32 2
  %46 = insertelement <4 x float> %45, float %12, i32 3
  store <4 x float> %46, ptr addrspace(1) %42, align 16
  %47 = getelementptr inbounds float, ptr addrspace(1) %14, i64 3750000
  %48 = insertelement <4 x float> poison, float %9, i32 0
  %49 = insertelement <4 x float> %48, float %10, i32 1
  %50 = insertelement <4 x float> %49, float %11, i32 2
  %51 = insertelement <4 x float> %50, float %12, i32 3
  store <4 x float> %51, ptr addrspace(1) %47, align 16
  %52 = getelementptr inbounds float, ptr addrspace(1) %14, i64 4375000
  %53 = insertelement <4 x float> poison, float %9, i32 0
  %54 = insertelement <4 x float> %53, float %10, i32 1
  %55 = insertelement <4 x float> %54, float %11, i32 2
  %56 = insertelement <4 x float> %55, float %12, i32 3
  store <4 x float> %56, ptr addrspace(1) %52, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: argmemonly nofree nosync nounwind
define void @fusion_4(ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf11 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 98316
  %uglygep = getelementptr i8, ptr addrspace(1) %temp_buf11, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %fusion_4.in_bounds-after.1, %entry
  %lsr.iv27 = phi ptr addrspace(1) [ %uglygep28, %fusion_4.in_bounds-after.1 ], [ %uglygep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %fusion_4.in_bounds-after.1 ], [ 24576, %entry ]
  %uglygep30 = getelementptr i8, ptr addrspace(1) %lsr.iv27, i64 -98316
  %7 = load <4 x float>, ptr addrspace(1) %uglygep30, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %.inv = fcmp olt float %8, 0.000000e+00
  %12 = select i1 %.inv, float 0.000000e+00, float %8
  %.inv7 = fcmp olt float %9, 0.000000e+00
  %13 = select i1 %.inv7, float 0.000000e+00, float %9
  %.inv8 = fcmp olt float %10, 0.000000e+00
  %14 = select i1 %.inv8, float 0.000000e+00, float %10
  %.inv9 = fcmp olt float %11, 0.000000e+00
  %15 = select i1 %.inv9, float 0.000000e+00, float %11
  %16 = insertelement <4 x float> poison, float %12, i32 0
  %17 = insertelement <4 x float> %16, float %13, i32 1
  %18 = insertelement <4 x float> %17, float %14, i32 2
  %19 = insertelement <4 x float> %18, float %15, i32 3
  store <4 x float> %19, ptr addrspace(1) %uglygep30, align 16
  %20 = add i32 %linear_index_base, %lsr.iv
  %21 = icmp ult i32 %20, 5000000
  br i1 %21, label %fusion_4.in_bounds-true.1, label %fusion_4.in_bounds-after.1

fusion_4.in_bounds-true.1:                        ; preds = %loop.loop_body
  %uglygep29 = getelementptr i8, ptr addrspace(1) %lsr.iv27, i64 -12
  %22 = load <4 x float>, ptr addrspace(1) %uglygep29, align 16
  %23 = extractelement <4 x float> %22, i32 0
  %24 = extractelement <4 x float> %22, i32 1
  %25 = extractelement <4 x float> %22, i32 2
  %26 = extractelement <4 x float> %22, i32 3
  %.inv.1 = fcmp olt float %23, 0.000000e+00
  %27 = select i1 %.inv.1, float 0.000000e+00, float %23
  %.inv7.1 = fcmp olt float %24, 0.000000e+00
  %28 = select i1 %.inv7.1, float 0.000000e+00, float %24
  %.inv8.1 = fcmp olt float %25, 0.000000e+00
  %29 = select i1 %.inv8.1, float 0.000000e+00, float %25
  %.inv9.1 = fcmp olt float %26, 0.000000e+00
  %30 = select i1 %.inv9.1, float 0.000000e+00, float %26
  %31 = insertelement <4 x float> poison, float %27, i32 0
  %32 = insertelement <4 x float> %31, float %28, i32 1
  %33 = insertelement <4 x float> %32, float %29, i32 2
  %34 = insertelement <4 x float> %33, float %30, i32 3
  store <4 x float> %34, ptr addrspace(1) %uglygep29, align 16
  br label %fusion_4.in_bounds-after.1

fusion_4.in_bounds-after.1:                       ; preds = %fusion_4.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 49152
  %35 = add i32 %lsr.iv.next, -73728
  %uglygep28 = getelementptr i8, ptr addrspace(1) %lsr.iv27, i64 196608
  %36 = icmp ugt i32 %35, 4950847
  br i1 %36, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !33

loop.loop_exit:                                   ; preds = %fusion_4.in_bounds-after.1
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @broadcast_37(ptr noalias nocapture readonly align 16 dereferenceable(40) %alloc5, ptr noalias nocapture writeonly align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #2 {
entry:
  %temp_buf3 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc51 = addrspacecast ptr %alloc5 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 100000
  br i1 %4, label %broadcast_37.in_bounds-true, label %broadcast_37.in_bounds-after

broadcast_37.in_bounds-after:                     ; preds = %broadcast_37.in_bounds-true, %entry
  ret void

broadcast_37.in_bounds-true:                      ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %5 = urem i32 %linear_index3, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 10
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 10
  %8 = urem i32 %linear_index_base, 10
  %9 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf3, i64 20000000
  %10 = zext i32 %8 to i64
  %11 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc51, i64 0, i64 %10
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !30
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %9, i64 %13
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc51, i64 0, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !30
  %18 = zext i32 %6 to i64
  %19 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc51, i64 0, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !30
  %21 = zext i32 %5 to i64
  %22 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc51, i64 0, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !30
  %24 = insertelement <4 x float> poison, float %12, i32 0
  %25 = insertelement <4 x float> %24, float %17, i32 1
  %26 = insertelement <4 x float> %25, float %20, i32 2
  %27 = insertelement <4 x float> %26, float %23, i32 3
  store <4 x float> %27, ptr addrspace(1) %14, align 16
  br label %broadcast_37.in_bounds-after
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @reduce_45(ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf47 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf47, i64 20000000
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %3 = shl nuw nsw i32 %1, 10
  %4 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %3, %4
  %5 = icmp ult i32 %linear_index_base, 10000
  br i1 %5, label %reduce.7.inner.loop_header.reduction_dim.1.preheader, label %reduce_45.in_bounds-after

reduce.7.inner.loop_header.reduction_dim.1.preheader: ; preds = %entry
  %6 = zext i32 %linear_index_base to i64
  %7 = getelementptr inbounds [10000 x [10 x float]], ptr addrspace(1) %0, i64 0, i64 %6, i64 0
  %8 = load <4 x float>, ptr addrspace(1) %7, align 32, !invariant.load !30
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = fcmp ole float %9, 0xFFF0000000000000
  %maximum.6.i = select i1 %13, float 0xFFF0000000000000, float %9
  %14 = fcmp oge float %maximum.6.i, %10
  %15 = fcmp uno float %maximum.6.i, 0.000000e+00
  %16 = or i1 %15, %14
  %maximum.6.i.1 = select i1 %16, float %maximum.6.i, float %10
  %17 = fcmp oge float %maximum.6.i.1, %11
  %18 = fcmp uno float %maximum.6.i.1, 0.000000e+00
  %19 = or i1 %18, %17
  %maximum.6.i.2 = select i1 %19, float %maximum.6.i.1, float %11
  %20 = fcmp oge float %maximum.6.i.2, %12
  %21 = fcmp uno float %maximum.6.i.2, 0.000000e+00
  %22 = or i1 %21, %20
  %maximum.6.i.3 = select i1 %22, float %maximum.6.i.2, float %12
  %23 = getelementptr inbounds float, ptr addrspace(1) %7, i64 4
  %24 = load <4 x float>, ptr addrspace(1) %23, align 16, !invariant.load !30
  %25 = extractelement <4 x float> %24, i32 0
  %26 = extractelement <4 x float> %24, i32 1
  %27 = extractelement <4 x float> %24, i32 2
  %28 = extractelement <4 x float> %24, i32 3
  %29 = fcmp oge float %maximum.6.i.3, %25
  %30 = fcmp uno float %maximum.6.i.3, 0.000000e+00
  %31 = or i1 %30, %29
  %maximum.6.i.4 = select i1 %31, float %maximum.6.i.3, float %25
  %32 = fcmp oge float %maximum.6.i.4, %26
  %33 = fcmp uno float %maximum.6.i.4, 0.000000e+00
  %34 = or i1 %33, %32
  %maximum.6.i.5 = select i1 %34, float %maximum.6.i.4, float %26
  %35 = fcmp oge float %maximum.6.i.5, %27
  %36 = fcmp uno float %maximum.6.i.5, 0.000000e+00
  %37 = or i1 %36, %35
  %maximum.6.i.6 = select i1 %37, float %maximum.6.i.5, float %27
  %38 = fcmp oge float %maximum.6.i.6, %28
  %39 = fcmp uno float %maximum.6.i.6, 0.000000e+00
  %40 = or i1 %39, %38
  %maximum.6.i.7 = select i1 %40, float %maximum.6.i.6, float %28
  %41 = getelementptr inbounds float, ptr addrspace(1) %7, i64 8
  %42 = load <4 x float>, ptr addrspace(1) %41, align 32, !invariant.load !30
  %43 = extractelement <4 x float> %42, i32 0
  %44 = extractelement <4 x float> %42, i32 1
  %45 = extractelement <4 x float> %42, i32 2
  %46 = extractelement <4 x float> %42, i32 3
  %47 = fcmp oge float %maximum.6.i.7, %43
  %48 = fcmp uno float %maximum.6.i.7, 0.000000e+00
  %49 = or i1 %48, %47
  %maximum.6.i.8 = select i1 %49, float %maximum.6.i.7, float %43
  %50 = fcmp oge float %maximum.6.i.8, %44
  %51 = fcmp uno float %maximum.6.i.8, 0.000000e+00
  %52 = or i1 %51, %50
  %maximum.6.i.9 = select i1 %52, float %maximum.6.i.8, float %44
  %53 = getelementptr float, ptr addrspace(1) %temp_buf47, i64 %6
  %54 = fcmp ole float %45, 0xFFF0000000000000
  %maximum.6.i38 = select i1 %54, float 0xFFF0000000000000, float %45
  %55 = fcmp oge float %maximum.6.i38, %46
  %56 = fcmp uno float %maximum.6.i38, 0.000000e+00
  %57 = or i1 %56, %55
  %maximum.6.i38.1 = select i1 %57, float %maximum.6.i38, float %46
  %58 = getelementptr inbounds float, ptr addrspace(1) %7, i64 12
  %59 = load <4 x float>, ptr addrspace(1) %58, align 16, !invariant.load !30
  %60 = extractelement <4 x float> %59, i32 0
  %61 = extractelement <4 x float> %59, i32 1
  %62 = extractelement <4 x float> %59, i32 2
  %63 = extractelement <4 x float> %59, i32 3
  %64 = fcmp oge float %maximum.6.i38.1, %60
  %65 = fcmp uno float %maximum.6.i38.1, 0.000000e+00
  %66 = or i1 %65, %64
  %maximum.6.i38.2 = select i1 %66, float %maximum.6.i38.1, float %60
  %67 = fcmp oge float %maximum.6.i38.2, %61
  %68 = fcmp uno float %maximum.6.i38.2, 0.000000e+00
  %69 = or i1 %68, %67
  %maximum.6.i38.3 = select i1 %69, float %maximum.6.i38.2, float %61
  %70 = fcmp oge float %maximum.6.i38.3, %62
  %71 = fcmp uno float %maximum.6.i38.3, 0.000000e+00
  %72 = or i1 %71, %70
  %maximum.6.i38.4 = select i1 %72, float %maximum.6.i38.3, float %62
  %73 = fcmp oge float %maximum.6.i38.4, %63
  %74 = fcmp uno float %maximum.6.i38.4, 0.000000e+00
  %75 = or i1 %74, %73
  %maximum.6.i38.5 = select i1 %75, float %maximum.6.i38.4, float %63
  %76 = getelementptr inbounds float, ptr addrspace(1) %7, i64 16
  %77 = load <4 x float>, ptr addrspace(1) %76, align 32, !invariant.load !30
  %78 = extractelement <4 x float> %77, i32 0
  %79 = extractelement <4 x float> %77, i32 1
  %80 = extractelement <4 x float> %77, i32 2
  %81 = extractelement <4 x float> %77, i32 3
  %82 = fcmp oge float %maximum.6.i38.5, %78
  %83 = fcmp uno float %maximum.6.i38.5, 0.000000e+00
  %84 = or i1 %83, %82
  %maximum.6.i38.6 = select i1 %84, float %maximum.6.i38.5, float %78
  %85 = fcmp oge float %maximum.6.i38.6, %79
  %86 = fcmp uno float %maximum.6.i38.6, 0.000000e+00
  %87 = or i1 %86, %85
  %maximum.6.i38.7 = select i1 %87, float %maximum.6.i38.6, float %79
  %88 = fcmp oge float %maximum.6.i38.7, %80
  %89 = fcmp uno float %maximum.6.i38.7, 0.000000e+00
  %90 = or i1 %89, %88
  %maximum.6.i38.8 = select i1 %90, float %maximum.6.i38.7, float %80
  %91 = fcmp oge float %maximum.6.i38.8, %81
  %92 = fcmp uno float %maximum.6.i38.8, 0.000000e+00
  %93 = or i1 %92, %91
  %maximum.6.i38.9 = select i1 %93, float %maximum.6.i38.8, float %81
  %94 = getelementptr inbounds float, ptr addrspace(1) %7, i64 20
  %95 = load <4 x float>, ptr addrspace(1) %94, align 16, !invariant.load !30
  %96 = extractelement <4 x float> %95, i32 0
  %97 = extractelement <4 x float> %95, i32 1
  %98 = extractelement <4 x float> %95, i32 2
  %99 = extractelement <4 x float> %95, i32 3
  %100 = fcmp ole float %96, 0xFFF0000000000000
  %maximum.6.i37 = select i1 %100, float 0xFFF0000000000000, float %96
  %101 = fcmp oge float %maximum.6.i37, %97
  %102 = fcmp uno float %maximum.6.i37, 0.000000e+00
  %103 = or i1 %102, %101
  %maximum.6.i37.1 = select i1 %103, float %maximum.6.i37, float %97
  %104 = fcmp oge float %maximum.6.i37.1, %98
  %105 = fcmp uno float %maximum.6.i37.1, 0.000000e+00
  %106 = or i1 %105, %104
  %maximum.6.i37.2 = select i1 %106, float %maximum.6.i37.1, float %98
  %107 = fcmp oge float %maximum.6.i37.2, %99
  %108 = fcmp uno float %maximum.6.i37.2, 0.000000e+00
  %109 = or i1 %108, %107
  %maximum.6.i37.3 = select i1 %109, float %maximum.6.i37.2, float %99
  %110 = getelementptr inbounds float, ptr addrspace(1) %7, i64 24
  %111 = load <4 x float>, ptr addrspace(1) %110, align 32, !invariant.load !30
  %112 = extractelement <4 x float> %111, i32 0
  %113 = extractelement <4 x float> %111, i32 1
  %114 = extractelement <4 x float> %111, i32 2
  %115 = extractelement <4 x float> %111, i32 3
  %116 = fcmp oge float %maximum.6.i37.3, %112
  %117 = fcmp uno float %maximum.6.i37.3, 0.000000e+00
  %118 = or i1 %117, %116
  %maximum.6.i37.4 = select i1 %118, float %maximum.6.i37.3, float %112
  %119 = fcmp oge float %maximum.6.i37.4, %113
  %120 = fcmp uno float %maximum.6.i37.4, 0.000000e+00
  %121 = or i1 %120, %119
  %maximum.6.i37.5 = select i1 %121, float %maximum.6.i37.4, float %113
  %122 = fcmp oge float %maximum.6.i37.5, %114
  %123 = fcmp uno float %maximum.6.i37.5, 0.000000e+00
  %124 = or i1 %123, %122
  %maximum.6.i37.6 = select i1 %124, float %maximum.6.i37.5, float %114
  %125 = fcmp oge float %maximum.6.i37.6, %115
  %126 = fcmp uno float %maximum.6.i37.6, 0.000000e+00
  %127 = or i1 %126, %125
  %maximum.6.i37.7 = select i1 %127, float %maximum.6.i37.6, float %115
  %128 = getelementptr inbounds float, ptr addrspace(1) %7, i64 28
  %129 = load <4 x float>, ptr addrspace(1) %128, align 16, !invariant.load !30
  %130 = extractelement <4 x float> %129, i32 0
  %131 = extractelement <4 x float> %129, i32 1
  %132 = extractelement <4 x float> %129, i32 2
  %133 = extractelement <4 x float> %129, i32 3
  %134 = fcmp oge float %maximum.6.i37.7, %130
  %135 = fcmp uno float %maximum.6.i37.7, 0.000000e+00
  %136 = or i1 %135, %134
  %maximum.6.i37.8 = select i1 %136, float %maximum.6.i37.7, float %130
  %137 = fcmp oge float %maximum.6.i37.8, %131
  %138 = fcmp uno float %maximum.6.i37.8, 0.000000e+00
  %139 = or i1 %138, %137
  %maximum.6.i37.9 = select i1 %139, float %maximum.6.i37.8, float %131
  %140 = fcmp ole float %132, 0xFFF0000000000000
  %maximum.6.i36 = select i1 %140, float 0xFFF0000000000000, float %132
  %141 = fcmp oge float %maximum.6.i36, %133
  %142 = fcmp uno float %maximum.6.i36, 0.000000e+00
  %143 = or i1 %142, %141
  %maximum.6.i36.1 = select i1 %143, float %maximum.6.i36, float %133
  %144 = getelementptr inbounds float, ptr addrspace(1) %7, i64 32
  %145 = load <4 x float>, ptr addrspace(1) %144, align 32, !invariant.load !30
  %146 = extractelement <4 x float> %145, i32 0
  %147 = extractelement <4 x float> %145, i32 1
  %148 = extractelement <4 x float> %145, i32 2
  %149 = extractelement <4 x float> %145, i32 3
  %150 = fcmp oge float %maximum.6.i36.1, %146
  %151 = fcmp uno float %maximum.6.i36.1, 0.000000e+00
  %152 = or i1 %151, %150
  %maximum.6.i36.2 = select i1 %152, float %maximum.6.i36.1, float %146
  %153 = fcmp oge float %maximum.6.i36.2, %147
  %154 = fcmp uno float %maximum.6.i36.2, 0.000000e+00
  %155 = or i1 %154, %153
  %maximum.6.i36.3 = select i1 %155, float %maximum.6.i36.2, float %147
  %156 = fcmp oge float %maximum.6.i36.3, %148
  %157 = fcmp uno float %maximum.6.i36.3, 0.000000e+00
  %158 = or i1 %157, %156
  %maximum.6.i36.4 = select i1 %158, float %maximum.6.i36.3, float %148
  %159 = fcmp oge float %maximum.6.i36.4, %149
  %160 = fcmp uno float %maximum.6.i36.4, 0.000000e+00
  %161 = or i1 %160, %159
  %maximum.6.i36.5 = select i1 %161, float %maximum.6.i36.4, float %149
  %162 = getelementptr inbounds float, ptr addrspace(1) %7, i64 36
  %163 = load <4 x float>, ptr addrspace(1) %162, align 16, !invariant.load !30
  %164 = extractelement <4 x float> %163, i32 0
  %165 = extractelement <4 x float> %163, i32 1
  %166 = extractelement <4 x float> %163, i32 2
  %167 = extractelement <4 x float> %163, i32 3
  %168 = fcmp oge float %maximum.6.i36.5, %164
  %169 = fcmp uno float %maximum.6.i36.5, 0.000000e+00
  %170 = or i1 %169, %168
  %maximum.6.i36.6 = select i1 %170, float %maximum.6.i36.5, float %164
  %171 = fcmp oge float %maximum.6.i36.6, %165
  %172 = fcmp uno float %maximum.6.i36.6, 0.000000e+00
  %173 = or i1 %172, %171
  %maximum.6.i36.7 = select i1 %173, float %maximum.6.i36.6, float %165
  %174 = fcmp oge float %maximum.6.i36.7, %166
  %175 = fcmp uno float %maximum.6.i36.7, 0.000000e+00
  %176 = or i1 %175, %174
  %maximum.6.i36.8 = select i1 %176, float %maximum.6.i36.7, float %166
  %177 = fcmp oge float %maximum.6.i36.8, %167
  %178 = fcmp uno float %maximum.6.i36.8, 0.000000e+00
  %179 = or i1 %178, %177
  %maximum.6.i36.9 = select i1 %179, float %maximum.6.i36.8, float %167
  %180 = insertelement <4 x float> poison, float %maximum.6.i.9, i32 0
  %181 = insertelement <4 x float> %180, float %maximum.6.i38.9, i32 1
  %182 = insertelement <4 x float> %181, float %maximum.6.i37.9, i32 2
  %183 = insertelement <4 x float> %182, float %maximum.6.i36.9, i32 3
  store <4 x float> %183, ptr addrspace(1) %53, align 16
  br label %reduce_45.in_bounds-after

reduce_45.in_bounds-after:                        ; preds = %reduce.7.inner.loop_header.reduction_dim.1.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @fusion_7(ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf53 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf53, i64 20000000
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %3 = shl nuw nsw i32 %1, 10
  %4 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %3, %4
  %5 = icmp ult i32 %linear_index_base, 10000
  br i1 %5, label %reduce.11.inner.loop_header.reduction_dim.1.preheader, label %fusion_7.in_bounds-after

reduce.11.inner.loop_header.reduction_dim.1.preheader: ; preds = %entry
  %6 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf53, i64 40064
  %7 = zext i32 %linear_index_base to i64
  %8 = getelementptr inbounds [10000 x float], ptr addrspace(1) %temp_buf53, i64 0, i64 %7
  %9 = load <4 x float>, ptr addrspace(1) %8, align 16, !invariant.load !30
  %10 = extractelement <4 x float> %9, i32 0
  %11 = extractelement <4 x float> %9, i32 1
  %12 = extractelement <4 x float> %9, i32 2
  %13 = extractelement <4 x float> %9, i32 3
  %14 = getelementptr inbounds [10000 x [10 x float]], ptr addrspace(1) %0, i64 0, i64 %7, i64 0
  %15 = load <4 x float>, ptr addrspace(1) %14, align 32, !invariant.load !30
  %16 = extractelement <4 x float> %15, i32 0
  %17 = extractelement <4 x float> %15, i32 1
  %18 = extractelement <4 x float> %15, i32 2
  %19 = extractelement <4 x float> %15, i32 3
  %subtract.4 = fsub float %16, %10
  %20 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3F777313A0000000, float 5.000000e-01) #5
  %21 = tail call float @llvm.nvvm.saturate.f(float %20) #5
  %22 = tail call float @llvm.nvvm.fma.rm.f(float %21, float 2.520000e+02, float 0x4168000020000000) #5
  %23 = fadd float %22, 0xC168000FE0000000
  %24 = fneg float %23
  %25 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3FF7154760000000, float %24) #5
  %26 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3E54AE0C00000000, float %25) #5
  %27 = bitcast float %22 to i32
  %28 = shl i32 %27, 23
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %26) #5
  %31 = fmul float %30, %29
  %subtract.4.1 = fsub float %17, %10
  %32 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3F777313A0000000, float 5.000000e-01) #5
  %33 = tail call float @llvm.nvvm.saturate.f(float %32) #5
  %34 = tail call float @llvm.nvvm.fma.rm.f(float %33, float 2.520000e+02, float 0x4168000020000000) #5
  %35 = fadd float %34, 0xC168000FE0000000
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3FF7154760000000, float %36) #5
  %38 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3E54AE0C00000000, float %37) #5
  %39 = bitcast float %34 to i32
  %40 = shl i32 %39, 23
  %41 = bitcast i32 %40 to float
  %42 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %38) #5
  %43 = fmul float %42, %41
  %add.10.i44.1 = fadd float %31, %43
  %subtract.4.2 = fsub float %18, %10
  %44 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3F777313A0000000, float 5.000000e-01) #5
  %45 = tail call float @llvm.nvvm.saturate.f(float %44) #5
  %46 = tail call float @llvm.nvvm.fma.rm.f(float %45, float 2.520000e+02, float 0x4168000020000000) #5
  %47 = fadd float %46, 0xC168000FE0000000
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3FF7154760000000, float %48) #5
  %50 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3E54AE0C00000000, float %49) #5
  %51 = bitcast float %46 to i32
  %52 = shl i32 %51, 23
  %53 = bitcast i32 %52 to float
  %54 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %50) #5
  %55 = fmul float %54, %53
  %add.10.i44.2 = fadd float %add.10.i44.1, %55
  %subtract.4.3 = fsub float %19, %10
  %56 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3F777313A0000000, float 5.000000e-01) #5
  %57 = tail call float @llvm.nvvm.saturate.f(float %56) #5
  %58 = tail call float @llvm.nvvm.fma.rm.f(float %57, float 2.520000e+02, float 0x4168000020000000) #5
  %59 = fadd float %58, 0xC168000FE0000000
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3FF7154760000000, float %60) #5
  %62 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3E54AE0C00000000, float %61) #5
  %63 = bitcast float %58 to i32
  %64 = shl i32 %63, 23
  %65 = bitcast i32 %64 to float
  %66 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %62) #5
  %67 = fmul float %66, %65
  %add.10.i44.3 = fadd float %add.10.i44.2, %67
  %68 = getelementptr inbounds float, ptr addrspace(1) %14, i64 4
  %69 = load <4 x float>, ptr addrspace(1) %68, align 16, !invariant.load !30
  %70 = extractelement <4 x float> %69, i32 0
  %71 = extractelement <4 x float> %69, i32 1
  %72 = extractelement <4 x float> %69, i32 2
  %73 = extractelement <4 x float> %69, i32 3
  %subtract.4.4 = fsub float %70, %10
  %74 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3F777313A0000000, float 5.000000e-01) #5
  %75 = tail call float @llvm.nvvm.saturate.f(float %74) #5
  %76 = tail call float @llvm.nvvm.fma.rm.f(float %75, float 2.520000e+02, float 0x4168000020000000) #5
  %77 = fadd float %76, 0xC168000FE0000000
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3FF7154760000000, float %78) #5
  %80 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3E54AE0C00000000, float %79) #5
  %81 = bitcast float %76 to i32
  %82 = shl i32 %81, 23
  %83 = bitcast i32 %82 to float
  %84 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %80) #5
  %85 = fmul float %84, %83
  %add.10.i44.4 = fadd float %add.10.i44.3, %85
  %subtract.4.5 = fsub float %71, %10
  %86 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3F777313A0000000, float 5.000000e-01) #5
  %87 = tail call float @llvm.nvvm.saturate.f(float %86) #5
  %88 = tail call float @llvm.nvvm.fma.rm.f(float %87, float 2.520000e+02, float 0x4168000020000000) #5
  %89 = fadd float %88, 0xC168000FE0000000
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3FF7154760000000, float %90) #5
  %92 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3E54AE0C00000000, float %91) #5
  %93 = bitcast float %88 to i32
  %94 = shl i32 %93, 23
  %95 = bitcast i32 %94 to float
  %96 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %92) #5
  %97 = fmul float %96, %95
  %add.10.i44.5 = fadd float %add.10.i44.4, %97
  %subtract.4.6 = fsub float %72, %10
  %98 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3F777313A0000000, float 5.000000e-01) #5
  %99 = tail call float @llvm.nvvm.saturate.f(float %98) #5
  %100 = tail call float @llvm.nvvm.fma.rm.f(float %99, float 2.520000e+02, float 0x4168000020000000) #5
  %101 = fadd float %100, 0xC168000FE0000000
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3FF7154760000000, float %102) #5
  %104 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3E54AE0C00000000, float %103) #5
  %105 = bitcast float %100 to i32
  %106 = shl i32 %105, 23
  %107 = bitcast i32 %106 to float
  %108 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %104) #5
  %109 = fmul float %108, %107
  %add.10.i44.6 = fadd float %add.10.i44.5, %109
  %subtract.4.7 = fsub float %73, %10
  %110 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3F777313A0000000, float 5.000000e-01) #5
  %111 = tail call float @llvm.nvvm.saturate.f(float %110) #5
  %112 = tail call float @llvm.nvvm.fma.rm.f(float %111, float 2.520000e+02, float 0x4168000020000000) #5
  %113 = fadd float %112, 0xC168000FE0000000
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3FF7154760000000, float %114) #5
  %116 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3E54AE0C00000000, float %115) #5
  %117 = bitcast float %112 to i32
  %118 = shl i32 %117, 23
  %119 = bitcast i32 %118 to float
  %120 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %116) #5
  %121 = fmul float %120, %119
  %add.10.i44.7 = fadd float %add.10.i44.6, %121
  %122 = getelementptr inbounds float, ptr addrspace(1) %14, i64 8
  %123 = load <4 x float>, ptr addrspace(1) %122, align 32, !invariant.load !30
  %124 = extractelement <4 x float> %123, i32 0
  %125 = extractelement <4 x float> %123, i32 1
  %126 = extractelement <4 x float> %123, i32 2
  %127 = extractelement <4 x float> %123, i32 3
  %subtract.4.8 = fsub float %124, %10
  %128 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3F777313A0000000, float 5.000000e-01) #5
  %129 = tail call float @llvm.nvvm.saturate.f(float %128) #5
  %130 = tail call float @llvm.nvvm.fma.rm.f(float %129, float 2.520000e+02, float 0x4168000020000000) #5
  %131 = fadd float %130, 0xC168000FE0000000
  %132 = fneg float %131
  %133 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3FF7154760000000, float %132) #5
  %134 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3E54AE0C00000000, float %133) #5
  %135 = bitcast float %130 to i32
  %136 = shl i32 %135, 23
  %137 = bitcast i32 %136 to float
  %138 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %134) #5
  %139 = fmul float %138, %137
  %add.10.i44.8 = fadd float %add.10.i44.7, %139
  %subtract.4.9 = fsub float %125, %10
  %140 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3F777313A0000000, float 5.000000e-01) #5
  %141 = tail call float @llvm.nvvm.saturate.f(float %140) #5
  %142 = tail call float @llvm.nvvm.fma.rm.f(float %141, float 2.520000e+02, float 0x4168000020000000) #5
  %143 = fadd float %142, 0xC168000FE0000000
  %144 = fneg float %143
  %145 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3FF7154760000000, float %144) #5
  %146 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3E54AE0C00000000, float %145) #5
  %147 = bitcast float %142 to i32
  %148 = shl i32 %147, 23
  %149 = bitcast i32 %148 to float
  %150 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %146) #5
  %151 = fmul float %150, %149
  %add.10.i44.9 = fadd float %add.10.i44.8, %151
  %152 = getelementptr float, ptr addrspace(1) %6, i64 %7
  %subtract.410 = fsub float %126, %11
  %153 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3F777313A0000000, float 5.000000e-01) #5
  %154 = tail call float @llvm.nvvm.saturate.f(float %153) #5
  %155 = tail call float @llvm.nvvm.fma.rm.f(float %154, float 2.520000e+02, float 0x4168000020000000) #5
  %156 = fadd float %155, 0xC168000FE0000000
  %157 = fneg float %156
  %158 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3FF7154760000000, float %157) #5
  %159 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3E54AE0C00000000, float %158) #5
  %160 = bitcast float %155 to i32
  %161 = shl i32 %160, 23
  %162 = bitcast i32 %161 to float
  %163 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %159) #5
  %164 = fmul float %163, %162
  %subtract.410.1 = fsub float %127, %11
  %165 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3F777313A0000000, float 5.000000e-01) #5
  %166 = tail call float @llvm.nvvm.saturate.f(float %165) #5
  %167 = tail call float @llvm.nvvm.fma.rm.f(float %166, float 2.520000e+02, float 0x4168000020000000) #5
  %168 = fadd float %167, 0xC168000FE0000000
  %169 = fneg float %168
  %170 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3FF7154760000000, float %169) #5
  %171 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3E54AE0C00000000, float %170) #5
  %172 = bitcast float %167 to i32
  %173 = shl i32 %172, 23
  %174 = bitcast i32 %173 to float
  %175 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %171) #5
  %176 = fmul float %175, %174
  %add.10.i43.1 = fadd float %164, %176
  %177 = getelementptr inbounds float, ptr addrspace(1) %14, i64 12
  %178 = load <4 x float>, ptr addrspace(1) %177, align 16, !invariant.load !30
  %179 = extractelement <4 x float> %178, i32 0
  %180 = extractelement <4 x float> %178, i32 1
  %181 = extractelement <4 x float> %178, i32 2
  %182 = extractelement <4 x float> %178, i32 3
  %subtract.410.2 = fsub float %179, %11
  %183 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3F777313A0000000, float 5.000000e-01) #5
  %184 = tail call float @llvm.nvvm.saturate.f(float %183) #5
  %185 = tail call float @llvm.nvvm.fma.rm.f(float %184, float 2.520000e+02, float 0x4168000020000000) #5
  %186 = fadd float %185, 0xC168000FE0000000
  %187 = fneg float %186
  %188 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3FF7154760000000, float %187) #5
  %189 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3E54AE0C00000000, float %188) #5
  %190 = bitcast float %185 to i32
  %191 = shl i32 %190, 23
  %192 = bitcast i32 %191 to float
  %193 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %189) #5
  %194 = fmul float %193, %192
  %add.10.i43.2 = fadd float %add.10.i43.1, %194
  %subtract.410.3 = fsub float %180, %11
  %195 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3F777313A0000000, float 5.000000e-01) #5
  %196 = tail call float @llvm.nvvm.saturate.f(float %195) #5
  %197 = tail call float @llvm.nvvm.fma.rm.f(float %196, float 2.520000e+02, float 0x4168000020000000) #5
  %198 = fadd float %197, 0xC168000FE0000000
  %199 = fneg float %198
  %200 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3FF7154760000000, float %199) #5
  %201 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3E54AE0C00000000, float %200) #5
  %202 = bitcast float %197 to i32
  %203 = shl i32 %202, 23
  %204 = bitcast i32 %203 to float
  %205 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %201) #5
  %206 = fmul float %205, %204
  %add.10.i43.3 = fadd float %add.10.i43.2, %206
  %subtract.410.4 = fsub float %181, %11
  %207 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3F777313A0000000, float 5.000000e-01) #5
  %208 = tail call float @llvm.nvvm.saturate.f(float %207) #5
  %209 = tail call float @llvm.nvvm.fma.rm.f(float %208, float 2.520000e+02, float 0x4168000020000000) #5
  %210 = fadd float %209, 0xC168000FE0000000
  %211 = fneg float %210
  %212 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3FF7154760000000, float %211) #5
  %213 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3E54AE0C00000000, float %212) #5
  %214 = bitcast float %209 to i32
  %215 = shl i32 %214, 23
  %216 = bitcast i32 %215 to float
  %217 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %213) #5
  %218 = fmul float %217, %216
  %add.10.i43.4 = fadd float %add.10.i43.3, %218
  %subtract.410.5 = fsub float %182, %11
  %219 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3F777313A0000000, float 5.000000e-01) #5
  %220 = tail call float @llvm.nvvm.saturate.f(float %219) #5
  %221 = tail call float @llvm.nvvm.fma.rm.f(float %220, float 2.520000e+02, float 0x4168000020000000) #5
  %222 = fadd float %221, 0xC168000FE0000000
  %223 = fneg float %222
  %224 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3FF7154760000000, float %223) #5
  %225 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3E54AE0C00000000, float %224) #5
  %226 = bitcast float %221 to i32
  %227 = shl i32 %226, 23
  %228 = bitcast i32 %227 to float
  %229 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %225) #5
  %230 = fmul float %229, %228
  %add.10.i43.5 = fadd float %add.10.i43.4, %230
  %231 = getelementptr inbounds float, ptr addrspace(1) %14, i64 16
  %232 = load <4 x float>, ptr addrspace(1) %231, align 32, !invariant.load !30
  %233 = extractelement <4 x float> %232, i32 0
  %234 = extractelement <4 x float> %232, i32 1
  %235 = extractelement <4 x float> %232, i32 2
  %236 = extractelement <4 x float> %232, i32 3
  %subtract.410.6 = fsub float %233, %11
  %237 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3F777313A0000000, float 5.000000e-01) #5
  %238 = tail call float @llvm.nvvm.saturate.f(float %237) #5
  %239 = tail call float @llvm.nvvm.fma.rm.f(float %238, float 2.520000e+02, float 0x4168000020000000) #5
  %240 = fadd float %239, 0xC168000FE0000000
  %241 = fneg float %240
  %242 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3FF7154760000000, float %241) #5
  %243 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3E54AE0C00000000, float %242) #5
  %244 = bitcast float %239 to i32
  %245 = shl i32 %244, 23
  %246 = bitcast i32 %245 to float
  %247 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %243) #5
  %248 = fmul float %247, %246
  %add.10.i43.6 = fadd float %add.10.i43.5, %248
  %subtract.410.7 = fsub float %234, %11
  %249 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3F777313A0000000, float 5.000000e-01) #5
  %250 = tail call float @llvm.nvvm.saturate.f(float %249) #5
  %251 = tail call float @llvm.nvvm.fma.rm.f(float %250, float 2.520000e+02, float 0x4168000020000000) #5
  %252 = fadd float %251, 0xC168000FE0000000
  %253 = fneg float %252
  %254 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3FF7154760000000, float %253) #5
  %255 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3E54AE0C00000000, float %254) #5
  %256 = bitcast float %251 to i32
  %257 = shl i32 %256, 23
  %258 = bitcast i32 %257 to float
  %259 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %255) #5
  %260 = fmul float %259, %258
  %add.10.i43.7 = fadd float %add.10.i43.6, %260
  %subtract.410.8 = fsub float %235, %11
  %261 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3F777313A0000000, float 5.000000e-01) #5
  %262 = tail call float @llvm.nvvm.saturate.f(float %261) #5
  %263 = tail call float @llvm.nvvm.fma.rm.f(float %262, float 2.520000e+02, float 0x4168000020000000) #5
  %264 = fadd float %263, 0xC168000FE0000000
  %265 = fneg float %264
  %266 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3FF7154760000000, float %265) #5
  %267 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3E54AE0C00000000, float %266) #5
  %268 = bitcast float %263 to i32
  %269 = shl i32 %268, 23
  %270 = bitcast i32 %269 to float
  %271 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %267) #5
  %272 = fmul float %271, %270
  %add.10.i43.8 = fadd float %add.10.i43.7, %272
  %subtract.410.9 = fsub float %236, %11
  %273 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3F777313A0000000, float 5.000000e-01) #5
  %274 = tail call float @llvm.nvvm.saturate.f(float %273) #5
  %275 = tail call float @llvm.nvvm.fma.rm.f(float %274, float 2.520000e+02, float 0x4168000020000000) #5
  %276 = fadd float %275, 0xC168000FE0000000
  %277 = fneg float %276
  %278 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3FF7154760000000, float %277) #5
  %279 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3E54AE0C00000000, float %278) #5
  %280 = bitcast float %275 to i32
  %281 = shl i32 %280, 23
  %282 = bitcast i32 %281 to float
  %283 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %279) #5
  %284 = fmul float %283, %282
  %add.10.i43.9 = fadd float %add.10.i43.8, %284
  %285 = getelementptr inbounds float, ptr addrspace(1) %14, i64 20
  %286 = load <4 x float>, ptr addrspace(1) %285, align 16, !invariant.load !30
  %287 = extractelement <4 x float> %286, i32 0
  %288 = extractelement <4 x float> %286, i32 1
  %289 = extractelement <4 x float> %286, i32 2
  %290 = extractelement <4 x float> %286, i32 3
  %subtract.422 = fsub float %287, %12
  %291 = tail call float @llvm.fma.f32(float %subtract.422, float 0x3F777313A0000000, float 5.000000e-01) #5
  %292 = tail call float @llvm.nvvm.saturate.f(float %291) #5
  %293 = tail call float @llvm.nvvm.fma.rm.f(float %292, float 2.520000e+02, float 0x4168000020000000) #5
  %294 = fadd float %293, 0xC168000FE0000000
  %295 = fneg float %294
  %296 = tail call float @llvm.fma.f32(float %subtract.422, float 0x3FF7154760000000, float %295) #5
  %297 = tail call float @llvm.fma.f32(float %subtract.422, float 0x3E54AE0C00000000, float %296) #5
  %298 = bitcast float %293 to i32
  %299 = shl i32 %298, 23
  %300 = bitcast i32 %299 to float
  %301 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %297) #5
  %302 = fmul float %301, %300
  %subtract.422.1 = fsub float %288, %12
  %303 = tail call float @llvm.fma.f32(float %subtract.422.1, float 0x3F777313A0000000, float 5.000000e-01) #5
  %304 = tail call float @llvm.nvvm.saturate.f(float %303) #5
  %305 = tail call float @llvm.nvvm.fma.rm.f(float %304, float 2.520000e+02, float 0x4168000020000000) #5
  %306 = fadd float %305, 0xC168000FE0000000
  %307 = fneg float %306
  %308 = tail call float @llvm.fma.f32(float %subtract.422.1, float 0x3FF7154760000000, float %307) #5
  %309 = tail call float @llvm.fma.f32(float %subtract.422.1, float 0x3E54AE0C00000000, float %308) #5
  %310 = bitcast float %305 to i32
  %311 = shl i32 %310, 23
  %312 = bitcast i32 %311 to float
  %313 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %309) #5
  %314 = fmul float %313, %312
  %add.10.i42.1 = fadd float %302, %314
  %subtract.422.2 = fsub float %289, %12
  %315 = tail call float @llvm.fma.f32(float %subtract.422.2, float 0x3F777313A0000000, float 5.000000e-01) #5
  %316 = tail call float @llvm.nvvm.saturate.f(float %315) #5
  %317 = tail call float @llvm.nvvm.fma.rm.f(float %316, float 2.520000e+02, float 0x4168000020000000) #5
  %318 = fadd float %317, 0xC168000FE0000000
  %319 = fneg float %318
  %320 = tail call float @llvm.fma.f32(float %subtract.422.2, float 0x3FF7154760000000, float %319) #5
  %321 = tail call float @llvm.fma.f32(float %subtract.422.2, float 0x3E54AE0C00000000, float %320) #5
  %322 = bitcast float %317 to i32
  %323 = shl i32 %322, 23
  %324 = bitcast i32 %323 to float
  %325 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %321) #5
  %326 = fmul float %325, %324
  %add.10.i42.2 = fadd float %add.10.i42.1, %326
  %subtract.422.3 = fsub float %290, %12
  %327 = tail call float @llvm.fma.f32(float %subtract.422.3, float 0x3F777313A0000000, float 5.000000e-01) #5
  %328 = tail call float @llvm.nvvm.saturate.f(float %327) #5
  %329 = tail call float @llvm.nvvm.fma.rm.f(float %328, float 2.520000e+02, float 0x4168000020000000) #5
  %330 = fadd float %329, 0xC168000FE0000000
  %331 = fneg float %330
  %332 = tail call float @llvm.fma.f32(float %subtract.422.3, float 0x3FF7154760000000, float %331) #5
  %333 = tail call float @llvm.fma.f32(float %subtract.422.3, float 0x3E54AE0C00000000, float %332) #5
  %334 = bitcast float %329 to i32
  %335 = shl i32 %334, 23
  %336 = bitcast i32 %335 to float
  %337 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %333) #5
  %338 = fmul float %337, %336
  %add.10.i42.3 = fadd float %add.10.i42.2, %338
  %339 = getelementptr inbounds float, ptr addrspace(1) %14, i64 24
  %340 = load <4 x float>, ptr addrspace(1) %339, align 32, !invariant.load !30
  %341 = extractelement <4 x float> %340, i32 0
  %342 = extractelement <4 x float> %340, i32 1
  %343 = extractelement <4 x float> %340, i32 2
  %344 = extractelement <4 x float> %340, i32 3
  %subtract.422.4 = fsub float %341, %12
  %345 = tail call float @llvm.fma.f32(float %subtract.422.4, float 0x3F777313A0000000, float 5.000000e-01) #5
  %346 = tail call float @llvm.nvvm.saturate.f(float %345) #5
  %347 = tail call float @llvm.nvvm.fma.rm.f(float %346, float 2.520000e+02, float 0x4168000020000000) #5
  %348 = fadd float %347, 0xC168000FE0000000
  %349 = fneg float %348
  %350 = tail call float @llvm.fma.f32(float %subtract.422.4, float 0x3FF7154760000000, float %349) #5
  %351 = tail call float @llvm.fma.f32(float %subtract.422.4, float 0x3E54AE0C00000000, float %350) #5
  %352 = bitcast float %347 to i32
  %353 = shl i32 %352, 23
  %354 = bitcast i32 %353 to float
  %355 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %351) #5
  %356 = fmul float %355, %354
  %add.10.i42.4 = fadd float %add.10.i42.3, %356
  %subtract.422.5 = fsub float %342, %12
  %357 = tail call float @llvm.fma.f32(float %subtract.422.5, float 0x3F777313A0000000, float 5.000000e-01) #5
  %358 = tail call float @llvm.nvvm.saturate.f(float %357) #5
  %359 = tail call float @llvm.nvvm.fma.rm.f(float %358, float 2.520000e+02, float 0x4168000020000000) #5
  %360 = fadd float %359, 0xC168000FE0000000
  %361 = fneg float %360
  %362 = tail call float @llvm.fma.f32(float %subtract.422.5, float 0x3FF7154760000000, float %361) #5
  %363 = tail call float @llvm.fma.f32(float %subtract.422.5, float 0x3E54AE0C00000000, float %362) #5
  %364 = bitcast float %359 to i32
  %365 = shl i32 %364, 23
  %366 = bitcast i32 %365 to float
  %367 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %363) #5
  %368 = fmul float %367, %366
  %add.10.i42.5 = fadd float %add.10.i42.4, %368
  %subtract.422.6 = fsub float %343, %12
  %369 = tail call float @llvm.fma.f32(float %subtract.422.6, float 0x3F777313A0000000, float 5.000000e-01) #5
  %370 = tail call float @llvm.nvvm.saturate.f(float %369) #5
  %371 = tail call float @llvm.nvvm.fma.rm.f(float %370, float 2.520000e+02, float 0x4168000020000000) #5
  %372 = fadd float %371, 0xC168000FE0000000
  %373 = fneg float %372
  %374 = tail call float @llvm.fma.f32(float %subtract.422.6, float 0x3FF7154760000000, float %373) #5
  %375 = tail call float @llvm.fma.f32(float %subtract.422.6, float 0x3E54AE0C00000000, float %374) #5
  %376 = bitcast float %371 to i32
  %377 = shl i32 %376, 23
  %378 = bitcast i32 %377 to float
  %379 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %375) #5
  %380 = fmul float %379, %378
  %add.10.i42.6 = fadd float %add.10.i42.5, %380
  %subtract.422.7 = fsub float %344, %12
  %381 = tail call float @llvm.fma.f32(float %subtract.422.7, float 0x3F777313A0000000, float 5.000000e-01) #5
  %382 = tail call float @llvm.nvvm.saturate.f(float %381) #5
  %383 = tail call float @llvm.nvvm.fma.rm.f(float %382, float 2.520000e+02, float 0x4168000020000000) #5
  %384 = fadd float %383, 0xC168000FE0000000
  %385 = fneg float %384
  %386 = tail call float @llvm.fma.f32(float %subtract.422.7, float 0x3FF7154760000000, float %385) #5
  %387 = tail call float @llvm.fma.f32(float %subtract.422.7, float 0x3E54AE0C00000000, float %386) #5
  %388 = bitcast float %383 to i32
  %389 = shl i32 %388, 23
  %390 = bitcast i32 %389 to float
  %391 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %387) #5
  %392 = fmul float %391, %390
  %add.10.i42.7 = fadd float %add.10.i42.6, %392
  %393 = getelementptr inbounds float, ptr addrspace(1) %14, i64 28
  %394 = load <4 x float>, ptr addrspace(1) %393, align 16, !invariant.load !30
  %395 = extractelement <4 x float> %394, i32 0
  %396 = extractelement <4 x float> %394, i32 1
  %397 = extractelement <4 x float> %394, i32 2
  %398 = extractelement <4 x float> %394, i32 3
  %subtract.422.8 = fsub float %395, %12
  %399 = tail call float @llvm.fma.f32(float %subtract.422.8, float 0x3F777313A0000000, float 5.000000e-01) #5
  %400 = tail call float @llvm.nvvm.saturate.f(float %399) #5
  %401 = tail call float @llvm.nvvm.fma.rm.f(float %400, float 2.520000e+02, float 0x4168000020000000) #5
  %402 = fadd float %401, 0xC168000FE0000000
  %403 = fneg float %402
  %404 = tail call float @llvm.fma.f32(float %subtract.422.8, float 0x3FF7154760000000, float %403) #5
  %405 = tail call float @llvm.fma.f32(float %subtract.422.8, float 0x3E54AE0C00000000, float %404) #5
  %406 = bitcast float %401 to i32
  %407 = shl i32 %406, 23
  %408 = bitcast i32 %407 to float
  %409 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %405) #5
  %410 = fmul float %409, %408
  %add.10.i42.8 = fadd float %add.10.i42.7, %410
  %subtract.422.9 = fsub float %396, %12
  %411 = tail call float @llvm.fma.f32(float %subtract.422.9, float 0x3F777313A0000000, float 5.000000e-01) #5
  %412 = tail call float @llvm.nvvm.saturate.f(float %411) #5
  %413 = tail call float @llvm.nvvm.fma.rm.f(float %412, float 2.520000e+02, float 0x4168000020000000) #5
  %414 = fadd float %413, 0xC168000FE0000000
  %415 = fneg float %414
  %416 = tail call float @llvm.fma.f32(float %subtract.422.9, float 0x3FF7154760000000, float %415) #5
  %417 = tail call float @llvm.fma.f32(float %subtract.422.9, float 0x3E54AE0C00000000, float %416) #5
  %418 = bitcast float %413 to i32
  %419 = shl i32 %418, 23
  %420 = bitcast i32 %419 to float
  %421 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %417) #5
  %422 = fmul float %421, %420
  %add.10.i42.9 = fadd float %add.10.i42.8, %422
  %subtract.434 = fsub float %397, %13
  %423 = tail call float @llvm.fma.f32(float %subtract.434, float 0x3F777313A0000000, float 5.000000e-01) #5
  %424 = tail call float @llvm.nvvm.saturate.f(float %423) #5
  %425 = tail call float @llvm.nvvm.fma.rm.f(float %424, float 2.520000e+02, float 0x4168000020000000) #5
  %426 = fadd float %425, 0xC168000FE0000000
  %427 = fneg float %426
  %428 = tail call float @llvm.fma.f32(float %subtract.434, float 0x3FF7154760000000, float %427) #5
  %429 = tail call float @llvm.fma.f32(float %subtract.434, float 0x3E54AE0C00000000, float %428) #5
  %430 = bitcast float %425 to i32
  %431 = shl i32 %430, 23
  %432 = bitcast i32 %431 to float
  %433 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %429) #5
  %434 = fmul float %433, %432
  %subtract.434.1 = fsub float %398, %13
  %435 = tail call float @llvm.fma.f32(float %subtract.434.1, float 0x3F777313A0000000, float 5.000000e-01) #5
  %436 = tail call float @llvm.nvvm.saturate.f(float %435) #5
  %437 = tail call float @llvm.nvvm.fma.rm.f(float %436, float 2.520000e+02, float 0x4168000020000000) #5
  %438 = fadd float %437, 0xC168000FE0000000
  %439 = fneg float %438
  %440 = tail call float @llvm.fma.f32(float %subtract.434.1, float 0x3FF7154760000000, float %439) #5
  %441 = tail call float @llvm.fma.f32(float %subtract.434.1, float 0x3E54AE0C00000000, float %440) #5
  %442 = bitcast float %437 to i32
  %443 = shl i32 %442, 23
  %444 = bitcast i32 %443 to float
  %445 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %441) #5
  %446 = fmul float %445, %444
  %add.10.i.1 = fadd float %434, %446
  %447 = getelementptr inbounds float, ptr addrspace(1) %14, i64 32
  %448 = load <4 x float>, ptr addrspace(1) %447, align 32, !invariant.load !30
  %449 = extractelement <4 x float> %448, i32 0
  %450 = extractelement <4 x float> %448, i32 1
  %451 = extractelement <4 x float> %448, i32 2
  %452 = extractelement <4 x float> %448, i32 3
  %subtract.434.2 = fsub float %449, %13
  %453 = tail call float @llvm.fma.f32(float %subtract.434.2, float 0x3F777313A0000000, float 5.000000e-01) #5
  %454 = tail call float @llvm.nvvm.saturate.f(float %453) #5
  %455 = tail call float @llvm.nvvm.fma.rm.f(float %454, float 2.520000e+02, float 0x4168000020000000) #5
  %456 = fadd float %455, 0xC168000FE0000000
  %457 = fneg float %456
  %458 = tail call float @llvm.fma.f32(float %subtract.434.2, float 0x3FF7154760000000, float %457) #5
  %459 = tail call float @llvm.fma.f32(float %subtract.434.2, float 0x3E54AE0C00000000, float %458) #5
  %460 = bitcast float %455 to i32
  %461 = shl i32 %460, 23
  %462 = bitcast i32 %461 to float
  %463 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %459) #5
  %464 = fmul float %463, %462
  %add.10.i.2 = fadd float %add.10.i.1, %464
  %subtract.434.3 = fsub float %450, %13
  %465 = tail call float @llvm.fma.f32(float %subtract.434.3, float 0x3F777313A0000000, float 5.000000e-01) #5
  %466 = tail call float @llvm.nvvm.saturate.f(float %465) #5
  %467 = tail call float @llvm.nvvm.fma.rm.f(float %466, float 2.520000e+02, float 0x4168000020000000) #5
  %468 = fadd float %467, 0xC168000FE0000000
  %469 = fneg float %468
  %470 = tail call float @llvm.fma.f32(float %subtract.434.3, float 0x3FF7154760000000, float %469) #5
  %471 = tail call float @llvm.fma.f32(float %subtract.434.3, float 0x3E54AE0C00000000, float %470) #5
  %472 = bitcast float %467 to i32
  %473 = shl i32 %472, 23
  %474 = bitcast i32 %473 to float
  %475 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %471) #5
  %476 = fmul float %475, %474
  %add.10.i.3 = fadd float %add.10.i.2, %476
  %subtract.434.4 = fsub float %451, %13
  %477 = tail call float @llvm.fma.f32(float %subtract.434.4, float 0x3F777313A0000000, float 5.000000e-01) #5
  %478 = tail call float @llvm.nvvm.saturate.f(float %477) #5
  %479 = tail call float @llvm.nvvm.fma.rm.f(float %478, float 2.520000e+02, float 0x4168000020000000) #5
  %480 = fadd float %479, 0xC168000FE0000000
  %481 = fneg float %480
  %482 = tail call float @llvm.fma.f32(float %subtract.434.4, float 0x3FF7154760000000, float %481) #5
  %483 = tail call float @llvm.fma.f32(float %subtract.434.4, float 0x3E54AE0C00000000, float %482) #5
  %484 = bitcast float %479 to i32
  %485 = shl i32 %484, 23
  %486 = bitcast i32 %485 to float
  %487 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %483) #5
  %488 = fmul float %487, %486
  %add.10.i.4 = fadd float %add.10.i.3, %488
  %subtract.434.5 = fsub float %452, %13
  %489 = tail call float @llvm.fma.f32(float %subtract.434.5, float 0x3F777313A0000000, float 5.000000e-01) #5
  %490 = tail call float @llvm.nvvm.saturate.f(float %489) #5
  %491 = tail call float @llvm.nvvm.fma.rm.f(float %490, float 2.520000e+02, float 0x4168000020000000) #5
  %492 = fadd float %491, 0xC168000FE0000000
  %493 = fneg float %492
  %494 = tail call float @llvm.fma.f32(float %subtract.434.5, float 0x3FF7154760000000, float %493) #5
  %495 = tail call float @llvm.fma.f32(float %subtract.434.5, float 0x3E54AE0C00000000, float %494) #5
  %496 = bitcast float %491 to i32
  %497 = shl i32 %496, 23
  %498 = bitcast i32 %497 to float
  %499 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %495) #5
  %500 = fmul float %499, %498
  %add.10.i.5 = fadd float %add.10.i.4, %500
  %501 = getelementptr inbounds float, ptr addrspace(1) %14, i64 36
  %502 = load <4 x float>, ptr addrspace(1) %501, align 16, !invariant.load !30
  %503 = extractelement <4 x float> %502, i32 0
  %504 = extractelement <4 x float> %502, i32 1
  %505 = extractelement <4 x float> %502, i32 2
  %506 = extractelement <4 x float> %502, i32 3
  %subtract.434.6 = fsub float %503, %13
  %507 = tail call float @llvm.fma.f32(float %subtract.434.6, float 0x3F777313A0000000, float 5.000000e-01) #5
  %508 = tail call float @llvm.nvvm.saturate.f(float %507) #5
  %509 = tail call float @llvm.nvvm.fma.rm.f(float %508, float 2.520000e+02, float 0x4168000020000000) #5
  %510 = fadd float %509, 0xC168000FE0000000
  %511 = fneg float %510
  %512 = tail call float @llvm.fma.f32(float %subtract.434.6, float 0x3FF7154760000000, float %511) #5
  %513 = tail call float @llvm.fma.f32(float %subtract.434.6, float 0x3E54AE0C00000000, float %512) #5
  %514 = bitcast float %509 to i32
  %515 = shl i32 %514, 23
  %516 = bitcast i32 %515 to float
  %517 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %513) #5
  %518 = fmul float %517, %516
  %add.10.i.6 = fadd float %add.10.i.5, %518
  %subtract.434.7 = fsub float %504, %13
  %519 = tail call float @llvm.fma.f32(float %subtract.434.7, float 0x3F777313A0000000, float 5.000000e-01) #5
  %520 = tail call float @llvm.nvvm.saturate.f(float %519) #5
  %521 = tail call float @llvm.nvvm.fma.rm.f(float %520, float 2.520000e+02, float 0x4168000020000000) #5
  %522 = fadd float %521, 0xC168000FE0000000
  %523 = fneg float %522
  %524 = tail call float @llvm.fma.f32(float %subtract.434.7, float 0x3FF7154760000000, float %523) #5
  %525 = tail call float @llvm.fma.f32(float %subtract.434.7, float 0x3E54AE0C00000000, float %524) #5
  %526 = bitcast float %521 to i32
  %527 = shl i32 %526, 23
  %528 = bitcast i32 %527 to float
  %529 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %525) #5
  %530 = fmul float %529, %528
  %add.10.i.7 = fadd float %add.10.i.6, %530
  %subtract.434.8 = fsub float %505, %13
  %531 = tail call float @llvm.fma.f32(float %subtract.434.8, float 0x3F777313A0000000, float 5.000000e-01) #5
  %532 = tail call float @llvm.nvvm.saturate.f(float %531) #5
  %533 = tail call float @llvm.nvvm.fma.rm.f(float %532, float 2.520000e+02, float 0x4168000020000000) #5
  %534 = fadd float %533, 0xC168000FE0000000
  %535 = fneg float %534
  %536 = tail call float @llvm.fma.f32(float %subtract.434.8, float 0x3FF7154760000000, float %535) #5
  %537 = tail call float @llvm.fma.f32(float %subtract.434.8, float 0x3E54AE0C00000000, float %536) #5
  %538 = bitcast float %533 to i32
  %539 = shl i32 %538, 23
  %540 = bitcast i32 %539 to float
  %541 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %537) #5
  %542 = fmul float %541, %540
  %add.10.i.8 = fadd float %add.10.i.7, %542
  %subtract.434.9 = fsub float %506, %13
  %543 = tail call float @llvm.fma.f32(float %subtract.434.9, float 0x3F777313A0000000, float 5.000000e-01) #5
  %544 = tail call float @llvm.nvvm.saturate.f(float %543) #5
  %545 = tail call float @llvm.nvvm.fma.rm.f(float %544, float 2.520000e+02, float 0x4168000020000000) #5
  %546 = fadd float %545, 0xC168000FE0000000
  %547 = fneg float %546
  %548 = tail call float @llvm.fma.f32(float %subtract.434.9, float 0x3FF7154760000000, float %547) #5
  %549 = tail call float @llvm.fma.f32(float %subtract.434.9, float 0x3E54AE0C00000000, float %548) #5
  %550 = bitcast float %545 to i32
  %551 = shl i32 %550, 23
  %552 = bitcast i32 %551 to float
  %553 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %549) #5
  %554 = fmul float %553, %552
  %add.10.i.9 = fadd float %add.10.i.8, %554
  %555 = insertelement <4 x float> poison, float %add.10.i44.9, i32 0
  %556 = insertelement <4 x float> %555, float %add.10.i43.9, i32 1
  %557 = insertelement <4 x float> %556, float %add.10.i42.9, i32 2
  %558 = insertelement <4 x float> %557, float %add.10.i.9, i32 3
  store <4 x float> %558, ptr addrspace(1) %152, align 16
  br label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %reduce.11.inner.loop_header.reduction_dim.1.preheader, %entry
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_2(ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #2 {
entry:
  %temp_buf7 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 100000
  br i1 %4, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %5 = udiv i32 %linear_index3, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = udiv i32 %linear_index2, 10
  %7 = udiv i32 %linear_index_base, 10
  %8 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf7, i64 20000000
  %9 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf7, i64 40064
  %10 = zext i32 %linear_index_base to i64
  %11 = getelementptr float, ptr addrspace(1) %8, i64 %10
  %12 = load <4 x float>, ptr addrspace(1) %11, align 16
  %13 = extractelement <4 x float> %12, i32 0
  %14 = extractelement <4 x float> %12, i32 1
  %15 = extractelement <4 x float> %12, i32 2
  %16 = extractelement <4 x float> %12, i32 3
  %17 = zext i32 %7 to i64
  %18 = getelementptr inbounds [10000 x float], ptr addrspace(1) %temp_buf7, i64 0, i64 %17
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !30
  %subtract.5 = fsub float %13, %19
  %20 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3F777313A0000000, float 5.000000e-01) #5
  %21 = tail call float @llvm.nvvm.saturate.f(float %20) #5
  %22 = tail call float @llvm.nvvm.fma.rm.f(float %21, float 2.520000e+02, float 0x4168000020000000) #5
  %23 = fadd float %22, 0xC168000FE0000000
  %24 = fneg float %23
  %25 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3FF7154760000000, float %24) #5
  %26 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3E54AE0C00000000, float %25) #5
  %27 = bitcast float %22 to i32
  %28 = shl i32 %27, 23
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %26) #5
  %31 = fmul float %30, %29
  %32 = getelementptr inbounds [10000 x float], ptr addrspace(1) %9, i64 0, i64 %17
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !30
  %divide.8 = fdiv float %31, %33
  %subtract.51 = fsub float %14, %19
  %34 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3F777313A0000000, float 5.000000e-01) #5
  %35 = tail call float @llvm.nvvm.saturate.f(float %34) #5
  %36 = tail call float @llvm.nvvm.fma.rm.f(float %35, float 2.520000e+02, float 0x4168000020000000) #5
  %37 = fadd float %36, 0xC168000FE0000000
  %38 = fneg float %37
  %39 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3FF7154760000000, float %38) #5
  %40 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3E54AE0C00000000, float %39) #5
  %41 = bitcast float %36 to i32
  %42 = shl i32 %41, 23
  %43 = bitcast i32 %42 to float
  %44 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %40) #5
  %45 = fmul float %44, %43
  %divide.82 = fdiv float %45, %33
  %46 = zext i32 %6 to i64
  %47 = getelementptr inbounds [10000 x float], ptr addrspace(1) %temp_buf7, i64 0, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !30
  %subtract.53 = fsub float %15, %48
  %49 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3F777313A0000000, float 5.000000e-01) #5
  %50 = tail call float @llvm.nvvm.saturate.f(float %49) #5
  %51 = tail call float @llvm.nvvm.fma.rm.f(float %50, float 2.520000e+02, float 0x4168000020000000) #5
  %52 = fadd float %51, 0xC168000FE0000000
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3FF7154760000000, float %53) #5
  %55 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3E54AE0C00000000, float %54) #5
  %56 = bitcast float %51 to i32
  %57 = shl i32 %56, 23
  %58 = bitcast i32 %57 to float
  %59 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %55) #5
  %60 = fmul float %59, %58
  %61 = getelementptr inbounds [10000 x float], ptr addrspace(1) %9, i64 0, i64 %46
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !30
  %divide.84 = fdiv float %60, %62
  %63 = zext i32 %5 to i64
  %64 = getelementptr inbounds [10000 x float], ptr addrspace(1) %temp_buf7, i64 0, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !30
  %subtract.55 = fsub float %16, %65
  %66 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3F777313A0000000, float 5.000000e-01) #5
  %67 = tail call float @llvm.nvvm.saturate.f(float %66) #5
  %68 = tail call float @llvm.nvvm.fma.rm.f(float %67, float 2.520000e+02, float 0x4168000020000000) #5
  %69 = fadd float %68, 0xC168000FE0000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3FF7154760000000, float %70) #5
  %72 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3E54AE0C00000000, float %71) #5
  %73 = bitcast float %68 to i32
  %74 = shl i32 %73, 23
  %75 = bitcast i32 %74 to float
  %76 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %72) #5
  %77 = fmul float %76, %75
  %78 = getelementptr inbounds [10000 x float], ptr addrspace(1) %9, i64 0, i64 %63
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !30
  %divide.86 = fdiv float %77, %79
  %80 = insertelement <4 x float> poison, float %divide.8, i32 0
  %81 = insertelement <4 x float> %80, float %divide.82, i32 1
  %82 = insertelement <4 x float> %81, float %divide.84, i32 2
  %83 = insertelement <4 x float> %82, float %divide.86, i32 3
  store <4 x float> %83, ptr addrspace(1) %11, align 16
  br label %fusion_2.in_bounds-after
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @iota_65(ptr noalias nocapture writeonly align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #3 {
entry:
  %temp_buf1 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 100000
  br i1 %4, label %iota_65.in_bounds-true, label %iota_65.in_bounds-after

iota_65.in_bounds-after:                          ; preds = %iota_65.in_bounds-true, %entry
  ret void

iota_65.in_bounds-true:                           ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %5 = urem i32 %linear_index3, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 10
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 10
  %8 = urem i32 %linear_index_base, 10
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr i32, ptr addrspace(1) %temp_buf1, i64 %9
  %11 = insertelement <4 x i32> poison, i32 %8, i32 0
  %12 = insertelement <4 x i32> %11, i32 %7, i32 1
  %13 = insertelement <4 x i32> %12, i32 %6, i32 2
  %14 = insertelement <4 x i32> %13, i32 %5, i32 3
  store <4 x i32> %14, ptr addrspace(1) %10, align 16
  br label %iota_65.in_bounds-after
}

; Function Attrs: nofree nosync nounwind
define void @reduce_78(ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #4 {
entry:
  %temp_buf10 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !38
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 10000
  br i1 %3, label %reduce.26.inner.loop_header.reduction_dim.1.preheader, label %reduce_78.in_bounds-after

reduce.26.inner.loop_header.reduction_dim.1.preheader: ; preds = %entry
  %4 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf10, i64 400000
  %5 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf10, i64 440064
  %6 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf10, i64 20000000
  %7 = zext i32 %linear_index to i64
  %8 = getelementptr inbounds [10000 x [10 x float]], ptr addrspace(1) %6, i64 0, i64 %7, i64 0
  %9 = load <2 x float>, ptr addrspace(1) %8, align 8, !invariant.load !30
  %10 = extractelement <2 x float> %9, i32 0
  %11 = extractelement <2 x float> %9, i32 1
  %12 = getelementptr inbounds [10000 x [10 x i32]], ptr addrspace(1) %temp_buf10, i64 0, i64 %7, i64 0
  %13 = load <2 x i32>, ptr addrspace(1) %12, align 8, !invariant.load !30
  %14 = extractelement <2 x i32> %13, i32 0
  %15 = extractelement <2 x i32> %13, i32 1
  %compare.10.i = fcmp oeq float %10, 0xFFF0000000000000
  %16 = tail call i32 @llvm.smin.i32(i32 %14, i32 0) #5
  %compare.12.i = fcmp ole float %10, 0xFFF0000000000000
  %17 = select i1 %compare.12.i, i32 0, i32 %14
  %18 = select i1 %compare.10.i, i32 %16, i32 %17
  %19 = select i1 %compare.12.i, float 0xFFF0000000000000, float %10
  %compare.10.i.1 = fcmp oeq float %19, %11
  %20 = tail call i32 @llvm.smin.i32(i32 %18, i32 %15) #5
  %compare.12.i.1 = fcmp oge float %19, %11
  %21 = select i1 %compare.12.i.1, i32 %18, i32 %15
  %22 = select i1 %compare.10.i.1, i32 %20, i32 %21
  %23 = select i1 %compare.12.i.1, float %19, float %11
  %24 = getelementptr inbounds float, ptr addrspace(1) %8, i64 2
  %25 = load <2 x float>, ptr addrspace(1) %24, align 8, !invariant.load !30
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %28 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 2
  %29 = load <2 x i32>, ptr addrspace(1) %28, align 8, !invariant.load !30
  %30 = extractelement <2 x i32> %29, i32 0
  %31 = extractelement <2 x i32> %29, i32 1
  %compare.10.i.2 = fcmp oeq float %23, %26
  %32 = tail call i32 @llvm.smin.i32(i32 %22, i32 %30) #5
  %compare.12.i.2 = fcmp oge float %23, %26
  %33 = select i1 %compare.12.i.2, i32 %22, i32 %30
  %34 = select i1 %compare.10.i.2, i32 %32, i32 %33
  %35 = select i1 %compare.12.i.2, float %23, float %26
  %compare.10.i.3 = fcmp oeq float %35, %27
  %36 = tail call i32 @llvm.smin.i32(i32 %34, i32 %31) #5
  %compare.12.i.3 = fcmp oge float %35, %27
  %37 = select i1 %compare.12.i.3, i32 %34, i32 %31
  %38 = select i1 %compare.10.i.3, i32 %36, i32 %37
  %39 = select i1 %compare.12.i.3, float %35, float %27
  %40 = getelementptr inbounds float, ptr addrspace(1) %8, i64 4
  %41 = load <2 x float>, ptr addrspace(1) %40, align 8, !invariant.load !30
  %42 = extractelement <2 x float> %41, i32 0
  %43 = extractelement <2 x float> %41, i32 1
  %44 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 4
  %45 = load <2 x i32>, ptr addrspace(1) %44, align 8, !invariant.load !30
  %46 = extractelement <2 x i32> %45, i32 0
  %47 = extractelement <2 x i32> %45, i32 1
  %compare.10.i.4 = fcmp oeq float %39, %42
  %48 = tail call i32 @llvm.smin.i32(i32 %38, i32 %46) #5
  %compare.12.i.4 = fcmp oge float %39, %42
  %49 = select i1 %compare.12.i.4, i32 %38, i32 %46
  %50 = select i1 %compare.10.i.4, i32 %48, i32 %49
  %51 = select i1 %compare.12.i.4, float %39, float %42
  %compare.10.i.5 = fcmp oeq float %51, %43
  %52 = tail call i32 @llvm.smin.i32(i32 %50, i32 %47) #5
  %compare.12.i.5 = fcmp oge float %51, %43
  %53 = select i1 %compare.12.i.5, i32 %50, i32 %47
  %54 = select i1 %compare.10.i.5, i32 %52, i32 %53
  %55 = select i1 %compare.12.i.5, float %51, float %43
  %56 = getelementptr inbounds float, ptr addrspace(1) %8, i64 6
  %57 = load <2 x float>, ptr addrspace(1) %56, align 8, !invariant.load !30
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 6
  %61 = load <2 x i32>, ptr addrspace(1) %60, align 8, !invariant.load !30
  %62 = extractelement <2 x i32> %61, i32 0
  %63 = extractelement <2 x i32> %61, i32 1
  %compare.10.i.6 = fcmp oeq float %55, %58
  %64 = tail call i32 @llvm.smin.i32(i32 %54, i32 %62) #5
  %compare.12.i.6 = fcmp oge float %55, %58
  %65 = select i1 %compare.12.i.6, i32 %54, i32 %62
  %66 = select i1 %compare.10.i.6, i32 %64, i32 %65
  %67 = select i1 %compare.12.i.6, float %55, float %58
  %compare.10.i.7 = fcmp oeq float %67, %59
  %68 = tail call i32 @llvm.smin.i32(i32 %66, i32 %63) #5
  %compare.12.i.7 = fcmp oge float %67, %59
  %69 = select i1 %compare.12.i.7, i32 %66, i32 %63
  %70 = select i1 %compare.10.i.7, i32 %68, i32 %69
  %71 = select i1 %compare.12.i.7, float %67, float %59
  %72 = getelementptr inbounds float, ptr addrspace(1) %8, i64 8
  %73 = load <2 x float>, ptr addrspace(1) %72, align 8, !invariant.load !30
  %74 = extractelement <2 x float> %73, i32 0
  %75 = extractelement <2 x float> %73, i32 1
  %76 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 8
  %77 = load <2 x i32>, ptr addrspace(1) %76, align 8, !invariant.load !30
  %78 = extractelement <2 x i32> %77, i32 0
  %79 = extractelement <2 x i32> %77, i32 1
  %compare.10.i.8 = fcmp oeq float %71, %74
  %80 = tail call i32 @llvm.smin.i32(i32 %70, i32 %78) #5
  %compare.12.i.8 = fcmp oge float %71, %74
  %81 = select i1 %compare.12.i.8, i32 %70, i32 %78
  %82 = select i1 %compare.10.i.8, i32 %80, i32 %81
  %83 = select i1 %compare.12.i.8, float %71, float %74
  %compare.10.i.9 = fcmp oeq float %83, %75
  %84 = tail call i32 @llvm.smin.i32(i32 %82, i32 %79) #5
  %compare.12.i.9 = fcmp oge float %83, %75
  %85 = select i1 %compare.12.i.9, i32 %82, i32 %79
  %86 = select i1 %compare.10.i.9, i32 %84, i32 %85
  %87 = select i1 %compare.12.i.9, float %83, float %75
  %88 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %7
  store float %87, ptr addrspace(1) %88, align 4
  %89 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %7
  store i32 %86, ptr addrspace(1) %89, align 4
  br label %reduce_78.in_bounds-after

reduce_78.in_bounds-after:                        ; preds = %reduce.26.inner.loop_header.reduction_dim.1.preheader, %entry
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn writeonly
define void @iota_19(ptr noalias nocapture writeonly align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #3 {
entry:
  %temp_buf1 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 100000
  br i1 %4, label %iota_19.in_bounds-true, label %iota_19.in_bounds-after

iota_19.in_bounds-after:                          ; preds = %iota_19.in_bounds-true, %entry
  ret void

iota_19.in_bounds-true:                           ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %5 = urem i32 %linear_index3, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 10
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 10
  %8 = urem i32 %linear_index_base, 10
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr i32, ptr addrspace(1) %temp_buf1, i64 %9
  %11 = insertelement <4 x i32> poison, i32 %8, i32 0
  %12 = insertelement <4 x i32> %11, i32 %7, i32 1
  %13 = insertelement <4 x i32> %12, i32 %6, i32 2
  %14 = insertelement <4 x i32> %13, i32 %5, i32 3
  store <4 x i32> %14, ptr addrspace(1) %10, align 16
  br label %iota_19.in_bounds-after
}

; Function Attrs: nofree nosync nounwind
define void @reduce_32(ptr noalias nocapture readonly align 16 dereferenceable(400000) %alloc1, ptr noalias nocapture align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #4 {
entry:
  %temp_buf12 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc110 = addrspacecast ptr %alloc1 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !38
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 10000
  br i1 %3, label %reduce.26.inner.loop_header.reduction_dim.1.preheader, label %reduce_32.in_bounds-after

reduce.26.inner.loop_header.reduction_dim.1.preheader: ; preds = %entry
  %4 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf12, i64 440064
  %5 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf12, i64 480128
  %6 = zext i32 %linear_index to i64
  %7 = getelementptr inbounds [10000 x [10 x float]], ptr addrspace(1) %alloc110, i64 0, i64 %6, i64 0
  %8 = load <2 x float>, ptr addrspace(1) %7, align 8, !invariant.load !30
  %9 = extractelement <2 x float> %8, i32 0
  %10 = extractelement <2 x float> %8, i32 1
  %11 = getelementptr inbounds [10000 x [10 x i32]], ptr addrspace(1) %temp_buf12, i64 0, i64 %6, i64 0
  %12 = load <2 x i32>, ptr addrspace(1) %11, align 8, !invariant.load !30
  %13 = extractelement <2 x i32> %12, i32 0
  %14 = extractelement <2 x i32> %12, i32 1
  %compare.10.i = fcmp oeq float %9, 0xFFF0000000000000
  %15 = tail call i32 @llvm.smin.i32(i32 %13, i32 0) #5
  %compare.12.i = fcmp ole float %9, 0xFFF0000000000000
  %16 = select i1 %compare.12.i, i32 0, i32 %13
  %17 = select i1 %compare.10.i, i32 %15, i32 %16
  %18 = select i1 %compare.12.i, float 0xFFF0000000000000, float %9
  %compare.10.i.1 = fcmp oeq float %18, %10
  %19 = tail call i32 @llvm.smin.i32(i32 %17, i32 %14) #5
  %compare.12.i.1 = fcmp oge float %18, %10
  %20 = select i1 %compare.12.i.1, i32 %17, i32 %14
  %21 = select i1 %compare.10.i.1, i32 %19, i32 %20
  %22 = select i1 %compare.12.i.1, float %18, float %10
  %23 = getelementptr inbounds float, ptr addrspace(1) %7, i64 2
  %24 = load <2 x float>, ptr addrspace(1) %23, align 8, !invariant.load !30
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 2
  %28 = load <2 x i32>, ptr addrspace(1) %27, align 8, !invariant.load !30
  %29 = extractelement <2 x i32> %28, i32 0
  %30 = extractelement <2 x i32> %28, i32 1
  %compare.10.i.2 = fcmp oeq float %22, %25
  %31 = tail call i32 @llvm.smin.i32(i32 %21, i32 %29) #5
  %compare.12.i.2 = fcmp oge float %22, %25
  %32 = select i1 %compare.12.i.2, i32 %21, i32 %29
  %33 = select i1 %compare.10.i.2, i32 %31, i32 %32
  %34 = select i1 %compare.12.i.2, float %22, float %25
  %compare.10.i.3 = fcmp oeq float %34, %26
  %35 = tail call i32 @llvm.smin.i32(i32 %33, i32 %30) #5
  %compare.12.i.3 = fcmp oge float %34, %26
  %36 = select i1 %compare.12.i.3, i32 %33, i32 %30
  %37 = select i1 %compare.10.i.3, i32 %35, i32 %36
  %38 = select i1 %compare.12.i.3, float %34, float %26
  %39 = getelementptr inbounds float, ptr addrspace(1) %7, i64 4
  %40 = load <2 x float>, ptr addrspace(1) %39, align 8, !invariant.load !30
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %43 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 4
  %44 = load <2 x i32>, ptr addrspace(1) %43, align 8, !invariant.load !30
  %45 = extractelement <2 x i32> %44, i32 0
  %46 = extractelement <2 x i32> %44, i32 1
  %compare.10.i.4 = fcmp oeq float %38, %41
  %47 = tail call i32 @llvm.smin.i32(i32 %37, i32 %45) #5
  %compare.12.i.4 = fcmp oge float %38, %41
  %48 = select i1 %compare.12.i.4, i32 %37, i32 %45
  %49 = select i1 %compare.10.i.4, i32 %47, i32 %48
  %50 = select i1 %compare.12.i.4, float %38, float %41
  %compare.10.i.5 = fcmp oeq float %50, %42
  %51 = tail call i32 @llvm.smin.i32(i32 %49, i32 %46) #5
  %compare.12.i.5 = fcmp oge float %50, %42
  %52 = select i1 %compare.12.i.5, i32 %49, i32 %46
  %53 = select i1 %compare.10.i.5, i32 %51, i32 %52
  %54 = select i1 %compare.12.i.5, float %50, float %42
  %55 = getelementptr inbounds float, ptr addrspace(1) %7, i64 6
  %56 = load <2 x float>, ptr addrspace(1) %55, align 8, !invariant.load !30
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 6
  %60 = load <2 x i32>, ptr addrspace(1) %59, align 8, !invariant.load !30
  %61 = extractelement <2 x i32> %60, i32 0
  %62 = extractelement <2 x i32> %60, i32 1
  %compare.10.i.6 = fcmp oeq float %54, %57
  %63 = tail call i32 @llvm.smin.i32(i32 %53, i32 %61) #5
  %compare.12.i.6 = fcmp oge float %54, %57
  %64 = select i1 %compare.12.i.6, i32 %53, i32 %61
  %65 = select i1 %compare.10.i.6, i32 %63, i32 %64
  %66 = select i1 %compare.12.i.6, float %54, float %57
  %compare.10.i.7 = fcmp oeq float %66, %58
  %67 = tail call i32 @llvm.smin.i32(i32 %65, i32 %62) #5
  %compare.12.i.7 = fcmp oge float %66, %58
  %68 = select i1 %compare.12.i.7, i32 %65, i32 %62
  %69 = select i1 %compare.10.i.7, i32 %67, i32 %68
  %70 = select i1 %compare.12.i.7, float %66, float %58
  %71 = getelementptr inbounds float, ptr addrspace(1) %7, i64 8
  %72 = load <2 x float>, ptr addrspace(1) %71, align 8, !invariant.load !30
  %73 = extractelement <2 x float> %72, i32 0
  %74 = extractelement <2 x float> %72, i32 1
  %75 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 8
  %76 = load <2 x i32>, ptr addrspace(1) %75, align 8, !invariant.load !30
  %77 = extractelement <2 x i32> %76, i32 0
  %78 = extractelement <2 x i32> %76, i32 1
  %compare.10.i.8 = fcmp oeq float %70, %73
  %79 = tail call i32 @llvm.smin.i32(i32 %69, i32 %77) #5
  %compare.12.i.8 = fcmp oge float %70, %73
  %80 = select i1 %compare.12.i.8, i32 %69, i32 %77
  %81 = select i1 %compare.10.i.8, i32 %79, i32 %80
  %82 = select i1 %compare.12.i.8, float %70, float %73
  %compare.10.i.9 = fcmp oeq float %82, %74
  %83 = tail call i32 @llvm.smin.i32(i32 %81, i32 %78) #5
  %compare.12.i.9 = fcmp oge float %82, %74
  %84 = select i1 %compare.12.i.9, i32 %81, i32 %78
  %85 = select i1 %compare.10.i.9, i32 %83, i32 %84
  %86 = select i1 %compare.12.i.9, float %82, float %74
  %87 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %6
  store float %86, ptr addrspace(1) %87, align 4
  %88 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %6
  store i32 %85, ptr addrspace(1) %88, align 4
  br label %reduce_32.in_bounds-after

reduce_32.in_bounds-after:                        ; preds = %reduce.26.inner.loop_header.reduction_dim.1.preheader, %entry
  ret void
}

; Function Attrs: nounwind
define void @input_fusion_reduce(ptr noalias nocapture writeonly align 128 dereferenceable(4) %alloc6, ptr noalias nocapture readonly align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #5 {
entry:
  %temp_buf69 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc667 = addrspacecast ptr %alloc6 to ptr addrspace(1)
  %initial_value_addr = alloca float, align 4
  %0 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf69, i64 440064
  %1 = getelementptr inbounds i8, ptr addrspace(1) %temp_buf69, i64 400000
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %3 = zext i32 %2 to i64
  %Arg_1.212 = getelementptr i32, ptr addrspace(1) %1, i64 %3
  %Arg_1.213 = load i32, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !30
  %Arg_0.114 = getelementptr i32, ptr addrspace(1) %0, i64 %3
  %Arg_0.115 = load i32, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !30
  %4 = icmp eq i32 %Arg_1.213, %Arg_0.115
  %5 = uitofp i1 %4 to float
  %Arg_1.212.172 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 640
  %Arg_1.213.1 = load i32, ptr addrspace(1) %Arg_1.212.172, align 4, !invariant.load !30
  %Arg_0.114.174 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 640
  %Arg_0.115.1 = load i32, ptr addrspace(1) %Arg_0.114.174, align 4, !invariant.load !30
  %6 = icmp eq i32 %Arg_1.213.1, %Arg_0.115.1
  %7 = uitofp i1 %6 to float
  %add.11.i60.1 = fadd float %5, %7
  %Arg_1.212.276 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 1280
  %Arg_1.213.2 = load i32, ptr addrspace(1) %Arg_1.212.276, align 4, !invariant.load !30
  %Arg_0.114.278 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 1280
  %Arg_0.115.2 = load i32, ptr addrspace(1) %Arg_0.114.278, align 4, !invariant.load !30
  %8 = icmp eq i32 %Arg_1.213.2, %Arg_0.115.2
  %9 = uitofp i1 %8 to float
  %add.11.i60.2 = fadd float %add.11.i60.1, %9
  %Arg_1.212.380 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 1920
  %Arg_1.213.3 = load i32, ptr addrspace(1) %Arg_1.212.380, align 4, !invariant.load !30
  %Arg_0.114.382 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 1920
  %Arg_0.115.3 = load i32, ptr addrspace(1) %Arg_0.114.382, align 4, !invariant.load !30
  %10 = icmp eq i32 %Arg_1.213.3, %Arg_0.115.3
  %11 = uitofp i1 %10 to float
  %add.11.i60.3 = fadd float %add.11.i60.2, %11
  %Arg_1.212.484 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 2560
  %Arg_1.213.4 = load i32, ptr addrspace(1) %Arg_1.212.484, align 4, !invariant.load !30
  %Arg_0.114.486 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 2560
  %Arg_0.115.4 = load i32, ptr addrspace(1) %Arg_0.114.486, align 4, !invariant.load !30
  %12 = icmp eq i32 %Arg_1.213.4, %Arg_0.115.4
  %13 = uitofp i1 %12 to float
  %add.11.i60.4 = fadd float %add.11.i60.3, %13
  %Arg_1.212.588 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 3200
  %Arg_1.213.5 = load i32, ptr addrspace(1) %Arg_1.212.588, align 4, !invariant.load !30
  %Arg_0.114.590 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 3200
  %Arg_0.115.5 = load i32, ptr addrspace(1) %Arg_0.114.590, align 4, !invariant.load !30
  %14 = icmp eq i32 %Arg_1.213.5, %Arg_0.115.5
  %15 = uitofp i1 %14 to float
  %add.11.i60.5 = fadd float %add.11.i60.4, %15
  %Arg_1.212.692 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 3840
  %Arg_1.213.6 = load i32, ptr addrspace(1) %Arg_1.212.692, align 4, !invariant.load !30
  %Arg_0.114.694 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 3840
  %Arg_0.115.6 = load i32, ptr addrspace(1) %Arg_0.114.694, align 4, !invariant.load !30
  %16 = icmp eq i32 %Arg_1.213.6, %Arg_0.115.6
  %17 = uitofp i1 %16 to float
  %add.11.i60.6 = fadd float %add.11.i60.5, %17
  %Arg_1.212.796 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 4480
  %Arg_1.213.7 = load i32, ptr addrspace(1) %Arg_1.212.796, align 4, !invariant.load !30
  %Arg_0.114.798 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 4480
  %Arg_0.115.7 = load i32, ptr addrspace(1) %Arg_0.114.798, align 4, !invariant.load !30
  %18 = icmp eq i32 %Arg_1.213.7, %Arg_0.115.7
  %19 = uitofp i1 %18 to float
  %add.11.i60.7 = fadd float %add.11.i60.6, %19
  %Arg_1.212.8100 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 5120
  %Arg_1.213.8 = load i32, ptr addrspace(1) %Arg_1.212.8100, align 4, !invariant.load !30
  %Arg_0.114.8102 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 5120
  %Arg_0.115.8 = load i32, ptr addrspace(1) %Arg_0.114.8102, align 4, !invariant.load !30
  %20 = icmp eq i32 %Arg_1.213.8, %Arg_0.115.8
  %21 = uitofp i1 %20 to float
  %add.11.i60.8 = fadd float %add.11.i60.7, %21
  %Arg_1.212.9104 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 5760
  %Arg_1.213.9 = load i32, ptr addrspace(1) %Arg_1.212.9104, align 4, !invariant.load !30
  %Arg_0.114.9106 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 5760
  %Arg_0.115.9 = load i32, ptr addrspace(1) %Arg_0.114.9106, align 4, !invariant.load !30
  %22 = icmp eq i32 %Arg_1.213.9, %Arg_0.115.9
  %23 = uitofp i1 %22 to float
  %add.11.i60.9 = fadd float %add.11.i60.8, %23
  %Arg_1.212.10108 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 6400
  %Arg_1.213.10 = load i32, ptr addrspace(1) %Arg_1.212.10108, align 4, !invariant.load !30
  %Arg_0.114.10110 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 6400
  %Arg_0.115.10 = load i32, ptr addrspace(1) %Arg_0.114.10110, align 4, !invariant.load !30
  %24 = icmp eq i32 %Arg_1.213.10, %Arg_0.115.10
  %25 = uitofp i1 %24 to float
  %add.11.i60.10 = fadd float %add.11.i60.9, %25
  %Arg_1.212.11112 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 7040
  %Arg_1.213.11 = load i32, ptr addrspace(1) %Arg_1.212.11112, align 4, !invariant.load !30
  %Arg_0.114.11114 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 7040
  %Arg_0.115.11 = load i32, ptr addrspace(1) %Arg_0.114.11114, align 4, !invariant.load !30
  %26 = icmp eq i32 %Arg_1.213.11, %Arg_0.115.11
  %27 = uitofp i1 %26 to float
  %add.11.i60.11 = fadd float %add.11.i60.10, %27
  %Arg_1.212.12116 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 7680
  %Arg_1.213.12 = load i32, ptr addrspace(1) %Arg_1.212.12116, align 4, !invariant.load !30
  %Arg_0.114.12118 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 7680
  %Arg_0.115.12 = load i32, ptr addrspace(1) %Arg_0.114.12118, align 4, !invariant.load !30
  %28 = icmp eq i32 %Arg_1.213.12, %Arg_0.115.12
  %29 = uitofp i1 %28 to float
  %add.11.i60.12 = fadd float %add.11.i60.11, %29
  %Arg_1.212.13120 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 8320
  %Arg_1.213.13 = load i32, ptr addrspace(1) %Arg_1.212.13120, align 4, !invariant.load !30
  %Arg_0.114.13122 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 8320
  %Arg_0.115.13 = load i32, ptr addrspace(1) %Arg_0.114.13122, align 4, !invariant.load !30
  %30 = icmp eq i32 %Arg_1.213.13, %Arg_0.115.13
  %31 = uitofp i1 %30 to float
  %add.11.i60.13 = fadd float %add.11.i60.12, %31
  %Arg_1.212.14124 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 8960
  %Arg_1.213.14 = load i32, ptr addrspace(1) %Arg_1.212.14124, align 4, !invariant.load !30
  %Arg_0.114.14126 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 8960
  %Arg_0.115.14 = load i32, ptr addrspace(1) %Arg_0.114.14126, align 4, !invariant.load !30
  %32 = icmp eq i32 %Arg_1.213.14, %Arg_0.115.14
  %33 = uitofp i1 %32 to float
  %add.11.i60.14 = fadd float %add.11.i60.13, %33
  %34 = icmp ult i32 %2, 400
  br i1 %34, label %x_in_tile-true.15, label %x_in_tile-after.15

common.ret:                                       ; preds = %reduction_write_output-true, %inter_warp_reduce-true, %intra_warp_reduce_write-after
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  tail call void @llvm.nvvm.barrier0()
  %35 = icmp ult i32 %2, 32
  br i1 %35, label %inter_warp_reduce-true, label %common.ret

x_in_tile-true.15:                                ; preds = %entry
  %Arg_1.212.15128 = getelementptr inbounds i32, ptr addrspace(1) %Arg_1.212, i64 9600
  %Arg_1.213.15 = load i32, ptr addrspace(1) %Arg_1.212.15128, align 4, !invariant.load !30
  %Arg_0.114.15130 = getelementptr inbounds i32, ptr addrspace(1) %Arg_0.114, i64 9600
  %Arg_0.115.15 = load i32, ptr addrspace(1) %Arg_0.114.15130, align 4, !invariant.load !30
  %36 = icmp eq i32 %Arg_1.213.15, %Arg_0.115.15
  %37 = uitofp i1 %36 to float
  %add.11.i60.15 = fadd float %add.11.i60.14, %37
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.15, %entry
  %partial_reduction_result.1.15 = phi float [ %add.11.i60.15, %x_in_tile-true.15 ], [ %add.11.i60.14, %entry ]
  %lane_id = and i32 %2, 31
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.15, i32 16, i32 31)
  %add.11.i = fadd float %partial_reduction_result.1.15, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i, i32 8, i32 31)
  %add.11.i64 = fadd float %add.11.i, %39
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i64, i32 4, i32 31)
  %add.11.i63 = fadd float %add.11.i64, %40
  %41 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i63, i32 2, i32 31)
  %add.11.i62 = fadd float %add.11.i63, %41
  %42 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i62, i32 1, i32 31)
  %43 = icmp eq i32 %lane_id, 0
  %44 = lshr i32 %2, 5
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [1 x [1 x [20 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %45
  %add.11.i61 = fadd float %add.11.i62, %42
  br i1 %43, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.11.i61, ptr addrspace(3) %46, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %47 = zext i32 %lane_id to i64
  %48 = getelementptr inbounds [1 x [1 x [20 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %47
  %49 = addrspacecast ptr addrspace(3) %48 to ptr
  store float 0.000000e+00, ptr %initial_value_addr, align 4
  %50 = icmp ult i32 %2, 20
  %51 = select i1 %50, ptr %49, ptr %initial_value_addr
  %partial_reduction_result32 = load float, ptr %51, align 4
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  %add.11.i59 = fadd float %partial_reduction_result32, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i59, i32 8, i32 31)
  %add.11.i58 = fadd float %add.11.i59, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i58, i32 4, i32 31)
  %add.11.i57 = fadd float %add.11.i58, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i57, i32 2, i32 31)
  %add.11.i56 = fadd float %add.11.i57, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i56, i32 1, i32 31)
  %add.11.i55 = fadd float %add.11.i56, %56
  store float %add.11.i55, ptr %51, align 4
  %57 = icmp eq i32 %2, 0
  br i1 %57, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  store float %add.11.i55, ptr addrspace(1) %alloc667, align 128
  br label %common.ret
}

; Function Attrs: convergent inaccessiblememonly nocallback nounwind
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #6

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #7

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define void @multiply(ptr noalias nocapture align 128 dereferenceable(4) %alloc6, ptr noalias nocapture readnone align 128 dereferenceable(20400144) %temp_buf) local_unnamed_addr #8 {
entry:
  %alloc61 = addrspacecast ptr %alloc6 to ptr addrspace(1)
  %0 = load float, ptr addrspace(1) %alloc61, align 128
  %multiply.3 = fmul float %0, 0x3F1A36E2E0000000
  store float %multiply.3, ptr addrspace(1) %alloc61, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone willreturn
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

attributes #0 = { argmemonly nofree nosync nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind }
attributes #5 = { nounwind }
attributes #6 = { convergent inaccessiblememonly nocallback nounwind }
attributes #7 = { convergent nocallback nounwind }
attributes #8 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone willreturn }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}
!llvm.module.flags = !{!26}

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
!25 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!26 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!27 = !{i32 0, i32 625}
!28 = !{i32 0, i32 125}
!29 = !{i32 0, i32 2}
!30 = !{}
!31 = !{i32 0, i32 48}
!32 = !{i32 0, i32 128}
!33 = distinct !{!33, !34}
!34 = !{!"llvm.loop.vectorize.enable", i1 false}
!35 = !{i32 0, i32 98}
!36 = !{i32 0, i32 256}
!37 = !{i32 0, i32 10}
!38 = !{i32 0, i32 1024}
!39 = !{i32 0, i32 640}
