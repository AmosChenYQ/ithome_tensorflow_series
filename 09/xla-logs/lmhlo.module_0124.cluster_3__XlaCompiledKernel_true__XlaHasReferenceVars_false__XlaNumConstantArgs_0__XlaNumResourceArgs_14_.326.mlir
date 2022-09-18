module attributes {hlo.unique_id = 124 : i32, mhlo.unique_id = 124 : i64} {
  memref.global "private" constant @buffer_for_constant_27 : memref<f32> = dense<0.000000e+00> {lmhlo.alloc = 33 : index}
  memref.global "private" constant @buffer_for_constant_61 : memref<f32> = dense<0xFF800000> {lmhlo.alloc = 32 : index}
  memref.global "private" constant @buffer_for_constant_297 : memref<f32> = dense<0.899999976> {lmhlo.alloc = 30 : index}
  memref.global "private" constant @buffer_for_constant_298 : memref<f32> = dense<9.990000e-01> {lmhlo.alloc = 31 : index}
  func.func @cluster_3__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_14_.326(%arg0: memref<31360xi8> {lmhlo.params = 0 : index}, %arg1: memref<400xi8> {lmhlo.params = 1 : index}, %arg2: memref<1568000xi8> {lmhlo.params = 2 : index}, %arg3: memref<2000xi8> {lmhlo.params = 3 : index}, %arg4: memref<20000xi8> {lmhlo.params = 4 : index}, %arg5: memref<40xi8> {lmhlo.params = 5 : index}, %arg6: memref<4xi8> {lmhlo.params = 6 : index}, %arg7: memref<4xi8> {lmhlo.params = 7 : index}, %arg8: memref<1568000xi8> {lmhlo.params = 8 : index}, %arg9: memref<1568000xi8> {lmhlo.params = 9 : index}, %arg10: memref<2000xi8> {lmhlo.params = 10 : index}, %arg11: memref<2000xi8> {lmhlo.params = 11 : index}, %arg12: memref<20000xi8> {lmhlo.params = 12 : index}, %arg13: memref<20000xi8> {lmhlo.params = 13 : index}, %arg14: memref<40xi8> {lmhlo.params = 14 : index}, %arg15: memref<40xi8> {lmhlo.params = 15 : index}, %arg16: memref<1568000xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg17: memref<1568000xi8> {lmhlo.output_index = dense<6> : tensor<1xi64>}, %arg18: memref<1568000xi8> {lmhlo.output_index = dense<7> : tensor<1xi64>}, %arg19: memref<20000xi8> {lmhlo.output_index = dense<4> : tensor<1xi64>}, %arg20: memref<20000xi8> {lmhlo.output_index = dense<10> : tensor<1xi64>}, %arg21: memref<20000xi8> {lmhlo.output_index = dense<11> : tensor<1xi64>}, %arg22: memref<2000xi8> {lmhlo.output_index = dense<3> : tensor<1xi64>}, %arg23: memref<2000xi8> {lmhlo.output_index = dense<8> : tensor<1xi64>}, %arg24: memref<2000xi8> {lmhlo.output_index = dense<9> : tensor<1xi64>}, %arg25: memref<40xi8> {lmhlo.output_index = dense<5> : tensor<1xi64>}, %arg26: memref<40xi8> {lmhlo.output_index = dense<12> : tensor<1xi64>}, %arg27: memref<40xi8> {lmhlo.output_index = dense<13> : tensor<1xi64>}, %arg28: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg29: memref<4xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg30: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_297"}, %arg31: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_298"}, %arg32: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_61"}, %arg33: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_27"}, %arg34: memref<328xi8>) attributes {result_xla_shape = "(f32[], f32[], f32[784,500]{1,0}, f32[500]{0}, f32[500,10]{1,0}, /*index=5*/f32[10]{0}, f32[784,500]{1,0}, f32[784,500]{1,0}, f32[500]{0}, f32[500]{0}, /*index=10*/f32[500,10]{1,0}, f32[500,10]{1,0}, f32[10]{0}, f32[10]{0})"} {
    %0 = memref.get_global @buffer_for_constant_298 : memref<f32>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg29[%c0][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %0 : memref<f32>
      %50 = "mhlo.copy"(%49) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %50, %1 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %2 = memref.get_global @buffer_for_constant_297 : memref<f32>
    %c0_0 = arith.constant 0 : index
    %3 = memref.view %arg28[%c0_0][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %2 : memref<f32>
      %50 = "mhlo.copy"(%49) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %50, %3 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %4 = memref.get_global @buffer_for_constant_61 : memref<f32>
    %5 = memref.get_global @buffer_for_constant_27 : memref<f32>
    %c0_1 = arith.constant 0 : index
    %6 = memref.view %arg6[%c0_1][] : memref<4xi8> to memref<f32>
    %c0_2 = arith.constant 0 : index
    %7 = memref.view %arg7[%c0_2][] : memref<4xi8> to memref<f32>
    %c0_3 = arith.constant 0 : index
    %8 = memref.view %arg34[%c0_3][] : memref<328xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %6 : memref<f32>
      %50 = bufferization.to_tensor %7 : memref<f32>
      %51 = mhlo.constant dense<2.500000e-03> : tensor<f32>
      %52 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %53 = mhlo.subtract %52, %50 : tensor<f32>
      %54 = mhlo.sqrt %53 : tensor<f32>
      %55 = mhlo.multiply %51, %54 : tensor<f32>
      %56 = mhlo.subtract %52, %49 : tensor<f32>
      %57 = mhlo.divide %55, %56 : tensor<f32>
      memref.tensor_store %57, %8 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_4 = arith.constant 0 : index
    %9 = memref.view %arg5[%c0_4][] : memref<40xi8> to memref<10xf32>
    %c0_5 = arith.constant 0 : index
    %10 = memref.view %arg24[%c0_5][] : memref<2000xi8> to memref<10x10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %9 : memref<10xf32>
      %50 = "mhlo.broadcast_in_dim"(%49) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<10x10xf32>
      memref.tensor_store %50, %10 : memref<10x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_6 = arith.constant 0 : index
    %11 = memref.view %arg3[%c0_6][] : memref<2000xi8> to memref<500xf32>
    %c0_7 = arith.constant 0 : index
    %12 = memref.view %arg21[%c0_7][] : memref<20000xi8> to memref<10x500xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %11 : memref<500xf32>
      %50 = "mhlo.broadcast_in_dim"(%49) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<500xf32>) -> tensor<10x500xf32>
      memref.tensor_store %50, %12 : memref<10x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_8 = arith.constant 0 : index
    %13 = memref.view %arg0[%c0_8][] : memref<31360xi8> to memref<10x784xf32>
    %c0_9 = arith.constant 0 : index
    %14 = memref.view %arg2[%c0_9][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_10 = arith.constant 0 : index
    %15 = memref.view %arg21[%c0_10][] : memref<20000xi8> to memref<10x500xf32>
    "lmhlo_gpu.gemm_bias"(%13, %14, %12, %15) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>} : (memref<10x784xf32>, memref<784x500xf32>, memref<10x500xf32>, memref<10x500xf32>) -> ()
    %c0_11 = arith.constant 0 : index
    %16 = memref.view %arg20[%c0_11][] : memref<20000xi8> to memref<10x500xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %15 : memref<10x500xf32>
      %50 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %51 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10x500xf32>
      %52 = mhlo.maximum %49, %51 : tensor<10x500xf32>
      memref.tensor_store %52, %16 : memref<10x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_12 = arith.constant 0 : index
    %17 = memref.view %arg4[%c0_12][] : memref<20000xi8> to memref<500x10xf32>
    %c0_13 = arith.constant 0 : index
    %18 = memref.view %arg24[%c0_13][] : memref<2000xi8> to memref<10x10xf32>
    "lmhlo_gpu.gemm_bias"(%16, %17, %10, %18) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>} : (memref<10x500xf32>, memref<500x10xf32>, memref<10x10xf32>, memref<10x10xf32>) -> ()
    %c0_14 = arith.constant 0 : index
    %19 = memref.view %arg27[%c0_14][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %18 : memref<10x10xf32>
      %50 = bufferization.to_tensor %4 : memref<f32>
      %51 = mhlo.reduce(%49 init: %50) across dimensions = [1] : (tensor<10x10xf32>, tensor<f32>) -> tensor<10xf32>
       reducer(%arg35: tensor<f32>, %arg36: tensor<f32>)  {
        %52 = mhlo.maximum %arg35, %arg36 : tensor<f32>
        "mhlo.return"(%52) : (tensor<f32>) -> ()
      }
      memref.tensor_store %51, %19 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_15 = arith.constant 0 : index
    %20 = memref.view %arg26[%c0_15][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %18 : memref<10x10xf32>
      %50 = bufferization.to_tensor %19 : memref<10xf32>
      %51 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<10x10xf32>
      %52 = mhlo.subtract %49, %51 : tensor<10x10xf32>
      %53 = mhlo.exponential %52 : tensor<10x10xf32>
      %54 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %55 = mhlo.reduce(%53 init: %54) across dimensions = [1] : (tensor<10x10xf32>, tensor<f32>) -> tensor<10xf32>
       reducer(%arg35: tensor<f32>, %arg36: tensor<f32>)  {
        %56 = mhlo.add %arg35, %arg36 : tensor<f32>
        "mhlo.return"(%56) : (tensor<f32>) -> ()
      }
      memref.tensor_store %55, %20 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_16 = arith.constant 0 : index
    %21 = memref.view %arg1[%c0_16][] : memref<400xi8> to memref<10x10xf32>
    %c0_17 = arith.constant 0 : index
    %22 = memref.view %arg24[%c0_17][] : memref<2000xi8> to memref<10x10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %21 : memref<10x10xf32>
      %50 = bufferization.to_tensor %20 : memref<10xf32>
      %51 = bufferization.to_tensor %18 : memref<10x10xf32>
      %52 = bufferization.to_tensor %19 : memref<10xf32>
      %53 = mhlo.constant dense<1.000000e-01> : tensor<f32>
      %54 = "mhlo.broadcast_in_dim"(%53) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10x10xf32>
      %55 = "mhlo.broadcast_in_dim"(%52) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<10x10xf32>
      %56 = mhlo.subtract %51, %55 : tensor<10x10xf32>
      %57 = mhlo.exponential %56 : tensor<10x10xf32>
      %58 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<10x10xf32>
      %59 = mhlo.divide %57, %58 : tensor<10x10xf32>
      %60 = mhlo.subtract %59, %49 : tensor<10x10xf32>
      %61 = mhlo.multiply %54, %60 : tensor<10x10xf32>
      memref.tensor_store %61, %22 : memref<10x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_18 = arith.constant 0 : index
    %23 = memref.view %arg19[%c0_18][] : memref<20000xi8> to memref<500x10xf32>
    "lmhlo_gpu.gemm"(%16, %22, %23) {algorithm = 2 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [0], rhs_contracting_dimensions = [0]>} : (memref<10x500xf32>, memref<10x10xf32>, memref<500x10xf32>) -> ()
    %c0_19 = arith.constant 0 : index
    %24 = memref.view %arg27[%c0_19][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %22 : memref<10x10xf32>
      %50 = bufferization.to_tensor %5 : memref<f32>
      %51 = mhlo.reduce(%49 init: %50) across dimensions = [0] : (tensor<10x10xf32>, tensor<f32>) -> tensor<10xf32>
       reducer(%arg35: tensor<f32>, %arg36: tensor<f32>)  {
        %52 = mhlo.add %arg35, %arg36 : tensor<f32>
        "mhlo.return"(%52) : (tensor<f32>) -> ()
      }
      memref.tensor_store %51, %24 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_20 = arith.constant 0 : index
    %25 = memref.view %arg20[%c0_20][] : memref<20000xi8> to memref<10x500xf32>
    "lmhlo_gpu.gemm"(%22, %17, %25) {algorithm = 4 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [1]>} : (memref<10x10xf32>, memref<500x10xf32>, memref<10x500xf32>) -> ()
    %c0_21 = arith.constant 0 : index
    %26 = memref.view %arg17[%c0_21][] : memref<1568000xi8> to memref<10x500xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %25 : memref<10x500xf32>
      %50 = bufferization.to_tensor %15 : memref<10x500xf32>
      %51 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %52 = "mhlo.broadcast_in_dim"(%51) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10x500xf32>
      %53 = mhlo.maximum %50, %52 : tensor<10x500xf32>
      %54 = "mhlo.compare"(%53, %52) {comparison_direction = #mhlo<"comparison_direction GT">} : (tensor<10x500xf32>, tensor<10x500xf32>) -> tensor<10x500xi1>
      %55 = "mhlo.select"(%54, %49, %52) : (tensor<10x500xi1>, tensor<10x500xf32>, tensor<10x500xf32>) -> tensor<10x500xf32>
      memref.tensor_store %55, %26 : memref<10x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_22 = arith.constant 0 : index
    %27 = memref.view %arg24[%c0_22][] : memref<2000xi8> to memref<500xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %26 : memref<10x500xf32>
      %50 = bufferization.to_tensor %5 : memref<f32>
      %51 = mhlo.reduce(%49 init: %50) across dimensions = [0] : (tensor<10x500xf32>, tensor<f32>) -> tensor<500xf32>
       reducer(%arg35: tensor<f32>, %arg36: tensor<f32>)  {
        %52 = mhlo.add %arg35, %arg36 : tensor<f32>
        "mhlo.return"(%52) : (tensor<f32>) -> ()
      }
      memref.tensor_store %51, %27 : memref<500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_23 = arith.constant 0 : index
    %28 = memref.view %arg10[%c0_23][] : memref<2000xi8> to memref<500xf32>
    %c0_24 = arith.constant 0 : index
    %29 = memref.view %arg11[%c0_24][] : memref<2000xi8> to memref<500xf32>
    %c0_25 = arith.constant 0 : index
    %30 = memref.view %arg12[%c0_25][] : memref<20000xi8> to memref<500x10xf32>
    %c0_26 = arith.constant 0 : index
    %31 = memref.view %arg13[%c0_26][] : memref<20000xi8> to memref<500x10xf32>
    %c0_27 = arith.constant 0 : index
    %32 = memref.view %arg14[%c0_27][] : memref<40xi8> to memref<10xf32>
    %c0_28 = arith.constant 0 : index
    %33 = memref.view %arg15[%c0_28][] : memref<40xi8> to memref<10xf32>
    %c0_29 = arith.constant 0 : index
    %34 = memref.view %arg22[%c0_29][] : memref<2000xi8> to memref<500xf32>
    %c0_30 = arith.constant 0 : index
    %35 = memref.view %arg23[%c0_30][] : memref<2000xi8> to memref<500xf32>
    %c0_31 = arith.constant 0 : index
    %36 = memref.view %arg24[%c0_31][] : memref<2000xi8> to memref<500xf32>
    %c0_32 = arith.constant 0 : index
    %37 = memref.view %arg19[%c0_32][] : memref<20000xi8> to memref<5000xf32>
    %c0_33 = arith.constant 0 : index
    %38 = memref.view %arg20[%c0_33][] : memref<20000xi8> to memref<5000xf32>
    %c0_34 = arith.constant 0 : index
    %39 = memref.view %arg21[%c0_34][] : memref<20000xi8> to memref<5000xf32>
    %c0_35 = arith.constant 0 : index
    %40 = memref.view %arg25[%c0_35][] : memref<40xi8> to memref<10xf32>
    %c0_36 = arith.constant 0 : index
    %41 = memref.view %arg26[%c0_36][] : memref<40xi8> to memref<10xf32>
    %c0_37 = arith.constant 0 : index
    %42 = memref.view %arg27[%c0_37][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %11 : memref<500xf32>
      %50 = bufferization.to_tensor %8 : memref<f32>
      %51 = bufferization.to_tensor %28 : memref<500xf32>
      %52 = bufferization.to_tensor %27 : memref<500xf32>
      %53 = bufferization.to_tensor %29 : memref<500xf32>
      %54 = bufferization.to_tensor %17 : memref<500x10xf32>
      %55 = bufferization.to_tensor %8 : memref<f32>
      %56 = bufferization.to_tensor %30 : memref<500x10xf32>
      %57 = bufferization.to_tensor %23 : memref<500x10xf32>
      %58 = bufferization.to_tensor %31 : memref<500x10xf32>
      %59 = bufferization.to_tensor %9 : memref<10xf32>
      %60 = bufferization.to_tensor %8 : memref<f32>
      %61 = bufferization.to_tensor %32 : memref<10xf32>
      %62 = bufferization.to_tensor %24 : memref<10xf32>
      %63 = bufferization.to_tensor %33 : memref<10xf32>
      %64 = mhlo.subtract %52, %51 : tensor<500xf32>
      %65 = mhlo.constant dense<0.100000024> : tensor<f32>
      %66 = "mhlo.broadcast_in_dim"(%65) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      %67 = mhlo.multiply %64, %66 : tensor<500xf32>
      %68 = mhlo.add %51, %67 : tensor<500xf32>
      %69 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      %70 = mhlo.multiply %68, %69 : tensor<500xf32>
      %71 = mhlo.multiply %52, %52 : tensor<500xf32>
      %72 = mhlo.subtract %71, %53 : tensor<500xf32>
      %73 = mhlo.constant dense<9.99987125E-4> : tensor<f32>
      %74 = "mhlo.broadcast_in_dim"(%73) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      %75 = mhlo.multiply %72, %74 : tensor<500xf32>
      %76 = mhlo.add %53, %75 : tensor<500xf32>
      %77 = mhlo.sqrt %76 : tensor<500xf32>
      %78 = mhlo.constant dense<9.99999993E-9> : tensor<f32>
      %79 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500xf32>
      %80 = mhlo.add %77, %79 : tensor<500xf32>
      %81 = mhlo.divide %70, %80 : tensor<500xf32>
      %82 = mhlo.subtract %49, %81 : tensor<500xf32>
      %83 = "mhlo.reshape"(%82) : (tensor<500xf32>) -> tensor<500xf32>
      %84 = mhlo.subtract %57, %56 : tensor<500x10xf32>
      %85 = "mhlo.broadcast_in_dim"(%65) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      %86 = mhlo.multiply %84, %85 : tensor<500x10xf32>
      %87 = mhlo.add %56, %86 : tensor<500x10xf32>
      %88 = "mhlo.broadcast_in_dim"(%55) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      %89 = mhlo.multiply %87, %88 : tensor<500x10xf32>
      %90 = mhlo.multiply %57, %57 : tensor<500x10xf32>
      %91 = mhlo.subtract %90, %58 : tensor<500x10xf32>
      %92 = "mhlo.broadcast_in_dim"(%73) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      %93 = mhlo.multiply %91, %92 : tensor<500x10xf32>
      %94 = mhlo.add %58, %93 : tensor<500x10xf32>
      %95 = mhlo.sqrt %94 : tensor<500x10xf32>
      %96 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<500x10xf32>
      %97 = mhlo.add %95, %96 : tensor<500x10xf32>
      %98 = mhlo.divide %89, %97 : tensor<500x10xf32>
      %99 = mhlo.subtract %54, %98 : tensor<500x10xf32>
      %100 = "mhlo.reshape"(%99) : (tensor<500x10xf32>) -> tensor<5000xf32>
      %101 = mhlo.subtract %62, %61 : tensor<10xf32>
      %102 = "mhlo.broadcast_in_dim"(%65) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %103 = mhlo.multiply %101, %102 : tensor<10xf32>
      %104 = mhlo.add %61, %103 : tensor<10xf32>
      %105 = "mhlo.broadcast_in_dim"(%60) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %106 = mhlo.multiply %104, %105 : tensor<10xf32>
      %107 = mhlo.multiply %62, %62 : tensor<10xf32>
      %108 = mhlo.subtract %107, %63 : tensor<10xf32>
      %109 = "mhlo.broadcast_in_dim"(%73) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %110 = mhlo.multiply %108, %109 : tensor<10xf32>
      %111 = mhlo.add %63, %110 : tensor<10xf32>
      %112 = mhlo.sqrt %111 : tensor<10xf32>
      %113 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %114 = mhlo.add %112, %113 : tensor<10xf32>
      %115 = mhlo.divide %106, %114 : tensor<10xf32>
      %116 = mhlo.subtract %59, %115 : tensor<10xf32>
      %117 = "mhlo.reshape"(%116) : (tensor<10xf32>) -> tensor<10xf32>
      %118 = "mhlo.concatenate"(%83, %100, %117) {dimension = 0 : i64} : (tensor<500xf32>, tensor<5000xf32>, tensor<10xf32>) -> tensor<5510xf32>
      %119 = "mhlo.slice"(%118) {limit_indices = dense<500> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<500xf32>
      %120 = "mhlo.reshape"(%68) : (tensor<500xf32>) -> tensor<500xf32>
      %121 = "mhlo.reshape"(%87) : (tensor<500x10xf32>) -> tensor<5000xf32>
      %122 = "mhlo.reshape"(%104) : (tensor<10xf32>) -> tensor<10xf32>
      %123 = "mhlo.concatenate"(%120, %121, %122) {dimension = 0 : i64} : (tensor<500xf32>, tensor<5000xf32>, tensor<10xf32>) -> tensor<5510xf32>
      %124 = "mhlo.slice"(%123) {limit_indices = dense<500> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<500xf32>
      %125 = "mhlo.reshape"(%76) : (tensor<500xf32>) -> tensor<500xf32>
      %126 = "mhlo.reshape"(%94) : (tensor<500x10xf32>) -> tensor<5000xf32>
      %127 = "mhlo.reshape"(%111) : (tensor<10xf32>) -> tensor<10xf32>
      %128 = "mhlo.concatenate"(%125, %126, %127) {dimension = 0 : i64} : (tensor<500xf32>, tensor<5000xf32>, tensor<10xf32>) -> tensor<5510xf32>
      %129 = "mhlo.slice"(%128) {limit_indices = dense<500> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<500xf32>
      %130 = "mhlo.slice"(%118) {limit_indices = dense<5500> : tensor<1xi64>, start_indices = dense<500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<5000xf32>
      %131 = "mhlo.slice"(%123) {limit_indices = dense<5500> : tensor<1xi64>, start_indices = dense<500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<5000xf32>
      %132 = "mhlo.slice"(%128) {limit_indices = dense<5500> : tensor<1xi64>, start_indices = dense<500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<5000xf32>
      %133 = "mhlo.slice"(%118) {limit_indices = dense<5510> : tensor<1xi64>, start_indices = dense<5500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<10xf32>
      %134 = "mhlo.slice"(%123) {limit_indices = dense<5510> : tensor<1xi64>, start_indices = dense<5500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<10xf32>
      %135 = "mhlo.slice"(%128) {limit_indices = dense<5510> : tensor<1xi64>, start_indices = dense<5500> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<5510xf32>) -> tensor<10xf32>
      memref.tensor_store %119, %34 : memref<500xf32>
      memref.tensor_store %124, %35 : memref<500xf32>
      memref.tensor_store %129, %36 : memref<500xf32>
      memref.tensor_store %130, %37 : memref<5000xf32>
      memref.tensor_store %131, %38 : memref<5000xf32>
      memref.tensor_store %132, %39 : memref<5000xf32>
      memref.tensor_store %133, %40 : memref<10xf32>
      memref.tensor_store %134, %41 : memref<10xf32>
      memref.tensor_store %135, %42 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_38 = arith.constant 0 : index
    %43 = memref.view %arg18[%c0_38][] : memref<1568000xi8> to memref<784x500xf32>
    "lmhlo_gpu.gemm"(%13, %26, %43) {algorithm = 12 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [0], rhs_contracting_dimensions = [0]>} : (memref<10x784xf32>, memref<10x500xf32>, memref<784x500xf32>) -> ()
    %c0_39 = arith.constant 0 : index
    %44 = memref.view %arg8[%c0_39][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_40 = arith.constant 0 : index
    %45 = memref.view %arg9[%c0_40][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_41 = arith.constant 0 : index
    %46 = memref.view %arg16[%c0_41][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_42 = arith.constant 0 : index
    %47 = memref.view %arg17[%c0_42][] : memref<1568000xi8> to memref<784x500xf32>
    %c0_43 = arith.constant 0 : index
    %48 = memref.view %arg18[%c0_43][] : memref<1568000xi8> to memref<784x500xf32>
    "lmhlo.fusion"() ({
      %49 = bufferization.to_tensor %14 : memref<784x500xf32>
      %50 = bufferization.to_tensor %8 : memref<f32>
      %51 = bufferization.to_tensor %44 : memref<784x500xf32>
      %52 = bufferization.to_tensor %43 : memref<784x500xf32>
      %53 = bufferization.to_tensor %45 : memref<784x500xf32>
      %54 = mhlo.subtract %52, %51 : tensor<784x500xf32>
      %55 = mhlo.constant dense<0.100000024> : tensor<f32>
      %56 = "mhlo.broadcast_in_dim"(%55) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      %57 = mhlo.multiply %54, %56 : tensor<784x500xf32>
      %58 = mhlo.add %51, %57 : tensor<784x500xf32>
      %59 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      %60 = mhlo.multiply %58, %59 : tensor<784x500xf32>
      %61 = mhlo.multiply %52, %52 : tensor<784x500xf32>
      %62 = mhlo.subtract %61, %53 : tensor<784x500xf32>
      %63 = mhlo.constant dense<9.99987125E-4> : tensor<f32>
      %64 = "mhlo.broadcast_in_dim"(%63) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      %65 = mhlo.multiply %62, %64 : tensor<784x500xf32>
      %66 = mhlo.add %53, %65 : tensor<784x500xf32>
      %67 = mhlo.sqrt %66 : tensor<784x500xf32>
      %68 = mhlo.constant dense<9.99999993E-9> : tensor<f32>
      %69 = "mhlo.broadcast_in_dim"(%68) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x500xf32>
      %70 = mhlo.add %67, %69 : tensor<784x500xf32>
      %71 = mhlo.divide %60, %70 : tensor<784x500xf32>
      %72 = mhlo.subtract %49, %71 : tensor<784x500xf32>
      memref.tensor_store %72, %46 : memref<784x500xf32>
      memref.tensor_store %58, %47 : memref<784x500xf32>
      memref.tensor_store %66, %48 : memref<784x500xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}