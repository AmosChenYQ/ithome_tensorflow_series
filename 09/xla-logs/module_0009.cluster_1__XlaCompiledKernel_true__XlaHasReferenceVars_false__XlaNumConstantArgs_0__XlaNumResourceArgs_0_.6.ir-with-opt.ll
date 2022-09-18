target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = local_unnamed_addr addrspace(1) constant [8 x i8] c"*\00\00\00\00\00\00\00", align 128
@buffer_for_constant_1 = local_unnamed_addr addrspace(1) constant [8 x i8] c"\B1\7F9\05\00\00\00\00", align 128

!llvm.module.flags = !{!0}

!0 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
