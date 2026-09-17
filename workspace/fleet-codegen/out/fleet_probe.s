	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.amdhsa_code_object_version 6
	.text
	.protected	_Z14k_xcd_identity13RuntimeConfigiPi ; -- Begin function _Z14k_xcd_identity13RuntimeConfigiPi
	.globl	_Z14k_xcd_identity13RuntimeConfigiPi
	.p2align	8
	.type	_Z14k_xcd_identity13RuntimeConfigiPi,@function
_Z14k_xcd_identity13RuntimeConfigiPi:   ; @_Z14k_xcd_identity13RuntimeConfigiPi
; %bb.0:
	s_load_dword s2, s[0:1], 0x50
	s_load_dwordx4 s[4:7], s[0:1], 0x30
	v_mov_b32_e32 v2, 0
	;;#ASMSTART
	s_getreg_b32 s8, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	v_mov_b32_e32 v1, -1
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[10:11], s[2:3], 2
	s_add_u32 s6, s6, s10
	v_mov_b32_e32 v0, s8
	s_addc_u32 s7, s7, s11
	s_ashr_i32 s9, s8, 31
	global_store_dword v2, v0, s[6:7]
	s_lshl_b64 s[6:7], s[8:9], 2
	s_add_u32 s4, s4, s6
	s_addc_u32 s5, s5, s7
	v_mov_b32_e32 v0, s2
	buffer_wbl2 sc1
	s_waitcnt vmcnt(0)
	global_atomic_cmpswap v0, v2, v[0:1], s[4:5] sc0
	s_load_dwordx2 s[4:5], s[0:1], 0x58
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e32 vcc, -1, v0
	v_cmp_eq_u32_e64 s[0:1], s2, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v0, 0, 1, s[0:1]
	s_waitcnt lgkmcnt(0)
	global_store_dword v2, v0, s[4:5]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z14k_xcd_identity13RuntimeConfigiPi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 96
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 3
		.amdhsa_next_free_sgpr 12
		.amdhsa_accum_offset 4
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z14k_xcd_identity13RuntimeConfigiPi, .Lfunc_end0-_Z14k_xcd_identity13RuntimeConfigiPi
                                        ; -- End function
	.set _Z14k_xcd_identity13RuntimeConfigiPi.num_vgpr, 3
	.set _Z14k_xcd_identity13RuntimeConfigiPi.num_agpr, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.numbered_sgpr, 12
	.set _Z14k_xcd_identity13RuntimeConfigiPi.num_named_barrier, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.private_seg_size, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.uses_vcc, 1
	.set _Z14k_xcd_identity13RuntimeConfigiPi.uses_flat_scratch, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.has_dyn_sized_stack, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.has_recursion, 0
	.set _Z14k_xcd_identity13RuntimeConfigiPi.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 168
; TotalNumSgprs: 18
; NumVgprs: 3
; NumAgprs: 0
; TotalNumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 18
; NumVGPRsForWavesPerEU: 3
; AccumOffset: 4
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 0
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z16k_gang_broadcast13RuntimeConfigiPiPyy ; -- Begin function _Z16k_gang_broadcast13RuntimeConfigiPiPyy
	.globl	_Z16k_gang_broadcast13RuntimeConfigiPiPyy
	.p2align	8
	.type	_Z16k_gang_broadcast13RuntimeConfigiPiPyy,@function
_Z16k_gang_broadcast13RuntimeConfigiPiPyy: ; @_Z16k_gang_broadcast13RuntimeConfigiPiPyy
; %bb.0:
	s_load_dword s16, s[0:1], 0x50
	s_waitcnt lgkmcnt(0)
	s_cmp_lt_i32 s16, 1
	s_cbranch_scc1 .LBB1_9
; %bb.1:
	s_load_dwordx4 s[4:7], s[0:1], 0x8
	s_load_dwordx2 s[2:3], s[0:1], 0x18
	s_load_dwordx2 s[12:13], s[0:1], 0x68
	s_load_dwordx4 s[8:11], s[0:1], 0x58
	s_mov_b32 s1, 0
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32_e32 v0, s4
	v_cvt_f32_u32_e32 v1, s5
	v_cvt_f32_u32_e32 v2, s4
	v_mov_b64_e32 v[10:11], s[12:13]
	s_sub_i32 s17, 0, s4
	v_fmamk_f32 v0, v1, 0x4f800000, v0
	v_rcp_iflag_f32_e32 v1, v2
	v_rcp_f32_e32 v2, v0
	v_mov_b32_e32 v0, 0
	v_mul_f32_e32 v1, 0x4f7ffffe, v1
	v_mul_f32_e32 v2, 0x5f7ffffc, v2
	v_mul_f32_e32 v3, 0x2f800000, v2
	v_trunc_f32_e32 v3, v3
	v_fmamk_f32 v2, v3, 0xcf800000, v2
	v_cvt_u32_f32_e32 v6, v3
	v_cvt_u32_f32_e32 v7, v2
	v_cvt_u32_f32_e32 v8, v1
	s_branch .LBB1_3
.LBB1_2:                                ;   in Loop: Header=BB1_3 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_add_i32 s16, s16, -1
	s_add_u32 s8, s8, 4
	s_addc_u32 s9, s9, 0
	s_add_u32 s10, s10, 8
	s_addc_u32 s11, s11, 0
	s_cmp_eq_u32 s16, 0
	s_cbranch_scc1 .LBB1_9
.LBB1_3:                                ; =>This Inner Loop Header: Depth=1
	global_load_dword v2, v0, s[8:9]
	global_load_dwordx2 v[12:13], v0, s[10:11]
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshlrev_b64 v[2:3], 3, v[2:3]
	v_lshl_add_u64 v[4:5], s[2:3], 0, v[2:3]
	global_load_dwordx2 v[4:5], v[4:5], off
	s_waitcnt vmcnt(1)
	v_or_b32_e32 v1, s5, v13
	v_cmp_ne_u64_e32 vcc, 0, v[0:1]
	v_readfirstlane_b32 s0, v12
	v_readfirstlane_b32 s12, v13
	v_lshl_add_u64 v[14:15], v[12:13], 0, 1
	global_store_dwordx2 v0, v[14:15], s[10:11]
	s_cbranch_vccz .LBB1_8
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	s_sub_u32 s13, 0, s4
	v_readfirstlane_b32 s15, v7
	v_readfirstlane_b32 s20, v6
	s_subb_u32 s14, 0, s5
	s_mul_hi_u32 s19, s13, s15
	s_mul_i32 s21, s13, s20
	s_mul_i32 s18, s14, s15
	s_add_i32 s19, s19, s21
	s_add_i32 s19, s19, s18
	s_mul_i32 s22, s13, s15
	s_mul_i32 s21, s15, s19
	s_mul_hi_u32 s23, s15, s22
	s_mul_hi_u32 s18, s15, s19
	s_add_u32 s21, s23, s21
	s_addc_u32 s18, 0, s18
	s_mul_hi_u32 s24, s20, s22
	s_mul_i32 s22, s20, s22
	s_add_u32 s21, s21, s22
	s_mul_hi_u32 s23, s20, s19
	s_addc_u32 s18, s18, s24
	s_addc_u32 s21, s23, 0
	s_mul_i32 s19, s20, s19
	s_add_u32 s18, s18, s19
	s_addc_u32 s19, 0, s21
	s_add_u32 s15, s15, s18
	s_addc_u32 s18, s20, s19
	s_mul_i32 s19, s13, s18
	s_mul_hi_u32 s20, s13, s15
	s_add_i32 s19, s20, s19
	s_mul_i32 s14, s14, s15
	s_add_i32 s19, s19, s14
	s_mul_i32 s13, s13, s15
	s_mul_hi_u32 s20, s18, s13
	s_mul_i32 s21, s18, s13
	s_mul_i32 s23, s15, s19
	s_mul_hi_u32 s13, s15, s13
	s_mul_hi_u32 s22, s15, s19
	s_add_u32 s13, s13, s23
	s_addc_u32 s22, 0, s22
	s_add_u32 s13, s13, s21
	s_mul_hi_u32 s14, s18, s19
	s_addc_u32 s13, s22, s20
	s_addc_u32 s14, s14, 0
	s_mul_i32 s19, s18, s19
	s_add_u32 s13, s13, s19
	s_addc_u32 s14, 0, s14
	s_add_u32 s13, s15, s13
	s_addc_u32 s14, s18, s14
	s_mul_i32 s18, s0, s14
	s_mul_hi_u32 s19, s0, s13
	s_mul_hi_u32 s15, s0, s14
	s_add_u32 s18, s19, s18
	s_addc_u32 s15, 0, s15
	s_mul_hi_u32 s20, s12, s13
	s_mul_i32 s13, s12, s13
	s_add_u32 s13, s18, s13
	s_mul_hi_u32 s19, s12, s14
	s_addc_u32 s13, s15, s20
	s_addc_u32 s15, s19, 0
	s_mul_i32 s14, s12, s14
	s_add_u32 s13, s13, s14
	s_addc_u32 s14, 0, s15
	s_mul_i32 s14, s4, s14
	s_mul_hi_u32 s15, s4, s13
	s_add_i32 s14, s15, s14
	s_mul_i32 s15, s5, s13
	s_add_i32 s20, s14, s15
	s_sub_i32 s18, s12, s20
	s_mul_i32 s13, s4, s13
	s_sub_u32 s21, s0, s13
	s_cselect_b64 s[14:15], -1, 0
	s_subb_u32 s13, s18, s5
	s_sub_u32 s22, s21, s4
	s_cselect_b64 s[18:19], -1, 0
	s_subb_u32 s23, s13, 0
	s_cmp_ge_u32 s23, s5
	s_cselect_b32 s24, -1, 0
	s_cmp_ge_u32 s22, s4
	s_cselect_b32 s25, -1, 0
	s_cmp_eq_u32 s23, s5
	s_cselect_b32 s24, s25, s24
	s_cmp_lg_u64 s[18:19], 0
	s_subb_u32 s13, s13, s5
	s_sub_u32 s18, s22, s4
	s_subb_u32 s13, s13, 0
	s_cmp_lg_u32 s24, 0
	s_cselect_b32 s18, s18, s22
	s_cselect_b32 s13, s13, s23
	s_cmp_lg_u64 s[14:15], 0
	s_subb_u32 s12, s12, s20
	s_cmp_ge_u32 s12, s5
	s_cselect_b32 s14, -1, 0
	s_cmp_ge_u32 s21, s4
	s_cselect_b32 s15, -1, 0
	s_cmp_eq_u32 s12, s5
	s_cselect_b32 s14, s15, s14
	s_cmp_lg_u32 s14, 0
	s_cselect_b32 s13, s13, s12
	s_cselect_b32 s12, s18, s21
	s_cbranch_execnz .LBB1_6
.LBB1_5:                                ;   in Loop: Header=BB1_3 Depth=1
	v_readfirstlane_b32 s12, v8
	s_mul_i32 s13, s17, s12
	s_mul_hi_u32 s13, s12, s13
	s_add_i32 s12, s12, s13
	s_mul_hi_u32 s12, s0, s12
	s_mul_i32 s12, s12, s4
	s_sub_i32 s0, s0, s12
	s_sub_i32 s12, s0, s4
	s_cmp_ge_u32 s0, s4
	s_cselect_b32 s0, s12, s0
	s_sub_i32 s12, s0, s4
	s_cmp_ge_u32 s0, s4
	s_cselect_b32 s0, s12, s0
	s_mov_b64 s[12:13], s[0:1]
.LBB1_6:                                ;   in Loop: Header=BB1_3 Depth=1
	s_lshl_b64 s[12:13], s[12:13], 3
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[4:5], v[4:5], 0, s[12:13]
	s_mov_b64 s[14:15], exec
	flat_store_dwordx2 v[4:5], v[10:11] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_mbcnt_lo_u32_b32 v1, s14, 0
	v_mbcnt_hi_u32_b32 v1, s15, v1
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_and_saveexec_b64 s[12:13], vcc
	s_cbranch_execz .LBB1_2
; %bb.7:                                ;   in Loop: Header=BB1_3 Depth=1
	s_bcnt1_i32_b64 s0, s[14:15]
	v_lshl_add_u64 v[2:3], s[6:7], 0, v[2:3]
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, v0
	global_atomic_add_x2 v[2:3], v[4:5], off
	s_branch .LBB1_2
.LBB1_8:                                ;   in Loop: Header=BB1_3 Depth=1
                                        ; implicit-def: $sgpr12_sgpr13
	s_branch .LBB1_5
.LBB1_9:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z16k_gang_broadcast13RuntimeConfigiPiPyy
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 112
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 16
		.amdhsa_next_free_sgpr 26
		.amdhsa_accum_offset 16
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end1:
	.size	_Z16k_gang_broadcast13RuntimeConfigiPiPyy, .Lfunc_end1-_Z16k_gang_broadcast13RuntimeConfigiPiPyy
                                        ; -- End function
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.num_vgpr, 16
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.num_agpr, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.numbered_sgpr, 26
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.num_named_barrier, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.private_seg_size, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.uses_vcc, 1
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.uses_flat_scratch, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.has_dyn_sized_stack, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.has_recursion, 0
	.set _Z16k_gang_broadcast13RuntimeConfigiPiPyy.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 828
; TotalNumSgprs: 32
; NumVgprs: 16
; NumAgprs: 0
; TotalNumVgprs: 16
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 32
; NumVGPRsForWavesPerEU: 16
; AccumOffset: 16
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 3
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z12k_gang_strip13RuntimeConfigPviiiiPi ; -- Begin function _Z12k_gang_strip13RuntimeConfigPviiiiPi
	.globl	_Z12k_gang_strip13RuntimeConfigPviiiiPi
	.p2align	8
	.type	_Z12k_gang_strip13RuntimeConfigPviiiiPi,@function
_Z12k_gang_strip13RuntimeConfigPviiiiPi: ; @_Z12k_gang_strip13RuntimeConfigPviiiiPi
; %bb.0:
	s_mov_b32 s33, s10
	s_mov_b32 s50, s9
	s_mov_b32 s51, s8
	s_mov_b64 s[36:37], s[6:7]
	s_mov_b64 s[34:35], s[4:5]
	s_mov_b64 s[38:39], s[2:3]
	s_mov_b64 s[48:49], s[0:1]
	s_load_dwordx4 s[8:11], s[4:5], 0x40
	s_nop 0
	s_load_dwordx8 s[0:7], s[34:35], 0x20
	s_load_dwordx4 s[52:55], s[34:35], 0x58
	v_mov_b32_e32 v40, v0
	s_mov_b32 s64, 0
	s_waitcnt lgkmcnt(0)
	v_mov_b64_e32 v[0:1], s[8:9]
	v_mov_b64_e32 v[2:3], s[10:11]
	s_load_dwordx8 s[8:15], s[34:35], 0x0
	scratch_store_dwordx4 off, v[0:3], off offset:64
	s_cmp_ge_i32 s52, s55
	s_movk_i32 s32, 0x60
	v_mov_b64_e32 v[0:1], s[4:5]
	v_mov_b64_e32 v[2:3], s[6:7]
	scratch_store_dwordx4 off, v[0:3], off offset:48
	s_nop 1
	v_mov_b64_e32 v[0:1], s[0:1]
	v_mov_b64_e32 v[2:3], s[2:3]
	scratch_store_dwordx4 off, v[0:3], off offset:32
	s_waitcnt lgkmcnt(0)
	s_nop 0
	v_mov_b64_e32 v[0:1], s[12:13]
	v_mov_b64_e32 v[2:3], s[14:15]
	scratch_store_dwordx4 off, v[0:3], off offset:16
	s_nop 1
	v_mov_b64_e32 v[0:1], s[8:9]
	v_mov_b64_e32 v[2:3], s[10:11]
	scratch_store_dwordx4 off, v[0:3], off
	s_cbranch_scc1 .LBB2_3
; %bb.1:
	s_load_dwordx2 s[66:67], s[34:35], 0x50
	s_mov_b64 s[64:65], src_private_base
	s_mov_b32 s64, 0
.LBB2_2:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s2, s54, s52
	s_add_u32 s8, s34, 0x70
	s_addc_u32 s9, s35, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, _Z18_execute_gang_taskPvRK13RuntimeConfigi@rel32@lo+4
	s_addc_u32 s1, s1, _Z18_execute_gang_taskPvRK13RuntimeConfigi@rel32@hi+12
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s51
	s_mov_b32 s13, s50
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s66
	v_mov_b32_e32 v1, s67
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v3, s65
	v_mov_b32_e32 v4, s2
	s_swappc_b64 s[30:31], s[0:1]
	s_add_i32 s64, s64, 1
	s_add_i32 s52, s52, s53
	s_cmp_ge_i32 s52, s55
	s_cbranch_scc0 .LBB2_2
.LBB2_3:
	s_nop 0
	v_and_b32_e32 v0, 0x3ff, v40
	v_cmp_eq_u32_e32 vcc, 0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_5
; %bb.4:
	s_load_dwordx2 s[0:1], s[34:35], 0x68
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, s64
	s_waitcnt lgkmcnt(0)
	global_store_dword v0, v1, s[0:1]
.LBB2_5:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z12k_gang_strip13RuntimeConfigPviiiiPi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 96
		.amdhsa_kernarg_size 368
		.amdhsa_user_sgpr_count 8
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 1
		.amdhsa_enable_private_segment 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr max(totalnumvgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 1, 0)
		.amdhsa_next_free_sgpr max(_Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr+6, 1, 0)-6
		.amdhsa_accum_offset (((((alignto(max(1, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 4)/4)-1)&~65536)&63)+1)*4
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end2:
	.size	_Z12k_gang_strip13RuntimeConfigPviiiiPi, .Lfunc_end2-_Z12k_gang_strip13RuntimeConfigPviiiiPi
                                        ; -- End function
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr, max(41, amdgpu.max_num_vgpr)
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, max(0, amdgpu.max_num_agpr)
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr, max(68, amdgpu.max_num_sgpr)
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_named_barrier, max(0, amdgpu.max_num_named_barrier)
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.private_seg_size, 96
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_vcc, 1
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_flat_scratch, 1
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.has_dyn_sized_stack, 1
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.has_recursion, 1
	.set _Z12k_gang_strip13RuntimeConfigPviiiiPi.has_indirect_call, 1
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 364
; TotalNumSgprs: _Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr+6
; NumVgprs: _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr
; NumAgprs: _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr
; TotalNumVgprs: totalnumvgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr)
; ScratchSize: 96
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: (alignto(max(max(_Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr+extrasgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_vcc, _Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_flat_scratch, 1), 1, 0), 1), 8)/8)-1
; VGPRBlocks: (alignto(max(max(totalnumvgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 1, 0), 1), 8)/8)-1
; NumSGPRsForWavesPerEU: max(_Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr+6, 1, 0)
; NumVGPRsForWavesPerEU: max(totalnumvgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 1, 0)
; AccumOffset: ((alignto(max(1, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 4)/4)-1+1)*4
; Occupancy: occupancy(8, 8, 512, 8, 8, max(_Z12k_gang_strip13RuntimeConfigPviiiiPi.numbered_sgpr+extrasgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_vcc, _Z12k_gang_strip13RuntimeConfigPviiiiPi.uses_flat_scratch, 1), 1, 0), max(totalnumvgprs(_Z12k_gang_strip13RuntimeConfigPviiiiPi.num_agpr, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 1, 0))
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: (((alignto(max(1, _Z12k_gang_strip13RuntimeConfigPviiiiPi.num_vgpr), 4)/4)-1)&~65536)&63
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z18k_two_level_signal13RuntimeConfigiiiiiyPi ; -- Begin function _Z18k_two_level_signal13RuntimeConfigiiiiiyPi
	.globl	_Z18k_two_level_signal13RuntimeConfigiiiiiyPi
	.p2align	8
	.type	_Z18k_two_level_signal13RuntimeConfigiiiiiyPi,@function
_Z18k_two_level_signal13RuntimeConfigiiiiiyPi: ; @_Z18k_two_level_signal13RuntimeConfigiiiiiyPi
; %bb.0:
	s_load_dword s14, s[0:1], 0x60
	s_load_dwordx4 s[4:7], s[0:1], 0x68
	v_mov_b32_e32 v0, 0
	s_waitcnt lgkmcnt(0)
	s_cmp_eq_u32 s14, 0
	s_cbranch_scc1 .LBB3_6
; %bb.1:
	s_load_dwordx4 s[8:11], s[0:1], 0x50
	s_mov_b64 s[12:13], exec
	v_mbcnt_lo_u32_b32 v0, s12, 0
	v_mbcnt_hi_u32_b32 v2, s13, v0
	s_ashr_i32 s15, s14, 31
	v_cmp_eq_u32_e32 vcc, 0, v2
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB3_3
; %bb.2:
	s_load_dword s18, s[0:1], 0x4
	s_load_dwordx2 s[16:17], s[0:1], 0x48
	v_mov_b32_e32 v3, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s8, s18, s8
	s_add_i32 s18, s8, s9
	s_ashr_i32 s19, s18, 31
	s_lshl_b64 s[18:19], s[18:19], 3
	s_add_u32 s16, s16, s18
	s_addc_u32 s17, s17, s19
	s_bcnt1_i32_b64 s8, s[12:13]
	s_mul_hi_i32 s12, s14, s8
	s_mul_i32 s8, s14, s8
	v_mov_b32_e32 v0, s8
	v_mov_b32_e32 v1, s12
	global_atomic_add_x2 v[0:1], v3, v[0:1], s[16:17] sc0
.LBB3_3:
	s_or_b64 exec, exec, s[2:3]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s2, v0
	v_readfirstlane_b32 s3, v1
	s_add_u32 s2, s14, s2
	s_addc_u32 s3, s15, s3
	v_mov_b64_e32 v[0:1], s[2:3]
	v_mad_i64_i32 v[0:1], s[2:3], s14, v2, v[0:1]
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s2, s10, 31
	s_mul_hi_u32 s3, s4, s10
	s_mul_i32 s2, s4, s2
	s_add_i32 s2, s3, s2
	s_mul_i32 s3, s5, s10
	s_add_i32 s3, s2, s3
	s_mul_i32 s2, s4, s10
	v_cmp_eq_u64_e32 vcc, s[2:3], v[0:1]
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB3_5
; %bb.4:
	s_load_dwordx2 s[0:1], s[0:1], 0x20
	s_ashr_i32 s13, s9, 31
	s_mov_b32 s12, s9
	s_lshl_b64 s[8:9], s[12:13], 3
	v_mov_b64_e32 v[0:1], 1
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, s1, s9
	v_mov_b64_e32 v[2:3], s[0:1]
	s_ashr_i32 s0, s11, 31
	s_mul_hi_u32 s1, s4, s11
	s_mul_i32 s0, s4, s0
	buffer_wbl2 sc1
	;;#ASMSTART
	flat_atomic_add_x2 v[0:1], v[2:3], v[0:1] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s5, s11
	v_lshl_add_u64 v[0:1], v[0:1], 0, 1
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s4, s11
	v_cmp_eq_u64_e32 vcc, s[0:1], v[0:1]
	s_nop 1
	v_cndmask_b32_e64 v0, 0, 1, vcc
.LBB3_5:
	s_or_b64 exec, exec, s[2:3]
.LBB3_6:
	v_mov_b32_e32 v1, 0
	global_store_dword v1, v0, s[6:7]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z18k_two_level_signal13RuntimeConfigiiiiiyPi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 120
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 4
		.amdhsa_next_free_sgpr 20
		.amdhsa_accum_offset 4
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end3:
	.size	_Z18k_two_level_signal13RuntimeConfigiiiiiyPi, .Lfunc_end3-_Z18k_two_level_signal13RuntimeConfigiiiiiyPi
                                        ; -- End function
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.num_vgpr, 4
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.num_agpr, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.numbered_sgpr, 20
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.num_named_barrier, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.private_seg_size, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.uses_vcc, 1
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.uses_flat_scratch, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.has_dyn_sized_stack, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.has_recursion, 0
	.set _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 388
; TotalNumSgprs: 26
; NumVgprs: 4
; NumAgprs: 0
; TotalNumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 26
; NumVGPRsForWavesPerEU: 4
; AccumOffset: 4
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 0
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z18k_mmajor_traversaliiiiPiS_ ; -- Begin function _Z18k_mmajor_traversaliiiiPiS_
	.globl	_Z18k_mmajor_traversaliiiiPiS_
	.p2align	8
	.type	_Z18k_mmajor_traversaliiiiPiS_,@function
_Z18k_mmajor_traversaliiiiPiS_:         ; @_Z18k_mmajor_traversaliiiiPiS_
; %bb.0:
	s_load_dwordx4 s[4:7], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_min_i32 s2, s6, s4
	s_cmp_gt_i32 s6, 0
	s_cselect_b32 s3, s2, s4
	s_mul_i32 s6, s3, s5
	s_abs_i32 s2, s6
	v_cvt_f32_u32_e32 v0, s2
	s_sub_i32 s10, 0, s2
	s_abs_i32 s8, s7
	s_xor_b32 s9, s7, s6
	v_rcp_iflag_f32_e32 v0, v0
	s_ashr_i32 s9, s9, 31
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_nop 0
	v_readfirstlane_b32 s11, v0
	s_mul_i32 s10, s10, s11
	s_mul_hi_u32 s10, s11, s10
	s_add_i32 s11, s11, s10
	s_mul_hi_u32 s10, s8, s11
	s_mul_i32 s11, s10, s2
	s_sub_i32 s8, s8, s11
	s_add_i32 s12, s10, 1
	s_sub_i32 s11, s8, s2
	s_cmp_ge_u32 s8, s2
	s_cselect_b32 s10, s12, s10
	s_cselect_b32 s8, s11, s8
	s_add_i32 s11, s10, 1
	s_cmp_ge_u32 s8, s2
	s_cselect_b32 s2, s11, s10
	s_xor_b32 s2, s2, s9
	s_sub_i32 s8, s2, s9
	s_mul_i32 s2, s8, s3
	s_sub_i32 s4, s4, s2
	s_mul_i32 s8, s8, s6
	s_min_i32 s4, s4, s3
	s_sub_i32 s3, s7, s8
	s_mul_i32 s5, s4, s5
	s_cmp_ge_i32 s3, s5
	s_cbranch_scc1 .LBB4_2
; %bb.1:
	s_abs_i32 s5, s4
	v_cvt_f32_u32_e32 v0, s5
	s_sub_i32 s6, 0, s5
	s_load_dwordx4 s[8:11], s[0:1], 0x10
	s_abs_i32 s1, s3
	v_rcp_iflag_f32_e32 v0, v0
	s_xor_b32 s0, s3, s4
	s_ashr_i32 s0, s0, 31
	v_mov_b32_e32 v1, 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_nop 0
	v_readfirstlane_b32 s7, v0
	s_mul_i32 s6, s6, s7
	s_mul_hi_u32 s6, s7, s6
	s_add_i32 s7, s7, s6
	s_mul_hi_u32 s6, s1, s7
	s_mul_i32 s7, s6, s5
	s_sub_i32 s1, s1, s7
	s_add_i32 s12, s6, 1
	s_sub_i32 s7, s1, s5
	s_cmp_ge_u32 s1, s5
	s_cselect_b32 s6, s12, s6
	s_cselect_b32 s1, s7, s1
	s_add_i32 s7, s6, 1
	s_cmp_ge_u32 s1, s5
	s_cselect_b32 s1, s7, s6
	s_xor_b32 s1, s1, s0
	s_sub_i32 s0, s1, s0
	s_mul_i32 s1, s0, s4
	v_mov_b32_e32 v0, s0
	s_sub_i32 s0, s3, s1
	s_add_i32 s0, s0, s2
	v_mov_b32_e32 v2, s0
	s_waitcnt lgkmcnt(0)
	global_store_dword v1, v2, s[8:9]
	global_store_dword v1, v0, s[10:11]
.LBB4_2:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z18k_mmajor_traversaliiiiPiS_
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 32
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 3
		.amdhsa_next_free_sgpr 13
		.amdhsa_accum_offset 4
		.amdhsa_reserve_vcc 0
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end4:
	.size	_Z18k_mmajor_traversaliiiiPiS_, .Lfunc_end4-_Z18k_mmajor_traversaliiiiPiS_
                                        ; -- End function
	.set _Z18k_mmajor_traversaliiiiPiS_.num_vgpr, 3
	.set _Z18k_mmajor_traversaliiiiPiS_.num_agpr, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.numbered_sgpr, 13
	.set _Z18k_mmajor_traversaliiiiPiS_.num_named_barrier, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.private_seg_size, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.uses_vcc, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.uses_flat_scratch, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.has_dyn_sized_stack, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.has_recursion, 0
	.set _Z18k_mmajor_traversaliiiiPiS_.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 340
; TotalNumSgprs: 19
; NumVgprs: 3
; NumAgprs: 0
; TotalNumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 19
; NumVGPRsForWavesPerEU: 3
; AccumOffset: 4
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 0
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z17k_poll_vs_depwait13RuntimeConfigiiyPy ; -- Begin function _Z17k_poll_vs_depwait13RuntimeConfigiiyPy
	.globl	_Z17k_poll_vs_depwait13RuntimeConfigiiyPy
	.p2align	8
	.type	_Z17k_poll_vs_depwait13RuntimeConfigiiyPy,@function
_Z17k_poll_vs_depwait13RuntimeConfigiiyPy: ; @_Z17k_poll_vs_depwait13RuntimeConfigiiyPy
; %bb.0:
	s_load_dwordx2 s[2:3], s[0:1], 0x50
	s_load_dwordx2 s[4:5], s[0:1], 0x10
	s_load_dwordx2 s[6:7], s[0:1], 0x20
	v_mov_b32_e32 v4, 0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s9, s2, 31
	s_mov_b32 s8, s2
	s_lshl_b64 s[8:9], s[8:9], 3
	s_add_u32 s4, s4, s8
	s_addc_u32 s5, s5, s9
	s_ashr_i32 s9, s3, 31
	s_mov_b32 s8, s3
	s_lshl_b64 s[2:3], s[8:9], 3
	s_add_u32 s2, s6, s2
	v_mov_b64_e32 v[0:1], s[4:5]
	s_addc_u32 s3, s7, s3
	flat_load_dwordx2 v[0:1], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
	s_load_dwordx4 s[4:7], s[0:1], 0x58
	global_load_dwordx2 v[2:3], v4, s[2:3] sc0 sc1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_le_u64_e32 vcc, s[4:5], v[2:3]
	buffer_inv sc1
	s_cbranch_vccnz .LBB5_2
.LBB5_1:                                ; =>This Inner Loop Header: Depth=1
	global_load_dwordx2 v[2:3], v4, s[2:3] sc0 sc1
	s_sleep 1
	s_waitcnt vmcnt(0)
	v_cmp_gt_u64_e32 vcc, s[4:5], v[2:3]
	s_cbranch_vccnz .LBB5_1
.LBB5_2:
	v_mov_b32_e32 v4, 0
	v_lshl_add_u64 v[0:1], v[2:3], 0, v[0:1]
	buffer_inv sc1
	global_store_dwordx2 v4, v[0:1], s[6:7]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z17k_poll_vs_depwait13RuntimeConfigiiyPy
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 104
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 5
		.amdhsa_next_free_sgpr 10
		.amdhsa_accum_offset 8
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end5:
	.size	_Z17k_poll_vs_depwait13RuntimeConfigiiyPy, .Lfunc_end5-_Z17k_poll_vs_depwait13RuntimeConfigiiyPy
                                        ; -- End function
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.num_vgpr, 5
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.num_agpr, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.numbered_sgpr, 10
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.num_named_barrier, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.private_seg_size, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.uses_vcc, 1
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.uses_flat_scratch, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.has_dyn_sized_stack, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.has_recursion, 0
	.set _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 180
; TotalNumSgprs: 16
; NumVgprs: 5
; NumAgprs: 0
; TotalNumVgprs: 5
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 16
; NumVGPRsForWavesPerEU: 5
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.set amdgpu.max_num_named_barrier, 0
	.text
	.type	__hip_cuid_12b089d14ba5fcaa,@object ; @__hip_cuid_12b089d14ba5fcaa
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_12b089d14ba5fcaa
__hip_cuid_12b089d14ba5fcaa:
	.byte	0                               ; 0x0
	.size	__hip_cuid_12b089d14ba5fcaa, 1

	.hidden	_Z18_execute_gang_taskPvRK13RuntimeConfigi
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_12b089d14ba5fcaa
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           80
        .value_kind:     by_value
      - .offset:         80
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         88
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 96
    .max_flat_workgroup_size: 1024
    .name:           _Z14k_xcd_identity13RuntimeConfigiPi
    .private_segment_fixed_size: 0
    .sgpr_count:     18
    .sgpr_spill_count: 0
    .symbol:         _Z14k_xcd_identity13RuntimeConfigiPi.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     3
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           80
        .value_kind:     by_value
      - .offset:         80
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         88
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         96
        .size:           8
        .value_kind:     global_buffer
      - .offset:         104
        .size:           8
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 112
    .max_flat_workgroup_size: 1024
    .name:           _Z16k_gang_broadcast13RuntimeConfigiPiPyy
    .private_segment_fixed_size: 0
    .sgpr_count:     32
    .sgpr_spill_count: 0
    .symbol:         _Z16k_gang_broadcast13RuntimeConfigiPiPyy.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     16
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           80
        .value_kind:     by_value
      - .address_space:  global
        .offset:         80
        .size:           8
        .value_kind:     global_buffer
      - .offset:         88
        .size:           4
        .value_kind:     by_value
      - .offset:         92
        .size:           4
        .value_kind:     by_value
      - .offset:         96
        .size:           4
        .value_kind:     by_value
      - .offset:         100
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         104
        .size:           8
        .value_kind:     global_buffer
      - .offset:         112
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         116
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         120
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         124
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         126
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         128
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         130
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         132
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         134
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         152
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         160
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         168
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         176
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         192
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         200
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         208
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         216
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         224
        .size:           8
        .value_kind:     hidden_completion_action
      - .offset:         312
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 368
    .max_flat_workgroup_size: 1024
    .name:           _Z12k_gang_strip13RuntimeConfigPviiiiPi
    .private_segment_fixed_size: 96
    .sgpr_count:     74
    .sgpr_spill_count: 0
    .symbol:         _Z12k_gang_strip13RuntimeConfigPviiiiPi.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: true
    .vgpr_count:     41
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           80
        .value_kind:     by_value
      - .offset:         80
        .size:           4
        .value_kind:     by_value
      - .offset:         84
        .size:           4
        .value_kind:     by_value
      - .offset:         88
        .size:           4
        .value_kind:     by_value
      - .offset:         92
        .size:           4
        .value_kind:     by_value
      - .offset:         96
        .size:           4
        .value_kind:     by_value
      - .offset:         104
        .size:           8
        .value_kind:     by_value
      - .address_space:  global
        .offset:         112
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 120
    .max_flat_workgroup_size: 1024
    .name:           _Z18k_two_level_signal13RuntimeConfigiiiiiyPi
    .private_segment_fixed_size: 0
    .sgpr_count:     26
    .sgpr_spill_count: 0
    .symbol:         _Z18k_two_level_signal13RuntimeConfigiiiiiyPi.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     4
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           4
        .value_kind:     by_value
      - .offset:         4
        .size:           4
        .value_kind:     by_value
      - .offset:         8
        .size:           4
        .value_kind:     by_value
      - .offset:         12
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 32
    .max_flat_workgroup_size: 1024
    .name:           _Z18k_mmajor_traversaliiiiPiS_
    .private_segment_fixed_size: 0
    .sgpr_count:     19
    .sgpr_spill_count: 0
    .symbol:         _Z18k_mmajor_traversaliiiiPiS_.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     3
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           80
        .value_kind:     by_value
      - .offset:         80
        .size:           4
        .value_kind:     by_value
      - .offset:         84
        .size:           4
        .value_kind:     by_value
      - .offset:         88
        .size:           8
        .value_kind:     by_value
      - .address_space:  global
        .offset:         96
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 104
    .max_flat_workgroup_size: 1024
    .name:           _Z17k_poll_vs_depwait13RuntimeConfigiiyPy
    .private_segment_fixed_size: 0
    .sgpr_count:     16
    .sgpr_spill_count: 0
    .symbol:         _Z17k_poll_vs_depwait13RuntimeConfigiiyPy.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     5
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
