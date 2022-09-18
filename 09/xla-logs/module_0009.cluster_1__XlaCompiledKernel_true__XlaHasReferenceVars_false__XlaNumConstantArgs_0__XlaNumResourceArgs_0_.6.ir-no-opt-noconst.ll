target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = external constant [8 x i8], align 128
@buffer_for_constant_1 = external constant [8 x i8], align 128
