module {
  amdgcn.module @air_forward_module target = <gfx942> isa = <cdna3> {
    kernel @forward arguments <[#amdgcn.buffer_arg<address_space = generic, access = read_only>, #amdgcn.buffer_arg<address_space = generic, access = read_only>, #amdgcn.buffer_arg<address_space = generic, access = write_only>]> attributes {enable_workgroup_id_x = false} {
      %c6_i32 = arith.constant 6 : i32
      %c63_i32 = arith.constant 63 : i32
      %c4_i32 = arith.constant 4 : i32
      %c5_i32 = arith.constant 5 : i32
      %c-64_i32 = arith.constant -64 : i32
      %c8_i32 = arith.constant 8 : i32
      %c-512_i32 = arith.constant -512 : i32
      %c0_i32 = arith.constant 0 : i32
      %c16_i32 = arith.constant 16 : i32
      %c3_i32 = arith.constant 3 : i32
      %c2_i32 = arith.constant 2 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = alloca : !amdgcn.vgpr<4>
      %1 = alloca : !amdgcn.vgpr<5>
      %2 = alloca : !amdgcn.vgpr<6>
      %3 = alloca : !amdgcn.vgpr<7>
      %4 = alloca : !amdgcn.sgpr<2>
      %5 = alloca : !amdgcn.sgpr<3>
      %6 = alloca : !amdgcn.sgpr<4>
      %7 = alloca : !amdgcn.sgpr<5>
      %8 = alloca : !amdgcn.sgpr<0>
      %9 = alloca : !amdgcn.sgpr<1>
      %10 = alloca : !amdgcn.vgpr<2>
      %11 = alloca : !amdgcn.vgpr<3>
      %12 = alloca : !amdgcn.vgpr<8>
      %13 = alloca : !amdgcn.vgpr<9>
      %14 = alloca : !amdgcn.vgpr<1>
      %15 = alloca : !amdgcn.vgpr<10>
      %16 = alloca : !amdgcn.vgpr<11>
      %17 = alloca : !amdgcn.vgpr<0>
      %18 = make_register_range %8, %9 : !amdgcn.sgpr<0>, !amdgcn.sgpr<1>
      %19 = make_register_range %4, %5 : !amdgcn.sgpr<2>, !amdgcn.sgpr<3>
      %token = load s_load_dwordx2 dest %19 addr %18 offset c(%c0_i32) : dps(!amdgcn.sgpr<[2 : 4]>) ins(!amdgcn.sgpr<[0 : 2]>, i32) -> !amdgcn.read_token<constant>
      %20 = make_register_range %6, %7 : !amdgcn.sgpr<4>, !amdgcn.sgpr<5>
      %token_0 = load s_load_dwordx2 dest %20 addr %18 offset c(%c8_i32) : dps(!amdgcn.sgpr<[4 : 6]>) ins(!amdgcn.sgpr<[0 : 2]>, i32) -> !amdgcn.read_token<constant>
      %token_1 = load s_load_dwordx2 dest %18 addr %18 offset c(%c16_i32) : dps(!amdgcn.sgpr<[0 : 2]>) ins(!amdgcn.sgpr<[0 : 2]>, i32) -> !amdgcn.read_token<constant>
      amdgcn.sopp.s_waitcnt <s_waitcnt> lgkmcnt = 0
      vop3 v_lshlrev_b32_e64 outs %14 ins %c5_i32, %17 : !amdgcn.vgpr<1>, i32, !amdgcn.vgpr<0>
      vop3 v_ashrrev_i32_e64 outs %15 ins %c4_i32, %17 : !amdgcn.vgpr<10>, i32, !amdgcn.vgpr<0>
      amdgcn.vop1.vop1 <v_mov_b32_e32> %10, %c-512_i32 : (!amdgcn.vgpr<2>, i32) -> ()
      vop3 v_mul_lo_u32 outs %10 ins %10, %15 : !amdgcn.vgpr<2>, !amdgcn.vgpr<2>, !amdgcn.vgpr<10>
      vop2 v_add_u32 outs %14 ins %14, %10 : !amdgcn.vgpr<1>, !amdgcn.vgpr<1>, !amdgcn.vgpr<2>
      vop2 v_and_b32 outs %10 ins %c63_i32, %17 : !amdgcn.vgpr<2>, i32, !amdgcn.vgpr<0>
      vop3 v_ashrrev_i32_e64 outs %16 ins %c4_i32, %10 : !amdgcn.vgpr<11>, i32, !amdgcn.vgpr<2>
      vop3 v_lshlrev_b32_e64 outs %10 ins %c3_i32, %16 : !amdgcn.vgpr<2>, i32, !amdgcn.vgpr<11>
      vop2 v_add_u32 outs %14 ins %14, %10 : !amdgcn.vgpr<1>, !amdgcn.vgpr<1>, !amdgcn.vgpr<2>
      %21 = make_register_range %10, %11 : !amdgcn.vgpr<2>, !amdgcn.vgpr<3>
      %token_2 = load global_load_dwordx2 dest %21 addr %19 offset d(%14) + c(%c0_i32) : dps(!amdgcn.vgpr<[2 : 4]>) ins(!amdgcn.sgpr<[2 : 4]>, !amdgcn.vgpr<1>, i32) -> !amdgcn.read_token<flat>
      %22 = make_register_range %12, %13 : !amdgcn.vgpr<8>, !amdgcn.vgpr<9>
      %token_3 = load global_load_dwordx2 dest %22 addr %20 offset d(%14) + c(%c0_i32) : dps(!amdgcn.vgpr<[8 : 10]>) ins(!amdgcn.sgpr<[4 : 6]>, !amdgcn.vgpr<1>, i32) -> !amdgcn.read_token<flat>
      amdgcn.vop1.vop1 <v_mov_b32_e32> %0, %c0_i32 : (!amdgcn.vgpr<4>, i32) -> ()
      amdgcn.vop1.vop1 <v_mov_b32_e32> %1, %c0_i32 : (!amdgcn.vgpr<5>, i32) -> ()
      amdgcn.vop1.vop1 <v_mov_b32_e32> %2, %c0_i32 : (!amdgcn.vgpr<6>, i32) -> ()
      amdgcn.vop1.vop1 <v_mov_b32_e32> %3, %c0_i32 : (!amdgcn.vgpr<7>, i32) -> ()
      %23 = make_register_range %0, %1, %2, %3 : !amdgcn.vgpr<4>, !amdgcn.vgpr<5>, !amdgcn.vgpr<6>, !amdgcn.vgpr<7>
      amdgcn.sopp.s_waitcnt <s_waitcnt> vmcnt = 0
      amdgcn.vop3p.vop3p_mai <v_mfma_f32_16x16x16_f16> %23, %21, %22, %23 : <[2 : 4]>, <[8 : 10]>, !amdgcn.vgpr<[4 : 8]> -> !amdgcn.vgpr<[4 : 8]>
      vop3 v_lshlrev_b32_e64 outs %14 ins %c2_i32, %16 : !amdgcn.vgpr<1>, i32, !amdgcn.vgpr<11>
      vop3 v_lshlrev_b32_e64 outs %17 ins %c2_i32, %17 : !amdgcn.vgpr<0>, i32, !amdgcn.vgpr<0>
      amdgcn.vop1.vop1 <v_mov_b32_e32> %10, %c-64_i32 : (!amdgcn.vgpr<2>, i32) -> ()
      vop3 v_mul_lo_u32 outs %10 ins %10, %15 : !amdgcn.vgpr<2>, !amdgcn.vgpr<2>, !amdgcn.vgpr<10>
      vop2 v_add_u32 outs %11 ins %17, %10 : !amdgcn.vgpr<3>, !amdgcn.vgpr<0>, !amdgcn.vgpr<2>
      vop3 v_lshlrev_b32_e64 outs %12 ins %c8_i32, %16 : !amdgcn.vgpr<8>, i32, !amdgcn.vgpr<11>
      vop2 v_add_u32 outs %11 ins %11, %12 : !amdgcn.vgpr<3>, !amdgcn.vgpr<3>, !amdgcn.vgpr<8>
      %24 = store global_store_dword data %0 addr %18 offset d(%11) + c(%c0_i32) : ins(!amdgcn.vgpr<4>, !amdgcn.sgpr<[0 : 2]>, !amdgcn.vgpr<3>, i32) -> !amdgcn.write_token<flat>
      vop2 v_add_u32 outs %11 ins %c1_i32, %14 : !amdgcn.vgpr<3>, i32, !amdgcn.vgpr<1>
      vop3 v_lshlrev_b32_e64 outs %11 ins %c6_i32, %11 : !amdgcn.vgpr<3>, i32, !amdgcn.vgpr<3>
      vop2 v_add_u32 outs %11 ins %11, %17 : !amdgcn.vgpr<3>, !amdgcn.vgpr<3>, !amdgcn.vgpr<0>
      vop2 v_add_u32 outs %11 ins %11, %10 : !amdgcn.vgpr<3>, !amdgcn.vgpr<3>, !amdgcn.vgpr<2>
      %25 = store global_store_dword data %1 addr %18 offset d(%11) + c(%c0_i32) : ins(!amdgcn.vgpr<5>, !amdgcn.sgpr<[0 : 2]>, !amdgcn.vgpr<3>, i32) -> !amdgcn.write_token<flat>
      vop2 v_add_u32 outs %11 ins %c2_i32, %14 : !amdgcn.vgpr<3>, i32, !amdgcn.vgpr<1>
      vop3 v_lshlrev_b32_e64 outs %11 ins %c6_i32, %11 : !amdgcn.vgpr<3>, i32, !amdgcn.vgpr<3>
      vop2 v_add_u32 outs %11 ins %11, %17 : !amdgcn.vgpr<3>, !amdgcn.vgpr<3>, !amdgcn.vgpr<0>
      vop2 v_add_u32 outs %11 ins %11, %10 : !amdgcn.vgpr<3>, !amdgcn.vgpr<3>, !amdgcn.vgpr<2>
      %26 = store global_store_dword data %2 addr %18 offset d(%11) + c(%c0_i32) : ins(!amdgcn.vgpr<6>, !amdgcn.sgpr<[0 : 2]>, !amdgcn.vgpr<3>, i32) -> !amdgcn.write_token<flat>
      vop2 v_add_u32 outs %14 ins %c3_i32, %14 : !amdgcn.vgpr<1>, i32, !amdgcn.vgpr<1>
      vop3 v_lshlrev_b32_e64 outs %14 ins %c6_i32, %14 : !amdgcn.vgpr<1>, i32, !amdgcn.vgpr<1>
      vop2 v_add_u32 outs %17 ins %14, %17 : !amdgcn.vgpr<0>, !amdgcn.vgpr<1>, !amdgcn.vgpr<0>
      vop2 v_add_u32 outs %17 ins %17, %10 : !amdgcn.vgpr<0>, !amdgcn.vgpr<0>, !amdgcn.vgpr<2>
      %27 = store global_store_dword data %3 addr %18 offset d(%17) + c(%c0_i32) : ins(!amdgcn.vgpr<7>, !amdgcn.sgpr<[0 : 2]>, !amdgcn.vgpr<0>, i32) -> !amdgcn.write_token<flat>
      amdgcn.sopp.s_waitcnt <s_waitcnt> vmcnt = 0
      end_kernel
    }
  }
}

