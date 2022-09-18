target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc0, ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc1, ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc2, ptr noalias nocapture readonly align 16 dereferenceable(4) %alloc3, ptr noalias nocapture writeonly align 128 dereferenceable(4) %alloc4, ptr noalias nocapture writeonly align 128 dereferenceable(4) %alloc5, ptr noalias nocapture readnone align 128 dereferenceable(16) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc515 = addrspacecast ptr %alloc5 to ptr addrspace(1)
  %alloc413 = addrspacecast ptr %alloc4 to ptr addrspace(1)
  %alloc311 = addrspacecast ptr %alloc3 to ptr addrspace(1)
  %alloc29 = addrspacecast ptr %alloc2 to ptr addrspace(1)
  %alloc17 = addrspacecast ptr %alloc1 to ptr addrspace(1)
  %alloc05 = addrspacecast ptr %alloc0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %.not = icmp eq i32 %0, 1
  %alloc3.val = load float, ptr addrspace(1) %alloc311, align 16
  %alloc2.val = load float, ptr addrspace(1) %alloc29, align 16
  %1 = select i1 %.not, float %alloc3.val, float %alloc2.val
  %alloc1.val = load float, ptr addrspace(1) %alloc17, align 16
  %alloc0.val = load float, ptr addrspace(1) %alloc05, align 16
  %2 = select i1 %.not, float %alloc1.val, float %alloc0.val
  %multiply.7 = fmul float %1, %2
  %alloc4.sink = select i1 %.not, ptr addrspace(1) %alloc515, ptr addrspace(1) %alloc413
  store float %multiply.7, ptr addrspace(1) %alloc4.sink, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @fusion_2, !"kernel", i32 1}
!1 = !{ptr @fusion_2, !"reqntidx", i32 2}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 2}
