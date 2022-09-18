module attributes {hlo.unique_id = 10 : i32, mhlo.unique_id = 10 : i64} {
  memref.global "private" constant @buffer_for_constant_1 : memref<f32> = dense<9.99999974E-5> {lmhlo.alloc = 9 : index}
  memref.global "private" constant @buffer_for_constant_18 : memref<i32> = dense<0> {lmhlo.alloc = 8 : index}
  memref.global "private" constant @buffer_for_constant_17 : memref<f32> = dense<0xFF800000> {lmhlo.alloc = 7 : index}
  func.func @cluster_2__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_4_.98(%arg0: memref<31360000xi8> {lmhlo.params = 0 : index}, %arg1: memref<400000xi8> {lmhlo.params = 1 : index}, %arg2: memref<1568000xi8> {lmhlo.params = 2 : index}, %arg3: memref<2000xi8> {lmhlo.params = 3 : index}, %arg4: memref<20000xi8> {lmhlo.params = 4 : index}, %arg5: memref<40xi8> {lmhlo.params = 5 : index}, %arg6: memref<4xi8> {lmhlo.output_index = dense<> : tensor<0xi64>}, %arg7: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_17"}, %arg8: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_18"}, %arg9: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_1"}, %arg10: memref<20400144xi8>) attributes {result_xla_shape = "f32[]"} {
    %c0 = arith.constant 0 : index
    %0 = memref.view %arg3[%c0][] : memref<2000xi8> to memref<500xf32>
    %c0_0 = arith.constant 0 : index
    %1 = memref.view %arg10[%c0_0][] : memref<20400144xi8> to memref<10000x500xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %0 : memref<500xf32>
      %28 = "mhlo.broadcast_in_dim"(%27) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<500xf32>) -> tensor<10000x500xf32>
      memref.tensor_store %28, %1 : memref<10000x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_1 = arith.constant 0 : index
    %2 = memref.view %arg0[%c0_1][] : memref<31360000xi8> to memref<10000x784xf32>
    %c0_2 = arith.constant 0 : index
    %3 = memref.view %arg2[%c0_2][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_3 = arith.constant 0 : index
    %4 = memref.view %arg10[%c0_3][] : memref<20400144xi8> to memref<10000x500xf32>
    "lmhlo_gpu.gemm_bias"(%2, %3, %1, %4) {algorithm = 6 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>} : (memref<10000x784xf32>, memref<784x500xf32>, memref<10000x500xf32>, memref<10000x500xf32>) -> ()
    %c0_4 = arith.constant 0 : index
    %5 = memref.view %arg10[%c0_4][] : memref<20400144xi8> to memref<10000x500xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %4 : memref<10000x500xf32>
      %28 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %29 = "mhlo.broadcast_in_dim"(%28) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10000x500xf32>
      %30 = mhlo.maximum %27, %29 : tensor<10000x500xf32>
      memref.tensor_store %30, %5 : memref<10000x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_5 = arith.constant 0 : index
    %6 = memref.view %arg5[%c0_5][] : memref<40xi8> to memref<10xf32>
    %c20000000 = arith.constant 20000000 : index
    %7 = memref.view %arg10[%c20000000][] : memref<20400144xi8> to memref<10000x10xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %6 : memref<10xf32>
      %28 = "mhlo.broadcast_in_dim"(%27) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<10000x10xf32>
      memref.tensor_store %28, %7 : memref<10000x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_6 = arith.constant 0 : index
    %8 = memref.view %arg4[%c0_6][] : memref<20000xi8> to memref<500x10xf32>
    %c20000000_7 = arith.constant 20000000 : index
    %9 = memref.view %arg10[%c20000000_7][] : memref<20400144xi8> to memref<10000x10xf32>
    "lmhlo_gpu.gemm_bias"(%5, %8, %7, %9) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>} : (memref<10000x500xf32>, memref<500x10xf32>, memref<10000x10xf32>, memref<10000x10xf32>) -> ()
    %10 = memref.get_global @buffer_for_constant_17 : memref<f32>
    %c0_8 = arith.constant 0 : index
    %11 = memref.view %arg10[%c0_8][] : memref<20400144xi8> to memref<10000xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %9 : memref<10000x10xf32>
      %28 = bufferization.to_tensor %10 : memref<f32>
      %29 = mhlo.reduce(%27 init: %28) across dimensions = [1] : (tensor<10000x10xf32>, tensor<f32>) -> tensor<10000xf32>
       reducer(%arg11: tensor<f32>, %arg12: tensor<f32>)  {
        %30 = mhlo.maximum %arg11, %arg12 : tensor<f32>
        "mhlo.return"(%30) : (tensor<f32>) -> ()
      }
      memref.tensor_store %29, %11 : memref<10000xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c40064 = arith.constant 40064 : index
    %12 = memref.view %arg10[%c40064][] : memref<20400144xi8> to memref<10000xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %9 : memref<10000x10xf32>
      %28 = bufferization.to_tensor %11 : memref<10000xf32>
      %29 = "mhlo.broadcast_in_dim"(%28) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10000xf32>) -> tensor<10000x10xf32>
      %30 = mhlo.subtract %27, %29 : tensor<10000x10xf32>
      %31 = mhlo.exponential %30 : tensor<10000x10xf32>
      %32 = mhlo.constant dense<-0.000000e+00> : tensor<f32>
      %33 = mhlo.reduce(%31 init: %32) across dimensions = [1] : (tensor<10000x10xf32>, tensor<f32>) -> tensor<10000xf32>
       reducer(%arg11: tensor<f32>, %arg12: tensor<f32>)  {
        %34 = mhlo.add %arg11, %arg12 : tensor<f32>
        "mhlo.return"(%34) : (tensor<f32>) -> ()
      }
      memref.tensor_store %33, %12 : memref<10000xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c20000000_9 = arith.constant 20000000 : index
    %13 = memref.view %arg10[%c20000000_9][] : memref<20400144xi8> to memref<10000x10xf32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %12 : memref<10000xf32>
      %28 = bufferization.to_tensor %9 : memref<10000x10xf32>
      %29 = bufferization.to_tensor %11 : memref<10000xf32>
      %30 = "mhlo.broadcast_in_dim"(%29) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10000xf32>) -> tensor<10000x10xf32>
      %31 = mhlo.subtract %28, %30 : tensor<10000x10xf32>
      %32 = mhlo.exponential %31 : tensor<10000x10xf32>
      %33 = "mhlo.broadcast_in_dim"(%27) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10000xf32>) -> tensor<10000x10xf32>
      %34 = mhlo.divide %32, %33 : tensor<10000x10xf32>
      memref.tensor_store %34, %13 : memref<10000x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_10 = arith.constant 0 : index
    %14 = memref.view %arg10[%c0_10][] : memref<20400144xi8> to memref<10000x10xi32>
    "lmhlo.fusion"() ({
      %27 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<10000x10xi32>
      memref.tensor_store %27, %14 : memref<10000x10xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %15 = memref.get_global @buffer_for_constant_18 : memref<i32>
    %c440064 = arith.constant 440064 : index
    %16 = memref.view %arg10[%c440064][] : memref<20400144xi8> to memref<10000xf32>
    %c400000 = arith.constant 400000 : index
    %17 = memref.view %arg10[%c400000][] : memref<20400144xi8> to memref<10000xi32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %13 : memref<10000x10xf32>
      %28 = bufferization.to_tensor %14 : memref<10000x10xi32>
      %29 = bufferization.to_tensor %10 : memref<f32>
      %30 = bufferization.to_tensor %15 : memref<i32>
      %31:2 = mhlo.reduce(%27 init: %29), (%28 init: %30) across dimensions = [1] : (tensor<10000x10xf32>, tensor<10000x10xi32>, tensor<f32>, tensor<i32>) -> (tensor<10000xf32>, tensor<10000xi32>)
       reducer(%arg11: tensor<f32>, %arg13: tensor<f32>) (%arg12: tensor<i32>, %arg14: tensor<i32>)  {
        %32:2 = "mhlo.fusion"(%arg12, %arg14, %arg11, %arg13) ({
        ^bb0(%arg15: tensor<i32>, %arg16: tensor<i32>, %arg17: tensor<f32>, %arg18: tensor<f32>):
          %33 = "mhlo.compare"(%arg17, %arg18) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %34 = mhlo.minimum %arg15, %arg16 : tensor<i32>
          %35 = "mhlo.compare"(%arg17, %arg18) {comparison_direction = #mhlo<"comparison_direction GE">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %36 = "mhlo.select"(%35, %arg15, %arg16) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %37 = "mhlo.select"(%33, %34, %36) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %38 = "mhlo.select"(%35, %arg17, %arg18) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
          "mhlo.return"(%37, %38) : (tensor<i32>, tensor<f32>) -> ()
        }) {fusion_kind = #mhlo<"fusion_kind kLoop">} : (tensor<i32>, tensor<i32>, tensor<f32>, tensor<f32>) -> (tensor<i32>, tensor<f32>)
        "mhlo.return"(%32#1, %32#0) : (tensor<f32>, tensor<i32>) -> ()
      }
      memref.tensor_store %31#0, %16 : memref<10000xf32>
      memref.tensor_store %31#1, %17 : memref<10000xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_11 = arith.constant 0 : index
    %18 = memref.view %arg10[%c0_11][] : memref<20400144xi8> to memref<10000x10xi32>
    "lmhlo.fusion"() ({
      %27 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<10000x10xi32>
      memref.tensor_store %27, %18 : memref<10000x10xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_12 = arith.constant 0 : index
    %19 = memref.view %arg1[%c0_12][] : memref<400000xi8> to memref<10000x10xf32>
    %c480128 = arith.constant 480128 : index
    %20 = memref.view %arg10[%c480128][] : memref<20400144xi8> to memref<10000xf32>
    %c440064_13 = arith.constant 440064 : index
    %21 = memref.view %arg10[%c440064_13][] : memref<20400144xi8> to memref<10000xi32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %19 : memref<10000x10xf32>
      %28 = bufferization.to_tensor %18 : memref<10000x10xi32>
      %29 = bufferization.to_tensor %10 : memref<f32>
      %30 = bufferization.to_tensor %15 : memref<i32>
      %31:2 = mhlo.reduce(%27 init: %29), (%28 init: %30) across dimensions = [1] : (tensor<10000x10xf32>, tensor<10000x10xi32>, tensor<f32>, tensor<i32>) -> (tensor<10000xf32>, tensor<10000xi32>)
       reducer(%arg11: tensor<f32>, %arg13: tensor<f32>) (%arg12: tensor<i32>, %arg14: tensor<i32>)  {
        %32:2 = "mhlo.fusion"(%arg12, %arg14, %arg11, %arg13) ({
        ^bb0(%arg15: tensor<i32>, %arg16: tensor<i32>, %arg17: tensor<f32>, %arg18: tensor<f32>):
          %33 = "mhlo.compare"(%arg17, %arg18) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %34 = mhlo.minimum %arg15, %arg16 : tensor<i32>
          %35 = "mhlo.compare"(%arg17, %arg18) {comparison_direction = #mhlo<"comparison_direction GE">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %36 = "mhlo.select"(%35, %arg15, %arg16) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %37 = "mhlo.select"(%33, %34, %36) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %38 = "mhlo.select"(%35, %arg17, %arg18) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
          "mhlo.return"(%37, %38) : (tensor<i32>, tensor<f32>) -> ()
        }) {fusion_kind = #mhlo<"fusion_kind kLoop">} : (tensor<i32>, tensor<i32>, tensor<f32>, tensor<f32>) -> (tensor<i32>, tensor<f32>)
        "mhlo.return"(%32#1, %32#0) : (tensor<f32>, tensor<i32>) -> ()
      }
      memref.tensor_store %31#0, %20 : memref<10000xf32>
      memref.tensor_store %31#1, %21 : memref<10000xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c440064_14 = arith.constant 440064 : index
    %22 = memref.view %arg10[%c440064_14][] : memref<20400144xi8> to memref<10000xi32>
    %c400000_15 = arith.constant 400000 : index
    %23 = memref.view %arg10[%c400000_15][] : memref<20400144xi8> to memref<10000xi32>
    %c0_16 = arith.constant 0 : index
    %24 = memref.view %arg6[%c0_16][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %22 : memref<10000xi32>
      %28 = bufferization.to_tensor %23 : memref<10000xi32>
      %29 = mhlo.convert(%28) : (tensor<10000xi32>) -> tensor<10000xi64>
      %30 = mhlo.convert(%27) : (tensor<10000xi32>) -> tensor<10000xi64>
      %31 = "mhlo.compare"(%29, %30) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<10000xi64>, tensor<10000xi64>) -> tensor<10000xi1>
      %32 = mhlo.convert(%31) : (tensor<10000xi1>) -> tensor<10000xf32>
      %33 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %34 = mhlo.reduce(%32 init: %33) across dimensions = [0] : (tensor<10000xf32>, tensor<f32>) -> tensor<f32>
       reducer(%arg11: tensor<f32>, %arg12: tensor<f32>)  {
        %35 = mhlo.add %arg11, %arg12 : tensor<f32>
        "mhlo.return"(%35) : (tensor<f32>) -> ()
      }
      memref.tensor_store %34, %24 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %25 = memref.get_global @buffer_for_constant_1 : memref<f32>
    %c0_17 = arith.constant 0 : index
    %26 = memref.view %arg6[%c0_17][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %27 = bufferization.to_tensor %24 : memref<f32>
      %28 = bufferization.to_tensor %25 : memref<f32>
      %29 = mhlo.multiply %27, %28 : tensor<f32>
      memref.tensor_store %29, %26 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}