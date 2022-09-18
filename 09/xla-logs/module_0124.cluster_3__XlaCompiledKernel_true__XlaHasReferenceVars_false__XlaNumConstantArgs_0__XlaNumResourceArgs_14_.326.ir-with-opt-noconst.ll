target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_298 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128
@buffer_for_constant_297 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128
@buffer_for_constant_61 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128
@buffer_for_constant_27 = external local_unnamed_addr addrspace(1) constant [4 x i8], align 128

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc6, ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc7, ptr noalias nocapture writeonly align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf6 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc74 = addrspacecast ptr %alloc7 to ptr addrspace(1)
  %alloc62 = addrspacecast ptr %alloc6 to ptr addrspace(1)
  %0 = load float, ptr addrspace(1) %alloc74, align 16, !invariant.load !27
  %subtract.5 = fsub float 1.000000e+00, %0
  %1 = tail call float @llvm.nvvm.sqrt.approx.f(float %subtract.5) #4
  %multiply.7 = fmul float %1, 0x3F647AE140000000
  %2 = load float, ptr addrspace(1) %alloc62, align 16, !invariant.load !27
  %subtract.8 = fsub float 1.000000e+00, %2
  %divide.9 = fdiv float %multiply.7, %subtract.8
  store float %divide.9, ptr addrspace(1) %temp_buf6, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @broadcast_45(ptr noalias nocapture readonly align 16 dereferenceable(40) %alloc5, ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc249 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %alloc57 = addrspacecast ptr %alloc5 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %.lhs.trunc = trunc i32 %linear_index3 to i8
  %1 = urem i8 %.lhs.trunc, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %.lhs.trunc1 = trunc i32 %linear_index2 to i8
  %2 = urem i8 %.lhs.trunc1, 10
  %linear_index1 = or i32 %linear_index_base, 1
  %.lhs.trunc3 = trunc i32 %linear_index1 to i8
  %3 = urem i8 %.lhs.trunc3, 10
  %.lhs.trunc5 = trunc i32 %linear_index_base to i8
  %4 = urem i8 %.lhs.trunc5, 10
  %5 = zext i8 %4 to i64
  %6 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc57, i64 0, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !27
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %alloc249, i64 %8
  %10 = zext i8 %3 to i64
  %11 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc57, i64 0, i64 %10
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !27
  %13 = zext i8 %2 to i64
  %14 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc57, i64 0, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !27
  %16 = zext i8 %1 to i64
  %17 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc57, i64 0, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !27
  %19 = insertelement <4 x float> poison, float %7, i32 0
  %20 = insertelement <4 x float> %19, float %12, i32 1
  %21 = insertelement <4 x float> %20, float %15, i32 2
  %22 = insertelement <4 x float> %21, float %18, i32 3
  store <4 x float> %22, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @broadcast_25(ptr noalias nocapture readonly align 16 dereferenceable(2000) %alloc3, ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc21, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc213 = addrspacecast ptr %alloc21 to ptr addrspace(1)
  %alloc31 = addrspacecast ptr %alloc3 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %row_index = shl nuw nsw i32 %0, 2
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %2 = mul nuw nsw i32 %1, 250
  %linear_index = add nuw nsw i32 %2, %0
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !31
  %4 = mul nuw nsw i32 %3, 125
  %5 = add nuw nsw i32 %linear_index, %4
  %linear_index_base = shl nuw nsw i32 %5, 2
  %6 = zext i32 %row_index to i64
  %7 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc31, i64 0, i64 %6
  %8 = load <4 x float>, ptr addrspace(1) %7, align 16, !invariant.load !27
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %alloc213, i64 %13
  %15 = insertelement <4 x float> poison, float %9, i32 0
  %16 = insertelement <4 x float> %15, float %10, i32 1
  %17 = insertelement <4 x float> %16, float %11, i32 2
  %18 = insertelement <4 x float> %17, float %12, i32 3
  store <4 x float> %18, ptr addrspace(1) %14, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc20, ptr noalias nocapture readonly align 128 dereferenceable(20000) %alloc21, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc2112 = addrspacecast ptr %alloc21 to ptr addrspace(1)
  %alloc2010 = addrspacecast ptr %alloc20 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 5000
  br i1 %4, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %alloc2112, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !27
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %.inv = fcmp olt float %8, 0.000000e+00
  %12 = select i1 %.inv, float 0.000000e+00, float %8
  %13 = getelementptr float, ptr addrspace(1) %alloc2010, i64 %5
  %.inv7 = fcmp olt float %9, 0.000000e+00
  %14 = select i1 %.inv7, float 0.000000e+00, float %9
  %.inv8 = fcmp olt float %10, 0.000000e+00
  %15 = select i1 %.inv8, float 0.000000e+00, float %10
  %.inv9 = fcmp olt float %11, 0.000000e+00
  %16 = select i1 %.inv9, float 0.000000e+00, float %11
  %17 = insertelement <4 x float> poison, float %12, i32 0
  %18 = insertelement <4 x float> %17, float %14, i32 1
  %19 = insertelement <4 x float> %18, float %15, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %13, align 16
  br label %fusion_16.in_bounds-after
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @reduce_66(ptr noalias nocapture readonly align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc27, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc2721 = addrspacecast ptr %alloc27 to ptr addrspace(1)
  %alloc2419 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !30
  %linear_index_base = shl nuw nsw i32 %0, 1
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr inbounds [10 x [10 x float]], ptr addrspace(1) %alloc2419, i64 0, i64 %1, i64 0
  %3 = load <4 x float>, ptr addrspace(1) %2, align 16, !invariant.load !27
  %4 = extractelement <4 x float> %3, i32 0
  %5 = extractelement <4 x float> %3, i32 1
  %6 = extractelement <4 x float> %3, i32 2
  %7 = extractelement <4 x float> %3, i32 3
  %8 = fcmp ole float %4, 0xFFF0000000000000
  %maximum.6.i = select i1 %8, float 0xFFF0000000000000, float %4
  %9 = fcmp oge float %maximum.6.i, %5
  %10 = fcmp uno float %maximum.6.i, 0.000000e+00
  %11 = or i1 %10, %9
  %maximum.6.i.1 = select i1 %11, float %maximum.6.i, float %5
  %12 = fcmp oge float %maximum.6.i.1, %6
  %13 = fcmp uno float %maximum.6.i.1, 0.000000e+00
  %14 = or i1 %13, %12
  %maximum.6.i.2 = select i1 %14, float %maximum.6.i.1, float %6
  %15 = fcmp oge float %maximum.6.i.2, %7
  %16 = fcmp uno float %maximum.6.i.2, 0.000000e+00
  %17 = or i1 %16, %15
  %maximum.6.i.3 = select i1 %17, float %maximum.6.i.2, float %7
  %18 = getelementptr inbounds float, ptr addrspace(1) %2, i64 4
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !27
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %24 = fcmp oge float %maximum.6.i.3, %20
  %25 = fcmp uno float %maximum.6.i.3, 0.000000e+00
  %26 = or i1 %25, %24
  %maximum.6.i.4 = select i1 %26, float %maximum.6.i.3, float %20
  %27 = fcmp oge float %maximum.6.i.4, %21
  %28 = fcmp uno float %maximum.6.i.4, 0.000000e+00
  %29 = or i1 %28, %27
  %maximum.6.i.5 = select i1 %29, float %maximum.6.i.4, float %21
  %30 = fcmp oge float %maximum.6.i.5, %22
  %31 = fcmp uno float %maximum.6.i.5, 0.000000e+00
  %32 = or i1 %31, %30
  %maximum.6.i.6 = select i1 %32, float %maximum.6.i.5, float %22
  %33 = fcmp oge float %maximum.6.i.6, %23
  %34 = fcmp uno float %maximum.6.i.6, 0.000000e+00
  %35 = or i1 %34, %33
  %maximum.6.i.7 = select i1 %35, float %maximum.6.i.6, float %23
  %36 = getelementptr inbounds float, ptr addrspace(1) %2, i64 8
  %37 = load <4 x float>, ptr addrspace(1) %36, align 16, !invariant.load !27
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %42 = fcmp oge float %maximum.6.i.7, %38
  %43 = fcmp uno float %maximum.6.i.7, 0.000000e+00
  %44 = or i1 %43, %42
  %maximum.6.i.8 = select i1 %44, float %maximum.6.i.7, float %38
  %45 = fcmp oge float %maximum.6.i.8, %39
  %46 = fcmp uno float %maximum.6.i.8, 0.000000e+00
  %47 = or i1 %46, %45
  %maximum.6.i.9 = select i1 %47, float %maximum.6.i.8, float %39
  %48 = getelementptr float, ptr addrspace(1) %alloc2721, i64 %1
  %49 = fcmp ole float %40, 0xFFF0000000000000
  %maximum.6.i14 = select i1 %49, float 0xFFF0000000000000, float %40
  %50 = fcmp oge float %maximum.6.i14, %41
  %51 = fcmp uno float %maximum.6.i14, 0.000000e+00
  %52 = or i1 %51, %50
  %maximum.6.i14.1 = select i1 %52, float %maximum.6.i14, float %41
  %53 = getelementptr inbounds float, ptr addrspace(1) %2, i64 12
  %54 = load <4 x float>, ptr addrspace(1) %53, align 16, !invariant.load !27
  %55 = extractelement <4 x float> %54, i32 0
  %56 = extractelement <4 x float> %54, i32 1
  %57 = extractelement <4 x float> %54, i32 2
  %58 = extractelement <4 x float> %54, i32 3
  %59 = fcmp oge float %maximum.6.i14.1, %55
  %60 = fcmp uno float %maximum.6.i14.1, 0.000000e+00
  %61 = or i1 %60, %59
  %maximum.6.i14.2 = select i1 %61, float %maximum.6.i14.1, float %55
  %62 = fcmp oge float %maximum.6.i14.2, %56
  %63 = fcmp uno float %maximum.6.i14.2, 0.000000e+00
  %64 = or i1 %63, %62
  %maximum.6.i14.3 = select i1 %64, float %maximum.6.i14.2, float %56
  %65 = fcmp oge float %maximum.6.i14.3, %57
  %66 = fcmp uno float %maximum.6.i14.3, 0.000000e+00
  %67 = or i1 %66, %65
  %maximum.6.i14.4 = select i1 %67, float %maximum.6.i14.3, float %57
  %68 = fcmp oge float %maximum.6.i14.4, %58
  %69 = fcmp uno float %maximum.6.i14.4, 0.000000e+00
  %70 = or i1 %69, %68
  %maximum.6.i14.5 = select i1 %70, float %maximum.6.i14.4, float %58
  %71 = getelementptr inbounds float, ptr addrspace(1) %2, i64 16
  %72 = load <4 x float>, ptr addrspace(1) %71, align 16, !invariant.load !27
  %73 = extractelement <4 x float> %72, i32 0
  %74 = extractelement <4 x float> %72, i32 1
  %75 = extractelement <4 x float> %72, i32 2
  %76 = extractelement <4 x float> %72, i32 3
  %77 = fcmp oge float %maximum.6.i14.5, %73
  %78 = fcmp uno float %maximum.6.i14.5, 0.000000e+00
  %79 = or i1 %78, %77
  %maximum.6.i14.6 = select i1 %79, float %maximum.6.i14.5, float %73
  %80 = fcmp oge float %maximum.6.i14.6, %74
  %81 = fcmp uno float %maximum.6.i14.6, 0.000000e+00
  %82 = or i1 %81, %80
  %maximum.6.i14.7 = select i1 %82, float %maximum.6.i14.6, float %74
  %83 = fcmp oge float %maximum.6.i14.7, %75
  %84 = fcmp uno float %maximum.6.i14.7, 0.000000e+00
  %85 = or i1 %84, %83
  %maximum.6.i14.8 = select i1 %85, float %maximum.6.i14.7, float %75
  %86 = fcmp oge float %maximum.6.i14.8, %76
  %87 = fcmp uno float %maximum.6.i14.8, 0.000000e+00
  %88 = or i1 %87, %86
  %maximum.6.i14.9 = select i1 %88, float %maximum.6.i14.8, float %76
  %89 = insertelement <2 x float> poison, float %maximum.6.i.9, i32 0
  %90 = insertelement <2 x float> %89, float %maximum.6.i14.9, i32 1
  store <2 x float> %90, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc26, ptr noalias nocapture readonly align 128 dereferenceable(40) %alloc27, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc2725 = addrspacecast ptr %alloc27 to ptr addrspace(1)
  %alloc2623 = addrspacecast ptr %alloc26 to ptr addrspace(1)
  %alloc2421 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !30
  %linear_index_base = shl nuw nsw i32 %0, 1
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2725, i64 0, i64 %1
  %3 = load <2 x float>, ptr addrspace(1) %2, align 8, !invariant.load !27
  %4 = extractelement <2 x float> %3, i32 0
  %5 = extractelement <2 x float> %3, i32 1
  %6 = getelementptr inbounds [10 x [10 x float]], ptr addrspace(1) %alloc2421, i64 0, i64 %1, i64 0
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !27
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %subtract.4 = fsub float %8, %4
  %12 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3F777313A0000000, float 5.000000e-01) #4
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #4
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #4
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3FF7154760000000, float %16) #4
  %18 = tail call float @llvm.fma.f32(float %subtract.4, float 0x3E54AE0C00000000, float %17) #4
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #4
  %23 = fmul float %22, %21
  %add.10.i16 = fadd float %23, 0.000000e+00
  %subtract.4.1 = fsub float %9, %4
  %24 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3F777313A0000000, float 5.000000e-01) #4
  %25 = tail call float @llvm.nvvm.saturate.f(float %24) #4
  %26 = tail call float @llvm.nvvm.fma.rm.f(float %25, float 2.520000e+02, float 0x4168000020000000) #4
  %27 = fadd float %26, 0xC168000FE0000000
  %28 = fneg float %27
  %29 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3FF7154760000000, float %28) #4
  %30 = tail call float @llvm.fma.f32(float %subtract.4.1, float 0x3E54AE0C00000000, float %29) #4
  %31 = bitcast float %26 to i32
  %32 = shl i32 %31, 23
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %30) #4
  %35 = fmul float %34, %33
  %add.10.i16.1 = fadd float %add.10.i16, %35
  %subtract.4.2 = fsub float %10, %4
  %36 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3F777313A0000000, float 5.000000e-01) #4
  %37 = tail call float @llvm.nvvm.saturate.f(float %36) #4
  %38 = tail call float @llvm.nvvm.fma.rm.f(float %37, float 2.520000e+02, float 0x4168000020000000) #4
  %39 = fadd float %38, 0xC168000FE0000000
  %40 = fneg float %39
  %41 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3FF7154760000000, float %40) #4
  %42 = tail call float @llvm.fma.f32(float %subtract.4.2, float 0x3E54AE0C00000000, float %41) #4
  %43 = bitcast float %38 to i32
  %44 = shl i32 %43, 23
  %45 = bitcast i32 %44 to float
  %46 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %42) #4
  %47 = fmul float %46, %45
  %add.10.i16.2 = fadd float %add.10.i16.1, %47
  %subtract.4.3 = fsub float %11, %4
  %48 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3F777313A0000000, float 5.000000e-01) #4
  %49 = tail call float @llvm.nvvm.saturate.f(float %48) #4
  %50 = tail call float @llvm.nvvm.fma.rm.f(float %49, float 2.520000e+02, float 0x4168000020000000) #4
  %51 = fadd float %50, 0xC168000FE0000000
  %52 = fneg float %51
  %53 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3FF7154760000000, float %52) #4
  %54 = tail call float @llvm.fma.f32(float %subtract.4.3, float 0x3E54AE0C00000000, float %53) #4
  %55 = bitcast float %50 to i32
  %56 = shl i32 %55, 23
  %57 = bitcast i32 %56 to float
  %58 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %54) #4
  %59 = fmul float %58, %57
  %add.10.i16.3 = fadd float %add.10.i16.2, %59
  %60 = getelementptr inbounds float, ptr addrspace(1) %6, i64 4
  %61 = load <4 x float>, ptr addrspace(1) %60, align 16, !invariant.load !27
  %62 = extractelement <4 x float> %61, i32 0
  %63 = extractelement <4 x float> %61, i32 1
  %64 = extractelement <4 x float> %61, i32 2
  %65 = extractelement <4 x float> %61, i32 3
  %subtract.4.4 = fsub float %62, %4
  %66 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3F777313A0000000, float 5.000000e-01) #4
  %67 = tail call float @llvm.nvvm.saturate.f(float %66) #4
  %68 = tail call float @llvm.nvvm.fma.rm.f(float %67, float 2.520000e+02, float 0x4168000020000000) #4
  %69 = fadd float %68, 0xC168000FE0000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3FF7154760000000, float %70) #4
  %72 = tail call float @llvm.fma.f32(float %subtract.4.4, float 0x3E54AE0C00000000, float %71) #4
  %73 = bitcast float %68 to i32
  %74 = shl i32 %73, 23
  %75 = bitcast i32 %74 to float
  %76 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %72) #4
  %77 = fmul float %76, %75
  %add.10.i16.4 = fadd float %add.10.i16.3, %77
  %subtract.4.5 = fsub float %63, %4
  %78 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3F777313A0000000, float 5.000000e-01) #4
  %79 = tail call float @llvm.nvvm.saturate.f(float %78) #4
  %80 = tail call float @llvm.nvvm.fma.rm.f(float %79, float 2.520000e+02, float 0x4168000020000000) #4
  %81 = fadd float %80, 0xC168000FE0000000
  %82 = fneg float %81
  %83 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3FF7154760000000, float %82) #4
  %84 = tail call float @llvm.fma.f32(float %subtract.4.5, float 0x3E54AE0C00000000, float %83) #4
  %85 = bitcast float %80 to i32
  %86 = shl i32 %85, 23
  %87 = bitcast i32 %86 to float
  %88 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %84) #4
  %89 = fmul float %88, %87
  %add.10.i16.5 = fadd float %add.10.i16.4, %89
  %subtract.4.6 = fsub float %64, %4
  %90 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3F777313A0000000, float 5.000000e-01) #4
  %91 = tail call float @llvm.nvvm.saturate.f(float %90) #4
  %92 = tail call float @llvm.nvvm.fma.rm.f(float %91, float 2.520000e+02, float 0x4168000020000000) #4
  %93 = fadd float %92, 0xC168000FE0000000
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3FF7154760000000, float %94) #4
  %96 = tail call float @llvm.fma.f32(float %subtract.4.6, float 0x3E54AE0C00000000, float %95) #4
  %97 = bitcast float %92 to i32
  %98 = shl i32 %97, 23
  %99 = bitcast i32 %98 to float
  %100 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %96) #4
  %101 = fmul float %100, %99
  %add.10.i16.6 = fadd float %add.10.i16.5, %101
  %subtract.4.7 = fsub float %65, %4
  %102 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3F777313A0000000, float 5.000000e-01) #4
  %103 = tail call float @llvm.nvvm.saturate.f(float %102) #4
  %104 = tail call float @llvm.nvvm.fma.rm.f(float %103, float 2.520000e+02, float 0x4168000020000000) #4
  %105 = fadd float %104, 0xC168000FE0000000
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3FF7154760000000, float %106) #4
  %108 = tail call float @llvm.fma.f32(float %subtract.4.7, float 0x3E54AE0C00000000, float %107) #4
  %109 = bitcast float %104 to i32
  %110 = shl i32 %109, 23
  %111 = bitcast i32 %110 to float
  %112 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %108) #4
  %113 = fmul float %112, %111
  %add.10.i16.7 = fadd float %add.10.i16.6, %113
  %114 = getelementptr inbounds float, ptr addrspace(1) %6, i64 8
  %115 = load <4 x float>, ptr addrspace(1) %114, align 16, !invariant.load !27
  %116 = extractelement <4 x float> %115, i32 0
  %117 = extractelement <4 x float> %115, i32 1
  %118 = extractelement <4 x float> %115, i32 2
  %119 = extractelement <4 x float> %115, i32 3
  %subtract.4.8 = fsub float %116, %4
  %120 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3F777313A0000000, float 5.000000e-01) #4
  %121 = tail call float @llvm.nvvm.saturate.f(float %120) #4
  %122 = tail call float @llvm.nvvm.fma.rm.f(float %121, float 2.520000e+02, float 0x4168000020000000) #4
  %123 = fadd float %122, 0xC168000FE0000000
  %124 = fneg float %123
  %125 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3FF7154760000000, float %124) #4
  %126 = tail call float @llvm.fma.f32(float %subtract.4.8, float 0x3E54AE0C00000000, float %125) #4
  %127 = bitcast float %122 to i32
  %128 = shl i32 %127, 23
  %129 = bitcast i32 %128 to float
  %130 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %126) #4
  %131 = fmul float %130, %129
  %add.10.i16.8 = fadd float %add.10.i16.7, %131
  %subtract.4.9 = fsub float %117, %4
  %132 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3F777313A0000000, float 5.000000e-01) #4
  %133 = tail call float @llvm.nvvm.saturate.f(float %132) #4
  %134 = tail call float @llvm.nvvm.fma.rm.f(float %133, float 2.520000e+02, float 0x4168000020000000) #4
  %135 = fadd float %134, 0xC168000FE0000000
  %136 = fneg float %135
  %137 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3FF7154760000000, float %136) #4
  %138 = tail call float @llvm.fma.f32(float %subtract.4.9, float 0x3E54AE0C00000000, float %137) #4
  %139 = bitcast float %134 to i32
  %140 = shl i32 %139, 23
  %141 = bitcast i32 %140 to float
  %142 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %138) #4
  %143 = fmul float %142, %141
  %add.10.i16.9 = fadd float %add.10.i16.8, %143
  %144 = getelementptr float, ptr addrspace(1) %alloc2623, i64 %1
  %subtract.410 = fsub float %118, %5
  %145 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3F777313A0000000, float 5.000000e-01) #4
  %146 = tail call float @llvm.nvvm.saturate.f(float %145) #4
  %147 = tail call float @llvm.nvvm.fma.rm.f(float %146, float 2.520000e+02, float 0x4168000020000000) #4
  %148 = fadd float %147, 0xC168000FE0000000
  %149 = fneg float %148
  %150 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3FF7154760000000, float %149) #4
  %151 = tail call float @llvm.fma.f32(float %subtract.410, float 0x3E54AE0C00000000, float %150) #4
  %152 = bitcast float %147 to i32
  %153 = shl i32 %152, 23
  %154 = bitcast i32 %153 to float
  %155 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %151) #4
  %156 = fmul float %155, %154
  %add.10.i = fadd float %156, 0.000000e+00
  %subtract.410.1 = fsub float %119, %5
  %157 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3F777313A0000000, float 5.000000e-01) #4
  %158 = tail call float @llvm.nvvm.saturate.f(float %157) #4
  %159 = tail call float @llvm.nvvm.fma.rm.f(float %158, float 2.520000e+02, float 0x4168000020000000) #4
  %160 = fadd float %159, 0xC168000FE0000000
  %161 = fneg float %160
  %162 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3FF7154760000000, float %161) #4
  %163 = tail call float @llvm.fma.f32(float %subtract.410.1, float 0x3E54AE0C00000000, float %162) #4
  %164 = bitcast float %159 to i32
  %165 = shl i32 %164, 23
  %166 = bitcast i32 %165 to float
  %167 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %163) #4
  %168 = fmul float %167, %166
  %add.10.i.1 = fadd float %add.10.i, %168
  %169 = getelementptr inbounds float, ptr addrspace(1) %6, i64 12
  %170 = load <4 x float>, ptr addrspace(1) %169, align 16, !invariant.load !27
  %171 = extractelement <4 x float> %170, i32 0
  %172 = extractelement <4 x float> %170, i32 1
  %173 = extractelement <4 x float> %170, i32 2
  %174 = extractelement <4 x float> %170, i32 3
  %subtract.410.2 = fsub float %171, %5
  %175 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3F777313A0000000, float 5.000000e-01) #4
  %176 = tail call float @llvm.nvvm.saturate.f(float %175) #4
  %177 = tail call float @llvm.nvvm.fma.rm.f(float %176, float 2.520000e+02, float 0x4168000020000000) #4
  %178 = fadd float %177, 0xC168000FE0000000
  %179 = fneg float %178
  %180 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3FF7154760000000, float %179) #4
  %181 = tail call float @llvm.fma.f32(float %subtract.410.2, float 0x3E54AE0C00000000, float %180) #4
  %182 = bitcast float %177 to i32
  %183 = shl i32 %182, 23
  %184 = bitcast i32 %183 to float
  %185 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %181) #4
  %186 = fmul float %185, %184
  %add.10.i.2 = fadd float %add.10.i.1, %186
  %subtract.410.3 = fsub float %172, %5
  %187 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3F777313A0000000, float 5.000000e-01) #4
  %188 = tail call float @llvm.nvvm.saturate.f(float %187) #4
  %189 = tail call float @llvm.nvvm.fma.rm.f(float %188, float 2.520000e+02, float 0x4168000020000000) #4
  %190 = fadd float %189, 0xC168000FE0000000
  %191 = fneg float %190
  %192 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3FF7154760000000, float %191) #4
  %193 = tail call float @llvm.fma.f32(float %subtract.410.3, float 0x3E54AE0C00000000, float %192) #4
  %194 = bitcast float %189 to i32
  %195 = shl i32 %194, 23
  %196 = bitcast i32 %195 to float
  %197 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %193) #4
  %198 = fmul float %197, %196
  %add.10.i.3 = fadd float %add.10.i.2, %198
  %subtract.410.4 = fsub float %173, %5
  %199 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3F777313A0000000, float 5.000000e-01) #4
  %200 = tail call float @llvm.nvvm.saturate.f(float %199) #4
  %201 = tail call float @llvm.nvvm.fma.rm.f(float %200, float 2.520000e+02, float 0x4168000020000000) #4
  %202 = fadd float %201, 0xC168000FE0000000
  %203 = fneg float %202
  %204 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3FF7154760000000, float %203) #4
  %205 = tail call float @llvm.fma.f32(float %subtract.410.4, float 0x3E54AE0C00000000, float %204) #4
  %206 = bitcast float %201 to i32
  %207 = shl i32 %206, 23
  %208 = bitcast i32 %207 to float
  %209 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %205) #4
  %210 = fmul float %209, %208
  %add.10.i.4 = fadd float %add.10.i.3, %210
  %subtract.410.5 = fsub float %174, %5
  %211 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3F777313A0000000, float 5.000000e-01) #4
  %212 = tail call float @llvm.nvvm.saturate.f(float %211) #4
  %213 = tail call float @llvm.nvvm.fma.rm.f(float %212, float 2.520000e+02, float 0x4168000020000000) #4
  %214 = fadd float %213, 0xC168000FE0000000
  %215 = fneg float %214
  %216 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3FF7154760000000, float %215) #4
  %217 = tail call float @llvm.fma.f32(float %subtract.410.5, float 0x3E54AE0C00000000, float %216) #4
  %218 = bitcast float %213 to i32
  %219 = shl i32 %218, 23
  %220 = bitcast i32 %219 to float
  %221 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %217) #4
  %222 = fmul float %221, %220
  %add.10.i.5 = fadd float %add.10.i.4, %222
  %223 = getelementptr inbounds float, ptr addrspace(1) %6, i64 16
  %224 = load <4 x float>, ptr addrspace(1) %223, align 16, !invariant.load !27
  %225 = extractelement <4 x float> %224, i32 0
  %226 = extractelement <4 x float> %224, i32 1
  %227 = extractelement <4 x float> %224, i32 2
  %228 = extractelement <4 x float> %224, i32 3
  %subtract.410.6 = fsub float %225, %5
  %229 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3F777313A0000000, float 5.000000e-01) #4
  %230 = tail call float @llvm.nvvm.saturate.f(float %229) #4
  %231 = tail call float @llvm.nvvm.fma.rm.f(float %230, float 2.520000e+02, float 0x4168000020000000) #4
  %232 = fadd float %231, 0xC168000FE0000000
  %233 = fneg float %232
  %234 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3FF7154760000000, float %233) #4
  %235 = tail call float @llvm.fma.f32(float %subtract.410.6, float 0x3E54AE0C00000000, float %234) #4
  %236 = bitcast float %231 to i32
  %237 = shl i32 %236, 23
  %238 = bitcast i32 %237 to float
  %239 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %235) #4
  %240 = fmul float %239, %238
  %add.10.i.6 = fadd float %add.10.i.5, %240
  %subtract.410.7 = fsub float %226, %5
  %241 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3F777313A0000000, float 5.000000e-01) #4
  %242 = tail call float @llvm.nvvm.saturate.f(float %241) #4
  %243 = tail call float @llvm.nvvm.fma.rm.f(float %242, float 2.520000e+02, float 0x4168000020000000) #4
  %244 = fadd float %243, 0xC168000FE0000000
  %245 = fneg float %244
  %246 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3FF7154760000000, float %245) #4
  %247 = tail call float @llvm.fma.f32(float %subtract.410.7, float 0x3E54AE0C00000000, float %246) #4
  %248 = bitcast float %243 to i32
  %249 = shl i32 %248, 23
  %250 = bitcast i32 %249 to float
  %251 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %247) #4
  %252 = fmul float %251, %250
  %add.10.i.7 = fadd float %add.10.i.6, %252
  %subtract.410.8 = fsub float %227, %5
  %253 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3F777313A0000000, float 5.000000e-01) #4
  %254 = tail call float @llvm.nvvm.saturate.f(float %253) #4
  %255 = tail call float @llvm.nvvm.fma.rm.f(float %254, float 2.520000e+02, float 0x4168000020000000) #4
  %256 = fadd float %255, 0xC168000FE0000000
  %257 = fneg float %256
  %258 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3FF7154760000000, float %257) #4
  %259 = tail call float @llvm.fma.f32(float %subtract.410.8, float 0x3E54AE0C00000000, float %258) #4
  %260 = bitcast float %255 to i32
  %261 = shl i32 %260, 23
  %262 = bitcast i32 %261 to float
  %263 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %259) #4
  %264 = fmul float %263, %262
  %add.10.i.8 = fadd float %add.10.i.7, %264
  %subtract.410.9 = fsub float %228, %5
  %265 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3F777313A0000000, float 5.000000e-01) #4
  %266 = tail call float @llvm.nvvm.saturate.f(float %265) #4
  %267 = tail call float @llvm.nvvm.fma.rm.f(float %266, float 2.520000e+02, float 0x4168000020000000) #4
  %268 = fadd float %267, 0xC168000FE0000000
  %269 = fneg float %268
  %270 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3FF7154760000000, float %269) #4
  %271 = tail call float @llvm.fma.f32(float %subtract.410.9, float 0x3E54AE0C00000000, float %270) #4
  %272 = bitcast float %267 to i32
  %273 = shl i32 %272, 23
  %274 = bitcast i32 %273 to float
  %275 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %271) #4
  %276 = fmul float %275, %274
  %add.10.i.9 = fadd float %add.10.i.8, %276
  %277 = insertelement <2 x float> poison, float %add.10.i16.9, i32 0
  %278 = insertelement <2 x float> %277, float %add.10.i.9, i32 1
  store <2 x float> %278, ptr addrspace(1) %144, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_14(ptr noalias nocapture readonly align 16 dereferenceable(400) %alloc1, ptr noalias nocapture align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture readonly align 128 dereferenceable(40) %alloc26, ptr noalias nocapture readonly align 128 dereferenceable(40) %alloc27, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc2726 = addrspacecast ptr %alloc27 to ptr addrspace(1)
  %alloc2624 = addrspacecast ptr %alloc26 to ptr addrspace(1)
  %alloc2422 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %alloc120 = addrspacecast ptr %alloc1 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %.lhs.trunc = trunc i32 %linear_index3 to i8
  %1 = udiv i8 %.lhs.trunc, 10
  %linear_index2 = or i32 %linear_index_base, 2
  %.lhs.trunc16 = trunc i32 %linear_index2 to i8
  %2 = udiv i8 %.lhs.trunc16, 10
  %.lhs.trunc18 = trunc i32 %linear_index_base to i8
  %3 = udiv i8 %.lhs.trunc18, 10
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %alloc2422, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = zext i8 %3 to i64
  %12 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2726, i64 0, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !27
  %subtract.8 = fsub float %7, %13
  %14 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3F777313A0000000, float 5.000000e-01) #4
  %15 = tail call float @llvm.nvvm.saturate.f(float %14) #4
  %16 = tail call float @llvm.nvvm.fma.rm.f(float %15, float 2.520000e+02, float 0x4168000020000000) #4
  %17 = fadd float %16, 0xC168000FE0000000
  %18 = fneg float %17
  %19 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3FF7154760000000, float %18) #4
  %20 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3E54AE0C00000000, float %19) #4
  %21 = bitcast float %16 to i32
  %22 = shl i32 %21, 23
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %20) #4
  %25 = fmul float %24, %23
  %26 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2624, i64 0, i64 %11
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !27
  %divide.11 = fdiv float %25, %27
  %28 = getelementptr float, ptr addrspace(1) %alloc120, i64 %4
  %29 = load <4 x float>, ptr addrspace(1) %28, align 16, !invariant.load !27
  %30 = extractelement <4 x float> %29, i32 0
  %31 = extractelement <4 x float> %29, i32 1
  %32 = extractelement <4 x float> %29, i32 2
  %33 = extractelement <4 x float> %29, i32 3
  %subtract.12 = fsub float %divide.11, %30
  %multiply.13 = fmul float %subtract.12, 0x3FB99999A0000000
  %subtract.82 = fsub float %8, %13
  %34 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3F777313A0000000, float 5.000000e-01) #4
  %35 = tail call float @llvm.nvvm.saturate.f(float %34) #4
  %36 = tail call float @llvm.nvvm.fma.rm.f(float %35, float 2.520000e+02, float 0x4168000020000000) #4
  %37 = fadd float %36, 0xC168000FE0000000
  %38 = fneg float %37
  %39 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3FF7154760000000, float %38) #4
  %40 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3E54AE0C00000000, float %39) #4
  %41 = bitcast float %36 to i32
  %42 = shl i32 %41, 23
  %43 = bitcast i32 %42 to float
  %44 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %40) #4
  %45 = fmul float %44, %43
  %divide.113 = fdiv float %45, %27
  %subtract.124 = fsub float %divide.113, %31
  %multiply.135 = fmul float %subtract.124, 0x3FB99999A0000000
  %46 = zext i8 %2 to i64
  %47 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2726, i64 0, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !27
  %subtract.87 = fsub float %9, %48
  %49 = tail call float @llvm.fma.f32(float %subtract.87, float 0x3F777313A0000000, float 5.000000e-01) #4
  %50 = tail call float @llvm.nvvm.saturate.f(float %49) #4
  %51 = tail call float @llvm.nvvm.fma.rm.f(float %50, float 2.520000e+02, float 0x4168000020000000) #4
  %52 = fadd float %51, 0xC168000FE0000000
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %subtract.87, float 0x3FF7154760000000, float %53) #4
  %55 = tail call float @llvm.fma.f32(float %subtract.87, float 0x3E54AE0C00000000, float %54) #4
  %56 = bitcast float %51 to i32
  %57 = shl i32 %56, 23
  %58 = bitcast i32 %57 to float
  %59 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %55) #4
  %60 = fmul float %59, %58
  %61 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2624, i64 0, i64 %46
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !27
  %divide.118 = fdiv float %60, %62
  %subtract.129 = fsub float %divide.118, %32
  %multiply.1310 = fmul float %subtract.129, 0x3FB99999A0000000
  %63 = zext i8 %1 to i64
  %64 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2726, i64 0, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !27
  %subtract.812 = fsub float %10, %65
  %66 = tail call float @llvm.fma.f32(float %subtract.812, float 0x3F777313A0000000, float 5.000000e-01) #4
  %67 = tail call float @llvm.nvvm.saturate.f(float %66) #4
  %68 = tail call float @llvm.nvvm.fma.rm.f(float %67, float 2.520000e+02, float 0x4168000020000000) #4
  %69 = fadd float %68, 0xC168000FE0000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %subtract.812, float 0x3FF7154760000000, float %70) #4
  %72 = tail call float @llvm.fma.f32(float %subtract.812, float 0x3E54AE0C00000000, float %71) #4
  %73 = bitcast float %68 to i32
  %74 = shl i32 %73, 23
  %75 = bitcast i32 %74 to float
  %76 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %72) #4
  %77 = fmul float %76, %75
  %78 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc2624, i64 0, i64 %63
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !27
  %divide.1113 = fdiv float %77, %79
  %subtract.1214 = fsub float %divide.1113, %33
  %multiply.1315 = fmul float %subtract.1214, 0x3FB99999A0000000
  %80 = insertelement <4 x float> poison, float %multiply.13, i32 0
  %81 = insertelement <4 x float> %80, float %multiply.135, i32 1
  %82 = insertelement <4 x float> %81, float %multiply.1310, i32 2
  %83 = insertelement <4 x float> %82, float %multiply.1315, i32 3
  store <4 x float> %83, ptr addrspace(1) %5, align 16
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @reduce_158(ptr noalias nocapture readonly align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc27, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc2721 = addrspacecast ptr %alloc27 to ptr addrspace(1)
  %alloc2419 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !30
  %linear_index_base = shl nuw nsw i32 %0, 1
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr inbounds [10 x [10 x float]], ptr addrspace(1) %alloc2419, i64 0, i64 0, i64 %1
  %3 = load <2 x float>, ptr addrspace(1) %2, align 8, !invariant.load !27
  %4 = extractelement <2 x float> %3, i32 0
  %5 = extractelement <2 x float> %3, i32 1
  %add.6.i = fadd float %4, 0.000000e+00
  %6 = getelementptr inbounds float, ptr addrspace(1) %2, i64 10
  %7 = load <2 x float>, ptr addrspace(1) %6, align 8, !invariant.load !27
  %8 = extractelement <2 x float> %7, i32 0
  %9 = extractelement <2 x float> %7, i32 1
  %add.6.i.1 = fadd float %add.6.i, %8
  %10 = getelementptr inbounds float, ptr addrspace(1) %2, i64 20
  %11 = load <2 x float>, ptr addrspace(1) %10, align 8, !invariant.load !27
  %12 = extractelement <2 x float> %11, i32 0
  %13 = extractelement <2 x float> %11, i32 1
  %add.6.i.2 = fadd float %add.6.i.1, %12
  %14 = getelementptr inbounds float, ptr addrspace(1) %2, i64 30
  %15 = load <2 x float>, ptr addrspace(1) %14, align 8, !invariant.load !27
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %add.6.i.3 = fadd float %add.6.i.2, %16
  %18 = getelementptr inbounds float, ptr addrspace(1) %2, i64 40
  %19 = load <2 x float>, ptr addrspace(1) %18, align 8, !invariant.load !27
  %20 = extractelement <2 x float> %19, i32 0
  %21 = extractelement <2 x float> %19, i32 1
  %add.6.i.4 = fadd float %add.6.i.3, %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %2, i64 50
  %23 = load <2 x float>, ptr addrspace(1) %22, align 8, !invariant.load !27
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.6.i.5 = fadd float %add.6.i.4, %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %2, i64 60
  %27 = load <2 x float>, ptr addrspace(1) %26, align 8, !invariant.load !27
  %28 = extractelement <2 x float> %27, i32 0
  %29 = extractelement <2 x float> %27, i32 1
  %add.6.i.6 = fadd float %add.6.i.5, %28
  %30 = getelementptr inbounds float, ptr addrspace(1) %2, i64 70
  %31 = load <2 x float>, ptr addrspace(1) %30, align 8, !invariant.load !27
  %32 = extractelement <2 x float> %31, i32 0
  %33 = extractelement <2 x float> %31, i32 1
  %add.6.i.7 = fadd float %add.6.i.6, %32
  %34 = getelementptr inbounds float, ptr addrspace(1) %2, i64 80
  %35 = load <2 x float>, ptr addrspace(1) %34, align 8, !invariant.load !27
  %36 = extractelement <2 x float> %35, i32 0
  %37 = extractelement <2 x float> %35, i32 1
  %add.6.i.8 = fadd float %add.6.i.7, %36
  %38 = getelementptr inbounds float, ptr addrspace(1) %2, i64 90
  %39 = load <2 x float>, ptr addrspace(1) %38, align 8, !invariant.load !27
  %40 = extractelement <2 x float> %39, i32 0
  %41 = extractelement <2 x float> %39, i32 1
  %add.6.i.9 = fadd float %add.6.i.8, %40
  %42 = getelementptr float, ptr addrspace(1) %alloc2721, i64 %1
  %add.6.i14 = fadd float %5, 0.000000e+00
  %add.6.i14.1 = fadd float %add.6.i14, %9
  %add.6.i14.2 = fadd float %add.6.i14.1, %13
  %add.6.i14.3 = fadd float %add.6.i14.2, %17
  %add.6.i14.4 = fadd float %add.6.i14.3, %21
  %add.6.i14.5 = fadd float %add.6.i14.4, %25
  %add.6.i14.6 = fadd float %add.6.i14.5, %29
  %add.6.i14.7 = fadd float %add.6.i14.6, %33
  %add.6.i14.8 = fadd float %add.6.i14.7, %37
  %add.6.i14.9 = fadd float %add.6.i14.8, %41
  %43 = insertelement <2 x float> poison, float %add.6.i.9, i32 0
  %44 = insertelement <2 x float> %43, float %add.6.i14.9, i32 1
  store <2 x float> %44, ptr addrspace(1) %42, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(1568000) %alloc17, ptr noalias nocapture readonly align 128 dereferenceable(20000) %alloc20, ptr noalias nocapture readonly align 128 dereferenceable(20000) %alloc21, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc2117 = addrspacecast ptr %alloc21 to ptr addrspace(1)
  %alloc2015 = addrspacecast ptr %alloc20 to ptr addrspace(1)
  %alloc1713 = addrspacecast ptr %alloc17 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = icmp ult i32 %linear_index_base, 5000
  br i1 %4, label %fusion_13.in_bounds-true, label %fusion_13.in_bounds-after

fusion_13.in_bounds-after:                        ; preds = %fusion_13.in_bounds-true, %entry
  ret void

fusion_13.in_bounds-true:                         ; preds = %entry
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %alloc2117, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !27
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %.inv = fcmp olt float %8, 0.000000e+00
  %12 = select i1 %.inv, float 0.000000e+00, float %8
  %compare.6 = fcmp ogt float %12, 0.000000e+00
  %13 = getelementptr float, ptr addrspace(1) %alloc2015, i64 %5
  %14 = load <4 x float>, ptr addrspace(1) %13, align 16, !invariant.load !27
  %15 = extractelement <4 x float> %14, i32 0
  %16 = extractelement <4 x float> %14, i32 1
  %17 = extractelement <4 x float> %14, i32 2
  %18 = extractelement <4 x float> %14, i32 3
  %19 = select i1 %compare.6, float %15, float 0.000000e+00
  %20 = getelementptr float, ptr addrspace(1) %alloc1713, i64 %5
  %.inv10 = fcmp olt float %9, 0.000000e+00
  %21 = select i1 %.inv10, float 0.000000e+00, float %9
  %compare.63 = fcmp ogt float %21, 0.000000e+00
  %22 = select i1 %compare.63, float %16, float 0.000000e+00
  %.inv11 = fcmp olt float %10, 0.000000e+00
  %23 = select i1 %.inv11, float 0.000000e+00, float %10
  %compare.66 = fcmp ogt float %23, 0.000000e+00
  %24 = select i1 %compare.66, float %17, float 0.000000e+00
  %.inv12 = fcmp olt float %11, 0.000000e+00
  %25 = select i1 %.inv12, float 0.000000e+00, float %11
  %compare.69 = fcmp ogt float %25, 0.000000e+00
  %26 = select i1 %compare.69, float %18, float 0.000000e+00
  %27 = insertelement <4 x float> poison, float %19, i32 0
  %28 = insertelement <4 x float> %27, float %22, i32 1
  %29 = insertelement <4 x float> %28, float %24, i32 2
  %30 = insertelement <4 x float> %29, float %26, i32 3
  store <4 x float> %30, ptr addrspace(1) %20, align 16
  br label %fusion_13.in_bounds-after
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @reduce_178(ptr noalias nocapture readonly align 128 dereferenceable(1568000) %alloc17, ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture readnone align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc2449 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %alloc1747 = addrspacecast ptr %alloc17 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %linear_index_base = shl nuw nsw i32 %0, 2
  %1 = zext i32 %linear_index_base to i64
  %2 = getelementptr inbounds [10 x [500 x float]], ptr addrspace(1) %alloc1747, i64 0, i64 0, i64 %1
  %3 = load <4 x float>, ptr addrspace(1) %2, align 16, !invariant.load !27
  %4 = extractelement <4 x float> %3, i32 0
  %5 = extractelement <4 x float> %3, i32 1
  %6 = extractelement <4 x float> %3, i32 2
  %7 = extractelement <4 x float> %3, i32 3
  %add.6.i = fadd float %4, 0.000000e+00
  %8 = getelementptr inbounds float, ptr addrspace(1) %2, i64 500
  %9 = load <4 x float>, ptr addrspace(1) %8, align 16, !invariant.load !27
  %10 = extractelement <4 x float> %9, i32 0
  %11 = extractelement <4 x float> %9, i32 1
  %12 = extractelement <4 x float> %9, i32 2
  %13 = extractelement <4 x float> %9, i32 3
  %add.6.i.1 = fadd float %add.6.i, %10
  %14 = getelementptr inbounds float, ptr addrspace(1) %2, i64 1000
  %15 = load <4 x float>, ptr addrspace(1) %14, align 16, !invariant.load !27
  %16 = extractelement <4 x float> %15, i32 0
  %17 = extractelement <4 x float> %15, i32 1
  %18 = extractelement <4 x float> %15, i32 2
  %19 = extractelement <4 x float> %15, i32 3
  %add.6.i.2 = fadd float %add.6.i.1, %16
  %20 = getelementptr inbounds float, ptr addrspace(1) %2, i64 1500
  %21 = load <4 x float>, ptr addrspace(1) %20, align 16, !invariant.load !27
  %22 = extractelement <4 x float> %21, i32 0
  %23 = extractelement <4 x float> %21, i32 1
  %24 = extractelement <4 x float> %21, i32 2
  %25 = extractelement <4 x float> %21, i32 3
  %add.6.i.3 = fadd float %add.6.i.2, %22
  %26 = getelementptr inbounds float, ptr addrspace(1) %2, i64 2000
  %27 = load <4 x float>, ptr addrspace(1) %26, align 16, !invariant.load !27
  %28 = extractelement <4 x float> %27, i32 0
  %29 = extractelement <4 x float> %27, i32 1
  %30 = extractelement <4 x float> %27, i32 2
  %31 = extractelement <4 x float> %27, i32 3
  %add.6.i.4 = fadd float %add.6.i.3, %28
  %32 = getelementptr inbounds float, ptr addrspace(1) %2, i64 2500
  %33 = load <4 x float>, ptr addrspace(1) %32, align 16, !invariant.load !27
  %34 = extractelement <4 x float> %33, i32 0
  %35 = extractelement <4 x float> %33, i32 1
  %36 = extractelement <4 x float> %33, i32 2
  %37 = extractelement <4 x float> %33, i32 3
  %add.6.i.5 = fadd float %add.6.i.4, %34
  %38 = getelementptr inbounds float, ptr addrspace(1) %2, i64 3000
  %39 = load <4 x float>, ptr addrspace(1) %38, align 16, !invariant.load !27
  %40 = extractelement <4 x float> %39, i32 0
  %41 = extractelement <4 x float> %39, i32 1
  %42 = extractelement <4 x float> %39, i32 2
  %43 = extractelement <4 x float> %39, i32 3
  %add.6.i.6 = fadd float %add.6.i.5, %40
  %44 = getelementptr inbounds float, ptr addrspace(1) %2, i64 3500
  %45 = load <4 x float>, ptr addrspace(1) %44, align 16, !invariant.load !27
  %46 = extractelement <4 x float> %45, i32 0
  %47 = extractelement <4 x float> %45, i32 1
  %48 = extractelement <4 x float> %45, i32 2
  %49 = extractelement <4 x float> %45, i32 3
  %add.6.i.7 = fadd float %add.6.i.6, %46
  %50 = getelementptr inbounds float, ptr addrspace(1) %2, i64 4000
  %51 = load <4 x float>, ptr addrspace(1) %50, align 16, !invariant.load !27
  %52 = extractelement <4 x float> %51, i32 0
  %53 = extractelement <4 x float> %51, i32 1
  %54 = extractelement <4 x float> %51, i32 2
  %55 = extractelement <4 x float> %51, i32 3
  %add.6.i.8 = fadd float %add.6.i.7, %52
  %56 = getelementptr inbounds float, ptr addrspace(1) %2, i64 4500
  %57 = load <4 x float>, ptr addrspace(1) %56, align 16, !invariant.load !27
  %58 = extractelement <4 x float> %57, i32 0
  %59 = extractelement <4 x float> %57, i32 1
  %60 = extractelement <4 x float> %57, i32 2
  %61 = extractelement <4 x float> %57, i32 3
  %add.6.i.9 = fadd float %add.6.i.8, %58
  %62 = getelementptr float, ptr addrspace(1) %alloc2449, i64 %1
  %add.6.i38 = fadd float %5, 0.000000e+00
  %add.6.i38.1 = fadd float %add.6.i38, %11
  %add.6.i38.2 = fadd float %add.6.i38.1, %17
  %add.6.i38.3 = fadd float %add.6.i38.2, %23
  %add.6.i38.4 = fadd float %add.6.i38.3, %29
  %add.6.i38.5 = fadd float %add.6.i38.4, %35
  %add.6.i38.6 = fadd float %add.6.i38.5, %41
  %add.6.i38.7 = fadd float %add.6.i38.6, %47
  %add.6.i38.8 = fadd float %add.6.i38.7, %53
  %add.6.i38.9 = fadd float %add.6.i38.8, %59
  %add.6.i37 = fadd float %6, 0.000000e+00
  %add.6.i37.1 = fadd float %add.6.i37, %12
  %add.6.i37.2 = fadd float %add.6.i37.1, %18
  %add.6.i37.3 = fadd float %add.6.i37.2, %24
  %add.6.i37.4 = fadd float %add.6.i37.3, %30
  %add.6.i37.5 = fadd float %add.6.i37.4, %36
  %add.6.i37.6 = fadd float %add.6.i37.5, %42
  %add.6.i37.7 = fadd float %add.6.i37.6, %48
  %add.6.i37.8 = fadd float %add.6.i37.7, %54
  %add.6.i37.9 = fadd float %add.6.i37.8, %60
  %add.6.i36 = fadd float %7, 0.000000e+00
  %add.6.i36.1 = fadd float %add.6.i36, %13
  %add.6.i36.2 = fadd float %add.6.i36.1, %19
  %add.6.i36.3 = fadd float %add.6.i36.2, %25
  %add.6.i36.4 = fadd float %add.6.i36.3, %31
  %add.6.i36.5 = fadd float %add.6.i36.4, %37
  %add.6.i36.6 = fadd float %add.6.i36.5, %43
  %add.6.i36.7 = fadd float %add.6.i36.6, %49
  %add.6.i36.8 = fadd float %add.6.i36.7, %55
  %add.6.i36.9 = fadd float %add.6.i36.8, %61
  %63 = insertelement <4 x float> poison, float %add.6.i.9, i32 0
  %64 = insertelement <4 x float> %63, float %add.6.i38.9, i32 1
  %65 = insertelement <4 x float> %64, float %add.6.i37.9, i32 2
  %66 = insertelement <4 x float> %65, float %add.6.i36.9, i32 3
  store <4 x float> %66, ptr addrspace(1) %62, align 16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_18(ptr noalias nocapture readonly align 16 dereferenceable(2000) %alloc3, ptr noalias nocapture readonly align 16 dereferenceable(20000) %alloc4, ptr noalias nocapture readonly align 16 dereferenceable(40) %alloc5, ptr noalias nocapture readonly align 16 dereferenceable(2000) %alloc10, ptr noalias nocapture readonly align 16 dereferenceable(2000) %alloc11, ptr noalias nocapture readonly align 16 dereferenceable(20000) %alloc12, ptr noalias nocapture readonly align 16 dereferenceable(20000) %alloc13, ptr noalias nocapture readonly align 16 dereferenceable(40) %alloc14, ptr noalias nocapture readonly align 16 dereferenceable(40) %alloc15, ptr noalias nocapture align 128 dereferenceable(20000) %alloc19, ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc20, ptr noalias nocapture writeonly align 128 dereferenceable(20000) %alloc21, ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc22, ptr noalias nocapture writeonly align 128 dereferenceable(2000) %alloc23, ptr noalias nocapture align 128 dereferenceable(2000) %alloc24, ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc25, ptr noalias nocapture writeonly align 128 dereferenceable(40) %alloc26, ptr noalias nocapture align 128 dereferenceable(40) %alloc27, ptr noalias nocapture readonly align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf345 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc27343 = addrspacecast ptr %alloc27 to ptr addrspace(1)
  %alloc26341 = addrspacecast ptr %alloc26 to ptr addrspace(1)
  %alloc25339 = addrspacecast ptr %alloc25 to ptr addrspace(1)
  %alloc24337 = addrspacecast ptr %alloc24 to ptr addrspace(1)
  %alloc23335 = addrspacecast ptr %alloc23 to ptr addrspace(1)
  %alloc22333 = addrspacecast ptr %alloc22 to ptr addrspace(1)
  %alloc21331 = addrspacecast ptr %alloc21 to ptr addrspace(1)
  %alloc20329 = addrspacecast ptr %alloc20 to ptr addrspace(1)
  %alloc19327 = addrspacecast ptr %alloc19 to ptr addrspace(1)
  %alloc15325 = addrspacecast ptr %alloc15 to ptr addrspace(1)
  %alloc14323 = addrspacecast ptr %alloc14 to ptr addrspace(1)
  %alloc13321 = addrspacecast ptr %alloc13 to ptr addrspace(1)
  %alloc12319 = addrspacecast ptr %alloc12 to ptr addrspace(1)
  %alloc11317 = addrspacecast ptr %alloc11 to ptr addrspace(1)
  %alloc10315 = addrspacecast ptr %alloc10 to ptr addrspace(1)
  %alloc5313 = addrspacecast ptr %alloc5 to ptr addrspace(1)
  %alloc4311 = addrspacecast ptr %alloc4 to ptr addrspace(1)
  %alloc3309 = addrspacecast ptr %alloc3 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !33
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !34
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 5510
  br i1 %3, label %concatenate.pivot.500., label %fusion_18.in_bounds-after

fusion_18.in_bounds-after:                        ; preds = %slice6-true, %slice5-after, %entry
  ret void

concatenate.pivot.500.:                           ; preds = %entry
  %4 = icmp ult i32 %linear_index, 500
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.5500.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.500.
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc3309, i64 0, i64 %5
  %7 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %5
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !27
  %9 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %5
  %10 = load float, ptr addrspace(1) %9, align 4
  %subtract.16 = fsub float %10, %8
  %multiply.19 = fmul float %subtract.16, 0x3FB9999A00000000
  %add.20 = fadd float %8, %multiply.19
  %11 = load float, ptr addrspace(1) %temp_buf345, align 128, !invariant.load !27
  %multiply.22 = fmul float %11, %add.20
  %12 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %5
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !27
  %multiply.23 = fmul float %10, %10
  %subtract.24 = fsub float %multiply.23, %13
  br label %concatenate.pivot.500.24

concatenate.pivot.5500.:                          ; preds = %concatenate.pivot.500.
  %14 = icmp ult i32 %linear_index, 5500
  br i1 %14, label %concatenate.pivot.500.7, label %concatenate.pivot.5500.8

concatenate.pivot.500.7:                          ; preds = %concatenate.pivot.5500.
  %15 = trunc i32 %linear_index to i16
  %.lhs.trunc274 = add nsw i16 %15, -500
  %.lhs.trunc274.frozen = freeze i16 %.lhs.trunc274
  %16 = udiv i16 %.lhs.trunc274.frozen, 10
  %17 = mul i16 %16, 10
  %.decomposed = sub i16 %.lhs.trunc274.frozen, %17
  %18 = zext i16 %16 to i64
  %19 = zext i16 %.decomposed to i64
  %20 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc4311, i64 0, i64 %18, i64 %19
  %21 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %18, i64 %19
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !27
  %23 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %18, i64 %19
  %24 = load float, ptr addrspace(1) %23, align 4
  %subtract.36 = fsub float %24, %22
  %multiply.38 = fmul float %subtract.36, 0x3FB9999A00000000
  %add.39 = fadd float %22, %multiply.38
  %25 = load float, ptr addrspace(1) %temp_buf345, align 128, !invariant.load !27
  %multiply.41 = fmul float %25, %add.39
  %26 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %18, i64 %19
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !27
  %multiply.42 = fmul float %24, %24
  %subtract.43 = fsub float %multiply.42, %27
  br label %concatenate.pivot.500.24

concatenate.pivot.5500.8:                         ; preds = %concatenate.pivot.5500.
  %28 = add nsw i32 %linear_index, -5500
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc5313, i64 0, i64 %29
  %31 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %29
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !27
  %33 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %29
  %34 = load float, ptr addrspace(1) %33, align 4
  %subtract.53 = fsub float %34, %32
  %multiply.55 = fmul float %subtract.53, 0x3FB9999A00000000
  %add.56 = fadd float %32, %multiply.55
  %35 = load float, ptr addrspace(1) %temp_buf345, align 128, !invariant.load !27
  %multiply.58 = fmul float %35, %add.56
  %36 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %29
  %37 = load float, ptr addrspace(1) %36, align 4, !invariant.load !27
  %multiply.59 = fmul float %34, %34
  %subtract.60 = fsub float %multiply.59, %37
  br label %concatenate.pivot.500.24

concatenate.pivot.500.24:                         ; preds = %concatenate.pivot.5500.8, %concatenate.pivot.500.7, %concatenate.pivot.0.
  %subtract.24.sink = phi float [ %subtract.24, %concatenate.pivot.0. ], [ %subtract.43, %concatenate.pivot.500.7 ], [ %subtract.60, %concatenate.pivot.5500.8 ]
  %.sink279 = phi float [ %13, %concatenate.pivot.0. ], [ %27, %concatenate.pivot.500.7 ], [ %37, %concatenate.pivot.5500.8 ]
  %multiply.22.sink = phi float [ %multiply.22, %concatenate.pivot.0. ], [ %multiply.41, %concatenate.pivot.500.7 ], [ %multiply.58, %concatenate.pivot.5500.8 ]
  %.sink.in = phi ptr addrspace(1) [ %6, %concatenate.pivot.0. ], [ %20, %concatenate.pivot.500.7 ], [ %30, %concatenate.pivot.5500.8 ]
  %38 = phi float [ %11, %concatenate.pivot.0. ], [ %25, %concatenate.pivot.500.7 ], [ %35, %concatenate.pivot.5500.8 ]
  %39 = icmp ult i32 %linear_index, 500
  %.sink = load float, ptr addrspace(1) %.sink.in, align 4, !invariant.load !27
  %multiply.27 = fmul float %subtract.24.sink, 0x3F50624000000000
  %add.28 = fadd float %.sink279, %multiply.27
  %40 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.28) #4
  %add.32 = fadd float %40, 0x3E45798EE0000000
  %divide.33 = fdiv float %multiply.22.sink, %add.32
  %subtract.34 = fsub float %.sink, %divide.33
  br i1 %39, label %concatenate.pivot.0.25, label %concatenate.pivot.5500.26

concatenate.pivot.0.25:                           ; preds = %concatenate.pivot.500.24
  %41 = zext i32 %linear_index to i64
  %42 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %41
  %43 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %41
  br label %concatenate.pivot.500.47

concatenate.pivot.5500.26:                        ; preds = %concatenate.pivot.500.24
  %44 = icmp ult i32 %linear_index, 5500
  br i1 %44, label %concatenate.pivot.500.27, label %concatenate.pivot.5500.28

concatenate.pivot.500.27:                         ; preds = %concatenate.pivot.5500.26
  %45 = trunc i32 %linear_index to i16
  %.lhs.trunc270 = add nsw i16 %45, -500
  %.lhs.trunc270.frozen = freeze i16 %.lhs.trunc270
  %46 = udiv i16 %.lhs.trunc270.frozen, 10
  %47 = mul i16 %46, 10
  %.decomposed301 = sub i16 %.lhs.trunc270.frozen, %47
  %48 = zext i16 %46 to i64
  %49 = zext i16 %.decomposed301 to i64
  %50 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %48, i64 %49
  %51 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %48, i64 %49
  br label %concatenate.pivot.500.47

concatenate.pivot.5500.28:                        ; preds = %concatenate.pivot.5500.26
  %52 = add nsw i32 %linear_index, -5500
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %53
  %55 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %53
  br label %concatenate.pivot.500.47

concatenate.pivot.500.47:                         ; preds = %concatenate.pivot.5500.28, %concatenate.pivot.500.27, %concatenate.pivot.0.25
  %.sink283 = phi ptr addrspace(1) [ %43, %concatenate.pivot.0.25 ], [ %51, %concatenate.pivot.500.27 ], [ %55, %concatenate.pivot.5500.28 ]
  %.sink282.in = phi ptr addrspace(1) [ %42, %concatenate.pivot.0.25 ], [ %50, %concatenate.pivot.500.27 ], [ %54, %concatenate.pivot.5500.28 ]
  %56 = icmp ult i32 %linear_index, 500
  %.sink282 = load float, ptr addrspace(1) %.sink282.in, align 4, !invariant.load !27
  %57 = load float, ptr addrspace(1) %.sink283, align 4
  %subtract.1610 = fsub float %57, %.sink282
  %multiply.1912 = fmul float %subtract.1610, 0x3FB9999A00000000
  %add.2013 = fadd float %.sink282, %multiply.1912
  br i1 %56, label %concatenate.pivot.0.48, label %concatenate.pivot.5500.49

concatenate.pivot.0.48:                           ; preds = %concatenate.pivot.500.47
  %58 = zext i32 %linear_index to i64
  %59 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4, !invariant.load !27
  %61 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %58
  %62 = load float, ptr addrspace(1) %61, align 4
  %multiply.2330 = fmul float %62, %62
  %subtract.2431 = fsub float %multiply.2330, %60
  br label %concatenate.pivot.500.98

concatenate.pivot.5500.49:                        ; preds = %concatenate.pivot.500.47
  %63 = icmp ult i32 %linear_index, 5500
  br i1 %63, label %concatenate.pivot.500.50, label %concatenate.pivot.5500.51

concatenate.pivot.500.50:                         ; preds = %concatenate.pivot.5500.49
  %64 = trunc i32 %linear_index to i16
  %.lhs.trunc266 = add nsw i16 %64, -500
  %.lhs.trunc266.frozen = freeze i16 %.lhs.trunc266
  %65 = udiv i16 %.lhs.trunc266.frozen, 10
  %66 = mul i16 %65, 10
  %.decomposed302 = sub i16 %.lhs.trunc266.frozen, %66
  %67 = zext i16 %65 to i64
  %68 = zext i16 %.decomposed302 to i64
  %69 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %67, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !27
  %71 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %67, i64 %68
  %72 = load float, ptr addrspace(1) %71, align 4
  %multiply.4236 = fmul float %72, %72
  %subtract.4337 = fsub float %multiply.4236, %70
  br label %concatenate.pivot.500.98

concatenate.pivot.5500.51:                        ; preds = %concatenate.pivot.5500.49
  %73 = add nsw i32 %linear_index, -5500
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %74
  %76 = load float, ptr addrspace(1) %75, align 4, !invariant.load !27
  %77 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %74
  %78 = load float, ptr addrspace(1) %77, align 4
  %multiply.5942 = fmul float %78, %78
  %subtract.6043 = fsub float %multiply.5942, %76
  br label %concatenate.pivot.500.98

concatenate.pivot.500.98:                         ; preds = %concatenate.pivot.5500.51, %concatenate.pivot.500.50, %concatenate.pivot.0.48
  %subtract.2431.sink = phi float [ %subtract.2431, %concatenate.pivot.0.48 ], [ %subtract.4337, %concatenate.pivot.500.50 ], [ %subtract.6043, %concatenate.pivot.5500.51 ]
  %.sink284 = phi float [ %60, %concatenate.pivot.0.48 ], [ %70, %concatenate.pivot.500.50 ], [ %76, %concatenate.pivot.5500.51 ]
  %79 = icmp ult i32 %linear_index, 500
  %multiply.2733 = fmul float %subtract.2431.sink, 0x3F50624000000000
  %add.2834 = fadd float %.sink284, %multiply.2733
  br i1 %79, label %concatenate.pivot.0.99, label %concatenate.pivot.5500.100

concatenate.pivot.0.99:                           ; preds = %concatenate.pivot.500.98
  %80 = zext i32 %linear_index to i64
  %81 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc3309, i64 0, i64 %80
  %82 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %80
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !27
  %84 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %80
  %85 = load float, ptr addrspace(1) %84, align 4
  %subtract.1654 = fsub float %85, %83
  %multiply.1956 = fmul float %subtract.1654, 0x3FB9999A00000000
  %add.2057 = fadd float %83, %multiply.1956
  %86 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %80
  %87 = load float, ptr addrspace(1) %86, align 4, !invariant.load !27
  %multiply.2359 = fmul float %85, %85
  %subtract.2460 = fsub float %multiply.2359, %87
  br label %concatenate.pivot.500.119

concatenate.pivot.5500.100:                       ; preds = %concatenate.pivot.500.98
  %88 = icmp ult i32 %linear_index, 5500
  br i1 %88, label %concatenate.pivot.500.101, label %concatenate.pivot.5500.102

concatenate.pivot.500.101:                        ; preds = %concatenate.pivot.5500.100
  %89 = trunc i32 %linear_index to i16
  %.lhs.trunc262 = add nsw i16 %89, -500
  %.lhs.trunc262.frozen = freeze i16 %.lhs.trunc262
  %90 = udiv i16 %.lhs.trunc262.frozen, 10
  %91 = mul i16 %90, 10
  %.decomposed303 = sub i16 %.lhs.trunc262.frozen, %91
  %92 = zext i16 %90 to i64
  %93 = zext i16 %.decomposed303 to i64
  %94 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc4311, i64 0, i64 %92, i64 %93
  %95 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %92, i64 %93
  %96 = load float, ptr addrspace(1) %95, align 4, !invariant.load !27
  %97 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %92, i64 %93
  %98 = load float, ptr addrspace(1) %97, align 4
  %subtract.3669 = fsub float %98, %96
  %multiply.3871 = fmul float %subtract.3669, 0x3FB9999A00000000
  %add.3972 = fadd float %96, %multiply.3871
  %99 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %92, i64 %93
  %100 = load float, ptr addrspace(1) %99, align 4, !invariant.load !27
  %multiply.4274 = fmul float %98, %98
  %subtract.4375 = fsub float %multiply.4274, %100
  br label %concatenate.pivot.500.119

concatenate.pivot.5500.102:                       ; preds = %concatenate.pivot.5500.100
  %101 = add nsw i32 %linear_index, -5500
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc5313, i64 0, i64 %102
  %104 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %102
  %105 = load float, ptr addrspace(1) %104, align 4, !invariant.load !27
  %106 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %102
  %107 = load float, ptr addrspace(1) %106, align 4
  %subtract.5384 = fsub float %107, %105
  %multiply.5586 = fmul float %subtract.5384, 0x3FB9999A00000000
  %add.5687 = fadd float %105, %multiply.5586
  %108 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %102
  %109 = load float, ptr addrspace(1) %108, align 4, !invariant.load !27
  %multiply.5989 = fmul float %107, %107
  %subtract.6090 = fsub float %multiply.5989, %109
  br label %concatenate.pivot.500.119

concatenate.pivot.500.119:                        ; preds = %concatenate.pivot.5500.102, %concatenate.pivot.500.101, %concatenate.pivot.0.99
  %subtract.2460.sink = phi float [ %subtract.2460, %concatenate.pivot.0.99 ], [ %subtract.4375, %concatenate.pivot.500.101 ], [ %subtract.6090, %concatenate.pivot.5500.102 ]
  %.sink287 = phi float [ %87, %concatenate.pivot.0.99 ], [ %100, %concatenate.pivot.500.101 ], [ %109, %concatenate.pivot.5500.102 ]
  %add.2057.pn = phi float [ %add.2057, %concatenate.pivot.0.99 ], [ %add.3972, %concatenate.pivot.500.101 ], [ %add.5687, %concatenate.pivot.5500.102 ]
  %.sink285.in = phi ptr addrspace(1) [ %81, %concatenate.pivot.0.99 ], [ %94, %concatenate.pivot.500.101 ], [ %103, %concatenate.pivot.5500.102 ]
  %110 = icmp ult i32 %linear_index, 500
  %.sink285 = load float, ptr addrspace(1) %.sink285.in, align 4, !invariant.load !27
  %multiply.2258.sink = fmul float %38, %add.2057.pn
  %multiply.2762 = fmul float %subtract.2460.sink, 0x3F50624000000000
  %add.2863 = fadd float %.sink287, %multiply.2762
  %111 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.2863) #4
  %add.3265 = fadd float %111, 0x3E45798EE0000000
  %divide.3366 = fdiv float %multiply.2258.sink, %add.3265
  %subtract.3467 = fsub float %.sink285, %divide.3366
  br i1 %110, label %concatenate.pivot.0.120, label %concatenate.pivot.5500.121

concatenate.pivot.0.120:                          ; preds = %concatenate.pivot.500.119
  %112 = zext i32 %linear_index to i64
  %113 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %112
  %114 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %112
  br label %concatenate.pivot.500.143

concatenate.pivot.5500.121:                       ; preds = %concatenate.pivot.500.119
  %115 = icmp ult i32 %linear_index, 5500
  br i1 %115, label %concatenate.pivot.500.122, label %concatenate.pivot.5500.123

concatenate.pivot.500.122:                        ; preds = %concatenate.pivot.5500.121
  %116 = trunc i32 %linear_index to i16
  %.lhs.trunc258 = add nsw i16 %116, -500
  %.lhs.trunc258.frozen = freeze i16 %.lhs.trunc258
  %117 = udiv i16 %.lhs.trunc258.frozen, 10
  %118 = mul i16 %117, 10
  %.decomposed304 = sub i16 %.lhs.trunc258.frozen, %118
  %119 = zext i16 %117 to i64
  %120 = zext i16 %.decomposed304 to i64
  %121 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %119, i64 %120
  %122 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %119, i64 %120
  br label %concatenate.pivot.500.143

concatenate.pivot.5500.123:                       ; preds = %concatenate.pivot.5500.121
  %123 = add nsw i32 %linear_index, -5500
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %124
  %126 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %124
  br label %concatenate.pivot.500.143

concatenate.pivot.500.143:                        ; preds = %concatenate.pivot.5500.123, %concatenate.pivot.500.122, %concatenate.pivot.0.120
  %.sink291 = phi ptr addrspace(1) [ %114, %concatenate.pivot.0.120 ], [ %122, %concatenate.pivot.500.122 ], [ %126, %concatenate.pivot.5500.123 ]
  %.sink290.in = phi ptr addrspace(1) [ %113, %concatenate.pivot.0.120 ], [ %121, %concatenate.pivot.500.122 ], [ %125, %concatenate.pivot.5500.123 ]
  %127 = icmp ult i32 %linear_index, 500
  %.sink290 = load float, ptr addrspace(1) %.sink290.in, align 4, !invariant.load !27
  %128 = load float, ptr addrspace(1) %.sink291, align 4
  %subtract.16105 = fsub float %128, %.sink290
  %multiply.19107 = fmul float %subtract.16105, 0x3FB9999A00000000
  %add.20108 = fadd float %.sink290, %multiply.19107
  br i1 %127, label %concatenate.pivot.0.144, label %concatenate.pivot.5500.145

concatenate.pivot.0.144:                          ; preds = %concatenate.pivot.500.143
  %129 = zext i32 %linear_index to i64
  %130 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %129
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !27
  %132 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %129
  %133 = load float, ptr addrspace(1) %132, align 4
  %multiply.23126 = fmul float %133, %133
  %subtract.24127 = fsub float %multiply.23126, %131
  br label %concatenate.pivot.500.194

concatenate.pivot.5500.145:                       ; preds = %concatenate.pivot.500.143
  %134 = icmp ult i32 %linear_index, 5500
  br i1 %134, label %concatenate.pivot.500.146, label %concatenate.pivot.5500.147

concatenate.pivot.500.146:                        ; preds = %concatenate.pivot.5500.145
  %135 = trunc i32 %linear_index to i16
  %.lhs.trunc254 = add nsw i16 %135, -500
  %.lhs.trunc254.frozen = freeze i16 %.lhs.trunc254
  %136 = udiv i16 %.lhs.trunc254.frozen, 10
  %137 = mul i16 %136, 10
  %.decomposed305 = sub i16 %.lhs.trunc254.frozen, %137
  %138 = zext i16 %136 to i64
  %139 = zext i16 %.decomposed305 to i64
  %140 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %138, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 4, !invariant.load !27
  %142 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %138, i64 %139
  %143 = load float, ptr addrspace(1) %142, align 4
  %multiply.42132 = fmul float %143, %143
  %subtract.43133 = fsub float %multiply.42132, %141
  br label %concatenate.pivot.500.194

concatenate.pivot.5500.147:                       ; preds = %concatenate.pivot.5500.145
  %144 = add nsw i32 %linear_index, -5500
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4, !invariant.load !27
  %148 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %145
  %149 = load float, ptr addrspace(1) %148, align 4
  %multiply.59138 = fmul float %149, %149
  %subtract.60139 = fsub float %multiply.59138, %147
  br label %concatenate.pivot.500.194

concatenate.pivot.500.194:                        ; preds = %concatenate.pivot.5500.147, %concatenate.pivot.500.146, %concatenate.pivot.0.144
  %subtract.24127.sink = phi float [ %subtract.24127, %concatenate.pivot.0.144 ], [ %subtract.43133, %concatenate.pivot.500.146 ], [ %subtract.60139, %concatenate.pivot.5500.147 ]
  %.sink292 = phi float [ %131, %concatenate.pivot.0.144 ], [ %141, %concatenate.pivot.500.146 ], [ %147, %concatenate.pivot.5500.147 ]
  %150 = icmp ult i32 %linear_index, 500
  %multiply.27129 = fmul float %subtract.24127.sink, 0x3F50624000000000
  %add.28130 = fadd float %.sink292, %multiply.27129
  br i1 %150, label %concatenate.pivot.0.195, label %concatenate.pivot.5500.196

concatenate.pivot.0.195:                          ; preds = %concatenate.pivot.500.194
  %151 = zext i32 %linear_index to i64
  %152 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc3309, i64 0, i64 %151
  %153 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %151
  %154 = load float, ptr addrspace(1) %153, align 4, !invariant.load !27
  %155 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %151
  %156 = load float, ptr addrspace(1) %155, align 4
  %subtract.16150 = fsub float %156, %154
  %multiply.19152 = fmul float %subtract.16150, 0x3FB9999A00000000
  %add.20153 = fadd float %154, %multiply.19152
  %157 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %151
  %158 = load float, ptr addrspace(1) %157, align 4, !invariant.load !27
  %multiply.23155 = fmul float %156, %156
  %subtract.24156 = fsub float %multiply.23155, %158
  br label %concatenate.pivot.500.215

concatenate.pivot.5500.196:                       ; preds = %concatenate.pivot.500.194
  %159 = icmp ult i32 %linear_index, 5500
  br i1 %159, label %concatenate.pivot.500.197, label %concatenate.pivot.5500.198

concatenate.pivot.500.197:                        ; preds = %concatenate.pivot.5500.196
  %160 = trunc i32 %linear_index to i16
  %.lhs.trunc250 = add nsw i16 %160, -500
  %.lhs.trunc250.frozen = freeze i16 %.lhs.trunc250
  %161 = udiv i16 %.lhs.trunc250.frozen, 10
  %162 = mul i16 %161, 10
  %.decomposed306 = sub i16 %.lhs.trunc250.frozen, %162
  %163 = zext i16 %161 to i64
  %164 = zext i16 %.decomposed306 to i64
  %165 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc4311, i64 0, i64 %163, i64 %164
  %166 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %163, i64 %164
  %167 = load float, ptr addrspace(1) %166, align 4, !invariant.load !27
  %168 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %163, i64 %164
  %169 = load float, ptr addrspace(1) %168, align 4
  %subtract.36165 = fsub float %169, %167
  %multiply.38167 = fmul float %subtract.36165, 0x3FB9999A00000000
  %add.39168 = fadd float %167, %multiply.38167
  %170 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %163, i64 %164
  %171 = load float, ptr addrspace(1) %170, align 4, !invariant.load !27
  %multiply.42170 = fmul float %169, %169
  %subtract.43171 = fsub float %multiply.42170, %171
  br label %concatenate.pivot.500.215

concatenate.pivot.5500.198:                       ; preds = %concatenate.pivot.5500.196
  %172 = add nsw i32 %linear_index, -5500
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc5313, i64 0, i64 %173
  %175 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %173
  %176 = load float, ptr addrspace(1) %175, align 4, !invariant.load !27
  %177 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %173
  %178 = load float, ptr addrspace(1) %177, align 4
  %subtract.53180 = fsub float %178, %176
  %multiply.55182 = fmul float %subtract.53180, 0x3FB9999A00000000
  %add.56183 = fadd float %176, %multiply.55182
  %179 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %173
  %180 = load float, ptr addrspace(1) %179, align 4, !invariant.load !27
  %multiply.59185 = fmul float %178, %178
  %subtract.60186 = fsub float %multiply.59185, %180
  br label %concatenate.pivot.500.215

concatenate.pivot.500.215:                        ; preds = %concatenate.pivot.5500.198, %concatenate.pivot.500.197, %concatenate.pivot.0.195
  %subtract.24156.sink = phi float [ %subtract.24156, %concatenate.pivot.0.195 ], [ %subtract.43171, %concatenate.pivot.500.197 ], [ %subtract.60186, %concatenate.pivot.5500.198 ]
  %.sink295 = phi float [ %158, %concatenate.pivot.0.195 ], [ %171, %concatenate.pivot.500.197 ], [ %180, %concatenate.pivot.5500.198 ]
  %add.20153.pn = phi float [ %add.20153, %concatenate.pivot.0.195 ], [ %add.39168, %concatenate.pivot.500.197 ], [ %add.56183, %concatenate.pivot.5500.198 ]
  %.sink293.in = phi ptr addrspace(1) [ %152, %concatenate.pivot.0.195 ], [ %165, %concatenate.pivot.500.197 ], [ %174, %concatenate.pivot.5500.198 ]
  %181 = icmp ult i32 %linear_index, 500
  %.sink293 = load float, ptr addrspace(1) %.sink293.in, align 4, !invariant.load !27
  %multiply.22154.sink = fmul float %38, %add.20153.pn
  %multiply.27158 = fmul float %subtract.24156.sink, 0x3F50624000000000
  %add.28159 = fadd float %.sink295, %multiply.27158
  %182 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.28159) #4
  %add.32161 = fadd float %182, 0x3E45798EE0000000
  %divide.33162 = fdiv float %multiply.22154.sink, %add.32161
  %subtract.34163 = fsub float %.sink293, %divide.33162
  br i1 %181, label %concatenate.pivot.0.216, label %concatenate.pivot.5500.217

concatenate.pivot.0.216:                          ; preds = %concatenate.pivot.500.215
  %183 = zext i32 %linear_index to i64
  %184 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc10315, i64 0, i64 %183
  %185 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %183
  br label %concatenate.pivot.500.239

concatenate.pivot.5500.217:                       ; preds = %concatenate.pivot.500.215
  %186 = icmp ult i32 %linear_index, 5500
  br i1 %186, label %concatenate.pivot.500.218, label %concatenate.pivot.5500.219

concatenate.pivot.500.218:                        ; preds = %concatenate.pivot.5500.217
  %187 = trunc i32 %linear_index to i16
  %.lhs.trunc246 = add nsw i16 %187, -500
  %.lhs.trunc246.frozen = freeze i16 %.lhs.trunc246
  %188 = udiv i16 %.lhs.trunc246.frozen, 10
  %189 = mul i16 %188, 10
  %.decomposed307 = sub i16 %.lhs.trunc246.frozen, %189
  %190 = zext i16 %188 to i64
  %191 = zext i16 %.decomposed307 to i64
  %192 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc12319, i64 0, i64 %190, i64 %191
  %193 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %190, i64 %191
  br label %concatenate.pivot.500.239

concatenate.pivot.5500.219:                       ; preds = %concatenate.pivot.5500.217
  %194 = add nsw i32 %linear_index, -5500
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc14323, i64 0, i64 %195
  %197 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %195
  br label %concatenate.pivot.500.239

concatenate.pivot.500.239:                        ; preds = %concatenate.pivot.5500.219, %concatenate.pivot.500.218, %concatenate.pivot.0.216
  %.sink299 = phi ptr addrspace(1) [ %185, %concatenate.pivot.0.216 ], [ %193, %concatenate.pivot.500.218 ], [ %197, %concatenate.pivot.5500.219 ]
  %.sink298.in = phi ptr addrspace(1) [ %184, %concatenate.pivot.0.216 ], [ %192, %concatenate.pivot.500.218 ], [ %196, %concatenate.pivot.5500.219 ]
  %198 = icmp ult i32 %linear_index, 500
  %.sink298 = load float, ptr addrspace(1) %.sink298.in, align 4, !invariant.load !27
  %199 = load float, ptr addrspace(1) %.sink299, align 4
  %subtract.16201 = fsub float %199, %.sink298
  %multiply.19203 = fmul float %subtract.16201, 0x3FB9999A00000000
  %add.20204 = fadd float %.sink298, %multiply.19203
  br i1 %198, label %concatenate.pivot.0.240, label %concatenate.pivot.5500.241

concatenate.pivot.0.240:                          ; preds = %concatenate.pivot.500.239
  %200 = zext i32 %linear_index to i64
  %201 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc11317, i64 0, i64 %200
  %202 = load float, ptr addrspace(1) %201, align 4, !invariant.load !27
  %203 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %200
  %204 = load float, ptr addrspace(1) %203, align 4
  %multiply.23222 = fmul float %204, %204
  %subtract.24223 = fsub float %multiply.23222, %202
  br label %concatenate.80.merge220

concatenate.pivot.5500.241:                       ; preds = %concatenate.pivot.500.239
  %205 = icmp ult i32 %linear_index, 5500
  br i1 %205, label %concatenate.pivot.500.242, label %concatenate.pivot.5500.243

concatenate.pivot.500.242:                        ; preds = %concatenate.pivot.5500.241
  %206 = trunc i32 %linear_index to i16
  %.lhs.trunc = add nsw i16 %206, -500
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %207 = udiv i16 %.lhs.trunc.frozen, 10
  %208 = mul i16 %207, 10
  %.decomposed308 = sub i16 %.lhs.trunc.frozen, %208
  %209 = zext i16 %207 to i64
  %210 = zext i16 %.decomposed308 to i64
  %211 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc13321, i64 0, i64 %209, i64 %210
  %212 = load float, ptr addrspace(1) %211, align 4, !invariant.load !27
  %213 = getelementptr inbounds [500 x [10 x float]], ptr addrspace(1) %alloc19327, i64 0, i64 %209, i64 %210
  %214 = load float, ptr addrspace(1) %213, align 4
  %multiply.42228 = fmul float %214, %214
  %subtract.43229 = fsub float %multiply.42228, %212
  br label %concatenate.80.merge220

concatenate.pivot.5500.243:                       ; preds = %concatenate.pivot.5500.241
  %215 = add nsw i32 %linear_index, -5500
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc15325, i64 0, i64 %216
  %218 = load float, ptr addrspace(1) %217, align 4, !invariant.load !27
  %219 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %216
  %220 = load float, ptr addrspace(1) %219, align 4
  %multiply.59234 = fmul float %220, %220
  %subtract.60235 = fsub float %multiply.59234, %218
  br label %concatenate.80.merge220

concatenate.80.merge220:                          ; preds = %concatenate.pivot.5500.243, %concatenate.pivot.500.242, %concatenate.pivot.0.240
  %subtract.60235.sink = phi float [ %subtract.60235, %concatenate.pivot.5500.243 ], [ %subtract.43229, %concatenate.pivot.500.242 ], [ %subtract.24223, %concatenate.pivot.0.240 ]
  %.sink300 = phi float [ %218, %concatenate.pivot.5500.243 ], [ %212, %concatenate.pivot.500.242 ], [ %202, %concatenate.pivot.0.240 ]
  %221 = icmp ult i32 %linear_index, 500
  %multiply.62237 = fmul float %subtract.60235.sink, 0x3F50624000000000
  %add.63238 = fadd float %.sink300, %multiply.62237
  %222 = zext i32 %linear_index to i64
  %223 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc24337, i64 0, i64 %222
  %224 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc23335, i64 0, i64 %222
  %225 = getelementptr inbounds [500 x float], ptr addrspace(1) %alloc22333, i64 0, i64 %222
  br i1 %221, label %slice0-true, label %slice2-after

slice2-after:                                     ; preds = %slice0-true, %concatenate.80.merge220
  %226 = add nsw i32 %linear_index, -500
  %227 = icmp ult i32 %226, 5000
  %228 = zext i32 %226 to i64
  %229 = getelementptr inbounds [5000 x float], ptr addrspace(1) %alloc21331, i64 0, i64 %228
  %230 = getelementptr inbounds [5000 x float], ptr addrspace(1) %alloc20329, i64 0, i64 %228
  %231 = getelementptr inbounds [5000 x float], ptr addrspace(1) %alloc19327, i64 0, i64 %228
  br i1 %227, label %slice3-true, label %slice5-after

slice5-after:                                     ; preds = %slice3-true, %slice2-after
  %232 = icmp ugt i32 %linear_index, 5499
  %233 = add nsw i32 %linear_index, -5500
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc27343, i64 0, i64 %234
  %236 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc26341, i64 0, i64 %234
  %237 = getelementptr inbounds [10 x float], ptr addrspace(1) %alloc25339, i64 0, i64 %234
  br i1 %232, label %slice6-true, label %fusion_18.in_bounds-after

slice0-true:                                      ; preds = %concatenate.80.merge220
  store float %subtract.34, ptr addrspace(1) %225, align 4
  store float %add.2013, ptr addrspace(1) %224, align 4
  store float %add.2834, ptr addrspace(1) %223, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  store float %subtract.3467, ptr addrspace(1) %231, align 4
  store float %add.20108, ptr addrspace(1) %230, align 4
  store float %add.28130, ptr addrspace(1) %229, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  store float %subtract.34163, ptr addrspace(1) %237, align 4
  store float %add.20204, ptr addrspace(1) %236, align 4
  store float %add.63238, ptr addrspace(1) %235, align 4
  br label %fusion_18.in_bounds-after
}

; Function Attrs: argmemonly nofree nosync nounwind
define void @fusion_9(ptr noalias nocapture readonly align 16 dereferenceable(1568000) %alloc2, ptr noalias nocapture readonly align 16 dereferenceable(1568000) %alloc8, ptr noalias nocapture readonly align 16 dereferenceable(1568000) %alloc9, ptr noalias nocapture writeonly align 128 dereferenceable(1568000) %alloc16, ptr noalias nocapture writeonly align 128 dereferenceable(1568000) %alloc17, ptr noalias nocapture align 128 dereferenceable(1568000) %alloc18, ptr noalias nocapture readonly align 128 dereferenceable(328) %temp_buf) local_unnamed_addr #2 {
entry:
  %temp_buf56 = addrspacecast ptr %temp_buf to ptr addrspace(1)
  %alloc1854 = addrspacecast ptr %alloc18 to ptr addrspace(1)
  %alloc1752 = addrspacecast ptr %alloc17 to ptr addrspace(1)
  %alloc1650 = addrspacecast ptr %alloc16 to ptr addrspace(1)
  %alloc948 = addrspacecast ptr %alloc9 to ptr addrspace(1)
  %alloc846 = addrspacecast ptr %alloc8 to ptr addrspace(1)
  %alloc244 = addrspacecast ptr %alloc2 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = load float, ptr addrspace(1) %temp_buf56, align 128
  %5 = zext i32 %linear_index_base to i64
  %6 = shl nuw nsw i64 %5, 2
  %uglygep = getelementptr i8, ptr addrspace(1) %alloc1752, i64 12
  %uglygep85 = getelementptr i8, ptr addrspace(1) %alloc1650, i64 12
  %uglygep104 = getelementptr i8, ptr addrspace(1) %alloc948, i64 12
  %uglygep114 = getelementptr i8, ptr addrspace(1) %alloc1854, i64 12
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %fusion_9.in_bounds-after, %entry
  %lsr.iv124 = phi ptr addrspace(1) [ %alloc846, %entry ], [ %uglygep125, %fusion_9.in_bounds-after ]
  %lsr.iv115 = phi ptr addrspace(1) [ %uglygep114, %entry ], [ %uglygep116, %fusion_9.in_bounds-after ]
  %lsr.iv105 = phi ptr addrspace(1) [ %uglygep104, %entry ], [ %uglygep106, %fusion_9.in_bounds-after ]
  %lsr.iv95 = phi ptr addrspace(1) [ %alloc244, %entry ], [ %uglygep96, %fusion_9.in_bounds-after ]
  %lsr.iv86 = phi ptr addrspace(1) [ %uglygep85, %entry ], [ %uglygep87, %fusion_9.in_bounds-after ]
  %lsr.iv76 = phi ptr addrspace(1) [ %uglygep, %entry ], [ %uglygep77, %fusion_9.in_bounds-after ]
  %lsr.iv = phi i32 [ -24576, %entry ], [ %lsr.iv.next, %fusion_9.in_bounds-after ]
  %7 = add i32 %linear_index_base, %lsr.iv
  %8 = add i32 %7, 24576
  %9 = icmp ult i32 %8, 392000
  br i1 %9, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %loop.loop_body
  %lsr.iv.next = add nsw i32 %lsr.iv, 24576
  %uglygep77 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 98304
  %uglygep87 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 98304
  %uglygep96 = getelementptr i8, ptr addrspace(1) %lsr.iv95, i64 98304
  %uglygep106 = getelementptr i8, ptr addrspace(1) %lsr.iv105, i64 98304
  %uglygep116 = getelementptr i8, ptr addrspace(1) %lsr.iv115, i64 98304
  %uglygep125 = getelementptr i8, ptr addrspace(1) %lsr.iv124, i64 98304
  %10 = icmp ugt i32 %lsr.iv.next, 367423
  br i1 %10, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !37

loop.loop_exit:                                   ; preds = %fusion_9.in_bounds-after
  ret void

fusion_9.in_bounds-true:                          ; preds = %loop.loop_body
  %uglygep97 = getelementptr i8, ptr addrspace(1) %lsr.iv95, i64 %6
  %11 = load <4 x float>, ptr addrspace(1) %uglygep97, align 16, !invariant.load !27
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %uglygep126 = getelementptr i8, ptr addrspace(1) %lsr.iv124, i64 %6
  %16 = load <4 x float>, ptr addrspace(1) %uglygep126, align 16, !invariant.load !27
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %uglygep118 = getelementptr i8, ptr addrspace(1) %lsr.iv115, i64 %6
  %uglygep119 = getelementptr i8, ptr addrspace(1) %uglygep118, i64 -12
  %21 = load <4 x float>, ptr addrspace(1) %uglygep119, align 16
  %22 = extractelement <4 x float> %21, i32 0
  %23 = extractelement <4 x float> %21, i32 1
  %24 = extractelement <4 x float> %21, i32 2
  %25 = extractelement <4 x float> %21, i32 3
  %subtract.6 = fsub float %22, %17
  %multiply.9 = fmul float %subtract.6, 0x3FB9999A00000000
  %add.10 = fadd float %17, %multiply.9
  %multiply.12 = fmul float %4, %add.10
  %uglygep108 = getelementptr i8, ptr addrspace(1) %lsr.iv105, i64 %6
  %uglygep109 = getelementptr i8, ptr addrspace(1) %uglygep108, i64 -12
  %26 = load <4 x float>, ptr addrspace(1) %uglygep109, align 16, !invariant.load !27
  %27 = extractelement <4 x float> %26, i32 0
  %28 = extractelement <4 x float> %26, i32 1
  %29 = extractelement <4 x float> %26, i32 2
  %30 = extractelement <4 x float> %26, i32 3
  %multiply.13 = fmul float %22, %22
  %subtract.14 = fsub float %multiply.13, %27
  %multiply.17 = fmul float %subtract.14, 0x3F50624000000000
  %add.18 = fadd float %27, %multiply.17
  %31 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.18) #4
  %add.22 = fadd float %31, 0x3E45798EE0000000
  %divide.23 = fdiv float %multiply.12, %add.22
  %subtract.24 = fsub float %12, %divide.23
  %uglygep89 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 %6
  %uglygep90 = getelementptr i8, ptr addrspace(1) %uglygep89, i64 -12
  %uglygep79 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 %6
  %uglygep80 = getelementptr i8, ptr addrspace(1) %uglygep79, i64 -12
  %subtract.61 = fsub float %23, %18
  %multiply.93 = fmul float %subtract.61, 0x3FB9999A00000000
  %add.104 = fadd float %18, %multiply.93
  %multiply.125 = fmul float %4, %add.104
  %multiply.136 = fmul float %23, %23
  %subtract.147 = fsub float %multiply.136, %28
  %multiply.179 = fmul float %subtract.147, 0x3F50624000000000
  %add.1810 = fadd float %28, %multiply.179
  %32 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.1810) #4
  %add.2212 = fadd float %32, 0x3E45798EE0000000
  %divide.2313 = fdiv float %multiply.125, %add.2212
  %subtract.2414 = fsub float %13, %divide.2313
  %subtract.615 = fsub float %24, %19
  %multiply.917 = fmul float %subtract.615, 0x3FB9999A00000000
  %add.1018 = fadd float %19, %multiply.917
  %multiply.1219 = fmul float %4, %add.1018
  %multiply.1320 = fmul float %24, %24
  %subtract.1421 = fsub float %multiply.1320, %29
  %multiply.1723 = fmul float %subtract.1421, 0x3F50624000000000
  %add.1824 = fadd float %29, %multiply.1723
  %33 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.1824) #4
  %add.2226 = fadd float %33, 0x3E45798EE0000000
  %divide.2327 = fdiv float %multiply.1219, %add.2226
  %subtract.2428 = fsub float %14, %divide.2327
  %subtract.629 = fsub float %25, %20
  %multiply.931 = fmul float %subtract.629, 0x3FB9999A00000000
  %add.1032 = fadd float %20, %multiply.931
  %multiply.1233 = fmul float %4, %add.1032
  %multiply.1334 = fmul float %25, %25
  %subtract.1435 = fsub float %multiply.1334, %30
  %multiply.1737 = fmul float %subtract.1435, 0x3F50624000000000
  %add.1838 = fadd float %30, %multiply.1737
  %34 = tail call float @llvm.nvvm.sqrt.approx.f(float %add.1838) #4
  %add.2240 = fadd float %34, 0x3E45798EE0000000
  %divide.2341 = fdiv float %multiply.1233, %add.2240
  %subtract.2442 = fsub float %15, %divide.2341
  %35 = insertelement <4 x float> poison, float %subtract.24, i32 0
  %36 = insertelement <4 x float> %35, float %subtract.2414, i32 1
  %37 = insertelement <4 x float> %36, float %subtract.2428, i32 2
  %38 = insertelement <4 x float> %37, float %subtract.2442, i32 3
  store <4 x float> %38, ptr addrspace(1) %uglygep90, align 16
  %39 = insertelement <4 x float> poison, float %add.10, i32 0
  %40 = insertelement <4 x float> %39, float %add.104, i32 1
  %41 = insertelement <4 x float> %40, float %add.1018, i32 2
  %42 = insertelement <4 x float> %41, float %add.1032, i32 3
  store <4 x float> %42, ptr addrspace(1) %uglygep80, align 16
  %43 = insertelement <4 x float> poison, float %add.18, i32 0
  %44 = insertelement <4 x float> %43, float %add.1810, i32 1
  %45 = insertelement <4 x float> %44, float %add.1824, i32 2
  %46 = insertelement <4 x float> %45, float %add.1838, i32 3
  store <4 x float> %46, ptr addrspace(1) %uglygep119, align 16
  br label %fusion_9.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone willreturn
declare float @llvm.nvvm.sqrt.approx.f(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone willreturn
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

attributes #0 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone willreturn }
attributes #4 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}
!llvm.module.flags = !{!26}

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
!25 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!26 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!27 = !{}
!28 = !{i32 0, i32 25}
!29 = !{i32 0, i32 125}
!30 = !{i32 0, i32 5}
!31 = !{i32 0, i32 2}
!32 = !{i32 0, i32 256}
!33 = !{i32 0, i32 6}
!34 = !{i32 0, i32 1024}
!35 = !{i32 0, i32 48}
!36 = !{i32 0, i32 128}
!37 = distinct !{!37, !38}
!38 = !{!"llvm.loop.vectorize.enable", i1 false}
