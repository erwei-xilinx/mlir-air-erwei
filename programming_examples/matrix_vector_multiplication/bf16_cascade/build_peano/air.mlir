#map = affine_map<()[s0] -> (s0 * 8)>
#map1 = affine_map<()[s0] -> (s0 * 128)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<()[s0] -> (s0)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<()[s0, s1] -> (s0 + s1)>
"builtin.module"() ({
  "air.channel"() <{channel_type = "cascade", size = [2, 3], sym_name = "chan_cascade"}> : () -> ()
  "func.func"() <{function_type = (memref<256x512xbf16>, memref<512xbf16>, memref<256xbf16>) -> (), sym_name = "matvec_cascade_bf16"}> ({
  ^bb0(%arg0: memref<256x512xbf16>, %arg1: memref<512xbf16>, %arg2: memref<256xbf16>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "air.launch"(%0, %1, %arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 2, 3>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: memref<256x512xbf16>, %arg8: memref<512xbf16>, %arg9: memref<256xbf16>):
      "air.segment"(%arg3, %arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 0, 0, 4>, sym_name = "matvec_cascade_0"}> ({
      ^bb0(%arg10: index, %arg11: memref<256x512xbf16>, %arg12: memref<512xbf16>, %arg13: memref<256xbf16>):
        %2 = "affine.apply"(%arg10) <{map = #map}> : (index) -> index
        %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4x512xbf16, 1 : i32>
        %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4xbf16, 1 : i32>
        %5 = "arith.constant"() <{value = 0 : index}> : () -> index
        %6 = "arith.constant"() <{value = 0 : index}> : () -> index
        %7 = "arith.constant"() <{value = 2 : index}> : () -> index
        %8 = "arith.constant"() <{value = 4 : index}> : () -> index
        %9 = "arith.constant"() <{value = 512 : index}> : () -> index
        %10 = "arith.constant"() <{value = 2048 : index}> : () -> index
        %11 = "arith.constant"() <{value = 512 : index}> : () -> index
        %12 = "arith.constant"() <{value = 1 : index}> : () -> index
        "air.dma_memcpy_nd"(%3, %arg11, %5, %2, %6, %7, %8, %9, %10, %11, %12) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 1, 3, 3, 3>}> : (memref<2x4x512xbf16, 1 : i32>, memref<256x512xbf16>, index, index, index, index, index, index, index, index, index) -> ()
        %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x128xbf16, 2 : i32>
        %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xbf16, 2 : i32>
        %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xbf16, 2 : i32>
        %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32, 2 : i32>
        %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32, 2 : i32>
        %18 = "arith.constant"() <{value = 2 : index}> : () -> index
        %19 = "arith.constant"() <{value = 4 : index}> : () -> index
        "air.herd"(%18, %19, %13, %14, %15, %16, %17, %3, %arg12, %4) <{operandSegmentSizes = array<i32: 0, 2, 8>, sym_name = "herd_0"}> ({
        ^bb0(%arg14: index, %arg15: index, %arg16: index, %arg17: index, %arg18: memref<1x128xbf16, 2 : i32>, %arg19: memref<128xbf16, 2 : i32>, %arg20: memref<4xbf16, 2 : i32>, %arg21: memref<16xf32, 2 : i32>, %arg22: memref<16xf32, 2 : i32>, %arg23: memref<2x4x512xbf16, 1 : i32>, %arg24: memref<512xbf16>, %arg25: memref<2x4xbf16, 1 : i32>):
          %28 = "arith.constant"() <{value = 0 : index}> : () -> index
          %29 = "arith.constant"() <{value = 1 : index}> : () -> index
          %30 = "arith.constant"() <{value = 3 : index}> : () -> index
          %31 = "arith.constant"() <{value = 1 : i32}> : () -> i32
          %32 = "arith.constant"() <{value = 128 : i32}> : () -> i32
          %33 = "affine.apply"(%arg15) <{map = #map1}> : (index) -> index
          %34 = "arith.constant"() <{value = 128 : index}> : () -> index
          %35 = "arith.constant"() <{value = 1 : index}> : () -> index
          "air.dma_memcpy_nd"(%arg19, %arg24, %33, %34, %35) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 1, 1, 1, 1>}> : (memref<128xbf16, 2 : i32>, memref<512xbf16>, index, index, index) -> ()
          %36 = "arith.cmpi"(%arg15, %28) <{predicate = 0 : i64}> : (index, index) -> i1
          "scf.if"(%36) ({
            %124 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
            %125 = "vector.broadcast"(%124) : (bf16) -> vector<32xbf16>
            %126 = "arith.constant"() <{value = 0 : index}> : () -> index
            %127 = "arith.constant"() <{value = 4 : index}> : () -> index
            %128 = "arith.constant"() <{value = 32 : index}> : () -> index
            "scf.for"(%126, %127, %128) ({
            ^bb0(%arg33: index):
              %129 = "memref.subview"(%arg20, %arg33) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (memref<4xbf16, 2 : i32>, index) -> memref<32xbf16, strided<[1], offset: ?>, 2 : i32>
              "vector.transfer_write"(%125, %129, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<32xbf16>, memref<32xbf16, strided<[1], offset: ?>, 2 : i32>, index) -> ()
              "scf.yield"() : () -> ()
            }) : (index, index, index) -> ()
            "scf.yield"() : () -> ()
          }, {
          }) : (i1) -> ()
          %37 = "arith.constant"() <{value = 0 : index}> : () -> index
          %38 = "arith.constant"() <{value = 4 : index}> : () -> index
          %39 = "arith.constant"() <{value = 1 : index}> : () -> index
          "scf.for"(%37, %38, %39) ({
          ^bb0(%arg26: index):
            %48 = "affine.apply"(%arg26) <{map = #map3}> : (index) -> index
            %49 = "arith.constant"() <{value = 1 : index}> : () -> index
            %50 = "arith.constant"() <{value = 1 : index}> : () -> index
            %51 = "arith.constant"() <{value = 128 : index}> : () -> index
            %52 = "arith.constant"() <{value = 2048 : index}> : () -> index
            %53 = "arith.constant"() <{value = 512 : index}> : () -> index
            %54 = "arith.constant"() <{value = 1 : index}> : () -> index
            "air.dma_memcpy_nd"(%arg18, %arg23, %arg14, %48, %33, %49, %50, %51, %52, %53, %54) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 1, 3, 3, 3>}> : (memref<1x128xbf16, 2 : i32>, memref<2x4x512xbf16, 1 : i32>, index, index, index, index, index, index, index, index, index) -> ()
            %55 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
            %56 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
            %57 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xf32, 2 : i32>
            %58 = "arith.cmpi"(%arg15, %30) <{predicate = 0 : i64}> : (index, index) -> i1
            "scf.if"(%58) ({
              %105 = "arith.constant"() <{value = 0 : index}> : () -> index
              %106 = "arith.constant"() <{value = 1 : index}> : () -> index
              %107 = "arith.constant"() <{value = 1 : index}> : () -> index
              "scf.for"(%105, %106, %107) ({
              ^bb0(%arg31: index):
                %109 = "vector.broadcast"(%56) : (f32) -> vector<64xf32>
                "vector.transfer_write"(%109, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                %110 = "arith.constant"() <{value = 0 : index}> : () -> index
                %111 = "arith.constant"() <{value = 128 : index}> : () -> index
                %112 = "arith.constant"() <{value = 64 : index}> : () -> index
                "scf.for"(%110, %111, %112) ({
                ^bb0(%arg32: index):
                  %116 = "memref.subview"(%arg18, %arg31, %arg32) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 1, 1>}> : (memref<1x128xbf16, 2 : i32>, index, index) -> memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>
                  %117 = "memref.subview"(%arg19, %arg32) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 64>, static_strides = array<i64: 1>}> : (memref<128xbf16, 2 : i32>, index) -> memref<64xbf16, strided<[1], offset: ?>, 2 : i32>
                  %118 = "vector.transfer_read"(%116, %28, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>, index, index, bf16) -> vector<64xbf16>
                  %119 = "vector.transfer_read"(%117, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xbf16, strided<[1], offset: ?>, 2 : i32>, index, bf16) -> vector<64xbf16>
                  %120 = "arith.extf"(%118) : (vector<64xbf16>) -> vector<64xf32>
                  %121 = "arith.extf"(%119) : (vector<64xbf16>) -> vector<64xf32>
                  %122 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                  %123 = "vector.fma"(%120, %121, %122) : (vector<64xf32>, vector<64xf32>, vector<64xf32>) -> vector<64xf32>
                  "vector.transfer_write"(%123, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                  "scf.yield"() : () -> ()
                }) : (index, index, index) -> ()
                %113 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                %114 = "vector.reduction"(%113) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>) -> f32
                %115 = "memref.subview"(%arg21, %arg31) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<16xf32, 2 : i32>, index) -> memref<1xf32, strided<[1], offset: ?>, 2 : i32>
                "memref.store"(%114, %115, %28) : (f32, memref<1xf32, strided<[1], offset: ?>, 2 : i32>, index) -> ()
                "scf.yield"() : () -> ()
              }) : (index, index, index) -> ()
              %108 = "arith.subi"(%arg15, %29) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
              "air.channel.put"(%arg14, %108, %arg21) <{chan_name = @chan_cascade, operandSegmentSizes = array<i32: 0, 2, 1, 0, 0, 0>}> : (index, index, memref<16xf32, 2 : i32>) -> ()
              "scf.yield"() : () -> ()
            }, {
              %59 = "arith.cmpi"(%arg15, %28) <{predicate = 0 : i64}> : (index, index) -> i1
              "scf.if"(%59) ({
                "air.channel.get"(%arg14, %arg15, %arg22) <{chan_name = @chan_cascade, operandSegmentSizes = array<i32: 0, 2, 1, 0, 0, 0>}> : (index, index, memref<16xf32, 2 : i32>) -> ()
                %82 = "arith.constant"() <{value = 0 : index}> : () -> index
                %83 = "arith.constant"() <{value = 1 : index}> : () -> index
                %84 = "arith.constant"() <{value = 1 : index}> : () -> index
                "scf.for"(%82, %83, %84) ({
                ^bb0(%arg29: index):
                  %85 = "vector.broadcast"(%56) : (f32) -> vector<64xf32>
                  "vector.transfer_write"(%85, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                  %86 = "arith.constant"() <{value = 0 : index}> : () -> index
                  %87 = "arith.constant"() <{value = 128 : index}> : () -> index
                  %88 = "arith.constant"() <{value = 64 : index}> : () -> index
                  "scf.for"(%86, %87, %88) ({
                  ^bb0(%arg30: index):
                    %97 = "memref.subview"(%arg18, %arg29, %arg30) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 1, 1>}> : (memref<1x128xbf16, 2 : i32>, index, index) -> memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>
                    %98 = "memref.subview"(%arg19, %arg30) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 64>, static_strides = array<i64: 1>}> : (memref<128xbf16, 2 : i32>, index) -> memref<64xbf16, strided<[1], offset: ?>, 2 : i32>
                    %99 = "vector.transfer_read"(%97, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>, index, bf16) -> vector<64xbf16>
                    %100 = "vector.transfer_read"(%98, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xbf16, strided<[1], offset: ?>, 2 : i32>, index, bf16) -> vector<64xbf16>
                    %101 = "arith.extf"(%99) : (vector<64xbf16>) -> vector<64xf32>
                    %102 = "arith.extf"(%100) : (vector<64xbf16>) -> vector<64xf32>
                    %103 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                    %104 = "vector.fma"(%101, %102, %103) : (vector<64xf32>, vector<64xf32>, vector<64xf32>) -> vector<64xf32>
                    "vector.transfer_write"(%104, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                    "scf.yield"() : () -> ()
                  }) : (index, index, index) -> ()
                  %89 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                  %90 = "vector.reduction"(%89) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>) -> f32
                  %91 = "memref.subview"(%arg22, %arg29) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<16xf32, 2 : i32>, index) -> memref<1xf32, strided<[1], offset: ?>, 2 : i32>
                  %92 = "memref.load"(%91, %28) : (memref<1xf32, strided<[1], offset: ?>, 2 : i32>, index) -> f32
                  %93 = "arith.addf"(%92, %90) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                  %94 = "arith.truncf"(%93) : (f32) -> bf16
                  %95 = "affine.apply"(%48, %arg29) <{map = #map5}> : (index, index) -> index
                  %96 = "memref.subview"(%arg20, %95) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<4xbf16, 2 : i32>, index) -> memref<1xbf16, strided<[1], offset: ?>, 2 : i32>
                  "memref.store"(%94, %96, %28) : (bf16, memref<1xbf16, strided<[1], offset: ?>, 2 : i32>, index) -> ()
                  "scf.yield"() : () -> ()
                }) : (index, index, index) -> ()
                "scf.yield"() : () -> ()
              }, {
                "air.channel.get"(%arg14, %arg15, %arg22) <{chan_name = @chan_cascade, operandSegmentSizes = array<i32: 0, 2, 1, 0, 0, 0>}> : (index, index, memref<16xf32, 2 : i32>) -> ()
                %60 = "arith.constant"() <{value = 0 : index}> : () -> index
                %61 = "arith.constant"() <{value = 1 : index}> : () -> index
                %62 = "arith.constant"() <{value = 1 : index}> : () -> index
                "scf.for"(%60, %61, %62) ({
                ^bb0(%arg27: index):
                  %64 = "vector.broadcast"(%56) : (f32) -> vector<64xf32>
                  "vector.transfer_write"(%64, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                  %65 = "arith.constant"() <{value = 0 : index}> : () -> index
                  %66 = "arith.constant"() <{value = 128 : index}> : () -> index
                  %67 = "arith.constant"() <{value = 64 : index}> : () -> index
                  "scf.for"(%65, %66, %67) ({
                  ^bb0(%arg28: index):
                    %74 = "memref.subview"(%arg18, %arg27, %arg28) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 1, 1>}> : (memref<1x128xbf16, 2 : i32>, index, index) -> memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>
                    %75 = "memref.subview"(%arg19, %arg28) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 64>, static_strides = array<i64: 1>}> : (memref<128xbf16, 2 : i32>, index) -> memref<64xbf16, strided<[1], offset: ?>, 2 : i32>
                    %76 = "vector.transfer_read"(%74, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<1x64xbf16, strided<[128, 1], offset: ?>, 2 : i32>, index, bf16) -> vector<64xbf16>
                    %77 = "vector.transfer_read"(%75, %28, %55) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xbf16, strided<[1], offset: ?>, 2 : i32>, index, bf16) -> vector<64xbf16>
                    %78 = "arith.extf"(%76) : (vector<64xbf16>) -> vector<64xf32>
                    %79 = "arith.extf"(%77) : (vector<64xbf16>) -> vector<64xf32>
                    %80 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                    %81 = "vector.fma"(%78, %79, %80) : (vector<64xf32>, vector<64xf32>, vector<64xf32>) -> vector<64xf32>
                    "vector.transfer_write"(%81, %57, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<64xf32>, memref<64xf32, 2 : i32>, index) -> ()
                    "scf.yield"() : () -> ()
                  }) : (index, index, index) -> ()
                  %68 = "vector.transfer_read"(%57, %28, %56) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<64xf32, 2 : i32>, index, f32) -> vector<64xf32>
                  %69 = "vector.reduction"(%68) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>) -> f32
                  %70 = "memref.subview"(%arg22, %arg27) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<16xf32, 2 : i32>, index) -> memref<1xf32, strided<[1], offset: ?>, 2 : i32>
                  %71 = "memref.load"(%70, %28) : (memref<1xf32, strided<[1], offset: ?>, 2 : i32>, index) -> f32
                  %72 = "arith.addf"(%71, %69) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                  %73 = "memref.subview"(%arg21, %arg27) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<16xf32, 2 : i32>, index) -> memref<1xf32, strided<[1], offset: ?>, 2 : i32>
                  "memref.store"(%72, %73, %28) : (f32, memref<1xf32, strided<[1], offset: ?>, 2 : i32>, index) -> ()
                  "scf.yield"() : () -> ()
                }) : (index, index, index) -> ()
                %63 = "arith.subi"(%arg15, %29) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                "air.channel.put"(%arg14, %63, %arg21) <{chan_name = @chan_cascade, operandSegmentSizes = array<i32: 0, 2, 1, 0, 0, 0>}> : (index, index, memref<16xf32, 2 : i32>) -> ()
                "scf.yield"() : () -> ()
              }) : (i1) -> ()
              "scf.yield"() : () -> ()
            }) : (i1) -> ()
            "memref.dealloc"(%57) : (memref<64xf32, 2 : i32>) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          %40 = "arith.cmpi"(%arg15, %28) <{predicate = 0 : i64}> : (index, index) -> i1
          "scf.if"(%40) ({
            %41 = "arith.constant"() <{value = 0 : index}> : () -> index
            %42 = "arith.constant"() <{value = 1 : index}> : () -> index
            %43 = "arith.constant"() <{value = 4 : index}> : () -> index
            %44 = "arith.constant"() <{value = 4 : index}> : () -> index
            %45 = "arith.constant"() <{value = 1 : index}> : () -> index
            %46 = "arith.constant"() <{value = 4 : index}> : () -> index
            %47 = "arith.constant"() <{value = 1 : index}> : () -> index
            "air.dma_memcpy_nd"(%arg25, %arg14, %41, %42, %43, %44, %45, %arg20, %46, %47) <{operandSegmentSizes = array<i32: 0, 1, 2, 2, 2, 1, 0, 1, 1>}> : (memref<2x4xbf16, 1 : i32>, index, index, index, index, index, index, memref<4xbf16, 2 : i32>, index, index) -> ()
            "scf.yield"() : () -> ()
          }, {
          }) : (i1) -> ()
          "air.herd_terminator"() : () -> ()
        }) : (index, index, memref<1x128xbf16, 2 : i32>, memref<128xbf16, 2 : i32>, memref<4xbf16, 2 : i32>, memref<16xf32, 2 : i32>, memref<16xf32, 2 : i32>, memref<2x4x512xbf16, 1 : i32>, memref<512xbf16>, memref<2x4xbf16, 1 : i32>) -> ()
        %20 = "arith.constant"() <{value = 8 : index}> : () -> index
        %21 = "arith.constant"() <{value = 1 : index}> : () -> index
        %22 = "arith.constant"() <{value = 0 : index}> : () -> index
        %23 = "arith.constant"() <{value = 0 : index}> : () -> index
        %24 = "arith.constant"() <{value = 2 : index}> : () -> index
        %25 = "arith.constant"() <{value = 4 : index}> : () -> index
        %26 = "arith.constant"() <{value = 4 : index}> : () -> index
        %27 = "arith.constant"() <{value = 1 : index}> : () -> index
        "air.dma_memcpy_nd"(%arg13, %2, %20, %21, %4, %22, %23, %24, %25, %26, %27) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 2, 2, 2>}> : (memref<256xbf16>, index, index, index, memref<2x4xbf16, 1 : i32>, index, index, index, index, index, index) -> ()
        "memref.dealloc"(%3) : (memref<2x4x512xbf16, 1 : i32>) -> ()
        "memref.dealloc"(%4) : (memref<2x4xbf16, 1 : i32>) -> ()
        "memref.dealloc"(%13) : (memref<1x128xbf16, 2 : i32>) -> ()
        "memref.dealloc"(%14) : (memref<128xbf16, 2 : i32>) -> ()
        "memref.dealloc"(%15) : (memref<4xbf16, 2 : i32>) -> ()
        "memref.dealloc"(%16) : (memref<16xf32, 2 : i32>) -> ()
        "memref.dealloc"(%17) : (memref<16xf32, 2 : i32>) -> ()
        "air.segment_terminator"() : () -> ()
      }) : (index, memref<256x512xbf16>, memref<512xbf16>, memref<256xbf16>) -> ()
      "air.launch_terminator"() : () -> ()
    }) : (index, index, memref<256x512xbf16>, memref<512xbf16>, memref<256xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()
