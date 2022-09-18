module attributes {hlo.unique_id = 0 : i32, mhlo.unique_id = 0 : i64} {
  memref.global "private" constant @buffer_for_constant_5 : memref<f32> = dense<1.000000e-01> {lmhlo.alloc = 16 : index}
  memref.global "private" constant @buffer_for_constant_7 : memref<f32> = dense<0.000000e+00> {lmhlo.alloc = 19 : index}
  memref.global "private" constant @buffer_for_constant_37 : memref<f32> = dense<0.899999976> {lmhlo.alloc = 17 : index}
  memref.global "private" constant @buffer_for_constant_38 : memref<f32> = dense<9.990000e-01> {lmhlo.alloc = 18 : index}
  func.func @cluster_0__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_14_.68(%arg0: memref<1568000xi8> {lmhlo.params = 0 : index}, %arg1: memref<20000xi8> {lmhlo.params = 1 : index}, %arg2: memref<1568000xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg3: memref<1568000xi8> {lmhlo.output_index = dense<6> : tensor<1xi64>}, %arg4: memref<1568000xi8> {lmhlo.output_index = dense<7> : tensor<1xi64>}, %arg5: memref<20000xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg6: memref<20000xi8> {lmhlo.output_index = dense<10> : tensor<1xi64>}, %arg7: memref<20000xi8> {lmhlo.output_index = dense<11> : tensor<1xi64>}, %arg8: memref<2000xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg9: memref<2000xi8> {lmhlo.output_index = dense<8> : tensor<1xi64>}, %arg10: memref<2000xi8> {lmhlo.output_index = dense<9> : tensor<1xi64>}, %arg11: memref<40xi8> {lmhlo.output_index = dense<3> : tensor<1xi64>}, %arg12: memref<40xi8> {lmhlo.output_index = dense<12> : tensor<1xi64>}, %arg13: memref<40xi8> {lmhlo.output_index = dense<13> : tensor<1xi64>}, %arg14: memref<4xi8> {lmhlo.output_index = dense<4> : tensor<1xi64>}, %arg15: memref<4xi8> {lmhlo.output_index = dense<5> : tensor<1xi64>}, %arg16: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_5"}, %arg17: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_37"}, %arg18: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_38"}, %arg19: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_7"}) attributes {result_xla_shape = "(f32[784,500]{1,0}, f32[500]{0}, f32[500,10]{1,0}, f32[10]{0}, f32[], /*index=5*/f32[], f32[784,500]{1,0}, f32[784,500]{1,0}, f32[500]{0}, f32[500]{0}, /*index=10*/f32[500,10]{1,0}, f32[500,10]{1,0}, f32[10]{0}, f32[10]{0})"} {
    %0 = memref.get_global @buffer_for_constant_38 : memref<f32>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg15[%c0][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %0 : memref<f32>
      %21 = "mhlo.copy"(%20) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %21, %1 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %2 = memref.get_global @buffer_for_constant_37 : memref<f32>
    %c0_0 = arith.constant 0 : index
    %3 = memref.view %arg14[%c0_0][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %2 : memref<f32>
      %21 = "mhlo.copy"(%20) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %21, %3 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %4 = memref.get_global @buffer_for_constant_7 : memref<f32>
    %5 = memref.get_global @buffer_for_constant_5 : memref<f32>
    %c0_1 = arith.constant 0 : index
    %6 = memref.view %arg12[%c0_1][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %4 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      memref.tensor_store %21, %6 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_2 = arith.constant 0 : index
    %7 = memref.view %arg13[%c0_2][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %6 : memref<10xf32>
      %21 = "mhlo.copy"(%20) : (tensor<10xf32>) -> tensor<10xf32>
      memref.tensor_store %21, %7 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_3 = arith.constant 0 : index
    %8 = memref.view %arg11[%c0_3][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %5 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      memref.tensor_store %21, %8 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_4 = arith.constant 0 : index
    %9 = memref.view %arg9[%c0_4][] : memref<2000xi8> to memref<500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %4 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      memref.tensor_store %21, %9 : memref<500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_5 = arith.constant 0 : index
    %10 = memref.view %arg10[%c0_5][] : memref<2000xi8> to memref<500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %9 : memref<500xf32>
      %21 = "mhlo.copy"(%20) : (tensor<500xf32>) -> tensor<500xf32>
      memref.tensor_store %21, %10 : memref<500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_6 = arith.constant 0 : index
    %11 = memref.view %arg8[%c0_6][] : memref<2000xi8> to memref<500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %5 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      memref.tensor_store %21, %11 : memref<500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_7 = arith.constant 0 : index
    %12 = memref.view %arg6[%c0_7][] : memref<20000xi8> to memref<500x10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %4 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      memref.tensor_store %21, %12 : memref<500x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_8 = arith.constant 0 : index
    %13 = memref.view %arg7[%c0_8][] : memref<20000xi8> to memref<500x10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %12 : memref<500x10xf32>
      %21 = "mhlo.copy"(%20) : (tensor<500x10xf32>) -> tensor<500x10xf32>
      memref.tensor_store %21, %13 : memref<500x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_9 = arith.constant 0 : index
    %14 = memref.view %arg1[%c0_9][] : memref<20000xi8> to memref<500x10xf32>
    %c0_10 = arith.constant 0 : index
    %15 = memref.view %arg5[%c0_10][] : memref<20000xi8> to memref<500x10xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %14 : memref<500x10xf32>
      %21 = mhlo.constant dense<1.000000e-01> : tensor<f32>
      %22 = "mhlo.broadcast_in_dim"(%21) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      %23 = mhlo.multiply %20, %22 : tensor<500x10xf32>
      memref.tensor_store %23, %15 : memref<500x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_11 = arith.constant 0 : index
    %16 = memref.view %arg3[%c0_11][] : memref<1568000xi8> to memref<784x500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %4 : memref<f32>
      %21 = "mhlo.broadcast_in_dim"(%20) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      memref.tensor_store %21, %16 : memref<784x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_12 = arith.constant 0 : index
    %17 = memref.view %arg4[%c0_12][] : memref<1568000xi8> to memref<784x500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %16 : memref<784x500xf32>
      %21 = "mhlo.copy"(%20) : (tensor<784x500xf32>) -> tensor<784x500xf32>
      memref.tensor_store %21, %17 : memref<784x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_13 = arith.constant 0 : index
    %18 = memref.view %arg0[%c0_13][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_14 = arith.constant 0 : index
    %19 = memref.view %arg2[%c0_14][] : memref<1568000xi8> to memref<784x500xf32>
    "lmhlo.fusion"() ({
      %20 = bufferization.to_tensor %18 : memref<784x500xf32>
      %21 = mhlo.constant dense<1.000000e-01> : tensor<f32>
      %22 = "mhlo.broadcast_in_dim"(%21) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      %23 = mhlo.multiply %20, %22 : tensor<784x500xf32>
      memref.tensor_store %23, %19 : memref<784x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}