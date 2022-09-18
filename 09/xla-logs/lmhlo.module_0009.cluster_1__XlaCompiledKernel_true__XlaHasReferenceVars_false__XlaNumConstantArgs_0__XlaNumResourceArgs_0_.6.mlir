module attributes {hlo.unique_id = 9 : i32, mhlo.unique_id = 9 : i64} {
  memref.global "private" constant @buffer_for_constant_1 : memref<i64> = dense<87654321> {lmhlo.alloc = 2 : index}
  memref.global "private" constant @buffer_for_constant_2 : memref<i64> = dense<42> {lmhlo.alloc = 3 : index}
  func.func @cluster_1__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.6(%arg0: memref<8xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg1: memref<8xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg2: memref<8xi8> {lmhlo.constant_name = "buffer_for_constant_1"}, %arg3: memref<8xi8> {lmhlo.constant_name = "buffer_for_constant_2"}) attributes {result_xla_shape = "(s64[], s64[])"} {
    %0 = memref.get_global @buffer_for_constant_2 : memref<i64>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg1[%c0][] : memref<8xi8> to memref<i64>
    "lmhlo.fusion"() ({
      %4 = bufferization.to_tensor %0 : memref<i64>
      %5 = "mhlo.copy"(%4) : (tensor<i64>) -> tensor<i64>
      memref.tensor_store %5, %1 : memref<i64>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %2 = memref.get_global @buffer_for_constant_1 : memref<i64>
    %c0_0 = arith.constant 0 : index
    %3 = memref.view %arg0[%c0_0][] : memref<8xi8> to memref<i64>
    "lmhlo.fusion"() ({
      %4 = bufferization.to_tensor %2 : memref<i64>
      %5 = "mhlo.copy"(%4) : (tensor<i64>) -> tensor<i64>
      memref.tensor_store %5, %3 : memref<i64>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}