module attributes {hlo.unique_id = 137 : i32, mhlo.unique_id = 137 : i64} {
  func.func @cluster_4__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_2_.14(%arg0: memref<4xi8> {lmhlo.params = 0 : index}, %arg1: memref<4xi8> {lmhlo.params = 1 : index}, %arg2: memref<4xi8> {lmhlo.params = 2 : index}, %arg3: memref<4xi8> {lmhlo.params = 3 : index}, %arg4: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg5: memref<4xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg6: memref<16xi8>) attributes {result_xla_shape = "(f32[], f32[])"} {
    %c0 = arith.constant 0 : index
    %0 = memref.view %arg2[%c0][] : memref<4xi8> to memref<f32>
    %c0_0 = arith.constant 0 : index
    %1 = memref.view %arg0[%c0_0][] : memref<4xi8> to memref<f32>
    %c0_1 = arith.constant 0 : index
    %2 = memref.view %arg3[%c0_1][] : memref<4xi8> to memref<f32>
    %c0_2 = arith.constant 0 : index
    %3 = memref.view %arg1[%c0_2][] : memref<4xi8> to memref<f32>
    %c0_3 = arith.constant 0 : index
    %4 = memref.view %arg4[%c0_3][] : memref<4xi8> to memref<1xf32>
    %c0_4 = arith.constant 0 : index
    %5 = memref.view %arg5[%c0_4][] : memref<4xi8> to memref<1xf32>
    "lmhlo.fusion"() ({
      %6 = bufferization.to_tensor %0 : memref<f32>
      %7 = bufferization.to_tensor %1 : memref<f32>
      %8 = bufferization.to_tensor %2 : memref<f32>
      %9 = bufferization.to_tensor %3 : memref<f32>
      %10 = mhlo.multiply %6, %7 : tensor<f32>
      %11 = "mhlo.reshape"(%10) : (tensor<f32>) -> tensor<1xf32>
      %12 = mhlo.multiply %8, %9 : tensor<f32>
      %13 = "mhlo.reshape"(%12) : (tensor<f32>) -> tensor<1xf32>
      %14 = "mhlo.concatenate"(%11, %13) {dimension = 0 : i64} : (tensor<1xf32>, tensor<1xf32>) -> tensor<2xf32>
      %15 = "mhlo.slice"(%14) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      %16 = "mhlo.slice"(%14) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      memref.tensor_store %15, %4 : memref<1xf32>
      memref.tensor_store %16, %5 : memref<1xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}