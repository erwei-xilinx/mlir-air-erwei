#map = affine_map<()[s0] -> (s0 * 32 - (s0 floordiv 16) * 512 + ((s0 mod 64) floordiv 16) * 8)>
#map1 = affine_map<()[s0] -> (((s0 mod 64) floordiv 16) * 4)>
#map2 = affine_map<()[s0] -> (s0 * 4 - (s0 floordiv 16) * 64 + ((s0 mod 64) floordiv 16) * 256)>
#map3 = affine_map<()[s0, s1] -> (s0 * 64 + s1 * 4 - (s1 floordiv 16) * 64)>
module {
  amdgcn.module @air_forward_module target = <gfx942> isa = <cdna3> {
    kernel @forward arguments <[#amdgcn.buffer_arg<address_space = generic, access = read_only>, #amdgcn.buffer_arg<address_space = generic, access = read_only>, #amdgcn.buffer_arg<address_space = generic, access = write_only>]> {
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c0_i32 = arith.constant 0 : i32
      %0 = load_arg 0 : !amdgcn.sgpr<[? + 2]>
      %1 = load_arg 1 : !amdgcn.sgpr<[? + 2]>
      %2 = load_arg 2 : !amdgcn.sgpr<[? + 2]>
      amdgcn.sopp.s_waitcnt <s_waitcnt> lgkmcnt = 0
      %thread_id_x = gpu.thread_id  x
      %3 = affine.apply #map()[%thread_id_x]
      %4 = arith.index_cast %3 : index to i32
      %5 = lsir.to_reg %4 : i32 -> !amdgcn.vgpr
      %6 = alloca : !amdgcn.vgpr
      %7 = alloca : !amdgcn.vgpr
      %8 = make_register_range %6, %7 : !amdgcn.vgpr, !amdgcn.vgpr
      %dest_res, %token = load global_load_dwordx2 dest %8 addr %0 offset d(%5) + c(%c0_i32) : dps(!amdgcn.vgpr<[? + 2]>) ins(!amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.read_token<flat>
      %thread_id_x_0 = gpu.thread_id  x
      %9 = affine.apply #map()[%thread_id_x_0]
      %10 = arith.index_cast %9 : index to i32
      %11 = lsir.to_reg %10 : i32 -> !amdgcn.vgpr
      %12 = alloca : !amdgcn.vgpr
      %13 = alloca : !amdgcn.vgpr
      %14 = make_register_range %12, %13 : !amdgcn.vgpr, !amdgcn.vgpr
      %dest_res_1, %token_2 = load global_load_dwordx2 dest %14 addr %1 offset d(%11) + c(%c0_i32) : dps(!amdgcn.vgpr<[? + 2]>) ins(!amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.read_token<flat>
      %15 = alloca : !amdgcn.vgpr
      %16 = alloca : !amdgcn.vgpr
      %17 = alloca : !amdgcn.vgpr
      %18 = alloca : !amdgcn.vgpr
      %19 = amdgcn.vop1.vop1 <v_mov_b32_e32> %15, %c0_i32 : (!amdgcn.vgpr, i32) -> !amdgcn.vgpr
      %20 = amdgcn.vop1.vop1 <v_mov_b32_e32> %16, %c0_i32 : (!amdgcn.vgpr, i32) -> !amdgcn.vgpr
      %21 = amdgcn.vop1.vop1 <v_mov_b32_e32> %17, %c0_i32 : (!amdgcn.vgpr, i32) -> !amdgcn.vgpr
      %22 = amdgcn.vop1.vop1 <v_mov_b32_e32> %18, %c0_i32 : (!amdgcn.vgpr, i32) -> !amdgcn.vgpr
      %23 = make_register_range %19, %20, %21, %22 : !amdgcn.vgpr, !amdgcn.vgpr, !amdgcn.vgpr, !amdgcn.vgpr
      wait deps %token, %token_2 : !amdgcn.read_token<flat>, !amdgcn.read_token<flat>
      %24 = amdgcn.vop3p.vop3p_mai <v_mfma_f32_16x16x16_f16> %23, %dest_res, %dest_res_1, %23 : <[? + 2]>, <[? + 2]>, !amdgcn.vgpr<[? + 4]> -> !amdgcn.vgpr<[? + 4]>
      %thread_id_x_3 = gpu.thread_id  x
      %25 = affine.apply #map1()[%thread_id_x_3]
      %26:4 = split_register_range %24 : !amdgcn.vgpr<[? + 4]>
      %27 = affine.apply #map2()[%thread_id_x_3]
      %28 = arith.index_cast %27 : index to i32
      %29 = lsir.to_reg %28 : i32 -> !amdgcn.vgpr
      %30 = store global_store_dword data %26#0 addr %2 offset d(%29) + c(%c0_i32) : ins(!amdgcn.vgpr, !amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.write_token<flat>
      %31 = arith.addi %25, %c1 : index
      %32 = affine.apply #map3()[%31, %thread_id_x_3]
      %33 = arith.index_cast %32 : index to i32
      %34 = lsir.to_reg %33 : i32 -> !amdgcn.vgpr
      %35 = store global_store_dword data %26#1 addr %2 offset d(%34) + c(%c0_i32) : ins(!amdgcn.vgpr, !amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.write_token<flat>
      %36 = arith.addi %25, %c2 : index
      %37 = affine.apply #map3()[%36, %thread_id_x_3]
      %38 = arith.index_cast %37 : index to i32
      %39 = lsir.to_reg %38 : i32 -> !amdgcn.vgpr
      %40 = store global_store_dword data %26#2 addr %2 offset d(%39) + c(%c0_i32) : ins(!amdgcn.vgpr, !amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.write_token<flat>
      %41 = arith.addi %25, %c3 : index
      %42 = affine.apply #map3()[%41, %thread_id_x_3]
      %43 = arith.index_cast %42 : index to i32
      %44 = lsir.to_reg %43 : i32 -> !amdgcn.vgpr
      %45 = store global_store_dword data %26#3 addr %2 offset d(%44) + c(%c0_i32) : ins(!amdgcn.vgpr, !amdgcn.sgpr<[? + 2]>, !amdgcn.vgpr, i32) -> !amdgcn.write_token<flat>
      wait deps %45 : !amdgcn.write_token<flat>
      end_kernel
    }
  }
}

