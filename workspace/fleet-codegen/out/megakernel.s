	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.amdhsa_code_object_version 6
	.text
	.protected	_Z11init_kernelN6mirage7runtime13RuntimeConfigE ; -- Begin function _Z11init_kernelN6mirage7runtime13RuntimeConfigE
	.globl	_Z11init_kernelN6mirage7runtime13RuntimeConfigE
	.p2align	8
	.type	_Z11init_kernelN6mirage7runtime13RuntimeConfigE,@function
_Z11init_kernelN6mirage7runtime13RuntimeConfigE: ; @_Z11init_kernelN6mirage7runtime13RuntimeConfigE
; %bb.0:
	v_cmp_eq_u32_e32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB0_10
; %bb.1:
	s_load_dwordx2 s[2:3], s[0:1], 0x100
	s_load_dword s17, s[0:1], 0x108
	s_load_dwordx4 s[12:15], s[0:1], 0xb8
	s_load_dwordx8 s[4:11], s[0:1], 0xe0
	s_waitcnt lgkmcnt(0)
	s_cmp_lt_i32 s17, 1
	s_cbranch_scc1 .LBB0_9
; %bb.2:
	s_load_dwordx2 s[0:1], s[0:1], 0x80
	s_cmp_eq_u32 s17, 1
	s_cbranch_scc1 .LBB0_6
; %bb.3:
	s_and_b32 s16, s17, 0x7ffffffe
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, v0
	s_waitcnt lgkmcnt(0)
	s_mov_b64 s[18:19], s[0:1]
	s_mov_b32 s20, s16
.LBB0_4:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s20, s20, -2
	global_store_dwordx2 v0, v[0:1], s[18:19]
	s_add_u32 s18, s18, 8
	s_addc_u32 s19, s19, 0
	s_cmp_lg_u32 s20, 0
	s_cbranch_scc1 .LBB0_4
; %bb.5:
	s_cmp_lg_u32 s17, s16
	s_cselect_b64 s[18:19], -1, 0
	s_and_b64 vcc, exec, s[18:19]
	s_cbranch_vccnz .LBB0_7
	s_branch .LBB0_9
.LBB0_6:
	s_mov_b32 s16, 0
	s_cbranch_execz .LBB0_9
.LBB0_7:
	s_sub_i32 s18, s17, s16
	s_mov_b32 s17, 0
	s_lshl_b64 s[16:17], s[16:17], 2
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, s1, s17
	v_mov_b32_e32 v0, 0
.LBB0_8:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s18, s18, -1
	global_store_dword v0, v0, s[0:1]
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_eq_u32 s18, 0
	s_cbranch_scc0 .LBB0_8
.LBB0_9:
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, -1
	global_store_dword v0, v0, s[2:3]
	global_store_dword v0, v1, s[4:5]
	global_store_dword v0, v0, s[12:13]
	global_store_dword v0, v0, s[14:15]
	global_store_dword v0, v0, s[12:13] offset:4
	global_store_dword v0, v0, s[14:15] offset:4
	global_store_dword v0, v0, s[8:9]
	v_mov_b32_e32 v1, 16
	global_store_dword v0, v1, s[10:11]
	v_mov_b32_e32 v1, 1
	v_mov_b32_e32 v2, 2
	v_mov_b32_e32 v3, 3
	global_store_dwordx4 v0, v[0:3], s[6:7]
	v_mov_b32_e32 v4, 6
	v_mov_b32_e32 v5, 7
	v_mov_b32_e32 v2, 4
	v_mov_b32_e32 v3, 5
	global_store_dwordx4 v0, v[2:5], s[6:7] offset:16
	s_nop 1
	v_mov_b32_e32 v2, 8
	v_mov_b32_e32 v3, 9
	v_mov_b32_e32 v4, 10
	v_mov_b32_e32 v5, 11
	global_store_dwordx4 v0, v[2:5], s[6:7] offset:32
	s_nop 1
	v_mov_b32_e32 v2, 12
	v_mov_b32_e32 v3, 13
	v_mov_b32_e32 v4, 14
	v_mov_b32_e32 v5, 15
	global_store_dwordx4 v0, v[2:5], s[6:7] offset:48
.LBB0_10:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z11init_kernelN6mirage7runtime13RuntimeConfigE
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 432
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
		.amdhsa_next_free_vgpr 6
		.amdhsa_next_free_sgpr 21
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
.Lfunc_end0:
	.size	_Z11init_kernelN6mirage7runtime13RuntimeConfigE, .Lfunc_end0-_Z11init_kernelN6mirage7runtime13RuntimeConfigE
                                        ; -- End function
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr, 6
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr, 21
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.num_named_barrier, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.private_seg_size, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, 1
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.has_dyn_sized_stack, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.has_recursion, 0
	.set _Z11init_kernelN6mirage7runtime13RuntimeConfigE.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 392
; TotalNumSgprs: 27
; NumVgprs: 6
; NumAgprs: 0
; TotalNumVgprs: 6
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 27
; NumVGPRsForWavesPerEU: 6
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
	.protected	_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi ; -- Begin function _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
	.globl	_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
	.p2align	8
	.type	_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi,@function
_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi: ; @_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
; %bb.0:
	s_load_dwordx2 s[36:37], s[2:3], 0x168
	s_load_dword s5, s[2:3], 0x1c4
	s_load_dwordx4 s[24:27], s[2:3], 0x0
	s_load_dwordx8 s[8:15], s[2:3], 0x30
	s_load_dwordx2 s[34:35], s[2:3], 0x70
	s_load_dwordx8 s[16:23], s[2:3], 0x148
	s_waitcnt lgkmcnt(0)
	s_and_b32 s27, s5, 0xffff
	s_mul_i32 s5, s4, s27
	v_add_u32_e32 v2, s5, v0
	s_lshl_b32 s5, s24, 1
	v_cmp_gt_i32_e32 vcc, s5, v2
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB1_3
; %bb.1:
	s_load_dword s30, s[0:1], 0xc
	v_mov_b32_e32 v4, 0
	s_mov_b64 s[28:29], 0
	v_mov_b32_e32 v5, v4
	v_mov_b32_e32 v6, v2
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s30, s30, s27
.LBB1_2:                                ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[8:9]
	v_add_u32_e32 v6, s30, v6
	v_cmp_le_i32_e32 vcc, s5, v6
	s_or_b64 s[28:29], vcc, s[28:29]
	global_store_dwordx2 v[8:9], v[4:5], off
	s_andn2_b64 exec, exec, s[28:29]
	s_cbranch_execnz .LBB1_2
.LBB1_3:
	s_or_b64 exec, exec, s[6:7]
	s_load_dword s5, s[2:3], 0x18
	s_load_dwordx4 s[28:31], s[2:3], 0x130
	s_load_dword s33, s[2:3], 0x140
	s_add_i32 s25, s26, s25
	v_cmp_ge_i32_e32 vcc, s25, v2
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB1_6
; %bb.4:
	s_load_dword s26, s[0:1], 0xc
	s_mov_b32 s38, 0
	s_mov_b32 s39, s38
	s_mov_b64 s[8:9], 0
	v_mov_b64_e32 v[6:7], s[38:39]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s26, s26, s27
	v_mov_b32_e32 v4, v2
.LBB1_5:                                ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[8:9], 3, v[4:5]
	v_add_u32_e32 v4, s26, v4
	v_cmp_lt_i32_e32 vcc, s25, v4
	v_lshl_add_u64 v[10:11], s[10:11], 0, v[8:9]
	v_lshl_add_u64 v[8:9], s[12:13], 0, v[8:9]
	s_or_b64 s[8:9], vcc, s[8:9]
	global_store_dwordx2 v[10:11], v[6:7], off
	global_store_dwordx2 v[8:9], v[6:7], off
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz .LBB1_5
.LBB1_6:
	s_or_b64 exec, exec, s[6:7]
	s_waitcnt lgkmcnt(0)
	v_cmp_gt_i32_e32 vcc, s5, v2
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB1_9
; %bb.7:
	s_load_dword s25, s[0:1], 0xc
	v_mov_b32_e32 v4, 0
	s_mov_b64 s[8:9], 0
	v_mov_b32_e32 v5, v4
	v_mov_b32_e32 v6, v2
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s25, s25, s27
.LBB1_8:                                ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[14:15]
	v_add_u32_e32 v6, s25, v6
	v_cmp_le_i32_e32 vcc, s5, v6
	s_or_b64 s[8:9], vcc, s[8:9]
	global_store_dwordx2 v[8:9], v[4:5], off
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz .LBB1_8
.LBB1_9:
	s_or_b64 exec, exec, s[6:7]
	s_mul_i32 s5, s33, s5
	s_cmp_lg_u64 s[28:29], 0
	v_cmp_gt_i32_e32 vcc, s5, v2
	s_cbranch_scc0 .LBB1_14
; %bb.10:
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB1_13
; %bb.11:
	s_load_dword s14, s[0:1], 0xc
	v_mov_b32_e32 v4, 0
	s_mov_b64 s[8:9], 0
	v_mov_b32_e32 v5, v4
	v_mov_b32_e32 v6, v2
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s14, s14, s27
.LBB1_12:                               ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[28:29]
	v_add_u32_e32 v6, s14, v6
	v_cmp_le_i32_e32 vcc, s5, v6
	s_or_b64 s[8:9], vcc, s[8:9]
	global_store_dwordx2 v[8:9], v[4:5], off
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz .LBB1_12
.LBB1_13:
	s_or_b64 exec, exec, s[6:7]
.LBB1_14:
	s_cmp_lg_u64 s[30:31], 0
	s_cselect_b64 s[6:7], -1, 0
	v_cmp_gt_i32_e32 vcc, s33, v2
	s_and_b64 s[8:9], s[6:7], vcc
	s_and_saveexec_b64 s[6:7], s[8:9]
	s_cbranch_execz .LBB1_17
; %bb.15:
	s_load_dword s14, s[0:1], 0xc
	s_mov_b64 s[8:9], 0
	v_mov_b32_e32 v1, -1
	v_mov_b32_e32 v4, v2
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s14, s14, s27
.LBB1_16:                               ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshl_add_u64 v[6:7], v[4:5], 2, s[30:31]
	v_add_u32_e32 v4, s14, v4
	v_cmp_le_i32_e32 vcc, s33, v4
	s_or_b64 s[8:9], vcc, s[8:9]
	global_store_dword v[6:7], v1, off
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz .LBB1_16
.LBB1_17:
	s_or_b64 exec, exec, s[6:7]
	s_cmp_lg_u64 s[16:17], 0
	s_cselect_b64 s[8:9], -1, 0
	v_cmp_gt_i32_e32 vcc, s24, v2
	s_mov_b64 s[6:7], 0
	s_and_b64 s[14:15], s[8:9], vcc
	s_and_saveexec_b64 s[8:9], s[14:15]
	s_cbranch_execz .LBB1_20
; %bb.18:
	s_load_dword s14, s[0:1], 0xc
	v_mov_b32_e32 v1, -1
	v_mov_b32_e32 v4, v2
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s14, s14, s27
.LBB1_19:                               ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshl_add_u64 v[6:7], v[4:5], 2, s[16:17]
	v_add_u32_e32 v4, s14, v4
	v_cmp_le_i32_e32 vcc, s24, v4
	s_or_b64 s[6:7], vcc, s[6:7]
	global_store_dword v[6:7], v1, off
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz .LBB1_19
.LBB1_20:
	s_or_b64 exec, exec, s[8:9]
	s_cmp_lg_u64 s[18:19], 0
	v_or_b32_e32 v1, s4, v0
	s_cselect_b64 s[6:7], -1, 0
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_and_b64 s[8:9], vcc, s[6:7]
	s_and_saveexec_b64 s[6:7], s[8:9]
	s_cbranch_execz .LBB1_22
; %bb.21:
	v_mov_b32_e32 v1, 0
	global_store_dword v1, v1, s[18:19]
.LBB1_22:
	s_or_b64 exec, exec, s[6:7]
	s_cmp_eq_u64 s[20:21], 0
	s_cbranch_scc1 .LBB1_27
; %bb.23:
	v_cmp_gt_i32_e64 s[6:7], s5, v2
	s_and_saveexec_b64 s[8:9], s[6:7]
	s_cbranch_execz .LBB1_26
; %bb.24:
	s_load_dword s14, s[0:1], 0xc
	s_mov_b64 s[6:7], 0
	v_mov_b32_e32 v1, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s14, s14, s27
.LBB1_25:                               ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshl_add_u64 v[4:5], v[2:3], 2, s[20:21]
	v_add_u32_e32 v2, s14, v2
	v_cmp_le_i32_e64 s[0:1], s5, v2
	s_or_b64 s[6:7], s[0:1], s[6:7]
	global_store_dword v[4:5], v1, off
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz .LBB1_25
.LBB1_26:
	s_or_b64 exec, exec, s[8:9]
.LBB1_27:
	s_cmp_lg_u64 s[22:23], 0
	s_cselect_b64 s[0:1], -1, 0
	s_cmp_eq_u32 s4, 0
	s_cselect_b64 s[4:5], -1, 0
	s_and_b64 s[4:5], s[4:5], s[0:1]
	v_cmp_gt_i32_e64 s[0:1], s33, v0
	s_mov_b64 s[6:7], 0
	s_and_b64 s[0:1], s[4:5], s[0:1]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB1_30
; %bb.28:
	v_mov_b32_e32 v2, -1
.LBB1_29:                               ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[4:5], v[0:1], 2, s[22:23]
	v_add_u32_e32 v0, s27, v0
	v_cmp_le_i32_e64 s[0:1], s33, v0
	s_or_b64 s[6:7], s[0:1], s[6:7]
	global_store_dword v[4:5], v2, off
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz .LBB1_29
.LBB1_30:
	s_or_b64 exec, exec, s[4:5]
	s_cmp_lg_u64 s[36:37], 0
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 s[4:5], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[4:5]
	s_cbranch_execnz .LBB1_33
; %bb.31:
	s_or_b64 exec, exec, s[0:1]
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execnz .LBB1_34
.LBB1_32:
	s_endpgm
.LBB1_33:
	v_mov_b32_e32 v0, 0
	global_store_dword v0, v0, s[36:37]
	s_or_b64 exec, exec, s[0:1]
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB1_32
.LBB1_34:
	s_load_dword s4, s[2:3], 0x1b0
	s_mov_b64 s[0:1], 1
	s_load_dwordx2 s[2:3], s[34:35], 0x0
	v_mov_b32_e32 v2, 0
	v_mov_b64_e32 v[4:5], s[0:1]
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s5, s4, 31
	v_mov_b32_e32 v0, s4
	v_mov_b32_e32 v1, s5
	global_store_dwordx2 v2, v[4:5], s[12:13]
	global_store_dwordx2 v2, v[0:1], s[2:3]
	global_store_dwordx2 v2, v[4:5], s[10:11]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 696
		.amdhsa_user_sgpr_count 4
		.amdhsa_user_sgpr_dispatch_ptr 1
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
		.amdhsa_next_free_vgpr 12
		.amdhsa_next_free_sgpr 40
		.amdhsa_accum_offset 12
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
	.size	_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi, .Lfunc_end1-_Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
                                        ; -- End function
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.num_vgpr, 12
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.num_agpr, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.numbered_sgpr, 40
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.num_named_barrier, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.private_seg_size, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.uses_vcc, 1
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.uses_flat_scratch, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.has_dyn_sized_stack, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.has_recursion, 0
	.set _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 1056
; TotalNumSgprs: 46
; NumVgprs: 12
; NumAgprs: 0
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 46
; NumVGPRsForWavesPerEU: 12
; AccumOffset: 12
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 4
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 2
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE ; -- Begin function _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
	.globl	_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
	.p2align	8
	.type	_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE,@function
_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE: ; @_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
; %bb.0:
                                        ; implicit-def: $vgpr124 : SGPR spill to VGPR lane
	v_mov_b32_e32 v44, v0
	v_writelane_b32 v124, s10, 0
	v_writelane_b32 v124, s9, 1
	v_writelane_b32 v124, s6, 2
	s_mov_b32 s54, s8
	s_mov_b64 s[44:45], s[4:5]
	v_writelane_b32 v124, s7, 3
	v_writelane_b32 v124, s2, 4
	v_and_b32_e32 v46, 0x3ff, v44
	s_movk_i32 s32, 0x610
	v_writelane_b32 v124, s3, 5
	v_writelane_b32 v124, s0, 6
	v_cmp_eq_u32_e64 s[2:3], 0, v46
	s_nop 0
	v_writelane_b32 v124, s1, 7
	s_mov_b64 s[0:1], exec
	v_writelane_b32 v124, s2, 8
	s_nop 1
	v_writelane_b32 v124, s3, 9
	s_and_b64 s[2:3], s[0:1], s[2:3]
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB2_6
; %bb.1:
	s_load_dwordx2 s[2:3], s[44:45], 0x160
	;;#ASMSTART
	s_getreg_b32 s4, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	s_ashr_i32 s5, s4, 31
	s_lshl_b64 s[6:7], s[4:5], 2
	v_mov_b32_e32 v2, 0
	s_waitcnt lgkmcnt(0)
	s_add_u32 s2, s2, s6
	s_addc_u32 s3, s3, s7
	v_mov_b32_e32 v0, s54
	v_mov_b32_e32 v1, -1
	global_atomic_cmpswap v1, v2, v[0:1], s[2:3] sc0
	v_mov_b32_e32 v0, s4
	s_waitcnt vmcnt(0)
	v_cmp_ne_u32_e32 vcc, -1, v1
	v_mov_b32_e32 v1, 1
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB2_5
; %bb.2:
	s_mov_b64 s[6:7], exec
	v_mbcnt_lo_u32_b32 v0, s6, 0
	v_mbcnt_hi_u32_b32 v0, s7, v0
	v_cmp_eq_u32_e32 vcc, 0, v0
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_4
; %bb.3:
	s_load_dwordx2 s[8:9], s[44:45], 0x168
	s_bcnt1_i32_b64 s6, s[6:7]
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v2, s6
	s_waitcnt lgkmcnt(0)
	global_atomic_add v1, v1, v2, s[8:9] sc0
.LBB2_4:
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v1
	v_mov_b32_e32 v1, 0
	s_nop 0
	v_add_u32_e32 v0, s4, v0
.LBB2_5:
	s_or_b64 exec, exec, s[2:3]
	v_mov_b32_e32 v2, 0x80c
	ds_write2_b32 v2, v0, v1 offset1:1
.LBB2_6:
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	s_mov_b64 s[34:35], exec
	v_readlane_b32 s0, v124, 8
	v_readlane_b32 s1, v124, 9
	s_and_b64 s[0:1], s[34:35], s[0:1]
	s_mov_b64 exec, s[0:1]
	s_cbranch_execz .LBB2_9
; %bb.7:
	v_mov_b32_e32 v0, 0
	;;#ASMSTART
	s_getreg_b32 s33, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	ds_read_b32 v1, v0 offset:2064
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 1, v1
	s_cbranch_vccnz .LBB2_9
; %bb.8:
	s_add_u32 s52, s44, 0x1b0
	s_addc_u32 s53, s45, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	ds_read_b32 v40, v0 offset:2060
	v_readlane_b32 s68, v124, 6
	v_readlane_b32 s66, v124, 4
	v_readlane_b32 s48, v124, 2
	v_readlane_b32 s69, v124, 7
	v_readlane_b32 s67, v124, 5
	v_readlane_b32 s49, v124, 3
	v_readlane_b32 s39, v124, 1
	v_readlane_b32 s38, v124, 0
	s_mov_b64 s[4:5], s[68:69]
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s39
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	s_mov_b64 s[64:65], s[44:45]
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str@rel32@lo+4
	s_addc_u32 s1, s1, .L.str@rel32@hi+12
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s15, 55, 0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[4:5], s[68:69]
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s39
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s15
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[36:37], s[0:1], 0x0
	s_mov_b64 s[4:5], s[68:69]
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s39
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s54
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[36:37]
	s_mov_b64 s[4:5], s[68:69]
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s39
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s33
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[36:37]
	s_mov_b64 s[4:5], s[68:69]
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s39
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v40
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 1
	s_swappc_b64 s[30:31], s[36:37]
	s_mov_b64 s[44:45], s[64:65]
.LBB2_9:
	s_or_b64 exec, exec, s[34:35]
	v_mov_b32_e32 v0, 0
	s_barrier
	ds_read_b32 v0, v0 offset:2064
	s_load_dwordx4 s[56:59], s[44:45], 0x0
                                        ; implicit-def: $vgpr109 : SGPR spill to VGPR lane
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 0, v0
	s_cbranch_vccz .LBB2_22
; %bb.10:
	s_mov_b64 s[46:47], exec
	v_readlane_b32 s0, v124, 8
	v_readlane_b32 s1, v124, 9
	s_and_b64 s[0:1], s[46:47], s[0:1]
	s_mov_b64 exec, s[0:1]
	s_cbranch_execz .LBB2_318
; %bb.11:
	v_mov_b32_e32 v0, 0
	ds_read_b32 v1, v0 offset:2060
	s_load_dwordx8 s[80:87], s[44:45], 0x58
	s_mov_b32 s55, 0
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s0, v1
	s_cmp_lt_i32 s0, 0
	s_cselect_b32 s60, s54, s0
	s_ashr_i32 s61, s60, 31
	s_lshl_b64 s[50:51], s[60:61], 3
	s_add_u32 s0, s86, s50
	s_addc_u32 s1, s87, s51
	global_load_dwordx2 v[76:77], v0, s[0:1]
	s_load_dwordx8 s[64:71], s[44:45], 0x20
	s_load_dwordx2 s[62:63], s[44:45], 0x40
	s_load_dwordx8 s[72:79], s[44:45], 0x80
	s_load_dwordx2 s[88:89], s[44:45], 0x158
	s_load_dwordx4 s[0:3], s[44:45], 0x148
	s_cmp_lt_i32 s60, s57
	s_cselect_b64 s[90:91], -1, 0
	s_cmp_ge_i32 s60, s57
	s_cbranch_scc0 .LBB2_23
; %bb.12:
	s_sub_i32 s4, s60, s57
	s_cmp_ge_i32 s4, s56
	s_mov_b32 s33, 0
	s_cbranch_scc1 .LBB2_21
; %bb.13:
	v_cvt_f32_u32_e32 v0, s58
	s_add_i32 s5, s60, s58
	s_sub_i32 s6, s5, s57
	s_max_i32 s6, s56, s6
	v_rcp_iflag_f32_e32 v0, v0
	s_add_i32 s8, s57, s6
	s_cmp_lg_u32 s8, s5
	s_cselect_b64 s[6:7], -1, 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_addc_u32 s5, s58, s60
	s_sub_i32 s9, 0, s58
	s_sub_i32 s5, s8, s5
	v_readfirstlane_b32 s10, v0
	s_mul_i32 s9, s9, s10
	s_mul_hi_u32 s9, s10, s9
	s_add_i32 s10, s10, s9
	s_mul_hi_u32 s9, s5, s10
	s_mul_i32 s10, s9, s58
	s_sub_i32 s5, s5, s10
	s_add_i32 s10, s9, 1
	s_sub_i32 s11, s5, s58
	s_cmp_ge_u32 s5, s58
	s_cselect_b32 s9, s10, s9
	s_cselect_b32 s5, s11, s5
	s_add_i32 s10, s9, 1
	s_cmp_ge_u32 s5, s58
	s_cselect_b32 s5, s10, s9
	s_cmp_lg_u64 s[6:7], 0
	s_addc_u32 s33, s5, 1
	s_mov_b32 s8, 0
	s_cmp_lt_u32 s33, 2
	s_mov_b64 s[6:7], -1
	s_cbranch_scc1 .LBB2_17
; %bb.14:
	s_and_b32 s8, s33, -2
	s_add_i32 s5, s4, s58
	s_lshl_b32 s11, s58, 1
	s_mov_b32 s9, s56
	s_mov_b32 s10, s56
	s_mov_b32 s12, s11
	s_mov_b32 s13, 0
	s_mov_b32 s14, s8
	s_mov_b64 s[6:7], s[4:5]
.LBB2_15:                               ; =>This Inner Loop Header: Depth=1
	s_add_i32 s5, s7, s10
	s_add_i32 s15, s6, s9
	v_mov_b32_e32 v0, s15
	v_mov_b32_e32 v1, s5
	s_add_i32 s7, s7, s12
	s_add_i32 s6, s6, s11
	s_add_i32 s14, s14, -2
	scratch_store_dwordx2 off, v[0:1], s13
	s_add_i32 s13, s13, 8
	s_cmp_lg_u32 s14, 0
	s_cbranch_scc1 .LBB2_15
; %bb.16:
	s_mul_i32 s5, s8, s58
	s_add_i32 s4, s4, s5
	s_cmp_lg_u32 s33, s8
	s_cselect_b64 s[6:7], -1, 0
.LBB2_17:
	s_and_b64 vcc, exec, s[6:7]
	s_cbranch_vccz .LBB2_21
; %bb.18:
	s_lshl2_add_u32 s5, s8, 0
.LBB2_19:                               ; =>This Inner Loop Header: Depth=1
	s_add_i32 s6, s56, s4
	v_mov_b32_e32 v0, s6
	s_add_i32 s8, s8, 1
	s_add_i32 s4, s4, s58
	scratch_store_dword off, v0, s5
	s_add_i32 s5, s5, 4
	s_cmp_lt_i32 s4, s56
	s_cbranch_scc1 .LBB2_19
; %bb.20:
	s_mov_b32 s33, s8
.LBB2_21:
	s_mov_b64 s[4:5], 0
	s_branch .LBB2_24
.LBB2_22:
	s_branch .LBB2_319
.LBB2_23:
	s_mov_b64 s[4:5], -1
                                        ; implicit-def: $sgpr33
.LBB2_24:
	s_add_i32 s92, s58, s57
	v_mov_b64_e32 v[78:79], 0
	s_andn2_b64 vcc, exec, s[4:5]
	s_mov_b32 s97, 0
	s_mov_b32 s52, 0
	s_cbranch_vccnz .LBB2_50
; %bb.25:
	s_ashr_i32 s93, s92, 31
	s_lshl_b64 s[4:5], s[92:93], 3
	s_add_u32 s4, s86, s4
	s_addc_u32 s5, s87, s5
	v_mov_b32_e32 v0, 0
	global_load_dwordx2 v[78:79], v0, s[4:5]
	s_waitcnt lgkmcnt(0)
	s_cmp_eq_u64 s[0:1], 0
	s_cbranch_scc1 .LBB2_39
; %bb.26:
	v_mbcnt_lo_u32_b32 v0, exec_lo, 0
	v_mbcnt_hi_u32_b32 v0, exec_hi, v0
	v_cmp_eq_u32_e32 vcc, 0, v0
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_28
; %bb.27:
	v_mov_b32_e32 v0, 0
	global_load_dword v0, v0, s[2:3] sc1
.LBB2_28:
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v0
	s_cmp_ge_i32 s4, s56
	s_cbranch_scc1 .LBB2_33
; %bb.29:
	v_mov_b32_e32 v0, 0
	s_branch .LBB2_31
.LBB2_30:                               ;   in Loop: Header=BB2_31 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v1
	s_cmp_lt_i32 s4, s56
	s_cbranch_scc0 .LBB2_33
.LBB2_31:                               ; =>This Inner Loop Header: Depth=1
	v_mbcnt_lo_u32_b32 v1, exec_lo, 0
	v_mbcnt_hi_u32_b32 v1, exec_hi, v1
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_sleep 1
	s_sleep 1
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_30
; %bb.32:                               ;   in Loop: Header=BB2_31 Depth=1
	global_load_dword v1, v0, s[2:3] sc1
	s_branch .LBB2_30
.LBB2_33:
	s_cmp_lt_i32 s56, 1
	s_mov_b32 s33, 0
	buffer_wbl2 sc1
	;;#ASMSTART
	s_getreg_b32 s48, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	s_cbranch_scc1 .LBB2_38
; %bb.34:
	v_mov_b32_e32 v0, 0
	s_mov_b32 s2, 0
	s_branch .LBB2_36
.LBB2_35:                               ;   in Loop: Header=BB2_36 Depth=1
	s_add_i32 s2, s2, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_eq_u32 s56, s2
	s_cbranch_scc1 .LBB2_38
.LBB2_36:                               ; =>This Inner Loop Header: Depth=1
	global_load_dword v1, v0, s[0:1]
	s_waitcnt vmcnt(0)
	v_cmp_ne_u32_e32 vcc, s48, v1
	s_cbranch_vccnz .LBB2_35
; %bb.37:                               ;   in Loop: Header=BB2_36 Depth=1
	s_lshl_b32 s3, s33, 2
	s_add_i32 s33, s33, 1
	v_mov_b32_e32 v1, s2
	scratch_store_dword off, v1, s3
	s_branch .LBB2_35
.LBB2_38:
	v_writelane_b32 v109, s92, 38
	s_add_u32 s52, s44, 0x1b0
	s_addc_u32 s53, s45, 0
	v_writelane_b32 v109, s93, 39
	v_writelane_b32 v109, s90, 36
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v109, s91, 37
	v_writelane_b32 v109, s88, 34
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_readlane_b32 s34, v124, 6
	v_writelane_b32 v109, s89, 35
	v_writelane_b32 v109, s72, 26
	s_load_dword s49, s[44:45], 0x18
	v_readlane_b32 s36, v124, 4
	v_writelane_b32 v109, s73, 27
	v_writelane_b32 v109, s74, 28
	v_writelane_b32 v109, s75, 29
	v_writelane_b32 v109, s76, 30
	v_writelane_b32 v109, s77, 31
	v_writelane_b32 v109, s78, 32
	v_writelane_b32 v109, s79, 33
	v_writelane_b32 v109, s62, 24
	v_readlane_b32 s98, v124, 2
	v_readlane_b32 s35, v124, 7
	v_writelane_b32 v109, s63, 25
	v_writelane_b32 v109, s60, 20
	v_readlane_b32 s37, v124, 5
	v_readlane_b32 s99, v124, 3
	v_writelane_b32 v109, s61, 21
	v_writelane_b32 v109, s46, 22
	s_mov_b32 s12, s54
	v_readlane_b32 s55, v124, 1
	v_writelane_b32 v109, s47, 23
	v_writelane_b32 v109, s56, 6
	s_mov_b32 s96, s54
	v_readlane_b32 s54, v124, 0
	v_writelane_b32 v109, s57, 7
	v_writelane_b32 v109, s58, 8
	v_writelane_b32 v109, s59, 9
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	v_writelane_b32 v109, s44, 4
	s_nop 1
	v_writelane_b32 v109, s45, 5
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.4@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.4@rel32@hi+12
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s15, 59, 0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s12, s96
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s15
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[38:39], s[0:1], 0x0
	v_readlane_b32 s0, v109, 20
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s12, s96
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	v_readlane_b32 s1, v109, 21
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s12, s96
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s48
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s12, s96
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s33
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[98:99]
	s_mov_b32 s12, s96
	s_mov_b32 s13, s55
	s_mov_b32 s14, s54
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s96
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 1
	s_mov_b32 s54, s96
	s_swappc_b64 s[30:31], s[38:39]
	v_readlane_b32 s60, v109, 20
	v_readlane_b32 s44, v109, 4
	v_readlane_b32 s56, v109, 6
	v_readlane_b32 s46, v109, 22
	v_readlane_b32 s62, v109, 24
	v_readlane_b32 s72, v109, 26
	v_readlane_b32 s88, v109, 34
	v_readlane_b32 s90, v109, 36
	v_readlane_b32 s92, v109, 38
	v_readlane_b32 s61, v109, 21
	v_readlane_b32 s45, v109, 5
	s_mul_i32 s55, s48, s49
	v_readlane_b32 s57, v109, 7
	v_readlane_b32 s58, v109, 8
	v_readlane_b32 s59, v109, 9
	v_readlane_b32 s47, v109, 23
	v_readlane_b32 s63, v109, 25
	v_readlane_b32 s73, v109, 27
	v_readlane_b32 s74, v109, 28
	v_readlane_b32 s75, v109, 29
	v_readlane_b32 s76, v109, 30
	v_readlane_b32 s77, v109, 31
	v_readlane_b32 s78, v109, 32
	v_readlane_b32 s79, v109, 33
	v_readlane_b32 s89, v109, 35
	v_readlane_b32 s91, v109, 37
	v_readlane_b32 s93, v109, 39
	s_branch .LBB2_49
.LBB2_39:
                                        ; implicit-def: $sgpr33
                                        ; implicit-def: $sgpr55
	s_cbranch_execz .LBB2_49
; %bb.40:
	s_mov_b32 s55, 0
	s_cmp_ge_i32 s60, s56
	s_mov_b32 s33, 0
	s_cbranch_scc1 .LBB2_49
; %bb.41:
	v_cvt_f32_u32_e32 v0, s57
	s_add_i32 s1, s60, s57
	s_max_i32 s0, s56, s1
	s_cmp_lt_i32 s1, s56
	v_rcp_iflag_f32_e32 v0, v0
	s_cselect_b64 s[2:3], -1, 0
	s_addc_u32 s5, s60, s57
	s_sub_i32 s6, 0, s57
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_sub_i32 s0, s0, s5
	s_mov_b32 s4, 0
	v_readfirstlane_b32 s5, v0
	s_mul_i32 s6, s6, s5
	s_mul_hi_u32 s6, s5, s6
	s_add_i32 s5, s5, s6
	s_mul_hi_u32 s5, s0, s5
	s_mul_i32 s6, s5, s57
	s_sub_i32 s0, s0, s6
	s_add_i32 s7, s5, 1
	s_sub_i32 s6, s0, s57
	s_cmp_ge_u32 s0, s57
	s_cselect_b32 s5, s7, s5
	s_cselect_b32 s0, s6, s0
	s_add_i32 s6, s5, 1
	s_cmp_ge_u32 s0, s57
	s_cselect_b32 s0, s6, s5
	s_cmp_lg_u64 s[2:3], 0
	s_addc_u32 s33, s0, 1
	s_mov_b64 s[2:3], -1
	s_cmp_lt_u32 s33, 2
	s_mov_b32 s0, s60
	s_cbranch_scc1 .LBB2_45
; %bb.42:
	s_and_b32 s4, s33, -2
	s_lshl_b32 s2, s57, 1
	s_mov_b32 s0, s60
	s_mov_b32 s3, s2
	s_mov_b32 s5, 0
	s_mov_b32 s6, s4
.LBB2_43:                               ; =>This Inner Loop Header: Depth=1
	v_mov_b64_e32 v[0:1], s[0:1]
	s_add_i32 s1, s1, s3
	s_add_i32 s0, s0, s2
	s_add_i32 s6, s6, -2
	scratch_store_dwordx2 off, v[0:1], s5
	s_add_i32 s5, s5, 8
	s_cmp_lg_u32 s6, 0
	s_cbranch_scc1 .LBB2_43
; %bb.44:
	s_mul_i32 s0, s4, s57
	s_add_i32 s0, s60, s0
	s_cmp_lg_u32 s33, s4
	s_cselect_b64 s[2:3], -1, 0
.LBB2_45:
	s_and_b64 vcc, exec, s[2:3]
	s_cbranch_vccz .LBB2_49
; %bb.46:
	s_lshl2_add_u32 s1, s4, 0
.LBB2_47:                               ; =>This Inner Loop Header: Depth=1
	v_mov_b32_e32 v0, s0
	s_add_i32 s4, s4, 1
	s_add_i32 s0, s0, s57
	scratch_store_dword off, v0, s1
	s_add_i32 s1, s1, 4
	s_cmp_ge_i32 s0, s56
	s_cbranch_scc0 .LBB2_47
; %bb.48:
	s_mov_b32 s33, s4
.LBB2_49:
	s_mov_b32 s97, 1
	s_mov_b32 s52, s92
.LBB2_50:
	s_waitcnt lgkmcnt(0)
	s_load_dwordx16 s[0:15], s[44:45], 0xb8
	s_cmp_gt_i32 s33, 0
	s_mov_b32 s39, 0
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v124, s0, 10
	s_nop 1
	v_writelane_b32 v124, s1, 11
	v_writelane_b32 v124, s2, 12
	v_writelane_b32 v124, s3, 13
	v_writelane_b32 v124, s4, 14
	v_writelane_b32 v124, s5, 15
	v_writelane_b32 v124, s6, 16
	v_writelane_b32 v124, s7, 17
	v_writelane_b32 v124, s8, 18
	v_writelane_b32 v124, s9, 19
	v_writelane_b32 v124, s10, 20
	v_writelane_b32 v124, s11, 21
	v_writelane_b32 v124, s12, 22
	v_writelane_b32 v124, s13, 23
	v_writelane_b32 v124, s14, 24
	v_writelane_b32 v124, s15, 25
	s_load_dwordx4 s[0:3], s[44:45], 0xf8
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v124, s0, 30
	s_nop 1
	v_writelane_b32 v124, s1, 31
	v_writelane_b32 v124, s2, 32
	v_writelane_b32 v124, s3, 33
	s_cselect_b64 s[0:1], -1, 0
	v_writelane_b32 v124, s0, 62
	s_cmp_lt_i32 s33, 1
	s_nop 0
	v_writelane_b32 v124, s1, 63
	s_cbranch_scc1 .LBB2_53
; %bb.51:
	v_mov_b32_e32 v0, 0
	s_movk_i32 s0, 0x200
	v_mov_b32_e32 v1, v0
	s_mov_b32 s1, s33
.LBB2_52:                               ; =>This Inner Loop Header: Depth=1
	scratch_store_dwordx2 off, v[0:1], s0
	s_add_i32 s1, s1, -1
	s_add_i32 s0, s0, 8
	s_cmp_eq_u32 s1, 0
	s_cbranch_scc0 .LBB2_52
.LBB2_53:
	s_add_u32 s48, s70, s50
	s_addc_u32 s49, s71, s51
	s_ashr_i32 s0, s57, 31
	s_cmp_lg_u64 s[88:89], 0
	v_writelane_b32 v109, s0, 16
	s_cselect_b64 s[0:1], -1, 0
	v_writelane_b32 v109, s0, 2
	s_ashr_i32 s3, s56, 31
	s_mov_b32 s2, s56
	v_writelane_b32 v109, s1, 3
	s_add_u32 s0, s56, -1
	s_addc_u32 s1, s3, -1
	v_writelane_b32 v124, s0, 56
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v42, v40
	v_writelane_b32 v124, s1, 57
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_cmp_gt_i32 s92, 0
	s_cselect_b64 s[4:5], -1, 0
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s0, 54, 0
	s_abs_i32 s53, s33
	v_cvt_f32_u32_e32 v0, s53
	v_writelane_b32 v109, s0, 40
	s_load_dword s0, s[44:45], 0xa8
	s_mul_hi_i32 s1, s60, 0x70
	v_rcp_iflag_f32_e32 v0, v0
	v_writelane_b32 v124, s4, 50
	v_mov_b32_e32 v43, v40
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v109, s0, 10
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_mov_b32 s0, s57
	v_writelane_b32 v109, s0, 0
	v_writelane_b32 v109, s2, 14
	s_sub_i32 s0, 0, s53
	v_mul_lo_u32 v1, s0, v0
	v_writelane_b32 v109, s3, 15
	s_mul_i32 s0, s60, 0x70
	v_writelane_b32 v109, s0, 41
	v_writelane_b32 v124, s5, 51
	v_mul_hi_u32 v1, v0, v1
	v_writelane_b32 v109, s1, 42
	s_load_dwordx16 s[0:15], s[44:45], 0xb8
	v_mov_b32_e32 v41, v40
	v_mov_b64_e32 v[58:59], v[42:43]
	v_mov_b64_e32 v[62:63], v[42:43]
	s_mov_b32 s94, 0
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s4, 32
	s_addc_u32 s1, s5, 0
	v_writelane_b32 v109, s0, 43
	s_mov_b32 s36, s60
	v_add_u32_e32 v45, v0, v1
	v_writelane_b32 v109, s1, 44
	s_add_u32 s0, s80, 8
	s_addc_u32 s1, s81, 0
	v_writelane_b32 v109, s0, 45
	s_movk_i32 s37, 0x70
	v_mov_b64_e32 v[88:89], 0
	v_writelane_b32 v109, s1, 46
	s_mov_b32 s0, 1
	v_mov_b64_e32 v[94:95], 0
	v_mov_b32_e32 v47, -1
	v_mov_b64_e32 v[90:91], 1
	v_mov_b32_e32 v92, 0
	v_mov_b32_e32 v93, v40
	v_mov_b64_e32 v[56:57], v[40:41]
	v_mov_b64_e32 v[60:61], v[40:41]
	v_mov_b32_e32 v43, 0
	v_mov_b32_e32 v108, 0
	v_mov_b32_e32 v42, 0
	v_mov_b64_e32 v[104:105], 0
	s_mov_b64 s[98:99], 0
	v_writelane_b32 v124, s0, 52
	s_mov_b32 s95, 0x412e8480
                                        ; implicit-def: $vgpr110_vgpr111
                                        ; implicit-def: $vgpr120_vgpr121
	s_nop 0
	v_writelane_b32 v124, s1, 53
	s_branch .LBB2_56
.LBB2_54:                               ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b64_e32 v[4:5], v[110:111]
	v_mov_b64_e32 v[0:1], v[120:121]
.LBB2_55:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_readlane_b32 s0, v124, 34
	v_readlane_b32 s1, v124, 35
	s_and_b64 s[0:1], exec, s[0:1]
	s_or_b64 s[98:99], s[0:1], s[98:99]
	v_mov_b64_e32 v[110:111], v[4:5]
	v_mov_b64_e32 v[120:121], v[0:1]
	s_andn2_b64 exec, exec, s[98:99]
	s_cbranch_execz .LBB2_318
.LBB2_56:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_59 Depth 2
                                        ;     Child Loop BB2_89 Depth 2
                                        ;     Child Loop BB2_108 Depth 2
                                        ;     Child Loop BB2_114 Depth 2
                                        ;     Child Loop BB2_119 Depth 2
                                        ;     Child Loop BB2_122 Depth 2
                                        ;     Child Loop BB2_125 Depth 2
                                        ;     Child Loop BB2_130 Depth 2
                                        ;     Child Loop BB2_138 Depth 2
                                        ;     Child Loop BB2_141 Depth 2
                                        ;     Child Loop BB2_144 Depth 2
                                        ;     Child Loop BB2_148 Depth 2
                                        ;       Child Loop BB2_152 Depth 3
                                        ;     Child Loop BB2_158 Depth 2
                                        ;     Child Loop BB2_168 Depth 2
                                        ;       Child Loop BB2_173 Depth 3
                                        ;     Child Loop BB2_201 Depth 2
                                        ;       Child Loop BB2_205 Depth 3
                                        ;     Child Loop BB2_223 Depth 2
                                        ;       Child Loop BB2_228 Depth 3
                                        ;         Child Loop BB2_249 Depth 4
                                        ;     Child Loop BB2_260 Depth 2
                                        ;     Child Loop BB2_286 Depth 2
                                        ;     Child Loop BB2_291 Depth 2
                                        ;     Child Loop BB2_302 Depth 2
                                        ;     Child Loop BB2_314 Depth 2
	v_cmp_eq_u32_e32 vcc, 1, v43
	s_nop 1
	v_cndmask_b32_e32 v107, v61, v63, vcc
	v_cndmask_b32_e32 v106, v60, v62, vcc
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_eq_u64_e32 vcc, v[106:107], v[0:1]
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_66
; %bb.57:                               ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b64 s[2:3], 0
	s_branch .LBB2_59
.LBB2_58:                               ;   in Loop: Header=BB2_59 Depth=2
	s_or_b64 exec, exec, s[4:5]
	s_and_b64 s[4:5], exec, s[6:7]
	s_or_b64 s[2:3], s[4:5], s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB2_65
.LBB2_59:                               ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_cmp_ne_u32_e32 vcc, 0, v43
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz .LBB2_61
; %bb.60:                               ;   in Loop: Header=BB2_59 Depth=2
	v_mov_b32_e32 v0, s36
	v_mov_b32_e32 v1, s52
	v_cmp_eq_u32_e32 vcc, 1, v43
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[70:71]
	;;#ASMSTART
	global_load_dwordx2 v[0:1], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cndmask_b32_e32 v59, v59, v1, vcc
	v_cndmask_b32_e32 v58, v58, v0, vcc
	v_cmp_eq_u32_e32 vcc, 0, v43
	s_nop 1
	v_cndmask_b32_e32 v57, v57, v1, vcc
	v_cndmask_b32_e32 v56, v56, v0, vcc
.LBB2_61:                               ;   in Loop: Header=BB2_59 Depth=2
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execz .LBB2_63
; %bb.62:                               ;   in Loop: Header=BB2_59 Depth=2
	v_mov_b64_e32 v[0:1], s[48:49]
	flat_load_dwordx2 v[56:57], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
.LBB2_63:                               ;   in Loop: Header=BB2_59 Depth=2
	s_or_b64 exec, exec, s[4:5]
	v_cmp_eq_u32_e32 vcc, 1, v43
	s_mov_b64 s[6:7], -1
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_ge_u64_e32 vcc, v[106:107], v[0:1]
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_58
; %bb.64:                               ;   in Loop: Header=BB2_59 Depth=2
	v_add_u32_e32 v0, 1, v43
	v_cmp_ne_u32_e32 vcc, s97, v43
	s_sleep 1
	s_nop 0
	v_cndmask_b32_e32 v43, 0, v0, vcc
	v_cmp_eq_u32_e32 vcc, 1, v43
	s_nop 1
	v_cndmask_b32_e32 v107, v61, v63, vcc
	v_cndmask_b32_e32 v106, v60, v62, vcc
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_ne_u64_e32 vcc, v[106:107], v[0:1]
	s_orn2_b64 s[6:7], vcc, exec
	s_branch .LBB2_58
.LBB2_65:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[2:3]
.LBB2_66:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_cmp_ne_u32_e32 vcc, 0, v43
                                        ; implicit-def: $vgpr2_vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[4:5], exec, s[0:1]
	s_cbranch_execz .LBB2_72
; %bb.67:                               ;   in Loop: Header=BB2_56 Depth=1
	v_or_b32_e32 v41, s67, v107
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	buffer_wbl2 sc1
	s_waitcnt vmcnt(0)
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB2_69
; %bb.68:                               ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v0, s66
	v_cvt_f32_u32_e32 v1, s67
	s_sub_u32 s0, 0, s66
	s_subb_u32 s1, 0, s67
	v_mov_b32_e32 v3, v40
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmac_f32_e32 v0, 0xcf800000, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v1
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[0:1], s[0:1], v106, s2, 0
	v_mul_hi_u32 v2, v106, s3
	v_lshl_add_u64 v[0:1], v[2:3], 0, v[0:1]
	v_mad_u64_u32 v[4:5], s[0:1], v107, s3, 0
	v_add_co_u32_e32 v0, vcc, v0, v4
	v_mad_u64_u32 v[2:3], s[0:1], v107, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v0, vcc, v1, v5, vcc
	v_mov_b32_e32 v1, s39
	s_nop 0
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[2:3]
	v_mul_lo_u32 v2, s67, v0
	v_mul_lo_u32 v3, s66, v1
	v_mad_u64_u32 v[0:1], s[0:1], s66, v0, 0
	v_add3_u32 v1, v1, v3, v2
	v_sub_u32_e32 v2, v107, v1
	v_mov_b32_e32 v3, s67
	v_sub_co_u32_e32 v0, vcc, v106, v0
	s_nop 1
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, vcc
	v_subrev_co_u32_e64 v4, s[0:1], s66, v0
	v_subb_co_u32_e32 v1, vcc, v107, v1, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v2, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s67, v5
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s66, v4
	v_subrev_co_u32_e64 v3, s[0:1], s66, v4
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s67, v5
	v_subbrev_co_u32_e64 v2, s[0:1], 0, v2, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, v6, v7, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v6
	v_cmp_le_u32_e32 vcc, s67, v1
	s_nop 0
	v_cndmask_b32_e64 v2, v5, v2, s[0:1]
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e64 v6, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s67, v1
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v2, vcc
	v_cndmask_b32_e64 v2, v4, v3, s[0:1]
	v_cndmask_b32_e32 v0, v0, v2, vcc
.LBB2_69:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB2_71
; %bb.70:                               ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v0, s66
	s_sub_i32 s2, 0, s66
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v1, s2, v0
	v_mul_hi_u32 v1, v0, v1
	v_add_u32_e32 v0, v0, v1
	v_mul_hi_u32 v0, v106, v0
	v_mul_lo_u32 v0, v0, s66
	v_sub_u32_e32 v0, v106, v0
	v_subrev_u32_e32 v1, s66, v0
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_subrev_u32_e32 v1, s66, v0
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_mov_b32_e32 v1, v40
.LBB2_71:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_cmp_eq_u32_e32 vcc, 1, v43
	s_nop 1
	v_cndmask_b32_e32 v3, v77, v79, vcc
	v_cndmask_b32_e32 v2, v76, v78, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 3, v[2:3]
	;;#ASMSTART
	global_load_dwordx2 v[2:3], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
.LBB2_72:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execz .LBB2_78
; %bb.73:                               ;   in Loop: Header=BB2_56 Depth=1
	;;#ASMSTART
	;;#ASMEND
	v_or_b32_e32 v41, s67, v61
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB2_75
; %bb.74:                               ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v0, s66
	v_cvt_f32_u32_e32 v1, s67
	s_sub_u32 s0, 0, s66
	s_subb_u32 s1, 0, s67
	v_mov_b32_e32 v3, v40
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmac_f32_e32 v0, 0xcf800000, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v1
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[0:1], s[0:1], v60, s2, 0
	v_mul_hi_u32 v2, v60, s3
	v_lshl_add_u64 v[0:1], v[2:3], 0, v[0:1]
	v_mad_u64_u32 v[4:5], s[0:1], v61, s3, 0
	v_add_co_u32_e32 v0, vcc, v0, v4
	v_mad_u64_u32 v[2:3], s[0:1], v61, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v0, vcc, v1, v5, vcc
	v_mov_b32_e32 v1, s39
	s_nop 0
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[2:3]
	v_mul_lo_u32 v2, s67, v0
	v_mul_lo_u32 v3, s66, v1
	v_mad_u64_u32 v[0:1], s[0:1], s66, v0, 0
	v_add3_u32 v1, v1, v3, v2
	v_sub_u32_e32 v2, v61, v1
	v_mov_b32_e32 v3, s67
	v_sub_co_u32_e32 v0, vcc, v60, v0
	s_nop 1
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, vcc
	v_subrev_co_u32_e64 v4, s[0:1], s66, v0
	v_subb_co_u32_e32 v1, vcc, v61, v1, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v2, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s67, v5
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s66, v4
	v_subrev_co_u32_e64 v3, s[0:1], s66, v4
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s67, v5
	v_subbrev_co_u32_e64 v2, s[0:1], 0, v2, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, v6, v7, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v6
	v_cmp_le_u32_e32 vcc, s67, v1
	s_nop 0
	v_cndmask_b32_e64 v2, v5, v2, s[0:1]
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e64 v6, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s67, v1
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v2, vcc
	v_cndmask_b32_e64 v2, v4, v3, s[0:1]
	v_cndmask_b32_e32 v0, v0, v2, vcc
.LBB2_75:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB2_77
; %bb.76:                               ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v0, s66
	s_sub_i32 s2, 0, s66
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v1, s2, v0
	v_mul_hi_u32 v1, v0, v1
	v_add_u32_e32 v0, v0, v1
	v_mul_hi_u32 v0, v60, v0
	v_mul_lo_u32 v0, v0, s66
	v_sub_u32_e32 v0, v60, v0
	v_subrev_u32_e32 v1, s66, v0
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_subrev_u32_e32 v1, s66, v0
	v_cmp_le_u32_e32 vcc, s66, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_mov_b32_e32 v1, v40
.LBB2_77:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[0:1], v[0:1], 3, v[76:77]
	flat_load_dwordx2 v[2:3], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
.LBB2_78:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u64_e64 s[0:1], 0, v[2:3]
	v_cmp_ne_u64_e32 vcc, 0, v[2:3]
                                        ; implicit-def: $vgpr0_vgpr1
                                        ; implicit-def: $vgpr4_vgpr5
	s_nop 0
	v_writelane_b32 v124, s0, 34
	s_nop 1
	v_writelane_b32 v124, s1, 35
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	v_writelane_b32 v124, s0, 26
	s_nop 1
	v_writelane_b32 v124, s1, 27
	s_cbranch_execz .LBB2_309
; %bb.79:                               ;   in Loop: Header=BB2_56 Depth=1
	v_mad_u64_u32 v[0:1], s[0:1], v2, 24, s[82:83]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v3, 24, v[2:3]
	v_mov_b32_e32 v1, v2
	global_load_dword v4, v[0:1], off
	global_load_dwordx4 v[72:75], v[0:1], off offset:8
	s_movk_i32 s0, 0x386
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr14_vgpr15
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
                                        ; implicit-def: $vgpr0_vgpr1
	s_waitcnt vmcnt(1)
	v_cmp_lt_i32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB2_91
; %bb.80:                               ;   in Loop: Header=BB2_56 Depth=1
	v_writelane_b32 v109, s0, 12
	s_mov_b64 s[4:5], 0
                                        ; implicit-def: $sgpr40_sgpr41
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
	s_nop 0
	v_writelane_b32 v109, s1, 13
	s_movk_i32 s0, 0x38d
	v_cmp_lt_i32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB2_178
; %bb.81:                               ;   in Loop: Header=BB2_56 Depth=1
	v_writelane_b32 v124, s0, 58
                                        ; implicit-def: $sgpr40_sgpr41
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
	s_nop 1
	v_writelane_b32 v124, s1, 59
	s_movk_i32 s0, 0x38e
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_mov_b64 s[0:1], -1
	s_mov_b64 s[2:3], exec
	v_writelane_b32 v124, s2, 60
	s_nop 1
	v_writelane_b32 v124, s3, 61
	s_and_b64 s[2:3], s[2:3], vcc
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB2_177
; %bb.82:                               ;   in Loop: Header=BB2_56 Depth=1
	s_memrealtime s[0:1]
	v_cmp_ne_u64_e32 vcc, 0, v[104:105]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s1, s1, 10
	s_mul_hi_u32 s2, s0, 10
	s_mul_i32 s40, s0, 10
	s_add_i32 s41, s2, s1
	s_mov_b64 s[0:1], exec
	v_writelane_b32 v109, s0, 18
	s_nop 1
	v_writelane_b32 v109, s1, 19
	s_and_b64 s[0:1], s[0:1], vcc
	s_mov_b64 exec, s[0:1]
	s_cbranch_execz .LBB2_85
; %bb.83:                               ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s0, 0xc28f5c29
	v_mul_lo_u32 v0, v42, s0
	v_alignbit_b32 v0, v0, v0, 2
	s_mov_b32 s0, 0x28f5c29
	v_cmp_gt_i32_e32 vcc, 10, v42
	v_cmp_gt_u32_e64 s[0:1], s0, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_and_b64 exec, exec, s[0:1]
	s_cbranch_execz .LBB2_85
; %bb.84:                               ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v124, 10
	v_readlane_b32 s1, v124, 11
	v_readlane_b32 s2, v124, 12
	v_readlane_b32 s3, v124, 13
	v_readlane_b32 s4, v124, 14
	v_readlane_b32 s5, v124, 15
	v_readlane_b32 s6, v124, 16
	global_load_dword v41, v40, s[0:1] offset:4
	v_readlane_b32 s7, v124, 17
	v_readlane_b32 s8, v124, 18
	v_readlane_b32 s9, v124, 19
	v_readlane_b32 s10, v124, 20
	v_readlane_b32 s11, v124, 21
	v_readlane_b32 s12, v124, 22
	v_readlane_b32 s13, v124, 23
	v_readlane_b32 s14, v124, 24
	v_readlane_b32 s15, v124, 25
	v_writelane_b32 v124, s54, 54
	s_add_u32 s54, s44, 0x1b0
	v_writelane_b32 v109, s55, 47
	s_addc_u32 s55, s45, 0
	s_mov_b64 s[8:9], s[54:55]
	v_writelane_b32 v109, s54, 48
	v_mov_b32_e32 v0, s41
	v_sub_co_u32_e32 v2, vcc, s40, v104
	v_writelane_b32 v109, s55, 49
	v_writelane_b32 v109, s44, 4
	v_subb_co_u32_e32 v0, vcc, v0, v105, vcc
	s_nop 0
	v_writelane_b32 v109, s45, 5
	v_writelane_b32 v109, s56, 6
	v_cvt_f64_u32_e32 v[0:1], v0
	v_ldexp_f64 v[0:1], v[0:1], 32
	v_writelane_b32 v109, s57, 7
	v_writelane_b32 v109, s58, 8
	v_writelane_b32 v109, s59, 9
	v_writelane_b32 v109, s46, 22
	v_cvt_f64_u32_e32 v[2:3], v2
	v_add_f64 v[0:1], v[0:1], v[2:3]
	v_writelane_b32 v109, s47, 23
	v_writelane_b32 v109, s60, 20
	v_div_scale_f64 v[2:3], s[0:1], s[94:95], s[94:95], v[0:1]
	s_nop 0
	v_writelane_b32 v109, s61, 21
	v_writelane_b32 v109, s62, 24
	v_rcp_f64_e32 v[4:5], v[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v109, s63, 25
	v_writelane_b32 v109, s72, 26
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v109, s73, 27
	v_writelane_b32 v109, s74, 28
	v_writelane_b32 v109, s75, 29
	v_writelane_b32 v109, s76, 30
	v_writelane_b32 v109, s77, 31
	v_writelane_b32 v109, s78, 32
	v_writelane_b32 v109, s79, 33
	v_writelane_b32 v109, s88, 34
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v109, s89, 35
	v_div_scale_f64 v[6:7], vcc, v[0:1], s[94:95], v[0:1]
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_writelane_b32 v109, s90, 36
	v_mul_f64 v[8:9], v[6:7], v[4:5]
	v_fma_f64 v[2:3], -v[2:3], v[8:9], v[6:7]
	v_writelane_b32 v109, s91, 37
	v_readlane_b32 s34, v124, 4
	v_writelane_b32 v109, s92, 38
	v_div_fmas_f64 v[2:3], v[2:3], v[4:5], v[8:9]
	v_readlane_b32 s4, v124, 6
	v_readlane_b32 s35, v124, 5
	v_readlane_b32 s10, v124, 2
	v_readlane_b32 s96, v124, 1
	v_readlane_b32 s51, v124, 0
	v_writelane_b32 v109, s93, 39
	v_div_fixup_f64 v[122:123], v[2:3], s[94:95], v[0:1]
	v_readlane_b32 s5, v124, 7
	s_mov_b64 s[6:7], s[34:35]
	v_readlane_b32 s11, v124, 3
	v_readlane_b32 s12, v124, 54
	s_mov_b32 s13, s96
	s_mov_b32 s14, s51
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v0, v40
	v_mov_b32_e32 v1, v40
	v_writelane_b32 v109, s40, 50
	s_nop 1
	v_writelane_b32 v109, s41, 51
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[8:9], s[54:55]
	v_readlane_b32 s54, v124, 2
	v_readlane_b32 s4, v124, 6
	v_readlane_b32 s55, v124, 3
	v_mov_b32_e32 v2, s0
	v_readlane_b32 s0, v109, 40
	v_readlane_b32 s5, v124, 7
	s_mov_b64 s[6:7], s[34:35]
	s_mov_b64 s[10:11], s[54:55]
	v_readlane_b32 s12, v124, 54
	s_mov_b32 s13, s96
	s_mov_b32 s14, s51
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_readlane_b32 s50, v124, 6
	s_mov_b64 s[6:7], s[34:35]
	v_readlane_b32 s51, v124, 7
	v_readlane_b32 s38, v124, 0
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v109, s0, 52
	s_mov_b64 s[4:5], s[50:51]
	s_mov_b64 s[10:11], s[54:55]
	v_writelane_b32 v109, s1, 53
	v_readlane_b32 s12, v124, 54
	v_readlane_b32 s34, v109, 48
	v_readlane_b32 s35, v109, 49
	v_readlane_b32 s0, v109, 52
	s_mov_b64 s[8:9], s[34:35]
	s_mov_b32 s13, s96
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v42
	v_mov_b32_e32 v4, v40
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, v40
	v_readlane_b32 s1, v109, 53
	s_swappc_b64 s[30:31], s[0:1]
	v_readlane_b32 s54, v124, 4
	s_mov_b64 s[8:9], s[34:35]
	v_readlane_b32 s34, v124, 2
	s_mov_b64 s[4:5], s[50:51]
	v_readlane_b32 s55, v124, 5
	v_readlane_b32 s35, v124, 3
	v_readlane_b32 s50, v109, 52
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[10:11], s[34:35]
	v_readlane_b32 s12, v124, 54
	s_mov_b32 s13, s96
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v122
	v_mov_b32_e32 v4, v123
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, v40
	v_readlane_b32 s51, v109, 53
	s_swappc_b64 s[30:31], s[50:51]
	v_readlane_b32 s4, v124, 6
	s_mov_b64 s[6:7], s[54:55]
	v_readlane_b32 s8, v109, 48
	v_readlane_b32 s54, v124, 54
	v_readlane_b32 s5, v124, 7
	v_readlane_b32 s9, v109, 49
	s_mov_b64 s[10:11], s[34:35]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s96
	s_mov_b32 s14, s38
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v41
	v_mov_b32_e32 v4, v40
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, 1
	v_readlane_b32 s55, v109, 47
	s_swappc_b64 s[30:31], s[50:51]
	v_readlane_b32 s40, v109, 50
	s_mov_b32 s94, 0
	v_readlane_b32 s90, v109, 36
	v_readlane_b32 s88, v109, 34
	v_readlane_b32 s72, v109, 26
	v_readlane_b32 s62, v109, 24
	v_readlane_b32 s60, v109, 20
	v_readlane_b32 s46, v109, 22
	v_readlane_b32 s56, v109, 6
	v_readlane_b32 s44, v109, 4
	v_readlane_b32 s41, v109, 51
	s_mov_b32 s95, 0x412e8480
	v_readlane_b32 s92, v109, 38
	v_readlane_b32 s91, v109, 37
	v_readlane_b32 s89, v109, 35
	v_readlane_b32 s73, v109, 27
	v_readlane_b32 s74, v109, 28
	v_readlane_b32 s75, v109, 29
	v_readlane_b32 s76, v109, 30
	v_readlane_b32 s77, v109, 31
	v_readlane_b32 s78, v109, 32
	v_readlane_b32 s79, v109, 33
	v_readlane_b32 s63, v109, 25
	v_readlane_b32 s61, v109, 21
	v_readlane_b32 s47, v109, 23
	v_readlane_b32 s57, v109, 7
	v_readlane_b32 s58, v109, 8
	v_readlane_b32 s45, v109, 5
	v_readlane_b32 s93, v109, 39
	v_readlane_b32 s59, v109, 9
.LBB2_85:                               ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v109, 18
	v_readlane_b32 s1, v109, 19
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s8, v124, 10
	v_readlane_b32 s22, v124, 24
	v_readlane_b32 s23, v124, 25
	v_readlane_b32 s18, v124, 20
	v_readlane_b32 s19, v124, 21
	s_nop 2
	global_load_dword v0, v40, s[22:23]
	s_nop 0
	global_load_dword v1, v40, s[18:19]
	v_readlane_b32 s0, v124, 30
	v_readlane_b32 s1, v124, 31
	v_readlane_b32 s12, v124, 14
	v_readlane_b32 s13, v124, 15
	v_readlane_b32 s9, v124, 11
	v_readlane_b32 s16, v124, 18
	v_readlane_b32 s17, v124, 19
	global_load_dword v2, v40, s[0:1]
	v_readlane_b32 s10, v124, 12
	v_readlane_b32 s11, v124, 13
	v_readlane_b32 s14, v124, 16
	v_readlane_b32 s15, v124, 17
	v_readlane_b32 s20, v124, 22
	v_readlane_b32 s21, v124, 23
	v_readlane_b32 s2, v124, 32
	v_readlane_b32 s3, v124, 33
	s_waitcnt vmcnt(2)
	v_readfirstlane_b32 s12, v0
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s0, v1
	s_lshl_b32 s1, s0, 16
	s_cmp_eq_u32 s1, 0xffff0000
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s13, v2
	s_cbranch_scc1 .LBB2_110
; %bb.86:                               ;   in Loop: Header=BB2_56 Depth=1
	global_load_dwordx2 v[0:1], v40, s[8:9]
	s_ashr_i32 s6, s1, 16
	s_ashr_i32 s4, s1, 14
	s_bfe_i32 s5, s0, 0x1000f
	s_add_u32 s0, s72, s4
	s_addc_u32 s1, s73, s5
	global_load_dword v2, v40, s[0:1]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s2, v0
	v_readfirstlane_b32 s3, v1
	s_sub_i32 s3, s3, s2
	s_add_u32 s4, s16, s4
	s_addc_u32 s5, s17, s5
	global_load_dword v0, v40, s[4:5]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s5, v2
	s_cmp_lt_i32 s3, 1
	s_mul_i32 s4, s6, 0x4b0
	s_cbranch_scc1 .LBB2_103
; %bb.87:                               ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s6, s5, 1
	s_add_i32 s7, s5, s4
	s_mov_b32 s8, 0
	s_branch .LBB2_89
.LBB2_88:                               ;   in Loop: Header=BB2_89 Depth=2
	s_add_i32 s8, s8, 1
	s_cmp_ge_i32 s8, s3
	s_cbranch_scc1 .LBB2_103
.LBB2_89:                               ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_add_i32 s9, s6, s8
	v_readlane_b32 s10, v109, 10
	s_cmp_lt_i32 s9, s10
	s_waitcnt vmcnt(0)
	v_cmp_ge_i32_e32 vcc, s9, v0
	s_cselect_b64 s[10:11], -1, 0
	s_and_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 vcc, exec, s[10:11]
	s_cbranch_vccnz .LBB2_88
; %bb.90:                               ;   in Loop: Header=BB2_89 Depth=2
	s_add_i32 s10, s2, s8
	s_ashr_i32 s11, s10, 31
	s_lshl_b64 s[10:11], s[10:11], 3
	s_add_u32 s10, s78, s10
	s_addc_u32 s11, s79, s11
	global_load_dwordx2 v[2:3], v40, s[10:11]
	s_add_i32 s10, s7, s8
	s_ashr_i32 s11, s10, 31
	s_lshl_b64 s[10:11], s[10:11], 3
	s_add_u32 s10, s74, s10
	s_addc_u32 s11, s75, s11
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[2:3], s[10:11] offset:8
	s_branch .LBB2_88
.LBB2_91:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB2_268
.LBB2_92:                               ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0x386
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_102
; %bb.93:                               ;   in Loop: Header=BB2_56 Depth=1
	s_waitcnt vmcnt(0)
	v_sub_co_u32_e32 v4, vcc, v74, v72
	v_readlane_b32 s0, v109, 16
	s_nop 0
	v_subb_co_u32_e32 v5, vcc, v75, v73, vcc
	v_or_b32_e32 v41, s0, v5
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB2_95
; %bb.94:                               ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s19, v109, 0
	v_readlane_b32 s18, v109, 16
	s_sub_u32 s0, 0, s19
	v_cvt_f32_u32_e32 v6, s19
	v_cvt_f32_u32_e32 v7, s18
	s_subb_u32 s1, 0, s18
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s10, v7
	v_readfirstlane_b32 s11, v6
	s_mul_i32 s12, s0, s10
	s_mul_hi_u32 s14, s0, s11
	s_mul_i32 s13, s1, s11
	s_add_i32 s12, s14, s12
	s_mul_i32 s15, s0, s11
	s_add_i32 s12, s12, s13
	s_mul_i32 s14, s11, s12
	s_mul_hi_u32 s16, s11, s15
	s_mul_hi_u32 s13, s11, s12
	s_add_u32 s14, s16, s14
	s_addc_u32 s13, 0, s13
	s_mul_hi_u32 s17, s10, s15
	s_mul_i32 s15, s10, s15
	s_add_u32 s14, s14, s15
	s_mul_hi_u32 s16, s10, s12
	s_addc_u32 s13, s13, s17
	s_addc_u32 s14, s16, 0
	s_mul_i32 s12, s10, s12
	s_add_u32 s12, s13, s12
	s_addc_u32 s13, 0, s14
	s_add_u32 s11, s11, s12
	s_addc_u32 s10, s10, s13
	s_mul_i32 s12, s0, s10
	s_mul_hi_u32 s13, s0, s11
	s_add_i32 s12, s13, s12
	s_mul_i32 s1, s1, s11
	s_add_i32 s12, s12, s1
	s_mul_i32 s0, s0, s11
	s_mul_hi_u32 s13, s10, s0
	s_mul_i32 s14, s10, s0
	s_mul_i32 s16, s11, s12
	s_mul_hi_u32 s0, s11, s0
	s_mul_hi_u32 s15, s11, s12
	s_add_u32 s0, s0, s16
	s_addc_u32 s15, 0, s15
	s_add_u32 s0, s0, s14
	s_mul_hi_u32 s1, s10, s12
	s_addc_u32 s0, s15, s13
	s_addc_u32 s1, s1, 0
	s_mul_i32 s12, s10, s12
	s_add_u32 s0, s0, s12
	s_addc_u32 s1, 0, s1
	s_add_u32 s11, s11, s0
	s_addc_u32 s10, s10, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s10, 0
	v_mul_hi_u32 v8, v4, s11
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s11, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s10, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s39
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v10, s18, v6
	v_mul_lo_u32 v11, s19, v7
	v_mad_u64_u32 v[8:9], s[0:1], s19, v6, 0
	v_add3_u32 v13, v9, v11, v10
	v_sub_u32_e32 v9, v5, v13
	v_mov_b32_e32 v10, s18
	v_sub_co_u32_e32 v16, vcc, v4, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v9, v10, vcc
	v_subrev_co_u32_e64 v9, s[0:1], s19, v16
	s_nop 1
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s18, v8
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s19, v9
	s_nop 1
	v_cndmask_b32_e64 v9, 0, -1, s[0:1]
	v_cmp_eq_u32_e64 s[0:1], s18, v8
	s_nop 1
	v_cndmask_b32_e64 v17, v10, v9, s[0:1]
	v_lshl_add_u64 v[8:9], v[6:7], 0, 2
	v_lshl_add_u64 v[10:11], v[6:7], 0, 1
	v_cmp_ne_u32_e64 s[0:1], 0, v17
	s_nop 1
	v_cndmask_b32_e64 v9, v11, v9, s[0:1]
	v_subb_co_u32_e32 v11, vcc, v5, v13, vcc
	v_cmp_le_u32_e32 vcc, s18, v11
	v_cndmask_b32_e64 v8, v10, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s19, v16
	s_nop 1
	v_cndmask_b32_e64 v16, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s18, v11
	s_nop 1
	v_cndmask_b32_e32 v11, v13, v16, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e32 v6, v6, v8, vcc
.LBB2_95:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB2_97
; %bb.96:                               ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s9, v109, 0
	s_sub_i32 s8, 0, s9
	s_nop 0
	v_cvt_f32_u32_e32 v6, s9
	v_rcp_iflag_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_mul_lo_u32 v7, s8, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v4, v6
	v_mul_lo_u32 v7, v6, s9
	v_sub_u32_e32 v7, v4, v7
	v_add_u32_e32 v8, 1, v6
	v_subrev_u32_e32 v9, s9, v7
	v_cmp_le_u32_e32 vcc, s9, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e32 v6, v6, v8, vcc
	v_add_u32_e32 v8, 1, v6
	v_cmp_le_u32_e32 vcc, s9, v7
	v_mov_b32_e32 v7, v40
	s_nop 0
	v_cndmask_b32_e32 v6, v6, v8, vcc
.LBB2_97:                               ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s1, v109, 0
	v_readlane_b32 s0, v109, 16
	s_nop 0
	v_mul_lo_u32 v10, v7, s1
	v_mul_lo_u32 v11, v6, s0
	v_mad_u64_u32 v[8:9], s[0:1], v6, s1, 0
	v_add3_u32 v9, v9, v11, v10
	v_sub_co_u32_e32 v10, vcc, v4, v8
	s_nop 1
	v_subb_co_u32_e32 v11, vcc, v5, v9, vcc
	v_cmp_ge_u64_e32 vcc, s[60:61], v[10:11]
                                        ; implicit-def: $vgpr8_vgpr9
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.98:                               ;   in Loop: Header=BB2_56 Depth=1
	v_mad_u64_u32 v[4:5], s[8:9], v6, s60, v[10:11]
	v_mul_lo_u32 v8, v6, s61
	v_mul_lo_u32 v9, v7, s60
	v_add3_u32 v5, v9, v5, v8
	v_lshl_add_u64 v[8:9], v[4:5], 0, v[6:7]
                                        ; implicit-def: $vgpr6_vgpr7
; %bb.99:                               ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[0:1]
; %bb.100:                              ;   in Loop: Header=BB2_56 Depth=1
	v_lshl_add_u64 v[6:7], v[6:7], 0, 1
	v_mul_lo_u32 v10, v7, s60
	v_mul_lo_u32 v11, v6, s61
	v_mad_u64_u32 v[4:5], s[8:9], v6, s60, 0
	v_mad_u64_u32 v[8:9], s[8:9], v6, s60, v[6:7]
	v_add3_u32 v5, v5, v11, v10
	v_add3_u32 v9, v10, v9, v11
; %bb.101:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[72:73]
	v_lshl_add_u64 v[74:75], v[8:9], 0, v[72:73]
	v_mov_b64_e32 v[72:73], v[4:5]
.LBB2_102:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_or_b64 s[2:3], s[2:3], exec
	s_or_b64 exec, exec, s[4:5]
	v_mov_b64_e32 v[4:5], v[110:111]
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB2_308
	s_branch .LBB2_269
.LBB2_103:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s5, s3, s5
	s_add_i32 s6, s5, 1
	v_readlane_b32 s7, v109, 10
	s_cmp_ge_i32 s6, s7
	v_mov_b32_e32 v1, s5
	s_cselect_b64 s[2:3], -1, 0
	s_cmp_lt_i32 s6, s7
	global_store_dword v40, v1, s[0:1]
	s_cbranch_scc0 .LBB2_105
; %bb.104:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s0, s5, s4
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 3
	s_add_u32 s0, s74, s0
	s_addc_u32 s1, s75, s1
	global_load_dwordx2 v[2:3], v40, s[0:1]
	s_load_dwordx2 s[0:1], s[44:45], 0xa0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u64_e32 vcc, s[0:1], v[2:3]
	v_cmp_ge_i32_e64 s[0:1], s5, v0
	s_and_b64 s[2:3], vcc, s[0:1]
.LBB2_105:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB2_110
; %bb.106:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s28, v124, 22
	global_store_dword v40, v47, s[26:27]
	v_readlane_b32 s29, v124, 23
	global_load_dwordx2 v[0:1], v40, s[18:19]
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_sub_i32 s2, s1, s0
	s_cmp_lt_i32 s2, 1
	s_cbranch_scc1 .LBB2_110
; %bb.107:                              ;   in Loop: Header=BB2_56 Depth=1
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 2
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	s_mov_b32 s3, 0
.LBB2_108:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v0, v40, s[0:1]
	s_add_i32 s4, s13, s3
	s_ashr_i32 s5, s4, 31
	s_lshr_b32 s5, s5, 28
	s_add_i32 s5, s4, s5
	s_and_b32 s5, s5, -16
	s_sub_i32 s4, s4, s5
	s_ashr_i32 s5, s4, 31
	s_lshl_b64 s[4:5], s[4:5], 2
	s_add_u32 s4, s28, s4
	s_addc_u32 s5, s29, s5
	s_add_i32 s3, s3, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_lt_i32 s3, s2
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[4:5]
	s_cbranch_scc1 .LBB2_108
; %bb.109:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s13, s13, s3
.LBB2_110:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	global_load_dword v0, v40, s[18:19] offset:4
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	s_waitcnt vmcnt(0)
	v_cmp_gt_i32_e32 vcc, 1, v0
	v_readfirstlane_b32 s6, v0
	s_cbranch_vccnz .LBB2_123
; %bb.111:                              ;   in Loop: Header=BB2_56 Depth=1
	s_cmp_eq_u32 s6, 1
	s_cbranch_scc1 .LBB2_116
; %bb.112:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s1, s6, -2
	s_lshr_b32 s0, s1, 1
	s_add_i32 s0, s0, 1
	s_and_b32 s2, s0, 7
	s_cmp_lt_u32 s1, 14
	s_cbranch_scc1 .LBB2_117
; %bb.113:                              ;   in Loop: Header=BB2_56 Depth=1
	s_and_b32 s3, s0, -8
	v_readlane_b32 s0, v109, 43
	s_mov_b32 s38, 0
	s_movk_i32 s4, 0x780
	v_readlane_b32 s1, v109, 44
.LBB2_114:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_nop 4
	global_load_dwordx4 v[2:5], v40, s[0:1] offset:-32
	global_load_dwordx4 v[6:9], v40, s[0:1] offset:-16
	global_load_dwordx4 v[10:13], v40, s[0:1]
	global_load_dwordx4 v[14:17], v40, s[0:1] offset:16
	v_mov_b32_e32 v0, s4
	s_add_i32 s38, s38, 16
	s_add_i32 s4, s4, 64
	s_add_u32 s0, s0, 64
	s_addc_u32 s1, s1, 0
	s_add_i32 s3, s3, -8
	s_cmp_lg_u32 s3, 0
	s_waitcnt vmcnt(3)
	ds_write_b128 v0, v[2:5]
	s_waitcnt vmcnt(2)
	ds_write_b128 v0, v[6:9] offset:16
	s_waitcnt vmcnt(1)
	ds_write_b128 v0, v[10:13] offset:32
	s_waitcnt vmcnt(0)
	ds_write_b128 v0, v[14:17] offset:48
	s_cbranch_scc1 .LBB2_114
; %bb.115:                              ;   in Loop: Header=BB2_56 Depth=1
	s_cmp_lg_u32 s2, 0
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB2_118
	s_branch .LBB2_120
.LBB2_116:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 0
	s_cbranch_execnz .LBB2_121
	s_branch .LBB2_123
.LBB2_117:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 0
	s_cbranch_execz .LBB2_120
.LBB2_118:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	s_lshl2_add_u32 s3, s38, 0x780
	s_lshl_b64 s[0:1], s[38:39], 2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_119:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[2:3], v40, s[0:1]
	v_mov_b32_e32 v0, s3
	s_add_i32 s3, s3, 8
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_add_i32 s2, s2, -1
	s_cmp_lg_u32 s2, 0
	s_waitcnt vmcnt(0)
	ds_write_b64 v0, v[2:3]
	s_cbranch_scc1 .LBB2_119
.LBB2_120:                              ;   in Loop: Header=BB2_56 Depth=1
	s_and_b32 s38, s6, 0x7ffffffe
	s_cmp_lg_u32 s6, s38
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccz .LBB2_123
.LBB2_121:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	s_lshl_b64 s[0:1], s[38:39], 2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	s_sub_i32 s2, s6, s38
	s_lshl2_add_u32 s3, s38, 0x780
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_122:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v1, v40, s[0:1]
	s_add_u32 s0, s0, 4
	v_mov_b32_e32 v0, s3
	s_addc_u32 s1, s1, 0
	s_add_i32 s2, s2, -1
	s_add_i32 s3, s3, 4
	s_cmp_lg_u32 s2, 0
	s_waitcnt vmcnt(0)
	ds_write_b32 v0, v1
	s_cbranch_scc1 .LBB2_122
.LBB2_123:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	global_load_dword v0, v40, s[26:27]
	s_mov_b32 s2, 0
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	s_lshl_b32 s1, s0, 16
	s_cmp_eq_u32 s1, 0xffff0000
	s_cbranch_scc1 .LBB2_132
; %bb.124:                              ;   in Loop: Header=BB2_56 Depth=1
	s_ashr_i32 s2, s1, 16
	s_lshl_b32 s1, s0, 16
	s_ashr_i32 s3, s1, 14
	s_bfe_i32 s4, s0, 0x1000f
	v_mov_b32_e32 v1, s2
	s_add_u32 s0, s72, s3
	global_load_dword v0, v40, s[18:19]
	s_nop 0
	global_store_dword v40, v1, s[26:27]
	global_store_dword v40, v40, s[16:17]
	global_store_dword v40, v40, s[18:19]
	s_addc_u32 s1, s73, s4
	global_load_dword v1, v40, s[0:1]
	s_add_u32 s0, s24, s3
	s_addc_u32 s1, s25, s4
	global_load_dword v2, v40, s[0:1]
	s_mulk_i32 s2, 0x4b0
	s_mov_b64 s[4:5], s[76:77]
	s_waitcnt vmcnt(5)
	v_readfirstlane_b32 s1, v0
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s7, v1
	s_add_i32 s2, s7, s2
	s_waitcnt vmcnt(0)
	v_sub_u32_e32 v0, v2, v1
	v_med3_i32 v0, v0, 1, 8
	s_nop 0
	v_readfirstlane_b32 s0, v0
	s_mov_b32 s8, s0
.LBB2_125:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[10:11], s[2:3], 3
	s_add_u32 s10, s74, s10
	s_addc_u32 s11, s75, s11
	global_load_dwordx2 v[0:1], v40, s[10:11]
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[0:1], s[4:5]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	s_add_i32 s2, s2, 1
	s_add_i32 s8, s8, -1
	s_cmp_eq_u32 s8, 0
	s_cbranch_scc0 .LBB2_125
; %bb.126:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s5, s0, s7
	s_ashr_i32 s2, s5, 31
	s_lshr_b32 s2, s2, 20
	s_add_i32 s2, s5, s2
	s_and_b32 s2, s2, 0xfffff000
	s_sub_i32 s4, s6, s1
	s_sub_i32 s2, s5, s2
	s_cmp_lg_u32 s2, 0
	s_cselect_b32 s2, s2, 0x1000
	v_readlane_b32 s16, v124, 10
	v_mov_b32_e32 v0, s2
	s_cmp_lt_i32 s4, 1
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	global_store_dword v40, v0, s[22:23]
	s_cbranch_scc1 .LBB2_142
; %bb.127:                              ;   in Loop: Header=BB2_56 Depth=1
	s_cmp_eq_u32 s4, 1
	s_cbranch_scc1 .LBB2_133
; %bb.128:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s3, s4, -2
	s_lshr_b32 s2, s3, 1
	s_add_i32 s2, s2, 1
	s_and_b32 s8, s2, 7
	s_cmp_gt_u32 s3, 13
	s_cbranch_scc0 .LBB2_134
; %bb.129:                              ;   in Loop: Header=BB2_56 Depth=1
	s_and_b32 s6, s2, -8
	s_lshl_b32 s9, s1, 2
	v_readlane_b32 s2, v109, 43
	s_add_i32 s7, s9, 0x780
	s_mov_b32 s38, 0
	v_readlane_b32 s3, v109, 44
.LBB2_130:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s7
	ds_read2_b32 v[2:3], v0 offset1:1
	ds_read2_b32 v[4:5], v0 offset0:2 offset1:3
	ds_read2_b32 v[6:7], v0 offset0:4 offset1:5
	ds_read2_b32 v[8:9], v0 offset0:6 offset1:7
	ds_read2_b32 v[10:11], v0 offset0:8 offset1:9
	ds_read2_b32 v[12:13], v0 offset0:10 offset1:11
	ds_read2_b32 v[14:15], v0 offset0:12 offset1:13
	ds_read2_b32 v[16:17], v0 offset0:14 offset1:15
	s_add_i32 s38, s38, 16
	s_waitcnt lgkmcnt(6)
	global_store_dwordx4 v40, v[2:5], s[2:3] offset:-32
	s_waitcnt lgkmcnt(4)
	global_store_dwordx4 v40, v[6:9], s[2:3] offset:-16
	s_waitcnt lgkmcnt(2)
	global_store_dwordx4 v40, v[10:13], s[2:3]
	s_waitcnt lgkmcnt(0)
	global_store_dwordx4 v40, v[14:17], s[2:3] offset:16
	s_add_u32 s2, s2, 64
	s_addc_u32 s3, s3, 0
	s_add_i32 s6, s6, -8
	s_add_i32 s7, s7, 64
	s_cmp_lg_u32 s6, 0
	s_cbranch_scc1 .LBB2_130
; %bb.131:                              ;   in Loop: Header=BB2_56 Depth=1
	s_cmp_lg_u32 s8, 0
	s_cselect_b64 s[2:3], -1, 0
	s_branch .LBB2_136
.LBB2_132:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 0
	s_mov_b32 s0, 0
	s_branch .LBB2_148
.LBB2_133:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 0
	s_cbranch_execnz .LBB2_140
	s_branch .LBB2_142
.LBB2_134:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $sgpr9
	s_cbranch_execz .LBB2_136
; %bb.135:                              ;   in Loop: Header=BB2_56 Depth=1
	s_lshl_b32 s9, s1, 2
	s_mov_b64 s[2:3], -1
	s_mov_b32 s38, 0
.LBB2_136:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB2_139
; %bb.137:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	s_lshl_b64 s[2:3], s[38:39], 2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	s_add_u32 s2, s20, s2
	s_addc_u32 s3, s21, s3
	s_lshl2_add_u32 s6, s38, s9
	s_addk_i32 s6, 0x780
	s_lshl_b32 s7, s8, 3
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_138:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s6
	ds_read2_b32 v[0:1], v0 offset1:1
	s_waitcnt lgkmcnt(0)
	global_store_dwordx2 v40, v[0:1], s[2:3]
	s_add_u32 s2, s2, 8
	s_addc_u32 s3, s3, 0
	s_add_i32 s6, s6, 8
	s_add_i32 s7, s7, -8
	s_cmp_lg_u32 s7, 0
	s_cbranch_scc1 .LBB2_138
.LBB2_139:                              ;   in Loop: Header=BB2_56 Depth=1
	s_and_b32 s38, s4, 0x7ffffffe
	s_cmp_lg_u32 s4, s38
	s_cselect_b64 s[2:3], -1, 0
	s_and_b64 vcc, exec, s[2:3]
	s_cbranch_vccz .LBB2_142
.LBB2_140:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	s_lshl_b64 s[2:3], s[38:39], 2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	s_add_u32 s2, s20, s2
	s_addc_u32 s3, s21, s3
	s_lshl_b32 s1, s1, 2
	s_lshl2_add_u32 s1, s38, s1
	s_addk_i32 s1, 0x780
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_141:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s1
	ds_read_b32 v0, v0
	s_add_i32 s38, s38, 1
	s_waitcnt lgkmcnt(0)
	global_store_dword v40, v0, s[2:3]
	s_add_u32 s2, s2, 4
	s_addc_u32 s3, s3, 0
	s_add_i32 s1, s1, 4
	s_cmp_ge_i32 s38, s4
	s_cbranch_scc0 .LBB2_141
.LBB2_142:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s1, s5, 0xfff
	s_ashr_i32 s2, s1, 31
	s_lshr_b32 s2, s2, 20
	s_add_i32 s1, s1, s2
	s_ashr_i32 s2, s1, 12
	s_cmp_ge_i32 s4, s2
	s_cbranch_scc1 .LBB2_145
; %bb.143:                              ;   in Loop: Header=BB2_56 Depth=1
	s_ashr_i32 s5, s4, 31
	v_readlane_b32 s16, v124, 10
	s_lshl_b64 s[6:7], s[4:5], 2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	s_add_u32 s6, s20, s6
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	s_addc_u32 s7, s21, s7
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_144:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_ashr_i32 s1, s12, 31
	s_lshr_b32 s1, s1, 28
	s_add_i32 s1, s12, s1
	s_and_b32 s1, s1, -16
	s_sub_i32 s8, s12, s1
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 2
	s_add_u32 s8, s28, s8
	s_addc_u32 s9, s29, s9
	global_load_dword v0, v40, s[8:9]
	s_add_i32 s12, s12, 1
	s_add_i32 s4, s4, 1
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[6:7]
	s_add_u32 s6, s6, 4
	s_addc_u32 s7, s7, 0
	s_cmp_lt_i32 s4, s2
	s_cbranch_scc1 .LBB2_144
.LBB2_145:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 1
	s_branch .LBB2_148
.LBB2_146:                              ;   in Loop: Header=BB2_148 Depth=2
	s_add_i32 s1, s7, 0xfff
	s_ashr_i32 s3, s1, 31
	s_lshr_b32 s3, s3, 20
	s_add_i32 s1, s1, s3
	s_ashr_i32 s1, s1, 12
	s_add_i32 s2, s1, s2
	s_add_i32 s1, s6, 1
	v_readlane_b32 s8, v124, 30
	s_add_i32 s0, s7, s0
	s_mov_b32 s38, 1
	v_mov_b32_e32 v0, s1
	v_readlane_b32 s10, v124, 32
	v_readlane_b32 s11, v124, 33
	v_readlane_b32 s9, v124, 31
	s_nop 3
	global_store_dword v40, v0, s[10:11]
.LBB2_147:                              ;   in Loop: Header=BB2_148 Depth=2
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB2_155
.LBB2_148:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_152 Depth 3
	s_cmp_eq_u32 s38, 0
	s_cselect_b64 s[4:5], -1, 0
	s_cmp_lt_i32 s0, 8
	s_cselect_b64 s[6:7], -1, 0
	s_and_b64 s[4:5], s[4:5], s[6:7]
	s_andn2_b64 vcc, exec, s[4:5]
	s_mov_b64 s[4:5], -1
	s_cbranch_vccnz .LBB2_147
; %bb.149:                              ;   in Loop: Header=BB2_148 Depth=2
	v_readlane_b32 s4, v124, 30
	v_readlane_b32 s6, v124, 32
	v_readlane_b32 s7, v124, 33
	s_load_dword s1, s[44:45], 0x108
	v_readlane_b32 s5, v124, 31
	s_mov_b32 s38, 0
	s_nop 1
	global_load_dword v0, v40, s[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_le_i32_e64 s[4:5], s1, v0
	v_readfirstlane_b32 s6, v0
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB2_147
; %bb.150:                              ;   in Loop: Header=BB2_148 Depth=2
	v_readlane_b32 s16, v124, 10
	v_mov_b32_e32 v0, s6
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	s_ashr_i32 s7, s6, 31
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s24, v124, 18
	s_lshl_b64 s[8:9], s[6:7], 2
	v_readlane_b32 s18, v124, 12
	global_store_dword v40, v0, s[26:27]
	v_mov_b32_e32 v0, s0
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s25, v124, 19
	global_store_dword v40, v0, s[16:17]
	v_mov_b32_e32 v0, s2
	s_add_u32 s8, s24, s8
	s_addc_u32 s9, s25, s9
	global_store_dword v40, v0, s[18:19]
	global_load_dword v0, v40, s[8:9]
	s_sub_i32 s1, 8, s0
	s_min_u32 s1, s1, 8
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s3, v0
	v_cmp_gt_i32_e32 vcc, 1, v0
	s_min_i32 s7, s3, s1
	s_cbranch_vccnz .LBB2_153
; %bb.151:                              ;   in Loop: Header=BB2_148 Depth=2
	s_mul_i32 s8, s6, 0x4b0
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 3
	s_add_u32 s8, s74, s8
	s_addc_u32 s9, s75, s9
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[10:11], s[0:1], 3
	s_add_u32 s10, s76, s10
	s_addc_u32 s11, s77, s11
	s_mov_b32 s1, s7
.LBB2_152:                              ;   Parent Loop BB2_56 Depth=1
                                        ;     Parent Loop BB2_148 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	global_load_dwordx2 v[2:3], v40, s[8:9]
	s_add_u32 s8, s8, 8
	s_addc_u32 s9, s9, 0
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[2:3], s[10:11]
	s_add_u32 s10, s10, 8
	s_addc_u32 s11, s11, 0
	s_add_i32 s1, s1, -1
	s_cmp_eq_u32 s1, 0
	s_cbranch_scc0 .LBB2_152
.LBB2_153:                              ;   in Loop: Header=BB2_148 Depth=2
	s_ashr_i32 s1, s7, 31
	s_lshr_b32 s1, s1, 20
	s_add_i32 s1, s7, s1
	s_and_b32 s1, s1, 0xfffff000
	s_sub_i32 s1, s7, s1
	s_cmp_lg_u32 s1, 0
	v_cmp_lt_i32_e32 vcc, 0, v0
	s_cselect_b32 s1, s1, 0x1000
	v_readlane_b32 s16, v124, 10
	v_mov_b32_e32 v0, s1
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	s_and_b64 vcc, exec, vcc
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	global_store_dword v40, v0, s[22:23]
	s_cbranch_vccz .LBB2_146
; %bb.154:                              ;   in Loop: Header=BB2_148 Depth=2
	s_ashr_i32 s1, s12, 31
	s_lshr_b32 s1, s1, 28
	s_add_i32 s1, s12, s1
	s_and_b32 s1, s1, -16
	s_sub_i32 s8, s12, s1
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 2
	s_add_u32 s8, s28, s8
	s_addc_u32 s9, s29, s9
	global_load_dword v0, v40, s[8:9]
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[8:9], s[2:3], 2
	s_add_u32 s8, s20, s8
	s_addc_u32 s9, s21, s9
	s_add_i32 s12, s12, 1
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[8:9]
	s_branch .LBB2_146
.LBB2_155:                              ;   in Loop: Header=BB2_56 Depth=1
	s_cmp_lg_u32 s38, 0
	s_cbranch_scc1 .LBB2_157
; %bb.156:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	global_store_dword v40, v47, s[26:27]
.LBB2_157:                              ;   in Loop: Header=BB2_56 Depth=1
	s_add_i32 s1, s38, -1
	s_lshl_b64 s[6:7], s[38:39], 2
	v_readlane_b32 s16, v124, 10
	v_readlane_b32 s17, v124, 11
	s_add_u32 s4, s16, s6
	v_readlane_b32 s18, v124, 12
	s_addc_u32 s5, s17, s7
	v_readlane_b32 s19, v124, 13
	s_add_u32 s6, s18, s6
	s_addc_u32 s7, s19, s7
	v_mov_b32_e32 v0, s0
	v_mov_b32_e32 v1, s2
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
.LBB2_158:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_add_i32 s1, s1, 1
	global_store_dword v40, v0, s[4:5]
	global_store_dword v40, v1, s[6:7]
	s_add_u32 s4, s4, 4
	s_addc_u32 s5, s5, 0
	s_add_u32 s6, s6, 4
	s_addc_u32 s7, s7, 0
	s_cmp_lt_i32 s1, 1
	s_cbranch_scc1 .LBB2_158
; %bb.159:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s16, v124, 10
	v_mov_b32_e32 v0, s12
	v_readlane_b32 s30, v124, 24
	v_readlane_b32 s31, v124, 25
	v_readlane_b32 s4, v124, 30
	v_readlane_b32 s5, v124, 31
	s_cmp_lg_u32 s0, 0
	v_readlane_b32 s17, v124, 11
	v_readlane_b32 s18, v124, 12
	global_store_dword v40, v0, s[30:31]
	v_mov_b32_e32 v0, s13
	v_readlane_b32 s19, v124, 13
	v_readlane_b32 s20, v124, 14
	v_readlane_b32 s21, v124, 15
	v_readlane_b32 s22, v124, 16
	v_readlane_b32 s23, v124, 17
	v_readlane_b32 s24, v124, 18
	v_readlane_b32 s25, v124, 19
	v_readlane_b32 s26, v124, 20
	v_readlane_b32 s27, v124, 21
	v_readlane_b32 s28, v124, 22
	v_readlane_b32 s29, v124, 23
	v_readlane_b32 s6, v124, 32
	v_readlane_b32 s7, v124, 33
	global_store_dword v40, v0, s[4:5]
	s_memrealtime s[2:3]
	s_cbranch_scc0 .LBB2_165
; %bb.160:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s0, 0
	v_lshl_add_u32 v0, v108, 2, s0
	scratch_load_dword v0, v0, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v8, v108, 3, s0
	scratch_load_dwordx2 v[4:5], v8, off
	s_waitcnt vmcnt(1)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[84:85]
	global_load_dwordx2 v[2:3], v[2:3], off
	s_waitcnt vmcnt(1)
	v_or_b32_e32 v41, s65, v5
	v_lshl_add_u64 v[6:7], v[4:5], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v8, v[6:7], off
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[4:5], exec, s[0:1]
	s_cbranch_execz .LBB2_162
; %bb.161:                              ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v6, s64
	v_cvt_f32_u32_e32 v7, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s6, s0, s2
	s_mul_hi_u32 s8, s0, s3
	s_mul_i32 s7, s1, s3
	s_add_i32 s6, s8, s6
	s_mul_i32 s9, s0, s3
	s_add_i32 s6, s6, s7
	s_mul_i32 s8, s3, s6
	s_mul_hi_u32 s10, s3, s9
	s_mul_hi_u32 s7, s3, s6
	s_add_u32 s8, s10, s8
	s_addc_u32 s7, 0, s7
	s_mul_hi_u32 s11, s2, s9
	s_mul_i32 s9, s2, s9
	s_add_u32 s8, s8, s9
	s_mul_hi_u32 s10, s2, s6
	s_addc_u32 s7, s7, s11
	s_addc_u32 s8, s10, 0
	s_mul_i32 s6, s2, s6
	s_add_u32 s6, s7, s6
	s_addc_u32 s7, 0, s8
	s_add_u32 s3, s3, s6
	s_addc_u32 s2, s2, s7
	s_mul_i32 s6, s0, s2
	s_mul_hi_u32 s7, s0, s3
	s_add_i32 s6, s7, s6
	s_mul_i32 s1, s1, s3
	s_add_i32 s6, s6, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s7, s2, s0
	s_mul_i32 s8, s2, s0
	s_mul_i32 s10, s3, s6
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s9, s3, s6
	s_add_u32 s0, s0, s10
	s_addc_u32 s9, 0, s9
	s_add_u32 s0, s0, s8
	s_mul_hi_u32 s1, s2, s6
	s_addc_u32 s0, s9, s7
	s_addc_u32 s1, s1, 0
	s_mul_i32 s6, s2, s6
	s_add_u32 s0, s0, s6
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s2, 0
	v_mul_hi_u32 v8, v4, s3
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s39
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v8, s65, v6
	v_mul_lo_u32 v9, s64, v7
	v_mad_u64_u32 v[6:7], s[0:1], s64, v6, 0
	v_add3_u32 v7, v7, v9, v8
	v_sub_u32_e32 v8, v5, v7
	v_mov_b32_e32 v9, s65
	v_sub_co_u32_e32 v4, vcc, v4, v6
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v8, v9, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s64, v4
	v_subb_co_u32_e32 v5, vcc, v5, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v10, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v10
	v_subb_co_u32_e64 v6, s[0:1], v6, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v8
	v_subrev_co_u32_e64 v9, s[0:1], s64, v8
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v10
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, v11, v12, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v5
	v_cmp_ne_u32_e64 s[0:1], 0, v11
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v4
	v_cndmask_b32_e64 v6, v10, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v5
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v5, v6, vcc
	v_cndmask_b32_e64 v5, v8, v9, s[0:1]
	v_cndmask_b32_e32 v6, v4, v5, vcc
                                        ; implicit-def: $vgpr4_vgpr5
.LBB2_162:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[4:5]
	s_cbranch_execz .LBB2_164
; %bb.163:                              ;   in Loop: Header=BB2_56 Depth=1
	v_cvt_f32_u32_e32 v5, s64
	s_waitcnt lgkmcnt(0)
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v7, v40
	v_rcp_iflag_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x4f7ffffe, v5
	v_cvt_u32_f32_e32 v5, v5
	v_mul_lo_u32 v6, s2, v5
	v_mul_hi_u32 v6, v5, v6
	v_add_u32_e32 v5, v5, v6
	v_mul_hi_u32 v5, v4, v5
	v_mul_lo_u32 v5, v5, s64
	v_sub_u32_e32 v4, v4, v5
	v_subrev_u32_e32 v5, s64, v4
	v_cmp_le_u32_e32 vcc, s64, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s64, v4
	v_cmp_le_u32_e32 vcc, s64, v4
	s_nop 1
	v_cndmask_b32_e32 v6, v4, v5, vcc
.LBB2_164:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v124, 52
	v_mov_b32_e32 v41, v94
	s_waitcnt lgkmcnt(0)
	s_mov_b32 s2, s0
	s_mov_b32 s3, s0
	s_waitcnt vmcnt(1)
	v_lshl_add_u64 v[2:3], v[6:7], 3, v[2:3]
	v_lshl_add_u64 v[4:5], v[40:41], 0, s[2:3]
	flat_store_dwordx2 v[2:3], v[4:5] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[68:69]
	global_atomic_add_x2 v[0:1], v[90:91], off
	v_add_u32_e32 v0, 1, v108
	v_sub_u32_e32 v2, 0, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_max_i32_e32 v0, v2, v0
	v_mul_hi_u32 v2, v0, v45
	v_mul_lo_u32 v2, v2, s53
	v_sub_u32_e32 v0, v0, v2
	v_subrev_u32_e32 v2, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_readlane_b32 s1, v124, 53
	v_writelane_b32 v124, s0, 52
	v_cndmask_b32_e32 v0, v0, v2, vcc
	v_subrev_u32_e32 v2, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_writelane_b32 v124, s1, 53
	s_nop 0
	v_cndmask_b32_e32 v0, v0, v2, vcc
	v_xor_b32_e32 v0, v0, v1
	v_sub_u32_e32 v22, v0, v1
	s_branch .LBB2_176
.LBB2_165:                              ;   in Loop: Header=BB2_56 Depth=1
                                        ; implicit-def: $vgpr22
	s_cbranch_execz .LBB2_176
; %bb.166:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v124, 50
	v_readlane_b32 s1, v124, 51
	s_andn2_b64 vcc, exec, s[0:1]
	v_mov_b32_e32 v22, v108
	s_cbranch_vccnz .LBB2_176
; %bb.167:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s38, 0
.LBB2_168:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_173 Depth 3
	s_lshl_b64 s[4:5], s[38:39], 3
	s_add_u32 s0, s62, s4
	s_addc_u32 s1, s63, s5
	v_mov_b64_e32 v[0:1], s[0:1]
	s_add_u32 s0, s86, s4
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[0:1], v[90:91] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_addc_u32 s1, s87, s5
	global_load_dwordx2 v[0:1], v40, s[0:1]
	v_or_b32_e32 v41, s67, v3
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB2_170
; %bb.169:                              ;   in Loop: Header=BB2_168 Depth=2
	v_cvt_f32_u32_e32 v4, s66
	v_cvt_f32_u32_e32 v5, s67
	s_sub_u32 s0, 0, s66
	s_subb_u32 s1, 0, s67
	v_mov_b32_e32 v7, v40
	v_fmac_f32_e32 v4, 0x4f800000, v5
	v_rcp_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v5, 0x2f800000, v4
	v_trunc_f32_e32 v5, v5
	v_fmac_f32_e32 v4, 0xcf800000, v5
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v4, v4
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s2, v5
	v_readfirstlane_b32 s3, v4
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[4:5], s[0:1], v2, s2, 0
	v_mul_hi_u32 v6, v2, s3
	v_lshl_add_u64 v[4:5], v[6:7], 0, v[4:5]
	v_mad_u64_u32 v[8:9], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v4, vcc, v4, v8
	v_mad_u64_u32 v[6:7], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v9, vcc
	v_mov_b32_e32 v5, s39
	s_nop 0
	v_addc_co_u32_e32 v7, vcc, 0, v7, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[6:7]
	v_mul_lo_u32 v6, s67, v4
	v_mul_lo_u32 v7, s66, v5
	v_mad_u64_u32 v[4:5], s[0:1], s66, v4, 0
	v_add3_u32 v5, v5, v7, v6
	v_sub_u32_e32 v6, v3, v5
	v_mov_b32_e32 v7, s67
	v_sub_co_u32_e32 v4, vcc, v2, v4
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v6, v7, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s66, v4
	v_subb_co_u32_e32 v5, vcc, v3, v5, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v9, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s67, v9
	v_subb_co_u32_e64 v6, s[0:1], v6, v7, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s66, v8
	v_subrev_co_u32_e64 v7, s[0:1], s66, v8
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s67, v9
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, v10, v11, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v10
	v_cmp_le_u32_e32 vcc, s67, v5
	s_nop 0
	v_cndmask_b32_e64 v6, v9, v6, s[0:1]
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s66, v4
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s67, v5
	s_nop 1
	v_cndmask_b32_e32 v9, v9, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v9
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cndmask_b32_e64 v6, v8, v7, s[0:1]
	v_cndmask_b32_e32 v4, v4, v6, vcc
.LBB2_170:                              ;   in Loop: Header=BB2_168 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB2_172
; %bb.171:                              ;   in Loop: Header=BB2_168 Depth=2
	v_cvt_f32_u32_e32 v4, s66
	s_waitcnt lgkmcnt(0)
	s_sub_i32 s2, 0, s66
	v_rcp_iflag_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, s2, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v2, v4
	v_mul_lo_u32 v4, v4, s66
	v_sub_u32_e32 v4, v2, v4
	v_subrev_u32_e32 v5, s66, v4
	v_cmp_le_u32_e32 vcc, s66, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s66, v4
	v_cmp_le_u32_e32 vcc, s66, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_mov_b32_e32 v5, v40
.LBB2_172:                              ;   in Loop: Header=BB2_168 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[0:1], v[4:5], 3, v[0:1]
	;;#ASMSTART
	global_store_dwordx2 v[0:1], v[88:89], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	s_waitcnt lgkmcnt(0)
	s_add_u32 s2, s70, s4
	s_mov_b64 s[0:1], 0
	s_addc_u32 s3, s71, s5
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	buffer_wbl2 sc1
.LBB2_173:                              ;   Parent Loop BB2_56 Depth=1
                                        ;     Parent Loop BB2_168 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_mov_b64_e32 v[4:5], s[2:3]
	;;#ASMSTART
	flat_atomic_cmpswap_x2 v[4:5], v[4:5], v[0:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB2_173
; %bb.174:                              ;   in Loop: Header=BB2_168 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_add_i32 s38, s38, 1
	s_cmp_eq_u32 s38, s92
	s_cbranch_scc0 .LBB2_168
; %bb.175:                              ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b32_e32 v22, v108
.LBB2_176:                              ;   in Loop: Header=BB2_56 Depth=1
	v_add_u32_e32 v12, 1, v42
	s_xor_b64 s[0:1], exec, -1
.LBB2_177:                              ;   in Loop: Header=BB2_56 Depth=1
	s_waitcnt lgkmcnt(0)
	v_readlane_b32 s2, v124, 60
	v_readlane_b32 s3, v124, 61
	s_or_b64 exec, exec, s[2:3]
	s_and_b64 s[4:5], s[0:1], exec
	v_readlane_b32 s0, v124, 58
	v_readlane_b32 s1, v124, 59
                                        ; implicit-def: $vgpr4
.LBB2_178:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_saveexec_b64 s[6:7], s[0:1]
	v_readlane_b32 s0, v109, 12
	v_mov_b64_e32 v[14:15], s[40:41]
	v_mov_b64_e32 v[2:3], v[94:95]
	v_mov_b64_e32 v[0:1], v[120:121]
	v_readlane_b32 s1, v109, 13
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execz .LBB2_267
; %bb.179:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0x387
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_mov_b64 s[0:1], -1
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr22
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_266
; %bb.180:                              ;   in Loop: Header=BB2_56 Depth=1
	s_load_dword s0, s[44:45], 0x140
	s_waitcnt vmcnt(0)
	v_sub_co_u32_e32 v4, vcc, v74, v72
	s_mov_b64 s[10:11], 0
	s_nop 0
	v_subb_co_u32_e32 v5, vcc, v75, v73, vcc
	v_cmp_lt_i32_e32 vcc, 0, v4
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u32_e64 s[0:1], s0, v4
	s_and_b64 s[12:13], vcc, s[0:1]
	s_mov_b64 s[0:1], -1
	v_mov_b64_e32 v[0:1], v[120:121]
	s_and_saveexec_b64 s[2:3], s[12:13]
	s_cbranch_execz .LBB2_192
; %bb.181:                              ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b64_e32 v[0:1], s[80:81]
	v_mad_u64_u32 v[0:1], s[0:1], v72, s37, v[0:1]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v73, s37, v[2:3]
	v_mov_b32_e32 v1, v2
	global_load_dword v2, v[0:1], off
	s_movk_i32 s10, 0x88
	s_mov_b64 s[0:1], 0
	s_mov_b64 s[12:13], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v3, -4, v2
	v_cmp_ne_u32_e32 vcc, s10, v3
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB2_191
; %bb.182:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e32 vcc, s0, v2
	s_mov_b64 s[14:15], 0
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[12:13], exec, s[0:1]
	s_cbranch_execz .LBB2_188
; %bb.183:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e32 vcc, s0, v2
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.184:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s14, 0xb8
	v_cmp_lt_i32_e32 vcc, s14, v2
	s_mov_b64 s[16:17], exec
	s_and_b64 s[14:15], vcc, exec
                                        ; implicit-def: $vgpr2
; %bb.185:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[18:19], s[0:1]
	s_cbranch_execz .LBB2_187
; %bb.186:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v2
	s_movk_i32 s0, 0xaf
	v_cmp_lt_i32_e64 s[0:1], s0, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[20:21], vcc, exec
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[16:17], s[16:17], s[20:21]
	s_or_b64 s[14:15], s[14:15], s[0:1]
.LBB2_187:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[18:19]
	s_and_b64 s[16:17], s[16:17], exec
	s_and_b64 s[14:15], s[14:15], exec
                                        ; implicit-def: $vgpr2
.LBB2_188:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[12:13], s[12:13]
; %bb.189:                              ;   in Loop: Header=BB2_56 Depth=1
	v_add_u32_e32 v2, 0xffffff72, v2
	v_cmp_gt_u32_e32 vcc, 7, v2
	v_cmp_lt_u32_e64 s[0:1], 6, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[18:19], vcc, exec
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[16:17], s[16:17], s[18:19]
	s_or_b64 s[14:15], s[14:15], s[0:1]
; %bb.190:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_orn2_b64 s[12:13], s[16:17], exec
	s_and_b64 s[0:1], s[14:15], exec
.LBB2_191:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[10:11], s[12:13], exec
	s_orn2_b64 s[0:1], s[0:1], exec
.LBB2_192:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[2:3]
	v_lshl_add_u64 v[2:3], v[94:95], 0, 1
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB2_218
; %bb.193:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v124, 56
	v_readlane_b32 s1, v124, 57
	s_nop 1
	v_lshl_add_u64 v[6:7], s[0:1], 0, v[4:5]
	v_readlane_b32 s0, v109, 14
	v_readlane_b32 s1, v109, 15
                                        ; implicit-def: $vgpr4_vgpr5
	s_nop 1
	v_or_b32_e32 v41, s1, v7
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[2:3], exec, s[0:1]
	s_cbranch_execz .LBB2_195
; %bb.194:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s22, v109, 14
	v_readlane_b32 s23, v109, 15
	s_sub_u32 s0, 0, s22
	v_cvt_f32_u32_e32 v4, s22
	v_cvt_f32_u32_e32 v5, s23
	s_subb_u32 s1, 0, s23
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v4, 0x4f800000, v5
	v_rcp_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v5, 0x2f800000, v4
	v_trunc_f32_e32 v5, v5
	v_fmac_f32_e32 v4, 0xcf800000, v5
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v4, v4
	v_readfirstlane_b32 s14, v5
	v_readfirstlane_b32 s15, v4
	s_mul_i32 s16, s0, s14
	s_mul_hi_u32 s18, s0, s15
	s_mul_i32 s17, s1, s15
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s15
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s15, s16
	s_mul_hi_u32 s20, s15, s19
	s_mul_hi_u32 s17, s15, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s14, s19
	s_mul_i32 s19, s14, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s14, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s14, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s15, s15, s16
	s_addc_u32 s14, s14, s17
	s_mul_i32 s16, s0, s14
	s_mul_hi_u32 s17, s0, s15
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s15
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s15
	s_mul_hi_u32 s17, s14, s0
	s_mul_i32 s18, s14, s0
	s_mul_i32 s20, s15, s16
	s_mul_hi_u32 s0, s15, s0
	s_mul_hi_u32 s19, s15, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s14, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s14, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s15, s15, s0
	s_addc_u32 s14, s14, s1
	v_mad_u64_u32 v[4:5], s[0:1], v6, s14, 0
	v_mul_hi_u32 v8, v6, s15
	v_lshl_add_u64 v[4:5], v[8:9], 0, v[4:5]
	v_mad_u64_u32 v[10:11], s[0:1], v7, s15, 0
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_mad_u64_u32 v[8:9], s[0:1], v7, s14, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v11, vcc
	v_mov_b32_e32 v5, s39
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[8:9]
	v_mul_lo_u32 v10, s23, v4
	v_mul_lo_u32 v11, s22, v5
	v_mad_u64_u32 v[8:9], s[0:1], s22, v4, 0
	v_add3_u32 v12, v9, v11, v10
	v_sub_u32_e32 v9, v7, v12
	v_mov_b32_e32 v10, s23
	v_sub_co_u32_e32 v13, vcc, v6, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v9, v10, vcc
	v_subrev_co_u32_e64 v9, s[0:1], s22, v13
	s_nop 1
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s23, v8
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s22, v9
	s_nop 1
	v_cndmask_b32_e64 v9, 0, -1, s[0:1]
	v_cmp_eq_u32_e64 s[0:1], s23, v8
	s_nop 1
	v_cndmask_b32_e64 v14, v10, v9, s[0:1]
	v_lshl_add_u64 v[8:9], v[4:5], 0, 2
	v_lshl_add_u64 v[10:11], v[4:5], 0, 1
	v_cmp_ne_u32_e64 s[0:1], 0, v14
	s_nop 1
	v_cndmask_b32_e64 v9, v11, v9, s[0:1]
	v_subb_co_u32_e32 v11, vcc, v7, v12, vcc
	v_cmp_le_u32_e32 vcc, s23, v11
	v_cndmask_b32_e64 v8, v10, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s22, v13
	s_nop 1
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s23, v11
	s_nop 1
	v_cndmask_b32_e32 v11, v12, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cndmask_b32_e32 v4, v4, v8, vcc
.LBB2_195:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB2_197
; %bb.196:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s14, v109, 14
	s_sub_i32 s2, 0, s14
	v_readlane_b32 s15, v109, 15
	v_cvt_f32_u32_e32 v4, s14
	v_rcp_iflag_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, s2, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v6, v4
	v_mul_lo_u32 v5, v4, s14
	v_sub_u32_e32 v5, v6, v5
	v_add_u32_e32 v8, 1, v4
	v_subrev_u32_e32 v9, s14, v5
	v_cmp_le_u32_e32 vcc, s14, v5
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cndmask_b32_e32 v4, v4, v8, vcc
	v_add_u32_e32 v8, 1, v4
	v_cmp_le_u32_e32 vcc, s14, v5
	v_mov_b32_e32 v5, v40
	s_nop 0
	v_cndmask_b32_e32 v4, v4, v8, vcc
.LBB2_197:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v109, 2
	v_cmp_eq_u64_e32 vcc, 0, v[94:95]
	v_readlane_b32 s1, v109, 3
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB2_220
; %bb.198:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s2, v109, 14
	v_readlane_b32 s3, v109, 15
	s_nop 1
	v_cmp_le_u64_e32 vcc, s[2:3], v[6:7]
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB2_219
; %bb.199:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b64 s[14:15], 0
	s_mov_b64 s[16:17], 0
	s_branch .LBB2_201
.LBB2_200:                              ;   in Loop: Header=BB2_201 Depth=2
	s_add_u32 s16, s16, 1
	s_addc_u32 s17, s17, 0
	v_cmp_ge_u64_e32 vcc, s[16:17], v[4:5]
	s_or_b64 s[14:15], vcc, s[14:15]
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_219
.LBB2_201:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_205 Depth 3
	v_readlane_b32 s18, v124, 62
	v_readlane_b32 s19, v124, 63
	s_andn2_b64 vcc, exec, s[18:19]
	s_cbranch_vccnz .LBB2_200
; %bb.202:                              ;   in Loop: Header=BB2_201 Depth=2
	v_readlane_b32 s22, v109, 14
	v_readlane_b32 s23, v109, 15
	s_mul_i32 s18, s17, s22
	s_mul_i32 s19, s16, s23
	v_mov_b32_e32 v8, s22
	s_add_i32 s20, s19, s18
	v_mad_u64_u32 v[8:9], s[18:19], s16, v8, v[72:73]
	v_add_u32_e32 v9, s20, v9
	s_mov_b32 s28, 0
	s_mov_b32 s29, s33
	s_branch .LBB2_205
.LBB2_203:                              ;   in Loop: Header=BB2_205 Depth=3
	s_or_b64 exec, exec, s[20:21]
	v_add_u32_e32 v10, s55, v12
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[10:11], v[10:11], 2, s[88:89]
	global_load_dword v12, v[10:11], off
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v12, v12, v13
	global_store_dword v[10:11], v12, off
.LBB2_204:                              ;   in Loop: Header=BB2_205 Depth=3
	s_or_b64 exec, exec, s[18:19]
	s_add_i32 s29, s29, -1
	s_add_i32 s28, s28, 4
	s_cmp_eq_u32 s29, 0
	s_cbranch_scc1 .LBB2_200
.LBB2_205:                              ;   Parent Loop BB2_56 Depth=1
                                        ;     Parent Loop BB2_201 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	scratch_load_dword v10, off, s28
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[12:13], v[8:9], 0, v[10:11]
	v_cmp_lt_u64_e32 vcc, v[12:13], v[74:75]
	s_and_saveexec_b64 s[18:19], vcc
	s_cbranch_execz .LBB2_204
; %bb.206:                              ;   in Loop: Header=BB2_205 Depth=3
	v_mov_b64_e32 v[10:11], s[80:81]
	v_mad_u64_u32 v[10:11], s[20:21], v12, s37, v[10:11]
	v_mov_b32_e32 v12, v11
	v_mad_u64_u32 v[12:13], s[20:21], v13, s37, v[12:13]
	v_mov_b32_e32 v11, v12
	global_load_dword v14, v[10:11], off
	global_load_dwordx2 v[12:13], v[10:11], off offset:8
	s_movk_i32 s20, 0x88
	s_mov_b64 s[22:23], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v13, -4, v14
	v_cmp_ne_u32_e32 vcc, s20, v13
	s_and_saveexec_b64 s[20:21], vcc
	s_cbranch_execz .LBB2_216
; %bb.207:                              ;   in Loop: Header=BB2_205 Depth=3
	s_movk_i32 s22, 0xad
	v_cmp_lt_i32_e32 vcc, s22, v14
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[22:23], vcc
	s_xor_b64 s[22:23], exec, s[22:23]
	s_cbranch_execz .LBB2_213
; %bb.208:                              ;   in Loop: Header=BB2_205 Depth=3
	s_movk_i32 s24, 0xb6
	v_cmp_lt_i32_e32 vcc, s24, v14
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[26:27], vcc
	s_xor_b64 s[26:27], exec, s[26:27]
; %bb.209:                              ;   in Loop: Header=BB2_205 Depth=3
	s_movk_i32 s24, 0xb9
	v_cmp_gt_i32_e32 vcc, s24, v14
	s_and_b64 s[24:25], vcc, exec
                                        ; implicit-def: $vgpr14
; %bb.210:                              ;   in Loop: Header=BB2_205 Depth=3
	s_andn2_saveexec_b64 s[26:27], s[26:27]
; %bb.211:                              ;   in Loop: Header=BB2_205 Depth=3
	s_movk_i32 s30, 0xb0
	v_cmp_gt_i32_e32 vcc, s30, v14
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[30:31], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[30:31]
; %bb.212:                              ;   in Loop: Header=BB2_205 Depth=3
	s_or_b64 exec, exec, s[26:27]
	s_and_b64 s[24:25], s[24:25], exec
                                        ; implicit-def: $vgpr14
.LBB2_213:                              ;   in Loop: Header=BB2_205 Depth=3
	s_andn2_saveexec_b64 s[22:23], s[22:23]
; %bb.214:                              ;   in Loop: Header=BB2_205 Depth=3
	v_add_u32_e32 v13, 0xffffff72, v14
	v_cmp_gt_u32_e32 vcc, 7, v13
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[26:27]
; %bb.215:                              ;   in Loop: Header=BB2_205 Depth=3
	s_or_b64 exec, exec, s[22:23]
	s_orn2_b64 s[22:23], s[24:25], exec
.LBB2_216:                              ;   in Loop: Header=BB2_205 Depth=3
	s_or_b64 exec, exec, s[20:21]
	v_mov_b32_e32 v13, 1
	s_and_saveexec_b64 s[20:21], s[22:23]
	s_cbranch_execz .LBB2_203
; %bb.217:                              ;   in Loop: Header=BB2_205 Depth=3
	global_load_ushort v13, v[10:11], off offset:106
	s_branch .LBB2_203
.LBB2_218:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_and_saveexec_b64 s[0:1], s[10:11]
	s_xor_b64 s[10:11], exec, s[0:1]
	s_cbranch_execnz .LBB2_255
	s_branch .LBB2_265
.LBB2_219:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[2:3]
	;;#ASMSTART
	;;#ASMEND
.LBB2_220:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v109, 14
	v_readlane_b32 s1, v109, 15
	v_mov_b32_e32 v22, v108
	s_nop 0
	v_cmp_le_u64_e32 vcc, s[0:1], v[6:7]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_254
; %bb.221:                              ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b32_e32 v7, v2
	s_mov_b64 s[16:17], 0
	v_mov_b32_e32 v22, v108
	s_mov_b64 s[18:19], 0
	s_branch .LBB2_223
.LBB2_222:                              ;   in Loop: Header=BB2_223 Depth=2
	s_add_u32 s18, s18, 1
	s_addc_u32 s19, s19, 0
	v_cmp_ge_u64_e32 vcc, s[18:19], v[4:5]
	s_or_b64 s[16:17], vcc, s[16:17]
	s_andn2_b64 exec, exec, s[16:17]
	s_cbranch_execz .LBB2_253
.LBB2_223:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_228 Depth 3
                                        ;         Child Loop BB2_249 Depth 4
	v_readlane_b32 s0, v124, 62
	v_readlane_b32 s1, v124, 63
	s_andn2_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB2_222
; %bb.224:                              ;   in Loop: Header=BB2_223 Depth=2
	v_readlane_b32 s20, v109, 14
	v_readlane_b32 s21, v109, 15
	s_mul_i32 s0, s19, s20
	s_mul_i32 s1, s18, s21
	v_mov_b32_e32 v6, s20
	s_add_i32 s2, s1, s0
	v_mad_u64_u32 v[8:9], s[0:1], s18, v6, v[72:73]
	v_add_u32_e32 v9, s2, v9
	s_mov_b32 s30, 0
	s_branch .LBB2_228
.LBB2_225:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[24:25]
	v_mov_b32_e32 v14, v22
.LBB2_226:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[22:23]
	v_mov_b32_e32 v22, v14
.LBB2_227:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[20:21]
	s_add_i32 s30, s30, 1
	s_cmp_eq_u32 s30, s33
	s_cbranch_scc1 .LBB2_222
.LBB2_228:                              ;   Parent Loop BB2_56 Depth=1
                                        ;     Parent Loop BB2_223 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_249 Depth 4
	s_lshl_b32 s0, s30, 2
	s_nop 0
	scratch_load_dword v10, off, s0
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[10:11], v[8:9], 0, v[10:11]
	v_cmp_lt_u64_e32 vcc, v[10:11], v[74:75]
	s_and_saveexec_b64 s[20:21], vcc
	s_cbranch_execz .LBB2_227
; %bb.229:                              ;   in Loop: Header=BB2_228 Depth=3
	v_mov_b64_e32 v[12:13], s[80:81]
	v_mad_u64_u32 v[12:13], s[0:1], v10, s37, v[12:13]
	v_mov_b32_e32 v6, v13
	v_mad_u64_u32 v[14:15], s[0:1], v11, s37, v[6:7]
	v_mov_b32_e32 v13, v14
	global_load_dword v6, v[12:13], off
	s_movk_i32 s0, 0x88
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v14, -4, v6
	v_cmp_ne_u32_e32 vcc, s0, v14
	s_mov_b64 s[0:1], -1
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[22:23], vcc
	s_cbranch_execz .LBB2_245
; %bb.230:                              ;   in Loop: Header=BB2_228 Depth=3
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e32 vcc, s0, v6
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[2:3], exec, s[0:1]
	s_cbranch_execz .LBB2_237
; %bb.231:                              ;   in Loop: Header=BB2_228 Depth=3
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e32 vcc, s0, v6
	s_mov_b64 s[26:27], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.232:                              ;   in Loop: Header=BB2_228 Depth=3
	s_movk_i32 s26, 0xb8
	v_cmp_lt_i32_e32 vcc, s26, v6
	s_mov_b64 s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
                                        ; implicit-def: $vgpr6
; %bb.233:                              ;   in Loop: Header=BB2_228 Depth=3
	s_andn2_saveexec_b64 s[28:29], s[0:1]
	s_cbranch_execz .LBB2_235
; %bb.234:                              ;   in Loop: Header=BB2_228 Depth=3
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v6
	s_movk_i32 s0, 0xaf
	v_cmp_lt_i32_e64 s[0:1], s0, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[34:35], vcc, exec
	s_andn2_b64 s[26:27], s[26:27], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[24:25], s[24:25], s[34:35]
	s_or_b64 s[26:27], s[26:27], s[0:1]
.LBB2_235:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[28:29]
	s_and_b64 s[24:25], s[24:25], exec
	s_and_b64 s[28:29], s[26:27], exec
                                        ; implicit-def: $vgpr6
	s_andn2_saveexec_b64 s[2:3], s[2:3]
	s_cbranch_execnz .LBB2_238
.LBB2_236:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[2:3]
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[26:27], s[28:29]
	s_cbranch_execnz .LBB2_239
	s_branch .LBB2_244
.LBB2_237:                              ;   in Loop: Header=BB2_228 Depth=3
	s_andn2_saveexec_b64 s[2:3], s[2:3]
	s_cbranch_execz .LBB2_236
.LBB2_238:                              ;   in Loop: Header=BB2_228 Depth=3
	v_add_u32_e32 v6, 0xffffff72, v6
	v_cmp_gt_u32_e32 vcc, 7, v6
	v_cmp_lt_u32_e64 s[0:1], 6, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[26:27]
	s_andn2_b64 s[26:27], s[28:29], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[28:29], s[26:27], s[0:1]
	s_or_b64 exec, exec, s[2:3]
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[26:27], s[28:29]
	s_cbranch_execz .LBB2_244
.LBB2_239:                              ;   in Loop: Header=BB2_228 Depth=3
	s_mov_b32 s0, 0
	v_lshl_add_u32 v6, v22, 2, s0
	scratch_load_dword v14, v6, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v6, v22, 3, s0
	scratch_load_dwordx2 v[18:19], v6, off
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v15, 31, v14
	v_lshl_add_u64 v[16:17], v[14:15], 3, s[84:85]
	global_load_dwordx2 v[16:17], v[16:17], off
	s_waitcnt vmcnt(1)
	v_or_b32_e32 v41, s65, v19
	v_lshl_add_u64 v[20:21], v[18:19], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v6, v[20:21], off
                                        ; implicit-def: $vgpr20_vgpr21
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[28:29], exec, s[0:1]
	s_cbranch_execz .LBB2_241
; %bb.240:                              ;   in Loop: Header=BB2_228 Depth=3
	v_cvt_f32_u32_e32 v6, s64
	v_cvt_f32_u32_e32 v20, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v25, v40
	v_fmac_f32_e32 v6, 0x4f800000, v20
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v20, 0x2f800000, v6
	v_trunc_f32_e32 v20, v20
	v_fmac_f32_e32 v6, 0xcf800000, v20
	v_cvt_u32_f32_e32 v20, v20
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s2, v20
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s31, s0, s2
	s_mul_hi_u32 s35, s0, s3
	s_mul_i32 s34, s1, s3
	s_add_i32 s31, s35, s31
	s_mul_i32 s38, s0, s3
	s_add_i32 s31, s31, s34
	s_mul_i32 s35, s3, s31
	s_mul_hi_u32 s40, s3, s38
	s_mul_hi_u32 s34, s3, s31
	s_add_u32 s35, s40, s35
	s_addc_u32 s34, 0, s34
	s_mul_hi_u32 s41, s2, s38
	s_mul_i32 s38, s2, s38
	s_add_u32 s35, s35, s38
	s_mul_hi_u32 s40, s2, s31
	s_addc_u32 s34, s34, s41
	s_addc_u32 s35, s40, 0
	s_mul_i32 s31, s2, s31
	s_add_u32 s31, s34, s31
	s_addc_u32 s34, 0, s35
	s_add_u32 s3, s3, s31
	s_addc_u32 s2, s2, s34
	s_mul_i32 s31, s0, s2
	s_mul_hi_u32 s34, s0, s3
	s_add_i32 s31, s34, s31
	s_mul_i32 s1, s1, s3
	s_add_i32 s31, s31, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s34, s2, s0
	s_mul_i32 s35, s2, s0
	s_mul_i32 s40, s3, s31
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s38, s3, s31
	s_add_u32 s0, s0, s40
	s_addc_u32 s38, 0, s38
	s_add_u32 s0, s0, s35
	s_mul_hi_u32 s1, s2, s31
	s_addc_u32 s0, s38, s34
	s_addc_u32 s1, s1, 0
	s_mul_i32 s31, s2, s31
	s_add_u32 s0, s0, s31
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[20:21], s[0:1], v18, s2, 0
	v_mul_hi_u32 v24, v18, s3
	v_lshl_add_u64 v[20:21], v[24:25], 0, v[20:21]
	v_mad_u64_u32 v[26:27], s[0:1], v19, s3, 0
	v_add_co_u32_e32 v6, vcc, v20, v26
	v_mad_u64_u32 v[24:25], s[0:1], v19, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v20, vcc, v21, v27, vcc
	v_mov_b32_e32 v21, s39
	s_nop 0
	v_addc_co_u32_e32 v25, vcc, 0, v25, vcc
	v_lshl_add_u64 v[20:21], v[20:21], 0, v[24:25]
	v_mul_lo_u32 v6, s65, v20
	v_mul_lo_u32 v23, s64, v21
	v_mad_u64_u32 v[20:21], s[0:1], s64, v20, 0
	v_add3_u32 v6, v21, v23, v6
	v_sub_u32_e32 v21, v19, v6
	v_mov_b32_e32 v23, s65
	v_sub_co_u32_e32 v18, vcc, v18, v20
	s_nop 1
	v_subb_co_u32_e64 v20, s[0:1], v21, v23, vcc
	v_subrev_co_u32_e64 v24, s[0:1], s64, v18
	v_subb_co_u32_e32 v6, vcc, v19, v6, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v21, s[2:3], 0, v20, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v21
	v_subb_co_u32_e64 v20, s[0:1], v20, v23, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v25, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v24
	v_subrev_co_u32_e64 v23, s[0:1], s64, v24
	s_nop 0
	v_cndmask_b32_e64 v26, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v21
	v_subbrev_co_u32_e64 v20, s[0:1], 0, v20, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v25, v25, v26, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v6
	v_cmp_ne_u32_e64 s[0:1], 0, v25
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v18
	v_cndmask_b32_e64 v20, v21, v20, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v21, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v6
	s_nop 1
	v_cndmask_b32_e32 v19, v19, v21, vcc
	v_cmp_ne_u32_e32 vcc, 0, v19
	s_nop 1
	v_cndmask_b32_e32 v21, v6, v20, vcc
	v_cndmask_b32_e64 v6, v24, v23, s[0:1]
	v_cndmask_b32_e32 v20, v18, v6, vcc
                                        ; implicit-def: $vgpr18_vgpr19
.LBB2_241:                              ;   in Loop: Header=BB2_228 Depth=3
	s_andn2_saveexec_b64 s[0:1], s[28:29]
	s_cbranch_execz .LBB2_243
; %bb.242:                              ;   in Loop: Header=BB2_228 Depth=3
	v_cvt_f32_u32_e32 v6, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v21, v40
	v_rcp_iflag_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_mul_lo_u32 v19, s2, v6
	v_mul_hi_u32 v19, v6, v19
	v_add_u32_e32 v6, v6, v19
	v_mul_hi_u32 v6, v18, v6
	v_mul_lo_u32 v6, v6, s64
	v_sub_u32_e32 v6, v18, v6
	v_subrev_u32_e32 v18, s64, v6
	v_cmp_le_u32_e32 vcc, s64, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v18, vcc
	v_subrev_u32_e32 v18, s64, v6
	v_cmp_le_u32_e32 vcc, s64, v6
	s_nop 1
	v_cndmask_b32_e32 v20, v6, v18, vcc
.LBB2_243:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[16:17], v[20:21], 3, v[16:17]
	v_or_b32_e32 v19, v11, v7
	v_mov_b32_e32 v18, v10
	flat_store_dwordx2 v[16:17], v[18:19] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[14:15], v[14:15], 3, s[68:69]
	global_atomic_add_x2 v[14:15], v[90:91], off
	v_add_u32_e32 v6, 1, v22
	v_sub_u32_e32 v15, 0, v6
	v_ashrrev_i32_e32 v14, 31, v6
	v_max_i32_e32 v6, v15, v6
	v_mul_hi_u32 v15, v6, v45
	v_mul_lo_u32 v15, v15, s53
	v_sub_u32_e32 v6, v6, v15
	v_subrev_u32_e32 v15, s53, v6
	v_cmp_le_u32_e32 vcc, s53, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_nop 0
	v_cndmask_b32_e32 v6, v6, v15, vcc
	v_subrev_u32_e32 v15, s53, v6
	v_cmp_le_u32_e32 vcc, s53, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v15, vcc
	v_xor_b32_e32 v6, v6, v14
	v_sub_u32_e32 v14, v6, v14
.LBB2_244:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[26:27]
	s_orn2_b64 s[0:1], s[24:25], exec
.LBB2_245:                              ;   in Loop: Header=BB2_228 Depth=3
	s_or_b64 exec, exec, s[22:23]
	s_and_saveexec_b64 s[22:23], s[0:1]
	s_cbranch_execz .LBB2_226
; %bb.246:                              ;   in Loop: Header=BB2_228 Depth=3
	global_load_ushort v6, v[12:13], off offset:106
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_e32 vcc, 0, v6
	s_and_saveexec_b64 s[24:25], vcc
	s_cbranch_execz .LBB2_225
; %bb.247:                              ;   in Loop: Header=BB2_228 Depth=3
	v_min_i32_sdwa v6, s33, v6 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_0
	v_or_b32_e32 v11, v11, v7
	s_mov_b32 s31, 0
	s_movk_i32 s34, 0x200
	s_mov_b64 s[26:27], 0
	s_branch .LBB2_249
.LBB2_248:                              ;   in Loop: Header=BB2_249 Depth=4
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[14:15], v[18:19], 3, v[14:15]
	flat_store_dwordx2 v[14:15], v[10:11] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[12:13], v[12:13], 3, s[68:69]
	global_atomic_add_x2 v[12:13], v[90:91], off
	v_add_u32_e32 v6, -1, v6
	s_add_i32 s31, s31, 4
	s_add_i32 s34, s34, 8
	v_cmp_eq_u32_e32 vcc, 0, v6
	s_or_b64 s[26:27], vcc, s[26:27]
	s_andn2_b64 exec, exec, s[26:27]
	s_cbranch_execz .LBB2_225
.LBB2_249:                              ;   Parent Loop BB2_56 Depth=1
                                        ;     Parent Loop BB2_223 Depth=2
                                        ;       Parent Loop BB2_228 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	scratch_load_dword v12, off, s31
	scratch_load_dwordx2 v[16:17], off, s34
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v13, 31, v12
	v_lshl_add_u64 v[14:15], v[12:13], 3, s[84:85]
	global_load_dwordx2 v[14:15], v[14:15], off
	v_or_b32_e32 v41, s65, v17
	v_lshl_add_u64 v[18:19], v[16:17], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[18:19], s34
                                        ; implicit-def: $vgpr18_vgpr19
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[28:29], exec, s[0:1]
	s_cbranch_execz .LBB2_251
; %bb.250:                              ;   in Loop: Header=BB2_249 Depth=4
	v_cvt_f32_u32_e32 v18, s64
	v_cvt_f32_u32_e32 v19, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v21, v40
	v_fmac_f32_e32 v18, 0x4f800000, v19
	v_rcp_f32_e32 v18, v18
	s_nop 0
	v_mul_f32_e32 v18, 0x5f7ffffc, v18
	v_mul_f32_e32 v19, 0x2f800000, v18
	v_trunc_f32_e32 v19, v19
	v_fmac_f32_e32 v18, 0xcf800000, v19
	v_cvt_u32_f32_e32 v19, v19
	v_cvt_u32_f32_e32 v18, v18
	v_readfirstlane_b32 s2, v19
	v_readfirstlane_b32 s3, v18
	s_mul_i32 s35, s0, s2
	s_mul_hi_u32 s40, s0, s3
	s_mul_i32 s38, s1, s3
	s_add_i32 s35, s40, s35
	s_mul_i32 s41, s0, s3
	s_add_i32 s35, s35, s38
	s_mul_i32 s40, s3, s35
	s_mul_hi_u32 s42, s3, s41
	s_mul_hi_u32 s38, s3, s35
	s_add_u32 s40, s42, s40
	s_addc_u32 s38, 0, s38
	s_mul_hi_u32 s43, s2, s41
	s_mul_i32 s41, s2, s41
	s_add_u32 s40, s40, s41
	s_mul_hi_u32 s42, s2, s35
	s_addc_u32 s38, s38, s43
	s_addc_u32 s40, s42, 0
	s_mul_i32 s35, s2, s35
	s_add_u32 s35, s38, s35
	s_addc_u32 s38, 0, s40
	s_add_u32 s3, s3, s35
	s_addc_u32 s2, s2, s38
	s_mul_i32 s35, s0, s2
	s_mul_hi_u32 s38, s0, s3
	s_add_i32 s35, s38, s35
	s_mul_i32 s1, s1, s3
	s_add_i32 s35, s35, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s38, s2, s0
	s_mul_i32 s40, s2, s0
	s_mul_i32 s42, s3, s35
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s41, s3, s35
	s_add_u32 s0, s0, s42
	s_addc_u32 s41, 0, s41
	s_add_u32 s0, s0, s40
	s_mul_hi_u32 s1, s2, s35
	s_addc_u32 s0, s41, s38
	s_addc_u32 s1, s1, 0
	s_mul_i32 s35, s2, s35
	s_add_u32 s0, s0, s35
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[18:19], s[0:1], v16, s2, 0
	v_mul_hi_u32 v20, v16, s3
	v_lshl_add_u64 v[18:19], v[20:21], 0, v[18:19]
	v_mad_u64_u32 v[24:25], s[0:1], v17, s3, 0
	v_add_co_u32_e32 v18, vcc, v18, v24
	v_mad_u64_u32 v[20:21], s[0:1], v17, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v18, vcc, v19, v25, vcc
	v_mov_b32_e32 v19, s39
	s_nop 0
	v_addc_co_u32_e32 v21, vcc, 0, v21, vcc
	v_lshl_add_u64 v[18:19], v[18:19], 0, v[20:21]
	v_mul_lo_u32 v20, s65, v18
	v_mul_lo_u32 v21, s64, v19
	v_mad_u64_u32 v[18:19], s[0:1], s64, v18, 0
	v_add3_u32 v19, v19, v21, v20
	v_sub_u32_e32 v20, v17, v19
	v_mov_b32_e32 v21, s65
	v_sub_co_u32_e32 v16, vcc, v16, v18
	s_nop 1
	v_subb_co_u32_e64 v18, s[0:1], v20, v21, vcc
	v_subrev_co_u32_e64 v20, s[0:1], s64, v16
	v_subb_co_u32_e32 v17, vcc, v17, v19, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v23, s[2:3], 0, v18, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v23
	v_subb_co_u32_e64 v18, s[0:1], v18, v21, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v24, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v20
	v_subrev_co_u32_e64 v21, s[0:1], s64, v20
	s_nop 0
	v_cndmask_b32_e64 v25, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v23
	v_subbrev_co_u32_e64 v18, s[0:1], 0, v18, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v24, v24, v25, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v17
	v_cmp_ne_u32_e64 s[0:1], 0, v24
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v16
	v_cndmask_b32_e64 v18, v23, v18, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v23, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v17
	s_nop 1
	v_cndmask_b32_e32 v19, v19, v23, vcc
	v_cmp_ne_u32_e32 vcc, 0, v19
	s_nop 1
	v_cndmask_b32_e32 v19, v17, v18, vcc
	v_cndmask_b32_e64 v17, v20, v21, s[0:1]
	v_cndmask_b32_e32 v18, v16, v17, vcc
                                        ; implicit-def: $vgpr16_vgpr17
.LBB2_251:                              ;   in Loop: Header=BB2_249 Depth=4
	s_andn2_saveexec_b64 s[0:1], s[28:29]
	s_cbranch_execz .LBB2_248
; %bb.252:                              ;   in Loop: Header=BB2_249 Depth=4
	v_cvt_f32_u32_e32 v17, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v19, v40
	v_rcp_iflag_f32_e32 v17, v17
	s_nop 0
	v_mul_f32_e32 v17, 0x4f7ffffe, v17
	v_cvt_u32_f32_e32 v17, v17
	v_mul_lo_u32 v18, s2, v17
	v_mul_hi_u32 v18, v17, v18
	v_add_u32_e32 v17, v17, v18
	v_mul_hi_u32 v17, v16, v17
	v_mul_lo_u32 v17, v17, s64
	v_sub_u32_e32 v16, v16, v17
	v_subrev_u32_e32 v17, s64, v16
	v_cmp_le_u32_e32 vcc, s64, v16
	s_nop 1
	v_cndmask_b32_e32 v16, v16, v17, vcc
	v_subrev_u32_e32 v17, s64, v16
	v_cmp_le_u32_e32 vcc, s64, v16
	s_nop 1
	v_cndmask_b32_e32 v18, v16, v17, vcc
	s_branch .LBB2_248
.LBB2_253:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[16:17]
.LBB2_254:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_andn2_b64 s[10:11], s[10:11], exec
	s_or_b64 exec, exec, s[12:13]
	s_and_saveexec_b64 s[0:1], s[10:11]
	s_xor_b64 s[10:11], exec, s[0:1]
	s_cbranch_execz .LBB2_265
.LBB2_255:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v109, 41
	v_readlane_b32 s1, v109, 42
	v_cmp_eq_u64_e32 vcc, 0, v[94:95]
	s_nop 0
	v_lshl_add_u64 v[4:5], v[0:1], 0, s[0:1]
	global_load_ushort v6, v[4:5], off offset:106
	v_readlane_b32 s0, v109, 2
	v_readlane_b32 s1, v109, 3
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB2_257
; %bb.256:                              ;   in Loop: Header=BB2_56 Depth=1
	global_load_dword v4, v[4:5], off offset:8
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v4, s55, v4
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshl_add_u64 v[4:5], v[4:5], 2, s[88:89]
	global_store_dword v[4:5], v6, off
	;;#ASMSTART
	;;#ASMEND
.LBB2_257:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_min_i32_e32 v14, s33, v6
	v_cmp_lt_i32_e32 vcc, 0, v14
	s_and_saveexec_b64 s[12:13], vcc
	s_cbranch_execz .LBB2_264
; %bb.258:                              ;   in Loop: Header=BB2_56 Depth=1
	v_lshl_add_u64 v[4:5], v[72:73], 0, s[60:61]
	v_or_b32_e32 v5, v5, v2
	s_mov_b32 s18, 0
	s_movk_i32 s19, 0x200
	s_mov_b64 s[14:15], 0
	s_branch .LBB2_260
.LBB2_259:                              ;   in Loop: Header=BB2_260 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[8:9], v[12:13], 3, v[8:9]
	flat_store_dwordx2 v[8:9], v[4:5] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[6:7], v[6:7], 3, s[68:69]
	global_atomic_add_x2 v[6:7], v[90:91], off
	v_add_u32_e32 v14, -1, v14
	s_add_i32 s18, s18, 4
	s_add_i32 s19, s19, 8
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_or_b64 s[14:15], vcc, s[14:15]
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_264
.LBB2_260:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v6, off, s18
	scratch_load_dwordx2 v[10:11], off, s19
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[84:85]
	global_load_dwordx2 v[8:9], v[8:9], off
	v_or_b32_e32 v41, s65, v11
	v_lshl_add_u64 v[12:13], v[10:11], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[12:13], s19
                                        ; implicit-def: $vgpr12_vgpr13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[16:17], exec, s[0:1]
	s_cbranch_execz .LBB2_262
; %bb.261:                              ;   in Loop: Header=BB2_260 Depth=2
	v_cvt_f32_u32_e32 v12, s64
	v_cvt_f32_u32_e32 v13, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v17, v40
	v_fmac_f32_e32 v12, 0x4f800000, v13
	v_rcp_f32_e32 v12, v12
	s_nop 0
	v_mul_f32_e32 v12, 0x5f7ffffc, v12
	v_mul_f32_e32 v13, 0x2f800000, v12
	v_trunc_f32_e32 v13, v13
	v_fmac_f32_e32 v12, 0xcf800000, v13
	v_cvt_u32_f32_e32 v13, v13
	v_cvt_u32_f32_e32 v12, v12
	v_readfirstlane_b32 s2, v13
	v_readfirstlane_b32 s3, v12
	s_mul_i32 s20, s0, s2
	s_mul_hi_u32 s22, s0, s3
	s_mul_i32 s21, s1, s3
	s_add_i32 s20, s22, s20
	s_mul_i32 s23, s0, s3
	s_add_i32 s20, s20, s21
	s_mul_i32 s22, s3, s20
	s_mul_hi_u32 s24, s3, s23
	s_mul_hi_u32 s21, s3, s20
	s_add_u32 s22, s24, s22
	s_addc_u32 s21, 0, s21
	s_mul_hi_u32 s25, s2, s23
	s_mul_i32 s23, s2, s23
	s_add_u32 s22, s22, s23
	s_mul_hi_u32 s24, s2, s20
	s_addc_u32 s21, s21, s25
	s_addc_u32 s22, s24, 0
	s_mul_i32 s20, s2, s20
	s_add_u32 s20, s21, s20
	s_addc_u32 s21, 0, s22
	s_add_u32 s3, s3, s20
	s_addc_u32 s2, s2, s21
	s_mul_i32 s20, s0, s2
	s_mul_hi_u32 s21, s0, s3
	s_add_i32 s20, s21, s20
	s_mul_i32 s1, s1, s3
	s_add_i32 s20, s20, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s21, s2, s0
	s_mul_i32 s22, s2, s0
	s_mul_i32 s24, s3, s20
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s23, s3, s20
	s_add_u32 s0, s0, s24
	s_addc_u32 s23, 0, s23
	s_add_u32 s0, s0, s22
	s_mul_hi_u32 s1, s2, s20
	s_addc_u32 s0, s23, s21
	s_addc_u32 s1, s1, 0
	s_mul_i32 s20, s2, s20
	s_add_u32 s0, s0, s20
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[12:13], s[0:1], v10, s2, 0
	v_mul_hi_u32 v16, v10, s3
	v_lshl_add_u64 v[12:13], v[16:17], 0, v[12:13]
	v_mad_u64_u32 v[18:19], s[0:1], v11, s3, 0
	v_add_co_u32_e32 v12, vcc, v12, v18
	v_mad_u64_u32 v[16:17], s[0:1], v11, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v12, vcc, v13, v19, vcc
	v_mov_b32_e32 v13, s39
	s_nop 0
	v_addc_co_u32_e32 v17, vcc, 0, v17, vcc
	v_lshl_add_u64 v[12:13], v[12:13], 0, v[16:17]
	v_mul_lo_u32 v15, s65, v12
	v_mul_lo_u32 v16, s64, v13
	v_mad_u64_u32 v[12:13], s[0:1], s64, v12, 0
	v_add3_u32 v13, v13, v16, v15
	v_sub_u32_e32 v15, v11, v13
	v_mov_b32_e32 v16, s65
	v_sub_co_u32_e32 v10, vcc, v10, v12
	s_nop 1
	v_subb_co_u32_e64 v12, s[0:1], v15, v16, vcc
	v_subrev_co_u32_e64 v15, s[0:1], s64, v10
	v_subb_co_u32_e32 v11, vcc, v11, v13, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v17, s[2:3], 0, v12, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v17
	v_subb_co_u32_e64 v12, s[0:1], v12, v16, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v18, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v15
	v_subrev_co_u32_e64 v16, s[0:1], s64, v15
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v17
	v_subbrev_co_u32_e64 v12, s[0:1], 0, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v18, v18, v19, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v11
	v_cmp_ne_u32_e64 s[0:1], 0, v18
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v10
	v_cndmask_b32_e64 v12, v17, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v17, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v11
	s_nop 1
	v_cndmask_b32_e32 v13, v13, v17, vcc
	v_cmp_ne_u32_e32 vcc, 0, v13
	s_nop 1
	v_cndmask_b32_e32 v13, v11, v12, vcc
	v_cndmask_b32_e64 v11, v15, v16, s[0:1]
	v_cndmask_b32_e32 v12, v10, v11, vcc
                                        ; implicit-def: $vgpr10_vgpr11
.LBB2_262:                              ;   in Loop: Header=BB2_260 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[16:17]
	s_cbranch_execz .LBB2_259
; %bb.263:                              ;   in Loop: Header=BB2_260 Depth=2
	v_cvt_f32_u32_e32 v11, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v13, v40
	v_rcp_iflag_f32_e32 v11, v11
	s_nop 0
	v_mul_f32_e32 v11, 0x4f7ffffe, v11
	v_cvt_u32_f32_e32 v11, v11
	v_mul_lo_u32 v12, s2, v11
	v_mul_hi_u32 v12, v11, v12
	v_add_u32_e32 v11, v11, v12
	v_mul_hi_u32 v11, v10, v11
	v_mul_lo_u32 v11, v11, s64
	v_sub_u32_e32 v10, v10, v11
	v_subrev_u32_e32 v11, s64, v10
	v_cmp_le_u32_e32 vcc, s64, v10
	s_nop 1
	v_cndmask_b32_e32 v10, v10, v11, vcc
	v_subrev_u32_e32 v11, s64, v10
	v_cmp_le_u32_e32 vcc, s64, v10
	s_nop 1
	v_cndmask_b32_e32 v12, v10, v11, vcc
	s_branch .LBB2_259
.LBB2_264:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[12:13]
	v_mov_b32_e32 v22, v108
.LBB2_265:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_xor_b64 s[0:1], exec, -1
.LBB2_266:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_andn2_b64 s[2:3], s[4:5], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[4:5], s[2:3], s[0:1]
	v_readlane_b32 s0, v109, 12
	v_mov_b64_e32 v[14:15], v[104:105]
	v_mov_b32_e32 v12, v42
	v_readlane_b32 s1, v109, 13
.LBB2_267:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_b64 s[2:3], s[4:5], exec
                                        ; implicit-def: $vgpr4
	s_andn2_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execnz .LBB2_92
.LBB2_268:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_mov_b64_e32 v[4:5], v[110:111]
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB2_308
.LBB2_269:                              ;   in Loop: Header=BB2_56 Depth=1
	s_waitcnt vmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[72:73], v[74:75]
	s_mov_b64 s[0:1], -1
	s_mov_b64 s[6:7], 0
	v_mov_b64_e32 v[4:5], v[110:111]
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_282
; %bb.270:                              ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b64_e32 v[0:1], s[80:81]
	v_mad_u64_u32 v[4:5], s[0:1], v72, s37, v[0:1]
	v_mov_b32_e32 v0, v5
	v_mad_u64_u32 v[0:1], s[0:1], v73, s37, v[0:1]
	v_mov_b32_e32 v5, v0
	global_load_dword v0, v[4:5], off
	s_movk_i32 s0, 0x88
	s_mov_b64 s[2:3], 0
	s_mov_b64 s[10:11], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v1, -4, v0
	v_cmp_ne_u32_e64 s[0:1], s0, v1
	s_and_saveexec_b64 s[6:7], s[0:1]
	s_cbranch_execz .LBB2_280
; %bb.271:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_mov_b64 s[12:13], 0
	s_mov_b64 s[14:15], 0
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_xor_b64 s[10:11], exec, s[2:3]
	s_cbranch_execz .LBB2_277
; %bb.272:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_xor_b64 s[2:3], exec, s[2:3]
; %bb.273:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xb8
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_mov_b64 s[14:15], exec
	s_and_b64 s[12:13], s[0:1], exec
                                        ; implicit-def: $vgpr0
; %bb.274:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[16:17], s[2:3]
	s_cbranch_execz .LBB2_276
; %bb.275:                              ;   in Loop: Header=BB2_56 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e64 s[0:1], s0, v0
	s_movk_i32 s2, 0xaf
	v_cmp_lt_i32_e64 s[2:3], s2, v0
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[14:15], s[14:15], s[0:1]
	s_andn2_b64 s[0:1], s[12:13], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_or_b64 s[12:13], s[0:1], s[2:3]
.LBB2_276:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], s[14:15], exec
	s_and_b64 s[12:13], s[12:13], exec
                                        ; implicit-def: $vgpr0
.LBB2_277:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_saveexec_b64 s[10:11], s[10:11]
; %bb.278:                              ;   in Loop: Header=BB2_56 Depth=1
	v_add_u32_e32 v0, 0xffffff72, v0
	v_cmp_gt_u32_e64 s[0:1], 7, v0
	v_cmp_lt_u32_e64 s[2:3], 6, v0
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[14:15], s[14:15], s[0:1]
	s_andn2_b64 s[0:1], s[12:13], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_or_b64 s[12:13], s[0:1], s[2:3]
; %bb.279:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_orn2_b64 s[10:11], s[14:15], exec
	s_and_b64 s[2:3], s[12:13], exec
.LBB2_280:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_b64 s[6:7], s[10:11], exec
	s_orn2_b64 s[0:1], s[2:3], exec
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execnz .LBB2_283
.LBB2_281:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[6:7]
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execnz .LBB2_297
	s_branch .LBB2_307
.LBB2_282:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB2_281
.LBB2_283:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s2, v109, 2
	v_cmp_eq_u64_e64 s[0:1], 1, v[94:95]
	v_readlane_b32 s3, v109, 3
	s_and_b64 s[0:1], s[0:1], s[2:3]
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB2_288
; %bb.284:                              ;   in Loop: Header=BB2_56 Depth=1
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB2_287
; %bb.285:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v109, 45
	v_readlane_b32 s1, v109, 46
	s_mov_b64 s[12:13], 0
	s_nop 0
	v_mov_b64_e32 v[0:1], s[0:1]
	v_mad_u64_u32 v[0:1], s[0:1], v72, s37, v[0:1]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v73, s37, v[2:3]
	v_mov_b32_e32 v1, v2
	v_mov_b64_e32 v[2:3], v[72:73]
.LBB2_286:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v6, v[0:1], off
	v_lshl_add_u64 v[2:3], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0x70
	v_lshl_add_u64 v[0:1], v[0:1], 0, s[0:1]
	v_cmp_ge_u64_e64 s[0:1], v[2:3], v[74:75]
	s_or_b64 s[12:13], s[0:1], s[12:13]
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v6, s55, v6
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[6:7], v[6:7], 2, s[88:89]
	global_load_dword v8, v[6:7], off
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v8, 1, v8
	global_store_dword v[6:7], v8, off
	s_andn2_b64 exec, exec, s[12:13]
	s_cbranch_execnz .LBB2_286
.LBB2_287:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[10:11]
	;;#ASMSTART
	;;#ASMEND
.LBB2_288:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[2:3]
	v_mov_b32_e32 v22, v108
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB2_296
; %bb.289:                              ;   in Loop: Header=BB2_56 Depth=1
	v_mov_b32_e32 v1, v94
	s_mov_b64 s[12:13], 0
	v_mov_b64_e32 v[2:3], v[72:73]
	v_mov_b32_e32 v22, v108
	s_branch .LBB2_291
.LBB2_290:                              ;   in Loop: Header=BB2_291 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[8:9], v[12:13], 3, v[8:9]
	v_or_b32_e32 v11, v3, v1
	v_mov_b32_e32 v10, v2
	flat_store_dwordx2 v[8:9], v[10:11] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[6:7], v[6:7], 3, s[68:69]
	global_atomic_add_x2 v[6:7], v[90:91], off
	v_add_u32_e32 v0, 1, v22
	v_sub_u32_e32 v7, 0, v0
	v_ashrrev_i32_e32 v6, 31, v0
	v_max_i32_e32 v0, v7, v0
	v_mul_hi_u32 v7, v0, v45
	v_mul_lo_u32 v7, v7, s53
	v_sub_u32_e32 v0, v0, v7
	v_subrev_u32_e32 v7, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_lshl_add_u64 v[2:3], v[2:3], 0, 1
	s_nop 0
	v_cndmask_b32_e32 v0, v0, v7, vcc
	v_subrev_u32_e32 v7, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v7, vcc
	v_xor_b32_e32 v0, v0, v6
	v_cmp_ge_u64_e32 vcc, v[2:3], v[74:75]
	s_or_b64 s[12:13], vcc, s[12:13]
	v_sub_u32_e32 v22, v0, v6
	s_andn2_b64 exec, exec, s[12:13]
	s_cbranch_execz .LBB2_295
.LBB2_291:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_mov_b32 s0, 0
	v_lshl_add_u32 v0, v22, 2, s0
	scratch_load_dword v6, v0, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v0, v22, 3, s0
	scratch_load_dwordx2 v[10:11], v0, off
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[84:85]
	global_load_dwordx2 v[8:9], v[8:9], off
	v_or_b32_e32 v41, s65, v11
	v_lshl_add_u64 v[12:13], v[10:11], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v0, v[12:13], off
                                        ; implicit-def: $vgpr12_vgpr13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[14:15], exec, s[0:1]
	s_cbranch_execz .LBB2_293
; %bb.292:                              ;   in Loop: Header=BB2_291 Depth=2
	v_cvt_f32_u32_e32 v0, s64
	v_cvt_f32_u32_e32 v12, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v15, v40
	v_fmac_f32_e32 v0, 0x4f800000, v12
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v12, 0x2f800000, v0
	v_trunc_f32_e32 v12, v12
	v_fmac_f32_e32 v0, 0xcf800000, v12
	v_cvt_u32_f32_e32 v12, v12
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v12
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s18, s0, s3
	s_mul_i32 s17, s1, s3
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s3
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s3, s16
	s_mul_hi_u32 s20, s3, s19
	s_mul_hi_u32 s17, s3, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s2, s19
	s_mul_i32 s19, s2, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s2, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s3, s3, s16
	s_addc_u32 s2, s2, s17
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s17, s0, s3
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s3
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s17, s2, s0
	s_mul_i32 s18, s2, s0
	s_mul_i32 s20, s3, s16
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s19, s3, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s2, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[12:13], s[0:1], v10, s2, 0
	v_mul_hi_u32 v14, v10, s3
	v_lshl_add_u64 v[12:13], v[14:15], 0, v[12:13]
	v_mad_u64_u32 v[16:17], s[0:1], v11, s3, 0
	v_add_co_u32_e32 v0, vcc, v12, v16
	v_mad_u64_u32 v[14:15], s[0:1], v11, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v12, vcc, v13, v17, vcc
	v_mov_b32_e32 v13, s39
	s_nop 0
	v_addc_co_u32_e32 v15, vcc, 0, v15, vcc
	v_lshl_add_u64 v[12:13], v[12:13], 0, v[14:15]
	v_mul_lo_u32 v0, s65, v12
	v_mul_lo_u32 v14, s64, v13
	v_mad_u64_u32 v[12:13], s[0:1], s64, v12, 0
	v_add3_u32 v0, v13, v14, v0
	v_sub_u32_e32 v13, v11, v0
	v_mov_b32_e32 v14, s65
	v_sub_co_u32_e32 v10, vcc, v10, v12
	s_nop 1
	v_subb_co_u32_e64 v12, s[0:1], v13, v14, vcc
	v_subrev_co_u32_e64 v15, s[0:1], s64, v10
	v_subb_co_u32_e32 v0, vcc, v11, v0, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v13, s[2:3], 0, v12, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v13
	v_subb_co_u32_e64 v12, s[0:1], v12, v14, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v15
	v_subrev_co_u32_e64 v14, s[0:1], s64, v15
	s_nop 0
	v_cndmask_b32_e64 v17, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v13
	v_subbrev_co_u32_e64 v12, s[0:1], 0, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v16, v16, v17, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v0
	v_cmp_ne_u32_e64 s[0:1], 0, v16
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v10
	v_cndmask_b32_e64 v12, v13, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v0
	s_nop 1
	v_cndmask_b32_e32 v11, v11, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v13, v0, v12, vcc
	v_cndmask_b32_e64 v0, v15, v14, s[0:1]
	v_cndmask_b32_e32 v12, v10, v0, vcc
                                        ; implicit-def: $vgpr10_vgpr11
.LBB2_293:                              ;   in Loop: Header=BB2_291 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB2_290
; %bb.294:                              ;   in Loop: Header=BB2_291 Depth=2
	v_cvt_f32_u32_e32 v0, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v13, v40
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v11, s2, v0
	v_mul_hi_u32 v11, v0, v11
	v_add_u32_e32 v0, v0, v11
	v_mul_hi_u32 v0, v10, v0
	v_mul_lo_u32 v0, v0, s64
	v_sub_u32_e32 v0, v10, v0
	v_subrev_u32_e32 v10, s64, v0
	v_cmp_le_u32_e32 vcc, s64, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v10, vcc
	v_subrev_u32_e32 v10, s64, v0
	v_cmp_le_u32_e32 vcc, s64, v0
	s_nop 1
	v_cndmask_b32_e32 v12, v0, v10, vcc
	s_branch .LBB2_290
.LBB2_295:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[12:13]
.LBB2_296:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_andn2_b64 s[6:7], s[6:7], exec
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[6:7]
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB2_307
.LBB2_297:                              ;   in Loop: Header=BB2_56 Depth=1
	global_load_ushort v0, v[4:5], off offset:106
	v_readlane_b32 s0, v109, 2
	v_cmp_eq_u64_e32 vcc, 1, v[94:95]
	v_readlane_b32 s1, v109, 3
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB2_299
; %bb.298:                              ;   in Loop: Header=BB2_56 Depth=1
	global_load_dword v1, v[4:5], off offset:8
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v2, s55, v1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshl_add_u64 v[2:3], v[2:3], 2, s[88:89]
	global_store_dword v[2:3], v0, off
	;;#ASMSTART
	;;#ASMEND
.LBB2_299:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_min_i32_e32 v10, s33, v0
	v_cmp_lt_i32_e32 vcc, 0, v10
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_306
; %bb.300:                              ;   in Loop: Header=BB2_56 Depth=1
	v_or_b32_e32 v73, v73, v94
	s_mov_b32 s14, 0
	s_movk_i32 s15, 0x200
	s_mov_b64 s[10:11], 0
	s_branch .LBB2_302
.LBB2_301:                              ;   in Loop: Header=BB2_302 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[8:9], 3, v[2:3]
	flat_store_dwordx2 v[2:3], v[72:73] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[68:69]
	global_atomic_add_x2 v[0:1], v[90:91], off
	v_add_u32_e32 v10, -1, v10
	s_add_i32 s14, s14, 4
	s_add_i32 s15, s15, 8
	v_cmp_eq_u32_e32 vcc, 0, v10
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execz .LBB2_306
.LBB2_302:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v0, off, s14
	scratch_load_dwordx2 v[6:7], off, s15
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[84:85]
	global_load_dwordx2 v[2:3], v[2:3], off
	v_or_b32_e32 v41, s65, v7
	v_lshl_add_u64 v[8:9], v[6:7], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[8:9], s15
                                        ; implicit-def: $vgpr8_vgpr9
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[12:13], exec, s[0:1]
	s_cbranch_execz .LBB2_304
; %bb.303:                              ;   in Loop: Header=BB2_302 Depth=2
	v_cvt_f32_u32_e32 v8, s64
	v_cvt_f32_u32_e32 v9, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v13, v40
	v_fmac_f32_e32 v8, 0x4f800000, v9
	v_rcp_f32_e32 v8, v8
	s_nop 0
	v_mul_f32_e32 v8, 0x5f7ffffc, v8
	v_mul_f32_e32 v9, 0x2f800000, v8
	v_trunc_f32_e32 v9, v9
	v_fmac_f32_e32 v8, 0xcf800000, v9
	v_cvt_u32_f32_e32 v9, v9
	v_cvt_u32_f32_e32 v8, v8
	v_readfirstlane_b32 s2, v9
	v_readfirstlane_b32 s3, v8
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s18, s0, s3
	s_mul_i32 s17, s1, s3
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s3
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s3, s16
	s_mul_hi_u32 s20, s3, s19
	s_mul_hi_u32 s17, s3, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s2, s19
	s_mul_i32 s19, s2, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s2, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s3, s3, s16
	s_addc_u32 s2, s2, s17
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s17, s0, s3
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s3
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s17, s2, s0
	s_mul_i32 s18, s2, s0
	s_mul_i32 s20, s3, s16
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s19, s3, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s2, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[8:9], s[0:1], v6, s2, 0
	v_mul_hi_u32 v12, v6, s3
	v_lshl_add_u64 v[8:9], v[12:13], 0, v[8:9]
	v_mad_u64_u32 v[14:15], s[0:1], v7, s3, 0
	v_add_co_u32_e32 v8, vcc, v8, v14
	v_mad_u64_u32 v[12:13], s[0:1], v7, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v8, vcc, v9, v15, vcc
	v_mov_b32_e32 v9, s39
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[8:9], v[8:9], 0, v[12:13]
	v_mul_lo_u32 v11, s65, v8
	v_mul_lo_u32 v12, s64, v9
	v_mad_u64_u32 v[8:9], s[0:1], s64, v8, 0
	v_add3_u32 v9, v9, v12, v11
	v_sub_u32_e32 v11, v7, v9
	v_mov_b32_e32 v12, s65
	v_sub_co_u32_e32 v6, vcc, v6, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v11, v12, vcc
	v_subrev_co_u32_e64 v11, s[0:1], s64, v6
	v_subb_co_u32_e32 v7, vcc, v7, v9, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v13, s[2:3], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v13
	v_subb_co_u32_e64 v8, s[0:1], v8, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v14, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v11
	v_subrev_co_u32_e64 v12, s[0:1], s64, v11
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v13
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v14, v14, v15, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v7
	v_cmp_ne_u32_e64 s[0:1], 0, v14
	s_nop 0
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v6
	v_cndmask_b32_e64 v8, v13, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v7
	s_nop 1
	v_cndmask_b32_e32 v9, v9, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v9
	s_nop 1
	v_cndmask_b32_e32 v9, v7, v8, vcc
	v_cndmask_b32_e64 v7, v11, v12, s[0:1]
	v_cndmask_b32_e32 v8, v6, v7, vcc
                                        ; implicit-def: $vgpr6_vgpr7
.LBB2_304:                              ;   in Loop: Header=BB2_302 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execz .LBB2_301
; %bb.305:                              ;   in Loop: Header=BB2_302 Depth=2
	v_cvt_f32_u32_e32 v7, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v9, v40
	v_rcp_iflag_f32_e32 v7, v7
	s_nop 0
	v_mul_f32_e32 v7, 0x4f7ffffe, v7
	v_cvt_u32_f32_e32 v7, v7
	v_mul_lo_u32 v8, s2, v7
	v_mul_hi_u32 v8, v7, v8
	v_add_u32_e32 v7, v7, v8
	v_mul_hi_u32 v7, v6, v7
	v_mul_lo_u32 v7, v7, s64
	v_sub_u32_e32 v6, v6, v7
	v_subrev_u32_e32 v7, s64, v6
	v_cmp_le_u32_e32 vcc, s64, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s64, v6
	v_cmp_le_u32_e32 vcc, s64, v6
	s_nop 1
	v_cndmask_b32_e32 v8, v6, v7, vcc
	s_branch .LBB2_301
.LBB2_306:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[8:9]
	v_mov_b32_e32 v22, v108
.LBB2_307:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[6:7]
	v_mov_b64_e32 v[0:1], v[120:121]
	v_mov_b32_e32 v12, v42
	v_mov_b64_e32 v[14:15], v[104:105]
	v_mov_b64_e32 v[2:3], v[94:95]
.LBB2_308:                              ;   in Loop: Header=BB2_56 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_lshl_add_u64 v[6:7], v[106:107], 0, 1
	v_cmp_eq_u32_e32 vcc, 1, v43
	v_mov_b64_e32 v[94:95], v[2:3]
	v_mov_b64_e32 v[104:105], v[14:15]
	v_cndmask_b32_e32 v63, v63, v7, vcc
	v_cndmask_b32_e32 v62, v62, v6, vcc
	v_cmp_eq_u32_e32 vcc, 0, v43
	v_mov_b32_e32 v42, v12
	v_mov_b32_e32 v108, v22
	v_cndmask_b32_e32 v61, v61, v7, vcc
	v_cndmask_b32_e32 v60, v60, v6, vcc
.LBB2_309:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v124, 26
	v_readlane_b32 s1, v124, 27
	s_andn2_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB2_55
; %bb.310:                              ;   in Loop: Header=BB2_56 Depth=1
	s_andn2_b64 vcc, exec, s[90:91]
	s_cbranch_vccnz .LBB2_54
; %bb.311:                              ;   in Loop: Header=BB2_56 Depth=1
	v_readlane_b32 s0, v124, 62
	v_readlane_b32 s1, v124, 63
	s_andn2_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB2_54
; %bb.312:                              ;   in Loop: Header=BB2_56 Depth=1
	s_mov_b32 s8, 0
	s_movk_i32 s9, 0x200
	s_mov_b32 s10, s33
	s_branch .LBB2_314
.LBB2_313:                              ;   in Loop: Header=BB2_314 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[6:7], 3, v[2:3]
	flat_store_dwordx2 v[2:3], v[92:93] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[68:69]
	global_atomic_add_x2 v[0:1], v[90:91], off
	s_add_i32 s10, s10, -1
	s_add_i32 s8, s8, 4
	s_add_i32 s9, s9, 8
	s_cmp_eq_u32 s10, 0
	s_cbranch_scc1 .LBB2_54
.LBB2_314:                              ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v0, off, s8
	scratch_load_dwordx2 v[4:5], off, s9
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[84:85]
	global_load_dwordx2 v[2:3], v[2:3], off
	v_or_b32_e32 v41, s65, v5
	v_lshl_add_u64 v[6:7], v[4:5], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[6:7], s9
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB2_316
; %bb.315:                              ;   in Loop: Header=BB2_314 Depth=2
	v_cvt_f32_u32_e32 v6, s64
	v_cvt_f32_u32_e32 v7, s65
	s_sub_u32 s0, 0, s64
	s_subb_u32 s1, 0, s65
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s11, s0, s2
	s_mul_hi_u32 s13, s0, s3
	s_mul_i32 s12, s1, s3
	s_add_i32 s11, s13, s11
	s_mul_i32 s14, s0, s3
	s_add_i32 s11, s11, s12
	s_mul_i32 s13, s3, s11
	s_mul_hi_u32 s15, s3, s14
	s_mul_hi_u32 s12, s3, s11
	s_add_u32 s13, s15, s13
	s_addc_u32 s12, 0, s12
	s_mul_hi_u32 s16, s2, s14
	s_mul_i32 s14, s2, s14
	s_add_u32 s13, s13, s14
	s_mul_hi_u32 s15, s2, s11
	s_addc_u32 s12, s12, s16
	s_addc_u32 s13, s15, 0
	s_mul_i32 s11, s2, s11
	s_add_u32 s11, s12, s11
	s_addc_u32 s12, 0, s13
	s_add_u32 s3, s3, s11
	s_addc_u32 s2, s2, s12
	s_mul_i32 s11, s0, s2
	s_mul_hi_u32 s12, s0, s3
	s_add_i32 s11, s12, s11
	s_mul_i32 s1, s1, s3
	s_add_i32 s11, s11, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s12, s2, s0
	s_mul_i32 s13, s2, s0
	s_mul_i32 s15, s3, s11
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s14, s3, s11
	s_add_u32 s0, s0, s15
	s_addc_u32 s14, 0, s14
	s_add_u32 s0, s0, s13
	s_mul_hi_u32 s1, s2, s11
	s_addc_u32 s0, s14, s12
	s_addc_u32 s1, s1, 0
	s_mul_i32 s11, s2, s11
	s_add_u32 s0, s0, s11
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s2, 0
	v_mul_hi_u32 v8, v4, s3
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s39
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v8, s65, v6
	v_mul_lo_u32 v9, s64, v7
	v_mad_u64_u32 v[6:7], s[0:1], s64, v6, 0
	v_add3_u32 v7, v7, v9, v8
	v_sub_u32_e32 v8, v5, v7
	v_mov_b32_e32 v9, s65
	v_sub_co_u32_e32 v4, vcc, v4, v6
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v8, v9, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s64, v4
	v_subb_co_u32_e32 v5, vcc, v5, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v10, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s65, v10
	v_subb_co_u32_e64 v6, s[0:1], v6, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s64, v8
	v_subrev_co_u32_e64 v9, s[0:1], s64, v8
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s65, v10
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, v11, v12, s[2:3]
	v_cmp_le_u32_e32 vcc, s65, v5
	v_cmp_ne_u32_e64 s[0:1], 0, v11
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s64, v4
	v_cndmask_b32_e64 v6, v10, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s65, v5
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v5, v6, vcc
	v_cndmask_b32_e64 v5, v8, v9, s[0:1]
	v_cndmask_b32_e32 v6, v4, v5, vcc
                                        ; implicit-def: $vgpr4_vgpr5
.LBB2_316:                              ;   in Loop: Header=BB2_314 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB2_313
; %bb.317:                              ;   in Loop: Header=BB2_314 Depth=2
	v_cvt_f32_u32_e32 v5, s64
	s_sub_i32 s2, 0, s64
	v_mov_b32_e32 v7, v40
	v_rcp_iflag_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x4f7ffffe, v5
	v_cvt_u32_f32_e32 v5, v5
	v_mul_lo_u32 v6, s2, v5
	v_mul_hi_u32 v6, v5, v6
	v_add_u32_e32 v5, v5, v6
	v_mul_hi_u32 v5, v4, v5
	v_mul_lo_u32 v5, v5, s64
	v_sub_u32_e32 v4, v4, v5
	v_subrev_u32_e32 v5, s64, v4
	v_cmp_le_u32_e32 vcc, s64, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s64, v4
	v_cmp_le_u32_e32 vcc, s64, v4
	s_nop 1
	v_cndmask_b32_e32 v6, v4, v5, vcc
	s_branch .LBB2_313
.LBB2_318:
	s_or_b64 exec, exec, s[46:47]
	s_cbranch_execnz .LBB2_477
.LBB2_319:
	v_mov_b32_e32 v0, 0
	ds_read_b32 v1, v0 offset:2060
	s_load_dwordx4 s[4:7], s[44:45], 0x60
	s_load_dword s2, s[44:45], 0x10
	s_load_dwordx2 s[98:99], s[44:45], 0x158
	s_load_dwordx2 s[36:37], s[44:45], 0x70
	s_load_dwordx4 s[24:27], s[44:45], 0x148
	s_mov_b32 s33, 0
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s0, v1
	s_cmp_lt_i32 s0, 0
	s_cselect_b32 s34, s54, s0
	s_ashr_i32 s35, s34, 31
	s_lshl_b64 s[0:1], s[34:35], 3
	s_add_u32 s0, s6, s0
	v_writelane_b32 v124, s4, 10
	s_addc_u32 s1, s7, s1
	global_load_dwordx2 v[2:3], v0, s[0:1]
	v_writelane_b32 v124, s5, 11
	v_writelane_b32 v124, s6, 12
	s_cmp_lt_i32 s2, 2
	v_writelane_b32 v124, s7, 13
	v_mov_b32_e32 v1, s34
	s_waitcnt vmcnt(0)
	ds_write_b64 v0, v[2:3] offset:2016
	ds_write_b32 v0, v1 offset:2032
	s_cbranch_scc1 .LBB2_321
; %bb.320:
	s_ashr_i32 s3, s56, 31
	s_mov_b32 s2, s56
	s_add_i32 s4, s34, s56
	s_lshl_b64 s[2:3], s[2:3], 3
	s_add_u32 s0, s0, s2
	s_addc_u32 s1, s1, s3
	global_load_dwordx2 v[2:3], v0, s[0:1]
	v_mov_b32_e32 v1, s4
	s_mov_b32 s33, 1
	ds_write_b32 v0, v1 offset:2036
	s_waitcnt vmcnt(0)
	ds_write_b64 v0, v[2:3] offset:2024
.LBB2_321:
	s_load_dwordx4 s[28:31], s[44:45], 0x130
	s_mov_b64 s[38:39], exec
	v_readlane_b32 s0, v124, 8
	v_readlane_b32 s1, v124, 9
	v_writelane_b32 v124, s24, 26
	s_and_b64 s[0:1], s[38:39], s[0:1]
	s_nop 0
	v_writelane_b32 v124, s25, 27
	v_writelane_b32 v124, s26, 28
	v_writelane_b32 v124, s27, 29
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v124, s28, 30
	s_nop 1
	v_writelane_b32 v124, s29, 31
	v_writelane_b32 v124, s30, 32
	v_writelane_b32 v124, s31, 33
	s_mov_b64 exec, s[0:1]
	s_cbranch_execz .LBB2_331
; %bb.322:
	;;#ASMSTART
	s_getreg_b32 s48, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v0, s48
	s_cmp_eq_u64 s[24:25], 0
	ds_write_b32 v40, v0 offset:2040
	s_cbranch_scc1 .LBB2_328
; %bb.323:
	s_lshl_b64 s[0:1], s[34:35], 2
	s_add_u32 s0, s24, s0
	s_addc_u32 s1, s25, s1
	v_mov_b32_e32 v0, s48
	s_cmp_gt_i32 s34, 7
	global_store_dword v40, v0, s[0:1]
	s_cbranch_scc1 .LBB2_325
; %bb.324:
	s_add_u32 s52, s44, 0x1b0
	s_addc_u32 s53, s45, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_readlane_b32 s80, v124, 6
	v_readlane_b32 s70, v124, 4
	v_readlane_b32 s66, v124, 2
	v_readlane_b32 s81, v124, 7
	v_readlane_b32 s71, v124, 5
	v_readlane_b32 s67, v124, 3
	v_readlane_b32 s49, v124, 1
	v_readlane_b32 s35, v124, 0
	s_mov_b64 s[4:5], s[80:81]
	s_mov_b64 s[6:7], s[70:71]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	s_mov_b32 s86, s58
	s_mov_b64 s[68:69], s[44:45]
	s_mov_b64 s[84:85], s[56:57]
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.1@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.1@rel32@hi+12
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s15, 43, 0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[4:5], s[80:81]
	s_mov_b64 s[6:7], s[70:71]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s54
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s15
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_mov_b32 s64, s54
	s_load_dwordx2 s[54:55], s[0:1], 0x0
	s_mov_b64 s[4:5], s[80:81]
	s_mov_b64 s[6:7], s[70:71]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s64
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s34
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[54:55]
	s_mov_b64 s[4:5], s[80:81]
	s_mov_b64 s[6:7], s[70:71]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s64
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s64
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[54:55]
	s_mov_b64 s[4:5], s[80:81]
	s_mov_b64 s[6:7], s[70:71]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s64
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s48
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 1
	s_swappc_b64 s[30:31], s[54:55]
	v_readlane_b32 s28, v124, 30
	v_readlane_b32 s24, v124, 26
	s_mov_b64 s[56:57], s[84:85]
	v_readlane_b32 s29, v124, 31
	v_readlane_b32 s30, v124, 32
	v_readlane_b32 s31, v124, 33
	v_readlane_b32 s25, v124, 27
	v_readlane_b32 s26, v124, 28
	v_readlane_b32 s27, v124, 29
	s_mov_b32 s58, s86
	s_mov_b64 s[44:45], s[68:69]
	s_mov_b32 s54, s64
.LBB2_325:
	s_mov_b64 s[2:3], exec
	v_mbcnt_lo_u32_b32 v0, s2, 0
	v_mbcnt_hi_u32_b32 v0, s3, v0
	v_cmp_eq_u32_e32 vcc, 0, v0
	buffer_wbl2 sc1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_327
; %bb.326:
	s_bcnt1_i32_b64 s2, s[2:3]
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, s2
	global_atomic_add v0, v1, s[26:27]
.LBB2_327:
	s_or_b64 exec, exec, s[0:1]
.LBB2_328:
	s_cmp_eq_u64 s[30:31], 0
	v_mov_b32_e32 v0, 0
	s_cbranch_scc1 .LBB2_330
; %bb.329:
	ds_read_b32 v0, v40 offset:2040
	v_mov_b32_e32 v2, s34
	v_mov_b32_e32 v3, -1
	s_waitcnt lgkmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_lshl_add_u64 v[0:1], s[30:31], 0, v[0:1]
	global_atomic_cmpswap v0, v[0:1], v[2:3], off sc0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e32 vcc, -1, v0
	v_cmp_eq_u32_e64 s[0:1], s34, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v0, 0, 1, s[0:1]
.LBB2_330:
	ds_write_b32 v40, v0 offset:2044
.LBB2_331:
	s_or_b64 exec, exec, s[38:39]
	s_load_dword s2, s[44:45], 0x18
	s_load_dwordx16 s[4:19], s[44:45], 0x20
	v_mov_b32_e32 v41, 0
	s_barrier
	ds_read_b32 v0, v41 offset:2040
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v124, s4, 34
	v_readfirstlane_b32 s38, v0
	s_nop 0
	v_writelane_b32 v124, s5, 35
	v_writelane_b32 v124, s6, 36
	v_writelane_b32 v124, s7, 37
	v_writelane_b32 v124, s8, 38
	v_writelane_b32 v124, s9, 39
	v_writelane_b32 v124, s10, 40
	v_writelane_b32 v124, s11, 41
	v_writelane_b32 v124, s12, 42
	v_writelane_b32 v124, s13, 43
	v_writelane_b32 v124, s14, 44
	v_writelane_b32 v124, s15, 45
	v_writelane_b32 v124, s16, 46
	v_writelane_b32 v124, s17, 47
	v_writelane_b32 v124, s18, 48
	v_writelane_b32 v124, s19, 49
	s_mov_b64 s[0:1], exec
	v_readlane_b32 s4, v124, 8
	v_readlane_b32 s5, v124, 9
	s_and_b64 s[4:5], s[0:1], s[4:5]
	s_mov_b64 exec, s[4:5]
	s_cbranch_execz .LBB2_333
; %bb.332:
	s_mov_b32 s4, 0
	v_mov_b32_e32 v0, 0x804
	v_mov_b32_e32 v1, -1
	s_mov_b32 s5, s4
	ds_write2_b32 v0, v41, v1 offset1:1
	s_mov_b32 s6, s4
	s_mov_b32 s7, s4
	v_mov_b64_e32 v[0:1], s[4:5]
	v_mov_b64_e32 v[2:3], s[6:7]
	ds_write_b128 v41, v[0:3] offset:2000
	ds_write_b128 v41, v[0:3] offset:1984
.LBB2_333:
	s_or_b64 exec, exec, s[0:1]
	s_add_u32 s30, s44, 0x1b0
	s_addc_u32 s31, s45, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_load_dwordx16 s[8:23], s[44:45], 0x20
	s_cmp_gt_i32 s56, 0
	s_cselect_b64 s[42:43], -1, 0
	s_cmp_lg_u64 s[98:99], 0
	s_cselect_b64 s[46:47], -1, 0
	s_ashr_i32 s39, s38, 31
	s_mul_i32 s27, s38, s2
	s_add_i32 s2, s58, s57
	s_lshl_b64 s[4:5], s[38:39], 3
	s_waitcnt lgkmcnt(0)
	s_add_u32 s6, s16, s4
	s_addc_u32 s7, s17, s5
	v_or_b32_e32 v0, s34, v46
	v_writelane_b32 v124, s6, 50
	v_cmp_eq_u32_e64 s[40:41], 0, v0
	v_cvt_f32_u32_e32 v0, s8
	v_writelane_b32 v124, s7, 51
	s_add_u32 s6, s36, s4
	v_cvt_f32_u32_e32 v1, s9
	s_addc_u32 s7, s37, s5
	s_add_u32 s48, s14, s4
	s_addc_u32 s49, s15, s5
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[2:3], s[2:3], 3
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_writelane_b32 v124, s6, 52
	s_add_u32 s4, s16, s2
	v_rcp_f32_e32 v0, v0
	v_writelane_b32 v124, s7, 53
	s_addc_u32 s5, s17, s3
	v_writelane_b32 v124, s4, 54
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_writelane_b32 v124, s5, 55
	s_add_u32 s4, s36, s2
	s_addc_u32 s5, s37, s3
	s_add_u32 s36, s14, s2
	s_addc_u32 s37, s15, s3
	v_trunc_f32_e32 v1, v1
	s_cmp_lg_u64 s[0:1], 0
	v_fmac_f32_e32 v0, 0xcf800000, v1
	s_cselect_b32 s0, 54, 0
	s_cmp_lg_u32 s56, 1
	v_cvt_u32_f32_e32 v72, v0
	v_cvt_u32_f32_e32 v73, v1
	s_cselect_b64 s[52:53], -1, 0
	s_and_b32 s55, s56, 0x7ffffffe
	s_movk_i32 s26, 0x700
	v_writelane_b32 v124, s4, 56
	s_cmp_lg_u32 s56, s55
	s_mov_b32 s58, -2
	v_mov_b32_e32 v47, v41
	v_lshl_add_u32 v43, v46, 3, s26
	s_mov_b32 s51, 0
	s_mov_b64 s[82:83], 0
	v_writelane_b32 v124, s5, 57
	s_mov_b32 s39, s38
	s_mov_b32 s35, s34
	v_lshlrev_b32_e32 v45, 4, v46
	v_mov_b64_e32 v[60:61], 0
	s_movk_i32 s84, 0x70
	s_brev_b32 s59, -2
	v_mov_b32_e32 v62, 1
	s_movk_i32 s85, 0x88
	s_movk_i32 s57, 0xad
	s_movk_i32 s76, 0xb6
	s_movk_i32 s77, 0xb8
	s_movk_i32 s78, 0xaf
	v_mov_b32_e32 v63, 0x804
	v_mov_b64_e32 v[56:57], 1
	v_mov_b32_e32 v42, 0
	v_mov_b32_e32 v58, v41
	v_mov_b32_e32 v59, 0
	s_cselect_b64 s[86:87], -1, 0
	s_barrier
	v_writelane_b32 v124, s0, 58
	s_branch .LBB2_336
.LBB2_334:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[6:7]
	v_add_u32_e32 v59, 1, v59
	s_xor_b64 s[0:1], exec, -1
.LBB2_335:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_and_b64 s[0:1], exec, s[0:1]
	s_or_b64 s[82:83], s[0:1], s[82:83]
	v_mov_b32_e32 v42, v8
	v_mov_b64_e32 v[60:61], v[10:11]
	s_andn2_b64 exec, exec, s[82:83]
	s_cbranch_execz .LBB2_477
.LBB2_336:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_341 Depth 2
                                        ;     Child Loop BB2_355 Depth 2
                                        ;     Child Loop BB2_362 Depth 2
                                        ;     Child Loop BB2_391 Depth 2
                                        ;     Child Loop BB2_401 Depth 2
                                        ;     Child Loop BB2_406 Depth 2
                                        ;     Child Loop BB2_410 Depth 2
                                        ;     Child Loop BB2_465 Depth 2
                                        ;     Child Loop BB2_473 Depth 2
	v_cmp_eq_u32_e32 vcc, v59, v58
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_357
; %bb.337:                              ;   in Loop: Header=BB2_336 Depth=1
	v_mov_b32_e32 v4, 0
	s_mov_b64 s[0:1], exec
	v_readlane_b32 s2, v124, 8
	v_readlane_b32 s3, v124, 9
	s_and_b64 s[2:3], s[0:1], s[2:3]
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB2_345
; %bb.338:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read2_b64 v[0:3], v41 offset0:248 offset1:250
	v_mov_b32_e32 v4, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, v[2:3], v[0:1]
	s_cbranch_vccnz .LBB2_344
; %bb.339:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v5, 0x7c0
	v_mov_b32_e32 v4, 0
                                        ; implicit-def: $sgpr6_sgpr7
	s_branch .LBB2_341
.LBB2_340:                              ;   in Loop: Header=BB2_341 Depth=2
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 s[8:9], exec, s[6:7]
	s_or_b64 s[2:3], s[8:9], s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB2_343
.LBB2_341:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_lshlrev_b32_e32 v0, 2, v4
	ds_read_b32 v0, v0 offset:2032
	v_readlane_b32 s8, v124, 34
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s9, v124, 35
	s_waitcnt lgkmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[12:13]
	flat_load_dwordx2 v[0:1], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
	s_or_b64 s[6:7], s[6:7], exec
	v_readlane_b32 s10, v124, 36
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[2:3], v[0:1]
	ds_write_b64 v5, v[0:1]
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr5
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_340
; %bb.342:                              ;   in Loop: Header=BB2_341 Depth=2
	v_add_u32_e32 v0, 1, v4
	v_cmp_ne_u32_e32 vcc, s33, v4
	s_sleep 1
	s_andn2_b64 s[6:7], s[6:7], exec
	v_cndmask_b32_e32 v4, 0, v0, vcc
	v_lshlrev_b32_e32 v5, 3, v4
	ds_read2_b64 v[0:3], v5 offset0:248 offset1:250
	v_add_u32_e32 v5, 0x7c0, v5
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, v[2:3], v[0:1]
	s_and_b64 s[10:11], vcc, exec
	s_or_b64 s[6:7], s[6:7], s[10:11]
	s_branch .LBB2_340
.LBB2_343:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[2:3]
.LBB2_344:                              ;   in Loop: Header=BB2_336 Depth=1
	;;#ASMSTART
	;;#ASMEND
.LBB2_345:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_lshlrev_b32_e32 v0, 3, v4
	s_barrier
	ds_read_b32 v1, v0 offset:1984
	ds_read_b64 v[2:3], v0 offset:2000
	v_add_u32_e32 v6, 0x7c0, v0
	s_waitcnt lgkmcnt(0)
	v_sub_u32_e32 v0, v1, v2
	v_min_i32_e32 v58, 16, v0
	v_cmp_lt_u32_e32 vcc, v46, v58
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_351
; %bb.346:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b64 v[0:1], v6 offset:32
	v_readlane_b32 s8, v124, 34
	v_lshl_add_u64 v[2:3], v[2:3], 0, v[46:47]
	v_readlane_b32 s9, v124, 35
	v_mov_b32_e32 v4, v41
	v_readlane_b32 s10, v124, 36
	v_or_b32_e32 v5, s9, v3
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB2_348
; %bb.347:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s61, v124, 35
	s_sub_u32 s0, 0, s60
	v_readfirstlane_b32 s2, v72
	v_readfirstlane_b32 s11, v73
	s_subb_u32 s1, 0, s61
	s_mul_hi_u32 s10, s0, s2
	s_mul_i32 s12, s0, s11
	s_mul_i32 s3, s1, s2
	s_add_i32 s10, s10, s12
	s_add_i32 s10, s10, s3
	s_mul_i32 s13, s0, s2
	s_mul_i32 s12, s2, s10
	s_mul_hi_u32 s14, s2, s13
	s_mul_hi_u32 s3, s2, s10
	s_add_u32 s12, s14, s12
	s_addc_u32 s3, 0, s3
	s_mul_hi_u32 s15, s11, s13
	s_mul_i32 s13, s11, s13
	s_add_u32 s12, s12, s13
	s_mul_hi_u32 s14, s11, s10
	s_addc_u32 s3, s3, s15
	s_addc_u32 s12, s14, 0
	s_mul_i32 s10, s11, s10
	s_add_u32 s3, s3, s10
	s_addc_u32 s10, 0, s12
	s_add_u32 s2, s2, s3
	s_addc_u32 s3, s11, s10
	s_mul_i32 s10, s0, s3
	s_mul_hi_u32 s11, s0, s2
	s_add_i32 s10, s11, s10
	s_mul_i32 s1, s1, s2
	s_add_i32 s10, s10, s1
	s_mul_i32 s0, s0, s2
	s_mul_hi_u32 s11, s3, s0
	s_mul_i32 s12, s3, s0
	s_mul_i32 s14, s2, s10
	s_mul_hi_u32 s0, s2, s0
	s_mul_hi_u32 s13, s2, s10
	s_add_u32 s0, s0, s14
	s_addc_u32 s13, 0, s13
	s_add_u32 s0, s0, s12
	s_mul_hi_u32 s1, s3, s10
	s_addc_u32 s0, s13, s11
	s_addc_u32 s1, s1, 0
	s_mul_i32 s10, s3, s10
	s_add_u32 s0, s0, s10
	s_addc_u32 s1, 0, s1
	s_add_u32 s2, s2, s0
	s_addc_u32 s3, s3, s1
	v_mad_u64_u32 v[4:5], s[0:1], v2, s3, 0
	v_mul_hi_u32 v40, v2, s2
	v_lshl_add_u64 v[4:5], v[40:41], 0, v[4:5]
	v_mad_u64_u32 v[10:11], s[0:1], v3, s2, 0
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_mad_u64_u32 v[8:9], s[0:1], v3, s3, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v11, vcc
	v_mov_b32_e32 v5, s51
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[8:9]
	v_mul_lo_u32 v7, s61, v4
	v_mul_lo_u32 v8, s60, v5
	v_mad_u64_u32 v[4:5], s[0:1], s60, v4, 0
	v_add3_u32 v5, v5, v8, v7
	v_sub_u32_e32 v7, v3, v5
	v_mov_b32_e32 v8, s61
	v_sub_co_u32_e32 v2, vcc, v2, v4
	v_readlane_b32 s62, v124, 36
	s_nop 0
	v_subb_co_u32_e64 v4, s[0:1], v7, v8, vcc
	v_subrev_co_u32_e64 v7, s[0:1], s60, v2
	v_subb_co_u32_e32 v3, vcc, v3, v5, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v9, s[2:3], 0, v4, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s61, v9
	v_subb_co_u32_e64 v4, s[0:1], v4, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s60, v7
	v_subrev_co_u32_e64 v8, s[0:1], s60, v7
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s61, v9
	v_subbrev_co_u32_e64 v4, s[0:1], 0, v4, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, v10, v11, s[2:3]
	v_cmp_le_u32_e32 vcc, s61, v3
	v_cmp_ne_u32_e64 s[0:1], 0, v10
	v_readlane_b32 s63, v124, 37
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s60, v2
	v_cndmask_b32_e64 v4, v9, v4, s[0:1]
	v_readlane_b32 s64, v124, 38
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s61, v3
	v_readlane_b32 s65, v124, 39
	v_readlane_b32 s66, v124, 40
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_readlane_b32 s67, v124, 41
	v_readlane_b32 s68, v124, 42
	v_cndmask_b32_e32 v5, v3, v4, vcc
	v_cndmask_b32_e64 v3, v7, v8, s[0:1]
	v_readlane_b32 s69, v124, 43
	v_readlane_b32 s70, v124, 44
	v_readlane_b32 s71, v124, 45
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
	v_cndmask_b32_e32 v4, v2, v3, vcc
                                        ; implicit-def: $vgpr2_vgpr3
.LBB2_348:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB2_350
; %bb.349:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s8, v124, 34
	s_sub_i32 s2, 0, s8
	v_readlane_b32 s9, v124, 35
	v_cvt_f32_u32_e32 v3, s8
	v_readlane_b32 s10, v124, 36
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_rcp_iflag_f32_e32 v3, v3
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_mul_f32_e32 v3, 0x4f7ffffe, v3
	v_cvt_u32_f32_e32 v3, v3
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_mul_lo_u32 v4, s2, v3
	v_mul_hi_u32 v4, v3, v4
	v_add_u32_e32 v3, v3, v4
	v_mul_hi_u32 v3, v2, v3
	v_mul_lo_u32 v3, v3, s8
	v_sub_u32_e32 v2, v2, v3
	v_subrev_u32_e32 v3, s8, v2
	v_cmp_le_u32_e32 vcc, s8, v2
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s20, v124, 46
	v_cndmask_b32_e32 v2, v2, v3, vcc
	v_subrev_u32_e32 v3, s8, v2
	v_cmp_le_u32_e32 vcc, s8, v2
	v_readlane_b32 s21, v124, 47
	v_readlane_b32 s22, v124, 48
	v_cndmask_b32_e32 v40, v2, v3, vcc
	v_mov_b64_e32 v[4:5], v[40:41]
	v_readlane_b32 s23, v124, 49
.LBB2_350:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[0:1], v[4:5], 3, v[0:1]
	flat_load_dwordx2 v[0:1], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	ds_write_b64 v43, v[0:1]
.LBB2_351:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_barrier
	s_mov_b64 s[0:1], exec
	v_readlane_b32 s2, v124, 8
	v_readlane_b32 s3, v124, 9
	s_and_b64 s[2:3], s[0:1], s[2:3]
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB2_353
; %bb.352:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b64 v[0:1], v6 offset:16
	v_ashrrev_i32_e32 v59, 31, v58
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[58:59]
	ds_write_b64 v6, v[0:1] offset:16
.LBB2_353:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_mul_lo_u32 v0, v58, 7
	v_cmp_lt_i32_e32 vcc, v46, v0
	s_and_saveexec_b64 s[0:1], vcc
	v_readlane_b32 s8, v124, 34
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
	v_readlane_b32 s9, v124, 35
	v_readlane_b32 s10, v124, 36
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	s_cbranch_execz .LBB2_356
; %bb.354:                              ;   in Loop: Header=BB2_336 Depth=1
	s_load_dword s6, s[30:31], 0xc
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v1, v45
	v_mov_b32_e32 v2, v45
	v_mov_b32_e32 v3, v46
	s_waitcnt lgkmcnt(0)
	s_and_b32 s6, s6, 0xffff
	s_lshl_b32 s7, s6, 4
.LBB2_355:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_mov_b32 s8, 0x24924925
	v_mul_hi_u32 v6, v3, s8
	v_sub_u32_e32 v7, v3, v6
	v_lshrrev_b32_e32 v7, 1, v7
	v_add_u32_e32 v6, v7, v6
	v_lshrrev_b32_e32 v6, 2, v6
	v_mul_lo_u32 v7, v6, s84
	v_lshlrev_b32_e32 v6, 3, v6
	ds_read_b32 v6, v6 offset:1792
	v_mov_b64_e32 v[4:5], s[22:23]
	v_sub_u32_e32 v40, v2, v7
	v_add_u32_e32 v3, s6, v3
	v_cmp_ge_i32_e32 vcc, v3, v0
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[4:5], s[8:9], v6, s84, v[4:5]
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[40:41]
	global_load_dwordx4 v[6:9], v[4:5], off
	global_load_dwordx4 v[10:13], v[4:5], off offset:16
	s_or_b64 s[2:3], vcc, s[2:3]
	v_add_u32_e32 v2, s7, v2
	s_waitcnt vmcnt(1)
	ds_write_b128 v1, v[6:9]
	s_waitcnt vmcnt(0)
	ds_write_b128 v1, v[10:13] offset:16
	v_add_u32_e32 v1, s7, v1
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz .LBB2_355
.LBB2_356:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_mov_b32_e32 v59, 0
	s_barrier
.LBB2_357:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_mul_lo_u32 v74, v59, s84
	s_mov_b64 s[0:1], exec
	v_readlane_b32 s2, v124, 8
	v_readlane_b32 s3, v124, 9
	s_and_b64 s[2:3], s[0:1], s[2:3]
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB2_364
; %bb.358:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b64 v[0:1], v74 offset:16
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, s[58:59], v[0:1]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_364
; %bb.359:                              ;   in Loop: Header=BB2_336 Depth=1
	v_and_b32_e32 v3, 0x1e000000, v1
	v_mov_b32_e32 v2, v41
	v_cmp_eq_u64_e32 vcc, 0, v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_364
; %bb.360:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s4, v124, 34
	v_mov_b32_e32 v1, v41
	v_readlane_b32 s16, v124, 46
	v_readlane_b32 s17, v124, 47
	v_readlane_b32 s14, v124, 44
	v_readlane_b32 s15, v124, 45
	v_lshl_add_u64 v[2:3], v[0:1], 2, s[16:17]
	global_load_dword v2, v[2:3], off
	v_lshlrev_b32_e32 v3, 3, v59
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[14:15]
	ds_read_b32 v7, v3 offset:1796
	global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1
	v_readlane_b32 s5, v124, 35
	v_readlane_b32 s6, v124, 36
	v_readlane_b32 s7, v124, 37
	v_readlane_b32 s8, v124, 38
	v_readlane_b32 s9, v124, 39
	v_readlane_b32 s10, v124, 40
	v_readlane_b32 s11, v124, 41
	v_readlane_b32 s12, v124, 42
	v_readlane_b32 s13, v124, 43
	v_readlane_b32 s18, v124, 48
	v_readlane_b32 s19, v124, 49
	s_waitcnt vmcnt(1)
	v_ashrrev_i32_e32 v8, 31, v2
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[2:3], s[2:3], v7, v2, 0
	v_mov_b32_e32 v6, v3
	v_mad_u64_u32 v[6:7], s[2:3], v7, v8, v[6:7]
	v_mov_b32_e32 v3, v6
	s_waitcnt vmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[4:5], v[2:3]
	buffer_inv sc1
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_364
; %bb.361:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[2:3], 0
.LBB2_362:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1
	s_sleep 1
	s_waitcnt vmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[2:3], vcc, s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz .LBB2_362
; %bb.363:                              ;   in Loop: Header=BB2_336 Depth=1
	buffer_inv sc1
.LBB2_364:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	s_mov_b64 s[0:1], exec
	v_readlane_b32 s2, v124, 8
	v_readlane_b32 s3, v124, 9
	s_and_b64 s[2:3], s[0:1], s[2:3]
	s_mov_b64 exec, s[2:3]
; %bb.365:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_write_b32 v41, v62 offset:2048
; %bb.366:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	ds_read_b32 v75, v74
	s_mov_b64 s[0:1], 0
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr10_vgpr11
                                        ; implicit-def: $vgpr8
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_i32_e32 vcc, 9, v75
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[96:97], exec, s[4:5]
	s_cbranch_execz .LBB2_393
; %bb.367:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_eq_u32_e32 vcc, 10, v75
	s_mov_b64 s[4:5], -1
                                        ; implicit-def: $vgpr10_vgpr11
                                        ; implicit-def: $vgpr8
	s_and_saveexec_b64 s[64:65], vcc
	s_cbranch_execz .LBB2_374
; %bb.368:                              ;   in Loop: Header=BB2_336 Depth=1
	v_mov_b64_e32 v[10:11], v[60:61]
	v_mov_b32_e32 v8, v42
	s_and_saveexec_b64 s[80:81], s[40:41]
	s_cbranch_execz .LBB2_373
; %bb.369:                              ;   in Loop: Header=BB2_336 Depth=1
	s_memrealtime s[0:1]
	v_cmp_ne_u64_e32 vcc, 0, v[60:61]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s1, s1, 10
	s_mul_hi_u32 s2, s0, 10
	s_mul_i32 s68, s0, 10
	s_add_i32 s69, s2, s1
	s_and_saveexec_b64 s[70:71], vcc
	s_cbranch_execz .LBB2_372
; %bb.370:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b32 s0, 0xc28f5c29
	v_mul_lo_u32 v0, v42, s0
	v_alignbit_b32 v0, v0, v0, 1
	s_mov_b32 s0, 0x51eb852
	v_cmp_gt_i32_e32 vcc, 10, v42
	v_cmp_gt_u32_e64 s[0:1], s0, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_and_b64 exec, exec, s[0:1]
	s_cbranch_execz .LBB2_372
; %bb.371:                              ;   in Loop: Header=BB2_336 Depth=1
	s_load_dwordx2 s[0:1], s[44:45], 0xb8
	v_mov_b32_e32 v0, s69
	v_sub_co_u32_e32 v2, vcc, s68, v60
	v_writelane_b32 v109, s36, 0
	s_waitcnt lgkmcnt(0)
	global_load_dword v40, v41, s[0:1] offset:4
	v_subb_co_u32_e32 v0, vcc, v0, v61, vcc
	v_cvt_f64_u32_e32 v[0:1], v0
	v_writelane_b32 v109, s37, 1
	v_ldexp_f64 v[0:1], v[0:1], 32
	v_cvt_f64_u32_e32 v[2:3], v2
	s_mov_b32 s2, 0
	v_writelane_b32 v124, s52, 60
	v_writelane_b32 v109, s48, 2
	v_add_f64 v[0:1], v[0:1], v[2:3]
	s_mov_b32 s3, 0x412e8480
	v_writelane_b32 v124, s53, 61
	s_mov_b32 s53, s54
	s_add_u32 s54, s44, 0x1b0
	v_writelane_b32 v109, s49, 3
	v_div_scale_f64 v[2:3], s[0:1], s[2:3], s[2:3], v[0:1]
	s_mov_b32 s67, s55
	s_addc_u32 s55, s45, 0
	v_writelane_b32 v109, s44, 4
	v_rcp_f64_e32 v[4:5], v[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v109, s45, 5
	v_writelane_b32 v109, s56, 6
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v109, s57, 7
	v_writelane_b32 v109, s58, 8
	v_writelane_b32 v109, s59, 9
	v_writelane_b32 v109, s30, 10
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v109, s31, 11
	v_div_scale_f64 v[6:7], vcc, v[0:1], s[2:3], v[0:1]
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_writelane_b32 v124, s98, 62
	v_writelane_b32 v109, s40, 12
	v_mul_f64 v[8:9], v[6:7], v[4:5]
	v_writelane_b32 v124, s99, 63
	v_writelane_b32 v109, s41, 13
	v_fma_f64 v[2:3], -v[2:3], v[8:9], v[6:7]
	v_readlane_b32 s98, v124, 6
	v_readlane_b32 s36, v124, 4
	v_readlane_b32 s48, v124, 2
	v_writelane_b32 v109, s42, 14
	v_div_fmas_f64 v[2:3], v[2:3], v[4:5], v[8:9]
	v_readlane_b32 s99, v124, 7
	v_readlane_b32 s37, v124, 5
	v_readlane_b32 s49, v124, 3
	v_readlane_b32 s52, v124, 1
	v_readlane_b32 s66, v124, 0
	v_writelane_b32 v109, s43, 15
	v_div_fixup_f64 v[76:77], v[2:3], s[2:3], v[0:1]
	s_mov_b64 s[4:5], s[98:99]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s66
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v0, v41
	v_mov_b32_e32 v1, v41
	v_writelane_b32 v109, s46, 16
	s_mov_b32 s50, s27
	s_nop 0
	v_writelane_b32 v109, s47, 17
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	v_mov_b32_e32 v2, s0
	v_readlane_b32 s0, v124, 58
	s_mov_b64 s[4:5], s[98:99]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s66
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	v_writelane_b32 v109, s86, 18
	s_mov_b64 s[4:5], s[98:99]
	s_mov_b64 s[6:7], s[36:37]
	v_writelane_b32 v109, s87, 19
	s_load_dwordx2 s[86:87], s[0:1], 0x0
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s66
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v42
	v_mov_b32_e32 v4, v41
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, v41
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[86:87]
	s_mov_b64 s[4:5], s[98:99]
	s_mov_b64 s[6:7], s[36:37]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[48:49]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s66
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v76
	v_mov_b32_e32 v4, v77
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, v41
	s_swappc_b64 s[30:31], s[86:87]
	s_mov_b64 s[4:5], s[98:99]
	v_readlane_b32 s98, v124, 62
	s_mov_b64 s[6:7], s[36:37]
	v_readlane_b32 s36, v109, 0
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b32 s54, s53
	s_mov_b64 s[10:11], s[48:49]
	v_readlane_b32 s48, v109, 2
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	v_readlane_b32 s52, v124, 60
	s_mov_b32 s14, s66
	v_mov_b32_e32 v31, v44
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v40
	v_mov_b32_e32 v4, v41
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, 1
	v_readlane_b32 s99, v124, 63
	v_readlane_b32 s37, v109, 1
	s_mov_b32 s55, s67
	v_readlane_b32 s49, v109, 3
	v_readlane_b32 s53, v124, 61
	s_swappc_b64 s[30:31], s[86:87]
	v_readlane_b32 s28, v124, 30
	v_readlane_b32 s56, v109, 6
	v_readlane_b32 s30, v124, 32
	v_readlane_b32 s31, v124, 33
	v_readlane_b32 s24, v124, 26
	v_readlane_b32 s58, v109, 8
	v_readlane_b32 s59, v109, 9
	v_readlane_b32 s86, v109, 18
	v_readlane_b32 s46, v109, 16
	v_readlane_b32 s42, v109, 14
	v_readlane_b32 s40, v109, 12
	v_readlane_b32 s30, v109, 10
	v_readlane_b32 s26, v124, 28
	v_readlane_b32 s27, v124, 29
	v_readlane_b32 s57, v109, 7
	s_mov_b32 s58, -2
	v_readlane_b32 s44, v109, 4
	v_readlane_b32 s87, v109, 19
	s_movk_i32 s78, 0xaf
	s_movk_i32 s77, 0xb8
	s_movk_i32 s76, 0xb6
	v_readlane_b32 s47, v109, 17
	v_readlane_b32 s43, v109, 15
	v_readlane_b32 s41, v109, 13
	v_readlane_b32 s29, v124, 31
	v_readlane_b32 s31, v109, 11
	v_readlane_b32 s25, v124, 27
	s_mov_b32 s27, s50
	s_movk_i32 s26, 0x700
	s_movk_i32 s57, 0xad
	s_brev_b32 s59, -2
	v_readlane_b32 s45, v109, 5
.LBB2_372:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[70:71]
	v_add_u32_e32 v8, 1, v42
	v_mov_b64_e32 v[10:11], s[68:69]
.LBB2_373:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[80:81]
	s_mov_b64 s[0:1], exec
	s_xor_b64 s[4:5], exec, -1
.LBB2_374:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[64:65]
	s_and_b64 s[2:3], s[0:1], exec
	s_and_b64 s[0:1], s[4:5], exec
	s_andn2_saveexec_b64 s[4:5], s[96:97]
	s_cbranch_execnz .LBB2_394
.LBB2_375:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB2_395
.LBB2_376:                              ;   in Loop: Header=BB2_336 Depth=1
	v_and_b32_e32 v0, -4, v75
	v_cmp_ne_u32_e32 vcc, s85, v0
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_386
; %bb.377:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s57, v75
	s_mov_b64 s[12:13], 0
	s_mov_b64 s[10:11], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB2_396
; %bb.378:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v75
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.379:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v75
	s_mov_b64 s[10:11], exec
	s_and_b64 s[12:13], vcc, exec
; %bb.380:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[14:15], s[0:1]
; %bb.381:                              ;   in Loop: Header=BB2_336 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v75
	v_cmp_lt_i32_e64 s[0:1], s78, v75
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[16:17], vcc, exec
	s_andn2_b64 s[12:13], s[12:13], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[10:11], s[10:11], s[16:17]
	s_or_b64 s[12:13], s[12:13], s[0:1]
; %bb.382:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[10:11], s[10:11], exec
	s_and_b64 s[12:13], s[12:13], exec
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execnz .LBB2_397
.LBB2_383:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execz .LBB2_385
.LBB2_384:                              ;   in Loop: Header=BB2_336 Depth=1
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	global_load_dword v0, v41, s[8:9]
	s_andn2_b64 s[10:11], s[10:11], exec
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v0, v0, v75
	global_store_dword v41, v0, s[8:9]
.LBB2_385:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_orn2_b64 s[0:1], s[10:11], exec
.LBB2_386:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[0:1]
	s_cbranch_execz .LBB2_415
; %bb.387:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b32 v0, v41 offset:2056
	v_readlane_b32 s8, v124, 8
	v_readlane_b32 s9, v124, 9
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s0, v0
	s_cmp_eq_u32 s0, -1
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 s[0:1], s[8:9], s[0:1]
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB2_403
; %bb.388:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_b64 vcc, exec, s[42:43]
	s_cbranch_vccnz .LBB2_398
; %bb.389:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_b64 vcc, exec, s[52:53]
	s_cbranch_vccnz .LBB2_399
; %bb.390:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b32 s12, 1
	s_mov_b32 s13, 0
	s_mov_b64 s[10:11], s[24:25]
	s_mov_b32 s14, s55
	s_mov_b32 s15, 0
	s_mov_b32 s16, 0
	s_mov_b32 s17, 0
	s_mov_b32 s18, 0
.LBB2_391:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[0:1], v41, s[10:11]
	s_cmp_lt_i32 s12, s35
	s_cselect_b64 s[20:21], -1, 0
	s_cmp_lt_i32 s13, s34
	s_cselect_b64 s[22:23], -1, 0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s[0:1], s39, v1
	s_cmp_lg_u64 s[0:1], 0
	v_cmp_eq_u32_e32 vcc, s38, v0
	s_addc_u32 s16, s16, 0
	s_cmp_lg_u64 vcc, 0
	s_addc_u32 s15, s15, 0
	s_and_b64 s[22:23], s[22:23], vcc
	s_and_b64 s[0:1], s[20:21], s[0:1]
	s_addc_u32 s18, s18, 0
	s_cmp_lg_u64 s[22:23], 0
	s_addc_u32 s17, s17, 0
	s_add_i32 s13, s13, 2
	s_add_i32 s12, s12, 2
	s_add_i32 s14, s14, -2
	s_add_u32 s10, s10, 8
	s_addc_u32 s11, s11, 0
	s_cmp_lg_u32 s14, 0
	s_cbranch_scc1 .LBB2_391
; %bb.392:                              ;   in Loop: Header=BB2_336 Depth=1
	s_add_i32 s10, s17, s18
	s_add_i32 s11, s15, s16
	s_mov_b32 s50, s55
	s_mov_b64 s[0:1], s[86:87]
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB2_400
	s_branch .LBB2_402
.LBB2_393:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[96:97]
	s_cbranch_execz .LBB2_375
.LBB2_394:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_ne_u32_e32 vcc, 0, v75
	s_andn2_b64 s[0:1], s[0:1], exec
	s_and_b64 s[6:7], vcc, exec
	s_or_b64 s[0:1], s[0:1], s[6:7]
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execnz .LBB2_376
.LBB2_395:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB2_335
	s_branch .LBB2_416
.LBB2_396:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB2_383
.LBB2_397:                              ;   in Loop: Header=BB2_336 Depth=1
	v_add_u32_e32 v0, 0xffffff72, v75
	v_cmp_gt_u32_e32 vcc, 7, v0
	v_cmp_lt_u32_e64 s[0:1], 6, v0
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[14:15], vcc, exec
	s_andn2_b64 s[12:13], s[12:13], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[10:11], s[10:11], s[14:15]
	s_or_b64 s[12:13], s[12:13], s[0:1]
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execnz .LBB2_384
	s_branch .LBB2_385
.LBB2_398:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b32 s11, 0
	s_mov_b32 s10, 0
	s_branch .LBB2_402
.LBB2_399:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b32 s50, 0
	s_mov_b32 s11, 0
	s_mov_b32 s10, 0
	s_cbranch_execz .LBB2_402
.LBB2_400:                              ;   in Loop: Header=BB2_336 Depth=1
	s_lshl_b64 s[0:1], s[50:51], 2
	s_add_u32 s0, s24, s0
	s_addc_u32 s1, s25, s1
.LBB2_401:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v0, v41, s[0:1]
	s_cmp_lt_i32 s50, s34
	s_cselect_b64 s[12:13], -1, 0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e32 vcc, s38, v0
	s_cmp_lg_u64 vcc, 0
	s_addc_u32 s11, s11, 0
	s_and_b64 s[12:13], s[12:13], vcc
	s_addc_u32 s10, s10, 0
	s_add_i32 s50, s50, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_eq_u32 s56, s50
	s_cbranch_scc0 .LBB2_401
.LBB2_402:                              ;   in Loop: Header=BB2_336 Depth=1
	v_mov_b32_e32 v0, s11
	v_mov_b32_e32 v1, s10
	ds_write2_b32 v63, v0, v1 offset1:1
.LBB2_403:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_barrier
	ds_read_u16 v8, v74 offset:106
	ds_read_b32 v2, v41 offset:2056
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_i32_e32 vcc, v2, v8
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_413
; %bb.404:                              ;   in Loop: Header=BB2_336 Depth=1
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	global_load_dword v0, v41, s[8:9]
	ds_read_b32 v9, v41 offset:2052
	ds_read_u16 v1, v74 offset:104
	ds_read_b32 v3, v74
	s_mov_b64 s[10:11], -1
	s_waitcnt lgkmcnt(2)
	v_cvt_f32_u32_e32 v5, v9
	v_sub_u32_e32 v7, 0, v9
	s_waitcnt lgkmcnt(0)
	v_add_u32_e32 v4, v3, v1
	v_add_u32_e32 v3, v2, v9
	v_rcp_iflag_f32_e32 v1, v5
	v_max_i32_e32 v5, v3, v8
	v_cmp_lt_i32_e32 vcc, v3, v8
	v_mul_f32_e32 v1, 0x4f7ffffe, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cndmask_b32_e64 v6, 1, 2, vcc
	v_subb_co_u32_e32 v5, vcc, v5, v3, vcc
	v_mul_lo_u32 v7, v7, v1
	v_mul_hi_u32 v7, v1, v7
	v_add_u32_e32 v1, v1, v7
	v_mul_hi_u32 v1, v5, v1
	v_mul_lo_u32 v7, v1, v9
	v_sub_u32_e32 v5, v5, v7
	v_add_u32_e32 v7, 1, v1
	v_cmp_ge_u32_e32 vcc, v5, v9
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v7, vcc
	v_sub_u32_e32 v7, v5, v9
	v_cndmask_b32_e32 v5, v5, v7, vcc
	v_add_u32_e32 v7, 1, v1
	v_cmp_ge_u32_e32 vcc, v5, v9
	v_mov_b32_e32 v5, 0
	s_nop 0
	v_cndmask_b32_e32 v1, v1, v7, vcc
	v_add_u32_e32 v10, v6, v1
	v_cmp_lt_u32_e32 vcc, 1, v10
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_408
; %bb.405:                              ;   in Loop: Header=BB2_336 Depth=1
	v_and_b32_e32 v11, -2, v10
	v_mov_b32_e32 v5, v4
	v_lshlrev_b32_e32 v12, 1, v9
	v_mov_b32_e32 v1, 0
	s_mov_b64 s[10:11], 0
	v_mov_b32_e32 v14, v11
	v_mov_b64_e32 v[6:7], v[2:3]
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v13, 0
.LBB2_406:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_u32_e32 v14, -2, v14
	v_cmp_eq_u32_e32 vcc, 0, v14
	v_add3_u32 v1, v7, v5, v1
	s_waitcnt vmcnt(0)
	v_add3_u32 v0, v6, v4, v0
	v_add_u32_e32 v13, 1, v13
	v_add_u32_e32 v3, 1, v3
	v_add_u32_e32 v7, v7, v12
	s_or_b64 s[10:11], vcc, s[10:11]
	v_add_u32_e32 v6, v6, v12
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB2_406
; %bb.407:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_mul_lo_u32 v5, v11, v9
	v_cmp_ne_u32_e32 vcc, v10, v11
	v_add_u32_e32 v2, v2, v5
	v_add_u32_e32 v5, v3, v13
	v_add_u32_e32 v0, v0, v1
	s_orn2_b64 s[10:11], vcc, exec
.LBB2_408:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[8:9], s[10:11]
	s_cbranch_execz .LBB2_412
; %bb.409:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[10:11], 0
.LBB2_410:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_waitcnt vmcnt(0)
	v_add3_u32 v0, v4, v2, v0
	v_add_u32_e32 v2, v2, v9
	v_cmp_ge_i32_e32 vcc, v2, v8
	s_or_b64 s[10:11], vcc, s[10:11]
	v_add_u32_e32 v5, 1, v5
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB2_410
; %bb.411:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[10:11]
.LBB2_412:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	s_waitcnt vmcnt(0)
	global_store_dword v41, v0, s[8:9]
.LBB2_413:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v124, 8
	v_readlane_b32 s1, v124, 9
	s_and_b64 exec, exec, s[0:1]
; %bb.414:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_write_b32 v41, v5 offset:2048
.LBB2_415:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_or_b64 s[2:3], s[2:3], exec
	v_mov_b64_e32 v[10:11], v[60:61]
	v_mov_b32_e32 v8, v42
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB2_335
.LBB2_416:                              ;   in Loop: Header=BB2_336 Depth=1
	s_barrier
	s_mov_b64 s[6:7], exec
	v_readlane_b32 s0, v124, 8
	v_readlane_b32 s1, v124, 9
	s_and_b64 s[0:1], s[6:7], s[0:1]
	s_mov_b64 exec, s[0:1]
	s_cbranch_execz .LBB2_334
; %bb.417:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b64 v[0:1], v74 offset:8
	v_mov_b32_e32 v2, v41
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v3, 0x1e000000, v1
	v_cmp_eq_u64_e32 vcc, 0, v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_334
; %bb.418:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s8, v124, 34
	v_mov_b32_e32 v1, v41
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	s_andn2_b64 vcc, exec, s[46:47]
	v_mov_b32_e32 v40, 0
	v_lshl_add_u64 v[2:3], v[0:1], 2, s[20:21]
	global_load_dword v6, v[2:3], off
	v_add_u32_e32 v2, s27, v0
	v_readlane_b32 s9, v124, 35
	v_readlane_b32 s10, v124, 36
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
	s_cbranch_vccnz .LBB2_420
; %bb.419:                              ;   in Loop: Header=BB2_336 Depth=1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshl_add_u64 v[4:5], v[2:3], 2, s[98:99]
	global_load_dword v40, v[4:5], off
.LBB2_420:                              ;   in Loop: Header=BB2_336 Depth=1
	s_waitcnt vmcnt(0)
	v_cmp_gt_i32_e32 vcc, 1, v40
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB2_423
; %bb.421:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s8, v124, 34
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	buffer_wbl2 sc1
	s_mov_b64 s[2:3], exec
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[18:19]
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[2:3], v[56:57] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s9, v124, 35
	v_readlane_b32 s10, v124, 36
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
	v_lshl_add_u64 v[4:5], v[2:3], 0, 1
	v_lshl_add_u32 v3, v59, 3, s26
                                        ; implicit-def: $vgpr74
                                        ; implicit-def: $vgpr2
	s_andn2_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execnz .LBB2_424
.LBB2_422:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB2_334
	s_branch .LBB2_455
.LBB2_423:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB2_422
.LBB2_424:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b32 v9, v41 offset:2048
	ds_read_b32 v7, v74
	s_mov_b64 s[14:15], -1
	s_waitcnt lgkmcnt(1)
	v_cmp_eq_u32_e32 vcc, 0, v9
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v3, -4, v7
	v_cmp_eq_u32_e64 s[10:11], s85, v3
	v_cmp_ne_u32_e64 s[0:1], s85, v3
	s_cbranch_vccnz .LBB2_426
; %bb.425:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[12:13], s[2:3]
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB2_454
	s_branch .LBB2_437
.LBB2_426:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[10:11], 0
	s_mov_b64 s[14:15], 0
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB2_436
; %bb.427:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s57, v7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB2_433
; %bb.428:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v7
	s_and_saveexec_b64 s[16:17], vcc
	s_xor_b64 s[16:17], exec, s[16:17]
; %bb.429:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v7
	s_and_b64 s[14:15], vcc, exec
; %bb.430:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[16:17], s[16:17]
; %bb.431:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s78, v7
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[18:19], vcc, exec
	s_or_b64 s[14:15], s[14:15], s[18:19]
; %bb.432:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], s[14:15], exec
.LBB2_433:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[0:1]
; %bb.434:                              ;   in Loop: Header=BB2_336 Depth=1
	v_add_u32_e32 v3, 0xffffff72, v7
	v_cmp_lt_u32_e32 vcc, 6, v3
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[16:17], vcc, exec
	s_or_b64 s[14:15], s[14:15], s[16:17]
; %bb.435:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_and_b64 s[14:15], s[14:15], exec
.LBB2_436:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_mov_b64 s[12:13], s[2:3]
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB2_454
.LBB2_437:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[12:13], -1
	s_xor_b64 s[14:15], s[10:11], -1
	s_and_saveexec_b64 s[10:11], s[14:15]
	s_cbranch_execz .LBB2_441
; %bb.438:                              ;   in Loop: Header=BB2_336 Depth=1
	v_add_u32_e32 v3, 0xffffff72, v7
	v_cmp_gt_u32_e32 vcc, 43, v3
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[12:13], vcc
; %bb.439:                              ;   in Loop: Header=BB2_336 Depth=1
	s_movk_i32 s16, 0x7f
	s_movk_i32 s17, 0x603
	v_lshrrev_b64 v[4:5], v3, s[16:17]
	v_and_b32_e32 v3, 1, v4
	v_cmp_eq_u32_e32 vcc, 1, v3
	s_and_b64 s[16:17], vcc, exec
; %bb.440:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_orn2_b64 s[12:13], s[16:17], exec
.LBB2_441:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_ashrrev_i32_e32 v3, 31, v2
	v_ashrrev_i32_e32 v4, 31, v9
	v_lshl_add_u64 v[2:3], v[2:3], 3, s[28:29]
	v_cndmask_b32_e64 v5, 0, v4, s[12:13]
	v_cndmask_b32_e64 v4, 1, v9, s[12:13]
	global_atomic_add_x2 v[2:3], v[2:3], v[4:5], off sc0
	v_lshlrev_b32_e32 v9, 3, v59
	ds_read_b32 v12, v9 offset:1796
	s_mov_b64 s[12:13], s[2:3]
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[12:13], s[10:11], v12, v40, 0
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[2:3], 0, v[4:5]
	v_cmp_eq_u64_e32 vcc, v[2:3], v[12:13]
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB2_453
; %bb.442:                              ;   in Loop: Header=BB2_336 Depth=1
	v_mov_b64_e32 v[2:3], 1
	buffer_wbl2 sc1
	s_and_saveexec_b64 s[12:13], s[14:15]
	s_cbranch_execz .LBB2_452
; %bb.443:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s57, v7
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execz .LBB2_475
; %bb.444:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v7
	s_and_saveexec_b64 s[18:19], vcc
	s_xor_b64 s[18:19], exec, s[18:19]
; %bb.445:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v7
	s_and_b64 s[16:17], vcc, exec
                                        ; implicit-def: $vgpr7
; %bb.446:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[18:19], s[18:19]
; %bb.447:                              ;   in Loop: Header=BB2_336 Depth=1
	v_cmp_lt_i32_e32 vcc, s78, v7
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[20:21], vcc, exec
	s_or_b64 s[16:17], s[16:17], s[20:21]
; %bb.448:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[18:19]
	s_and_b64 s[16:17], s[16:17], exec
                                        ; implicit-def: $vgpr7
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_476
.LBB2_449:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[14:15]
	v_mov_b64_e32 v[2:3], 1
	s_and_saveexec_b64 s[14:15], s[16:17]
.LBB2_450:                              ;   in Loop: Header=BB2_336 Depth=1
	v_mov_b64_e32 v[2:3], v[40:41]
.LBB2_451:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[14:15]
.LBB2_452:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[12:13]
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s70, v124, 44
	v_readlane_b32 s71, v124, 45
	s_or_b64 s[12:13], s[2:3], exec
	v_readlane_b32 s61, v124, 35
	v_lshl_add_u64 v[4:5], v[0:1], 3, s[70:71]
	;;#ASMSTART
	flat_atomic_add_x2 v[4:5], v[4:5], v[2:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s62, v124, 36
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[2:3]
	v_readlane_b32 s63, v124, 37
	v_readlane_b32 s64, v124, 38
	v_readlane_b32 s65, v124, 39
	v_readlane_b32 s66, v124, 40
	v_readlane_b32 s67, v124, 41
	v_readlane_b32 s68, v124, 42
	v_readlane_b32 s69, v124, 43
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
.LBB2_453:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_andn2_b64 s[10:11], s[2:3], exec
	s_and_b64 s[12:13], s[12:13], exec
	v_add_u32_e32 v3, 0x700, v9
	s_or_b64 s[12:13], s[10:11], s[12:13]
.LBB2_454:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_andn2_b64 s[0:1], s[2:3], exec
	s_and_b64 s[2:3], s[12:13], exec
	s_or_b64 s[2:3], s[0:1], s[2:3]
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB2_334
.LBB2_455:                              ;   in Loop: Header=BB2_336 Depth=1
	ds_read_b32 v7, v3 offset:4
	v_ashrrev_i32_e32 v9, 31, v6
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[2:3], s[0:1], v7, v6, 0
	v_mov_b32_e32 v6, v3
	v_mad_u64_u32 v[6:7], s[0:1], v7, v9, v[6:7]
	v_mov_b32_e32 v3, v6
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_334
; %bb.456:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s0, v124, 10
	v_readlane_b32 s1, v124, 11
	v_readlane_b32 s2, v124, 12
	v_readlane_b32 s3, v124, 13
	v_mad_u64_u32 v[2:3], s[0:1], v0, 24, s[0:1]
	global_load_dword v2, v[2:3], off
	s_movk_i32 s0, 0x384
	s_waitcnt vmcnt(0)
	v_cmp_ne_u32_e32 vcc, s0, v2
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_334
; %bb.457:                              ;   in Loop: Header=BB2_336 Depth=1
	v_and_b32_e32 v2, -2, v2
	s_movk_i32 s0, 0x386
	v_cmp_ne_u32_e32 vcc, s0, v2
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB2_467
; %bb.458:                              ;   in Loop: Header=BB2_336 Depth=1
	s_mov_b64 s[2:3], exec
	v_mbcnt_lo_u32_b32 v2, s2, 0
	v_mbcnt_hi_u32_b32 v40, s3, v2
	v_cmp_eq_u32_e32 vcc, 0, v40
                                        ; implicit-def: $vgpr2_vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_460
; %bb.459:                              ;   in Loop: Header=BB2_336 Depth=1
	s_bcnt1_i32_b64 s2, s[2:3]
	v_mov_b32_e32 v2, s2
	v_readlane_b32 s2, v124, 50
	v_mov_b32_e32 v3, v41
	v_readlane_b32 s3, v124, 51
	s_nop 4
	global_atomic_add_x2 v[2:3], v41, v[2:3], s[2:3] sc0
.LBB2_460:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v124, 52
	v_readlane_b32 s1, v124, 53
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s63, v124, 37
	v_mov_b32_e32 v6, v41
	v_readlane_b32 s61, v124, 35
	v_readlane_b32 s62, v124, 36
	global_load_dwordx2 v[4:5], v41, s[0:1]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s1, v3
	v_readfirstlane_b32 s0, v2
	v_readlane_b32 s64, v124, 38
	v_readlane_b32 s65, v124, 39
	v_lshl_add_u64 v[2:3], s[0:1], 0, v[40:41]
	v_or_b32_e32 v7, s63, v3
	v_cmp_ne_u64_e32 vcc, 0, v[6:7]
	v_readlane_b32 s66, v124, 40
	v_readlane_b32 s67, v124, 41
	v_readlane_b32 s68, v124, 42
	v_readlane_b32 s69, v124, 43
	v_readlane_b32 s70, v124, 44
	v_readlane_b32 s71, v124, 45
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[10:11], exec, s[0:1]
	s_cbranch_execz .LBB2_462
; %bb.461:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s62, v124, 36
	v_readlane_b32 s63, v124, 37
	s_sub_u32 s0, 0, s62
	v_cvt_f32_u32_e32 v6, s62
	v_cvt_f32_u32_e32 v7, s63
	s_subb_u32 s1, 0, s63
	v_readlane_b32 s61, v124, 35
	v_readlane_b32 s64, v124, 38
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	v_readlane_b32 s65, v124, 39
	v_readlane_b32 s66, v124, 40
	v_readlane_b32 s67, v124, 41
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s68, v124, 42
	v_readlane_b32 s69, v124, 43
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s12, s0, s2
	s_mul_hi_u32 s14, s0, s3
	s_mul_i32 s13, s1, s3
	s_add_i32 s12, s14, s12
	s_mul_i32 s15, s0, s3
	s_add_i32 s12, s12, s13
	s_mul_i32 s14, s3, s12
	s_mul_hi_u32 s16, s3, s15
	s_mul_hi_u32 s13, s3, s12
	s_add_u32 s14, s16, s14
	s_addc_u32 s13, 0, s13
	s_mul_hi_u32 s17, s2, s15
	s_mul_i32 s15, s2, s15
	s_add_u32 s14, s14, s15
	s_mul_hi_u32 s16, s2, s12
	s_addc_u32 s13, s13, s17
	s_addc_u32 s14, s16, 0
	s_mul_i32 s12, s2, s12
	s_add_u32 s12, s13, s12
	s_addc_u32 s13, 0, s14
	s_add_u32 s3, s3, s12
	s_addc_u32 s2, s2, s13
	s_mul_i32 s12, s0, s2
	s_mul_hi_u32 s13, s0, s3
	s_add_i32 s12, s13, s12
	s_mul_i32 s1, s1, s3
	s_add_i32 s12, s12, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s13, s2, s0
	s_mul_i32 s14, s2, s0
	s_mul_i32 s16, s3, s12
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s15, s3, s12
	s_add_u32 s0, s0, s16
	s_addc_u32 s15, 0, s15
	s_add_u32 s0, s0, s14
	s_mul_hi_u32 s1, s2, s12
	s_addc_u32 s0, s15, s13
	s_addc_u32 s1, s1, 0
	s_mul_i32 s12, s2, s12
	s_add_u32 s0, s0, s12
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v2, s2, 0
	v_mul_hi_u32 v40, v2, s3
	v_lshl_add_u64 v[6:7], v[40:41], 0, v[6:7]
	v_mad_u64_u32 v[14:15], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v14
	v_mad_u64_u32 v[12:13], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v15, vcc
	v_mov_b32_e32 v7, s51
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[12:13]
	v_mul_lo_u32 v9, s63, v6
	v_mul_lo_u32 v12, s62, v7
	v_mad_u64_u32 v[6:7], s[0:1], s62, v6, 0
	v_add3_u32 v7, v7, v12, v9
	v_sub_u32_e32 v9, v3, v7
	v_mov_b32_e32 v12, s63
	v_sub_co_u32_e32 v6, vcc, v2, v6
	v_readlane_b32 s70, v124, 44
	s_nop 0
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, vcc
	v_subrev_co_u32_e64 v13, s[0:1], s62, v6
	v_subb_co_u32_e32 v7, vcc, v3, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v14, s[2:3], 0, v9, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s63, v14
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s62, v13
	v_subrev_co_u32_e64 v12, s[0:1], s62, v13
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s63, v14
	v_subbrev_co_u32_e64 v9, s[0:1], 0, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, v15, v16, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v15
	v_cmp_le_u32_e32 vcc, s63, v7
	v_readlane_b32 s71, v124, 45
	v_cndmask_b32_e64 v9, v14, v9, s[0:1]
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s62, v6
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_cndmask_b32_e64 v15, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s63, v7
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
	v_cndmask_b32_e32 v14, v14, v15, vcc
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e64 v9, v13, v12, s[0:1]
	v_cndmask_b32_e32 v6, v6, v9, vcc
.LBB2_462:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[10:11]
	s_cbranch_execz .LBB2_464
; %bb.463:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s62, v124, 36
	s_sub_i32 s2, 0, s62
	v_readlane_b32 s61, v124, 35
	v_cvt_f32_u32_e32 v6, s62
	v_readlane_b32 s63, v124, 37
	v_readlane_b32 s64, v124, 38
	v_readlane_b32 s65, v124, 39
	v_rcp_iflag_f32_e32 v6, v6
	v_readlane_b32 s66, v124, 40
	v_readlane_b32 s67, v124, 41
	v_readlane_b32 s68, v124, 42
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s69, v124, 43
	v_readlane_b32 s70, v124, 44
	v_readlane_b32 s71, v124, 45
	v_mul_lo_u32 v7, s2, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v2, v6
	v_mul_lo_u32 v6, v6, s62
	v_sub_u32_e32 v6, v2, v6
	v_subrev_u32_e32 v7, s62, v6
	v_cmp_le_u32_e32 vcc, s62, v6
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s62, v6
	v_cmp_le_u32_e32 vcc, s62, v6
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
	v_cndmask_b32_e32 v40, v6, v7, vcc
	v_mov_b64_e32 v[6:7], v[40:41]
.LBB2_464:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[4:5], v[6:7], 3, v[4:5]
	flat_store_dwordx2 v[4:5], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0
.LBB2_465:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_atomic_cmpswap_x2 v[4:5], v41, v[0:3], s[48:49] sc0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB2_465
; %bb.466:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
                                        ; implicit-def: $vgpr0_vgpr1
.LBB2_467:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB2_334
; %bb.468:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s0, v124, 54
	v_readlane_b32 s1, v124, 55
	v_readlane_b32 s8, v124, 34
	v_readlane_b32 s11, v124, 37
	v_mov_b64_e32 v[2:3], s[0:1]
	v_readlane_b32 s0, v124, 56
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[2:3], v[56:57] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s1, v124, 57
	v_or_b32_e32 v7, s11, v3
	v_mov_b32_e32 v6, v41
	v_readlane_b32 s9, v124, 35
	v_cmp_ne_u64_e32 vcc, 0, v[6:7]
	v_readlane_b32 s10, v124, 36
	global_load_dwordx2 v[4:5], v41, s[0:1]
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB2_470
; %bb.469:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s60, v124, 34
	v_readlane_b32 s62, v124, 36
	v_readlane_b32 s63, v124, 37
	s_sub_u32 s0, 0, s62
	v_cvt_f32_u32_e32 v6, s62
	v_cvt_f32_u32_e32 v7, s63
	s_subb_u32 s1, 0, s63
	v_readlane_b32 s61, v124, 35
	v_readlane_b32 s64, v124, 38
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	v_readlane_b32 s65, v124, 39
	v_readlane_b32 s66, v124, 40
	v_readlane_b32 s67, v124, 41
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s68, v124, 42
	v_readlane_b32 s69, v124, 43
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s10, s0, s2
	s_mul_hi_u32 s12, s0, s3
	s_mul_i32 s11, s1, s3
	s_add_i32 s10, s12, s10
	s_mul_i32 s13, s0, s3
	s_add_i32 s10, s10, s11
	s_mul_i32 s12, s3, s10
	s_mul_hi_u32 s14, s3, s13
	s_mul_hi_u32 s11, s3, s10
	s_add_u32 s12, s14, s12
	s_addc_u32 s11, 0, s11
	s_mul_hi_u32 s15, s2, s13
	s_mul_i32 s13, s2, s13
	s_add_u32 s12, s12, s13
	s_mul_hi_u32 s14, s2, s10
	s_addc_u32 s11, s11, s15
	s_addc_u32 s12, s14, 0
	s_mul_i32 s10, s2, s10
	s_add_u32 s10, s11, s10
	s_addc_u32 s11, 0, s12
	s_add_u32 s3, s3, s10
	s_addc_u32 s2, s2, s11
	s_mul_i32 s10, s0, s2
	s_mul_hi_u32 s11, s0, s3
	s_add_i32 s10, s11, s10
	s_mul_i32 s1, s1, s3
	s_add_i32 s10, s10, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s11, s2, s0
	s_mul_i32 s12, s2, s0
	s_mul_i32 s14, s3, s10
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s13, s3, s10
	s_add_u32 s0, s0, s14
	s_addc_u32 s13, 0, s13
	s_add_u32 s0, s0, s12
	s_mul_hi_u32 s1, s2, s10
	s_addc_u32 s0, s13, s11
	s_addc_u32 s1, s1, 0
	s_mul_i32 s10, s2, s10
	s_add_u32 s0, s0, s10
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v2, s2, 0
	v_mul_hi_u32 v40, v2, s3
	v_lshl_add_u64 v[6:7], v[40:41], 0, v[6:7]
	v_mad_u64_u32 v[14:15], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v14
	v_mad_u64_u32 v[12:13], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v15, vcc
	v_mov_b32_e32 v7, s51
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[12:13]
	v_mul_lo_u32 v9, s63, v6
	v_mul_lo_u32 v12, s62, v7
	v_mad_u64_u32 v[6:7], s[0:1], s62, v6, 0
	v_add3_u32 v7, v7, v12, v9
	v_sub_u32_e32 v9, v3, v7
	v_mov_b32_e32 v12, s63
	v_sub_co_u32_e32 v6, vcc, v2, v6
	v_readlane_b32 s70, v124, 44
	s_nop 0
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, vcc
	v_subrev_co_u32_e64 v13, s[0:1], s62, v6
	v_subb_co_u32_e32 v7, vcc, v3, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v14, s[2:3], 0, v9, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s63, v14
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s62, v13
	v_subrev_co_u32_e64 v12, s[0:1], s62, v13
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s63, v14
	v_subbrev_co_u32_e64 v9, s[0:1], 0, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, v15, v16, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v15
	v_cmp_le_u32_e32 vcc, s63, v7
	v_readlane_b32 s71, v124, 45
	v_cndmask_b32_e64 v9, v14, v9, s[0:1]
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s62, v6
	v_readlane_b32 s72, v124, 46
	v_readlane_b32 s73, v124, 47
	v_cndmask_b32_e64 v15, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s63, v7
	v_readlane_b32 s74, v124, 48
	v_readlane_b32 s75, v124, 49
	v_cndmask_b32_e32 v14, v14, v15, vcc
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e64 v9, v13, v12, s[0:1]
	v_cndmask_b32_e32 v6, v6, v9, vcc
.LBB2_470:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB2_472
; %bb.471:                              ;   in Loop: Header=BB2_336 Depth=1
	v_readlane_b32 s8, v124, 34
	v_readlane_b32 s10, v124, 36
	s_sub_i32 s2, 0, s10
	v_readlane_b32 s9, v124, 35
	v_cvt_f32_u32_e32 v6, s10
	v_readlane_b32 s11, v124, 37
	v_readlane_b32 s12, v124, 38
	v_readlane_b32 s13, v124, 39
	v_rcp_iflag_f32_e32 v6, v6
	v_readlane_b32 s14, v124, 40
	v_readlane_b32 s15, v124, 41
	v_readlane_b32 s16, v124, 42
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s17, v124, 43
	v_readlane_b32 s18, v124, 44
	v_readlane_b32 s19, v124, 45
	v_mul_lo_u32 v7, s2, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v2, v6
	v_mul_lo_u32 v6, v6, s10
	v_sub_u32_e32 v6, v2, v6
	v_subrev_u32_e32 v7, s10, v6
	v_cmp_le_u32_e32 vcc, s10, v6
	v_readlane_b32 s20, v124, 46
	v_readlane_b32 s21, v124, 47
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s10, v6
	v_cmp_le_u32_e32 vcc, s10, v6
	v_readlane_b32 s22, v124, 48
	v_readlane_b32 s23, v124, 49
	v_cndmask_b32_e32 v40, v6, v7, vcc
	v_mov_b64_e32 v[6:7], v[40:41]
.LBB2_472:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[4:5], v[6:7], 3, v[4:5]
	;;#ASMSTART
	global_store_dwordx2 v[4:5], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0
	buffer_wbl2 sc1
	s_waitcnt lgkmcnt(0)
.LBB2_473:                              ;   Parent Loop BB2_336 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b64_e32 v[4:5], s[36:37]
	;;#ASMSTART
	flat_atomic_cmpswap_x2 v[4:5], v[4:5], v[0:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB2_473
; %bb.474:                              ;   in Loop: Header=BB2_336 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_branch .LBB2_334
.LBB2_475:                              ;   in Loop: Header=BB2_336 Depth=1
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_449
.LBB2_476:                              ;   in Loop: Header=BB2_336 Depth=1
	v_add_u32_e32 v2, 0xffffff72, v7
	v_cmp_lt_u32_e32 vcc, 6, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[18:19], vcc, exec
	s_or_b64 s[16:17], s[16:17], s[18:19]
	s_or_b64 exec, exec, s[14:15]
	v_mov_b64_e32 v[2:3], 1
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_450
	s_branch .LBB2_451
.LBB2_477:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
		.amdhsa_group_segment_fixed_size 2072
		.amdhsa_private_segment_fixed_size 1552
		.amdhsa_kernarg_size 688
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
		.amdhsa_next_free_vgpr max(totalnumvgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
		.amdhsa_next_free_sgpr max(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)-6
		.amdhsa_accum_offset (((((alignto(max(1, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63)+1)*4
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
	.size	_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE, .Lfunc_end2-_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
                                        ; -- End function
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr, max(125, amdgpu.max_num_vgpr)
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, max(0, amdgpu.max_num_agpr)
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr, max(100, amdgpu.max_num_sgpr)
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_named_barrier, max(0, amdgpu.max_num_named_barrier)
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.private_seg_size, 1552
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, 1
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.has_dyn_sized_stack, 1
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.has_recursion, 1
	.set _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.has_indirect_call, 1
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 35080
; TotalNumSgprs: _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6
; NumVgprs: _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr
; NumAgprs: _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr
; TotalNumVgprs: totalnumvgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr)
; ScratchSize: 1552
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 2072 bytes/workgroup (compile time only)
; SGPRBlocks: (alignto(max(max(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), 1), 8)/8)-1
; VGPRBlocks: (alignto(max(max(totalnumvgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0), 1), 8)/8)-1
; NumSGPRsForWavesPerEU: max(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)
; NumVGPRsForWavesPerEU: max(totalnumvgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
; AccumOffset: ((alignto(max(1, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1+1)*4
; Occupancy: occupancy(8, 8, 512, 8, 8, max(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), max(totalnumvgprs(_Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0))
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: (((alignto(max(1, _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z13worker_kernelN6mirage7runtime13RuntimeConfigE ; -- Begin function _Z13worker_kernelN6mirage7runtime13RuntimeConfigE
	.globl	_Z13worker_kernelN6mirage7runtime13RuntimeConfigE
	.p2align	8
	.type	_Z13worker_kernelN6mirage7runtime13RuntimeConfigE,@function
_Z13worker_kernelN6mirage7runtime13RuntimeConfigE: ; @_Z13worker_kernelN6mirage7runtime13RuntimeConfigE
; %bb.0:
                                        ; implicit-def: $vgpr79 : SGPR spill to VGPR lane
	s_mov_b64 s[38:39], s[4:5]
	v_writelane_b32 v79, s10, 0
	v_writelane_b32 v79, s9, 1
	v_writelane_b32 v79, s6, 2
	s_mov_b32 s34, s8
	s_ashr_i32 s35, s8, 31
	v_writelane_b32 v79, s7, 3
	v_writelane_b32 v79, s2, 4
	s_load_dwordx4 s[4:7], s[38:39], 0x60
	s_load_dwordx2 s[64:65], s[38:39], 0x70
	v_writelane_b32 v79, s3, 5
	v_writelane_b32 v79, s0, 6
	v_mov_b32_e32 v42, v0
	v_mov_b32_e32 v0, 0
	v_writelane_b32 v79, s1, 7
	s_lshl_b64 s[0:1], s[34:35], 3
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s6, s0
	v_writelane_b32 v79, s4, 8
	s_addc_u32 s1, s7, s1
	v_mov_b32_e32 v1, s8
	v_writelane_b32 v79, s5, 9
	v_writelane_b32 v79, s6, 10
	v_writelane_b32 v79, s7, 11
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx4 s[56:59], s[38:39], 0x0
	s_load_dword s4, s[38:39], 0x10
	s_load_dwordx2 s[84:85], s[38:39], 0x158
	s_load_dwordx4 s[96:99], s[38:39], 0x148
	s_waitcnt lgkmcnt(0)
	v_mov_b64_e32 v[2:3], s[2:3]
	s_mov_b32 s33, 0
	s_cmp_lt_i32 s4, 2
	s_mov_b32 s32, 0
	ds_write_b64 v0, v[2:3] offset:1952
	ds_write_b32 v0, v1 offset:1968
	s_cbranch_scc1 .LBB3_2
; %bb.1:
	s_ashr_i32 s3, s56, 31
	s_mov_b32 s2, s56
	s_add_i32 s4, s56, s34
	s_lshl_b64 s[2:3], s[2:3], 3
	s_add_u32 s0, s0, s2
	s_addc_u32 s1, s1, s3
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_mov_b32_e32 v1, s4
	s_mov_b32 s33, 1
	ds_write_b32 v0, v1 offset:1972
	s_waitcnt lgkmcnt(0)
	v_mov_b64_e32 v[2:3], s[0:1]
	ds_write_b64 v0, v[2:3] offset:1960
.LBB3_2:
	s_load_dwordx4 s[40:43], s[38:39], 0x130
	v_and_b32_e32 v44, 0x3ff, v42
	v_cmp_eq_u32_e64 s[52:53], 0, v44
	s_and_saveexec_b64 s[36:37], s[52:53]
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v79, s40, 12
	s_mov_b64 s[4:5], s[56:57]
	s_mov_b32 s6, s58
	v_writelane_b32 v79, s41, 13
	v_writelane_b32 v79, s42, 14
	v_writelane_b32 v79, s43, 15
	v_writelane_b32 v79, s4, 16
	s_nop 1
	v_writelane_b32 v79, s5, 17
	v_writelane_b32 v79, s6, 18
	v_writelane_b32 v79, s7, 19
	s_cbranch_execz .LBB3_12
; %bb.3:
	;;#ASMSTART
	s_getreg_b32 s48, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	v_mov_b32_e32 v40, 0
	v_mov_b32_e32 v0, s48
	s_cmp_eq_u64 s[96:97], 0
	ds_write_b32 v40, v0 offset:1976
	s_cbranch_scc1 .LBB3_9
; %bb.4:
	s_lshl_b64 s[0:1], s[34:35], 2
	s_add_u32 s0, s96, s0
	s_addc_u32 s1, s97, s1
	v_mov_b32_e32 v0, s48
	s_cmp_gt_i32 s34, 7
	global_store_dword v40, v0, s[0:1]
	s_cbranch_scc1 .LBB3_6
; %bb.5:
	s_add_u32 s54, s38, 0x1b0
	s_addc_u32 s55, s39, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_readlane_b32 s70, v79, 6
	v_readlane_b32 s68, v79, 4
	v_readlane_b32 s66, v79, 2
	v_readlane_b32 s71, v79, 7
	v_readlane_b32 s69, v79, 5
	v_readlane_b32 s67, v79, 3
	v_readlane_b32 s49, v79, 1
	v_readlane_b32 s35, v79, 0
	s_mov_b64 s[4:5], s[70:71]
	s_mov_b64 s[6:7], s[68:69]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.1@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.1@rel32@hi+12
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s15, 43, 0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[4:5], s[70:71]
	s_mov_b64 s[6:7], s[68:69]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s15
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[50:51], s[0:1], 0x0
	s_mov_b64 s[4:5], s[70:71]
	s_mov_b64 s[6:7], s[68:69]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s34
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[50:51]
	s_mov_b64 s[4:5], s[70:71]
	s_mov_b64 s[6:7], s[68:69]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s34
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[50:51]
	s_mov_b64 s[4:5], s[70:71]
	s_mov_b64 s[6:7], s[68:69]
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b64 s[10:11], s[66:67]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s49
	s_mov_b32 s14, s35
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s48
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 1
	s_swappc_b64 s[30:31], s[50:51]
	s_load_dwordx4 s[56:59], s[38:39], 0x0
	s_load_dwordx4 s[24:27], s[38:39], 0x130
	s_waitcnt lgkmcnt(0)
	s_mov_b64 s[42:43], s[26:27]
	s_mov_b64 s[40:41], s[24:25]
.LBB3_6:
	s_mov_b64 s[2:3], exec
	v_mbcnt_lo_u32_b32 v0, s2, 0
	v_mbcnt_hi_u32_b32 v0, s3, v0
	v_cmp_eq_u32_e32 vcc, 0, v0
	buffer_wbl2 sc1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB3_8
; %bb.7:
	s_bcnt1_i32_b64 s2, s[2:3]
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, s2
	global_atomic_add v0, v1, s[98:99]
.LBB3_8:
	s_or_b64 exec, exec, s[0:1]
.LBB3_9:
	s_cmp_eq_u64 s[42:43], 0
	v_mov_b32_e32 v0, 0
	s_cbranch_scc1 .LBB3_11
; %bb.10:
	ds_read_b32 v0, v40 offset:1976
	v_mov_b32_e32 v2, s34
	v_mov_b32_e32 v3, -1
	s_waitcnt lgkmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_lshl_add_u64 v[0:1], s[42:43], 0, v[0:1]
	global_atomic_cmpswap v0, v[0:1], v[2:3], off sc0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e32 vcc, -1, v0
	v_cmp_eq_u32_e64 s[0:1], s34, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v0, 0, 1, s[0:1]
.LBB3_11:
	ds_write_b32 v40, v0 offset:1980
.LBB3_12:
	s_or_b64 exec, exec, s[36:37]
	s_load_dword s2, s[38:39], 0x18
	s_load_dwordx16 s[4:19], s[38:39], 0x20
	v_mov_b32_e32 v41, 0
	s_barrier
	ds_read_b32 v0, v41 offset:1976
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v79, s4, 20
	v_readfirstlane_b32 s86, v0
	s_nop 0
	v_writelane_b32 v79, s5, 21
	v_writelane_b32 v79, s6, 22
	v_writelane_b32 v79, s7, 23
	v_writelane_b32 v79, s8, 24
	v_writelane_b32 v79, s9, 25
	v_writelane_b32 v79, s10, 26
	v_writelane_b32 v79, s11, 27
	v_writelane_b32 v79, s12, 28
	v_writelane_b32 v79, s13, 29
	v_writelane_b32 v79, s14, 30
	v_writelane_b32 v79, s15, 31
	v_writelane_b32 v79, s16, 32
	v_writelane_b32 v79, s17, 33
	v_writelane_b32 v79, s18, 34
	v_writelane_b32 v79, s19, 35
	s_and_saveexec_b64 s[0:1], s[52:53]
	s_cbranch_execz .LBB3_14
; %bb.13:
	s_mov_b32 s4, 0
	v_mov_b32_e32 v0, 0x7c4
	v_mov_b32_e32 v1, -1
	s_mov_b32 s5, s4
	ds_write2_b32 v0, v41, v1 offset1:1
	s_mov_b32 s6, s4
	s_mov_b32 s7, s4
	v_mov_b64_e32 v[0:1], s[4:5]
	v_mov_b64_e32 v[2:3], s[6:7]
	ds_write_b128 v41, v[0:3] offset:1936
	ds_write_b128 v41, v[0:3] offset:1920
.LBB3_14:
	s_or_b64 exec, exec, s[0:1]
	s_add_u32 s44, s38, 0x1b0
	s_addc_u32 s45, s39, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_load_dwordx16 s[8:23], s[38:39], 0x20
	s_cmp_gt_i32 s56, 0
	s_cselect_b64 s[54:55], -1, 0
	s_cmp_lg_u64 s[84:85], 0
	s_cselect_b64 s[60:61], -1, 0
	s_ashr_i32 s87, s86, 31
	s_mul_i32 s43, s86, s2
	s_add_i32 s2, s58, s57
	s_lshl_b64 s[4:5], s[86:87], 3
	s_waitcnt lgkmcnt(0)
	s_add_u32 s6, s16, s4
	s_addc_u32 s7, s17, s5
	v_or_b32_e32 v0, s34, v44
	v_writelane_b32 v79, s6, 36
	v_cmp_eq_u32_e64 s[46:47], 0, v0
	v_cvt_f32_u32_e32 v0, s8
	v_writelane_b32 v79, s7, 37
	s_add_u32 s6, s64, s4
	v_cvt_f32_u32_e32 v1, s9
	s_addc_u32 s7, s65, s5
	s_add_u32 s58, s14, s4
	s_addc_u32 s59, s15, s5
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[2:3], s[2:3], 3
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_writelane_b32 v79, s6, 38
	s_add_u32 s4, s16, s2
	v_rcp_f32_e32 v0, v0
	v_writelane_b32 v79, s7, 39
	s_addc_u32 s5, s17, s3
	v_writelane_b32 v79, s4, 40
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_writelane_b32 v79, s5, 41
	s_add_u32 s4, s64, s2
	s_addc_u32 s5, s65, s3
	s_add_u32 s62, s14, s2
	s_addc_u32 s63, s15, s3
	v_trunc_f32_e32 v1, v1
	s_cmp_lg_u64 s[0:1], 0
	v_fmac_f32_e32 v0, 0xcf800000, v1
	s_cselect_b32 s0, 54, 0
	s_cmp_lg_u32 s56, 1
	v_cvt_u32_f32_e32 v72, v0
	v_cvt_u32_f32_e32 v73, v1
	s_cselect_b64 s[64:65], -1, 0
	s_and_b32 s80, s56, 0x7ffffffe
	s_movk_i32 s42, 0x700
	v_writelane_b32 v79, s4, 42
	s_cmp_lg_u32 s56, s80
	s_mov_b32 s72, -2
	v_mov_b32_e32 v45, v41
	v_lshl_add_u32 v60, v44, 3, s42
	s_mov_b32 s83, 0
	s_mov_b64 s[68:69], 0
	v_writelane_b32 v79, s5, 43
	s_mov_b32 s81, s86
	s_mov_b32 s87, s34
	v_lshlrev_b32_e32 v61, 4, v44
	v_mov_b64_e32 v[58:59], 0
	s_movk_i32 s35, 0x70
	s_brev_b32 s73, -2
	v_mov_b32_e32 v62, 1
	s_movk_i32 s74, 0x88
	s_movk_i32 s75, 0xad
	s_movk_i32 s76, 0xb6
	s_movk_i32 s77, 0xb8
	s_movk_i32 s78, 0xaf
	v_mov_b32_e32 v63, 0x7c4
	v_mov_b64_e32 v[46:47], 1
	v_mov_b32_e32 v43, 0
	v_mov_b32_e32 v56, v41
	v_mov_b32_e32 v57, 0
	s_cselect_b64 s[88:89], -1, 0
	s_barrier
	v_writelane_b32 v79, s0, 44
	s_branch .LBB3_17
.LBB3_15:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[6:7]
	v_add_u32_e32 v57, 1, v57
	s_xor_b64 s[0:1], exec, -1
.LBB3_16:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_and_b64 s[0:1], exec, s[0:1]
	s_or_b64 s[68:69], s[0:1], s[68:69]
	v_mov_b32_e32 v43, v8
	v_mov_b64_e32 v[58:59], v[10:11]
	s_andn2_b64 exec, exec, s[68:69]
	s_cbranch_execz .LBB3_158
.LBB3_17:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_22 Depth 2
                                        ;     Child Loop BB3_36 Depth 2
                                        ;     Child Loop BB3_43 Depth 2
                                        ;     Child Loop BB3_72 Depth 2
                                        ;     Child Loop BB3_82 Depth 2
                                        ;     Child Loop BB3_87 Depth 2
                                        ;     Child Loop BB3_91 Depth 2
                                        ;     Child Loop BB3_146 Depth 2
                                        ;     Child Loop BB3_154 Depth 2
	v_cmp_eq_u32_e32 vcc, v57, v56
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB3_38
; %bb.18:                               ;   in Loop: Header=BB3_17 Depth=1
	v_mov_b32_e32 v4, 0
	s_and_saveexec_b64 s[0:1], s[52:53]
	s_cbranch_execz .LBB3_26
; %bb.19:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read2_b64 v[0:3], v41 offset0:240 offset1:242
	v_mov_b32_e32 v4, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, v[2:3], v[0:1]
	s_cbranch_vccnz .LBB3_25
; %bb.20:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v5, 0x780
	v_mov_b32_e32 v4, 0
                                        ; implicit-def: $sgpr6_sgpr7
	s_branch .LBB3_22
.LBB3_21:                               ;   in Loop: Header=BB3_22 Depth=2
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 s[8:9], exec, s[6:7]
	s_or_b64 s[2:3], s[8:9], s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB3_24
.LBB3_22:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_lshlrev_b32_e32 v0, 2, v4
	ds_read_b32 v0, v0 offset:1968
	v_readlane_b32 s8, v79, 20
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s9, v79, 21
	s_waitcnt lgkmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[12:13]
	flat_load_dwordx2 v[0:1], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
	s_or_b64 s[6:7], s[6:7], exec
	v_readlane_b32 s10, v79, 22
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[2:3], v[0:1]
	ds_write_b64 v5, v[0:1]
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr5
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB3_21
; %bb.23:                               ;   in Loop: Header=BB3_22 Depth=2
	v_add_u32_e32 v0, 1, v4
	v_cmp_ne_u32_e32 vcc, s33, v4
	s_sleep 1
	s_andn2_b64 s[6:7], s[6:7], exec
	v_cndmask_b32_e32 v4, 0, v0, vcc
	v_lshlrev_b32_e32 v5, 3, v4
	ds_read2_b64 v[0:3], v5 offset0:240 offset1:242
	v_add_u32_e32 v5, 0x780, v5
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, v[2:3], v[0:1]
	s_and_b64 s[10:11], vcc, exec
	s_or_b64 s[6:7], s[6:7], s[10:11]
	s_branch .LBB3_21
.LBB3_24:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[2:3]
.LBB3_25:                               ;   in Loop: Header=BB3_17 Depth=1
	;;#ASMSTART
	;;#ASMEND
.LBB3_26:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_lshlrev_b32_e32 v0, 3, v4
	s_barrier
	ds_read_b32 v1, v0 offset:1920
	ds_read_b64 v[2:3], v0 offset:1936
	v_add_u32_e32 v6, 0x780, v0
	s_waitcnt lgkmcnt(0)
	v_sub_u32_e32 v0, v1, v2
	v_min_i32_e32 v56, 16, v0
	v_cmp_lt_u32_e32 vcc, v44, v56
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB3_32
; %bb.27:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b64 v[0:1], v6 offset:32
	v_readlane_b32 s8, v79, 20
	v_lshl_add_u64 v[2:3], v[2:3], 0, v[44:45]
	v_readlane_b32 s9, v79, 21
	v_mov_b32_e32 v4, v41
	v_readlane_b32 s10, v79, 22
	v_or_b32_e32 v5, s9, v3
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB3_29
; %bb.28:                               ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s16, v79, 20
	v_readlane_b32 s17, v79, 21
	s_sub_u32 s0, 0, s16
	v_readfirstlane_b32 s2, v72
	v_readfirstlane_b32 s11, v73
	s_subb_u32 s1, 0, s17
	s_mul_hi_u32 s10, s0, s2
	s_mul_i32 s12, s0, s11
	s_mul_i32 s3, s1, s2
	s_add_i32 s10, s10, s12
	s_add_i32 s10, s10, s3
	s_mul_i32 s13, s0, s2
	s_mul_i32 s12, s2, s10
	s_mul_hi_u32 s14, s2, s13
	s_mul_hi_u32 s3, s2, s10
	s_add_u32 s12, s14, s12
	s_addc_u32 s3, 0, s3
	s_mul_hi_u32 s15, s11, s13
	s_mul_i32 s13, s11, s13
	s_add_u32 s12, s12, s13
	s_mul_hi_u32 s14, s11, s10
	s_addc_u32 s3, s3, s15
	s_addc_u32 s12, s14, 0
	s_mul_i32 s10, s11, s10
	s_add_u32 s3, s3, s10
	s_addc_u32 s10, 0, s12
	s_add_u32 s2, s2, s3
	s_addc_u32 s3, s11, s10
	s_mul_i32 s10, s0, s3
	s_mul_hi_u32 s11, s0, s2
	s_add_i32 s10, s11, s10
	s_mul_i32 s1, s1, s2
	s_add_i32 s10, s10, s1
	s_mul_i32 s0, s0, s2
	s_mul_hi_u32 s11, s3, s0
	s_mul_i32 s12, s3, s0
	s_mul_i32 s14, s2, s10
	s_mul_hi_u32 s0, s2, s0
	s_mul_hi_u32 s13, s2, s10
	s_add_u32 s0, s0, s14
	s_addc_u32 s13, 0, s13
	s_add_u32 s0, s0, s12
	s_mul_hi_u32 s1, s3, s10
	s_addc_u32 s0, s13, s11
	s_addc_u32 s1, s1, 0
	s_mul_i32 s10, s3, s10
	s_add_u32 s0, s0, s10
	s_addc_u32 s1, 0, s1
	s_add_u32 s2, s2, s0
	s_addc_u32 s3, s3, s1
	v_mad_u64_u32 v[4:5], s[0:1], v2, s3, 0
	v_mul_hi_u32 v40, v2, s2
	v_lshl_add_u64 v[4:5], v[40:41], 0, v[4:5]
	v_mad_u64_u32 v[10:11], s[0:1], v3, s2, 0
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_mad_u64_u32 v[8:9], s[0:1], v3, s3, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v11, vcc
	v_mov_b32_e32 v5, s83
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[8:9]
	v_mul_lo_u32 v7, s17, v4
	v_mul_lo_u32 v8, s16, v5
	v_mad_u64_u32 v[4:5], s[0:1], s16, v4, 0
	v_add3_u32 v5, v5, v8, v7
	v_sub_u32_e32 v7, v3, v5
	v_mov_b32_e32 v8, s17
	v_sub_co_u32_e32 v2, vcc, v2, v4
	v_readlane_b32 s18, v79, 22
	s_nop 0
	v_subb_co_u32_e64 v4, s[0:1], v7, v8, vcc
	v_subrev_co_u32_e64 v7, s[0:1], s16, v2
	v_subb_co_u32_e32 v3, vcc, v3, v5, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v9, s[2:3], 0, v4, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s17, v9
	v_subb_co_u32_e64 v4, s[0:1], v4, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s16, v7
	v_subrev_co_u32_e64 v8, s[0:1], s16, v7
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s17, v9
	v_subbrev_co_u32_e64 v4, s[0:1], 0, v4, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, v10, v11, s[2:3]
	v_cmp_le_u32_e32 vcc, s17, v3
	v_cmp_ne_u32_e64 s[0:1], 0, v10
	v_readlane_b32 s19, v79, 23
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s16, v2
	v_cndmask_b32_e64 v4, v9, v4, s[0:1]
	v_readlane_b32 s20, v79, 24
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s17, v3
	v_readlane_b32 s21, v79, 25
	v_readlane_b32 s22, v79, 26
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_readlane_b32 s23, v79, 27
	v_readlane_b32 s24, v79, 28
	v_cndmask_b32_e32 v5, v3, v4, vcc
	v_cndmask_b32_e64 v3, v7, v8, s[0:1]
	v_readlane_b32 s25, v79, 29
	v_readlane_b32 s26, v79, 30
	v_readlane_b32 s27, v79, 31
	v_readlane_b32 s28, v79, 32
	v_readlane_b32 s29, v79, 33
	v_readlane_b32 s30, v79, 34
	v_readlane_b32 s31, v79, 35
	v_cndmask_b32_e32 v4, v2, v3, vcc
                                        ; implicit-def: $vgpr2_vgpr3
.LBB3_29:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB3_31
; %bb.30:                               ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s8, v79, 20
	s_sub_i32 s2, 0, s8
	v_readlane_b32 s9, v79, 21
	v_cvt_f32_u32_e32 v3, s8
	v_readlane_b32 s10, v79, 22
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_rcp_iflag_f32_e32 v3, v3
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_mul_f32_e32 v3, 0x4f7ffffe, v3
	v_cvt_u32_f32_e32 v3, v3
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_mul_lo_u32 v4, s2, v3
	v_mul_hi_u32 v4, v3, v4
	v_add_u32_e32 v3, v3, v4
	v_mul_hi_u32 v3, v2, v3
	v_mul_lo_u32 v3, v3, s8
	v_sub_u32_e32 v2, v2, v3
	v_subrev_u32_e32 v3, s8, v2
	v_cmp_le_u32_e32 vcc, s8, v2
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s20, v79, 32
	v_cndmask_b32_e32 v2, v2, v3, vcc
	v_subrev_u32_e32 v3, s8, v2
	v_cmp_le_u32_e32 vcc, s8, v2
	v_readlane_b32 s21, v79, 33
	v_readlane_b32 s22, v79, 34
	v_cndmask_b32_e32 v40, v2, v3, vcc
	v_mov_b64_e32 v[4:5], v[40:41]
	v_readlane_b32 s23, v79, 35
.LBB3_31:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[0:1], v[4:5], 3, v[0:1]
	flat_load_dwordx2 v[0:1], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	ds_write_b64 v60, v[0:1]
.LBB3_32:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_barrier
	s_and_saveexec_b64 s[0:1], s[52:53]
	s_cbranch_execz .LBB3_34
; %bb.33:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b64 v[0:1], v6 offset:16
	v_ashrrev_i32_e32 v57, 31, v56
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[56:57]
	ds_write_b64 v6, v[0:1] offset:16
.LBB3_34:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_mul_lo_u32 v0, v56, 7
	v_cmp_lt_i32_e32 vcc, v44, v0
	s_and_saveexec_b64 s[0:1], vcc
	v_readlane_b32 s8, v79, 20
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
	v_readlane_b32 s9, v79, 21
	v_readlane_b32 s10, v79, 22
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	s_cbranch_execz .LBB3_37
; %bb.35:                               ;   in Loop: Header=BB3_17 Depth=1
	s_load_dword s6, s[44:45], 0xc
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v1, v61
	v_mov_b32_e32 v2, v61
	v_mov_b32_e32 v3, v44
	s_waitcnt lgkmcnt(0)
	s_and_b32 s6, s6, 0xffff
	s_lshl_b32 s7, s6, 4
.LBB3_36:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_mov_b32 s8, 0x24924925
	v_mul_hi_u32 v6, v3, s8
	v_sub_u32_e32 v7, v3, v6
	v_lshrrev_b32_e32 v7, 1, v7
	v_add_u32_e32 v6, v7, v6
	v_lshrrev_b32_e32 v6, 2, v6
	v_mul_lo_u32 v7, v6, s35
	v_lshlrev_b32_e32 v6, 3, v6
	ds_read_b32 v6, v6 offset:1792
	v_mov_b64_e32 v[4:5], s[22:23]
	v_sub_u32_e32 v40, v2, v7
	v_add_u32_e32 v3, s6, v3
	v_cmp_ge_i32_e32 vcc, v3, v0
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[4:5], s[8:9], v6, s35, v[4:5]
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[40:41]
	global_load_dwordx4 v[6:9], v[4:5], off
	global_load_dwordx4 v[10:13], v[4:5], off offset:16
	s_or_b64 s[2:3], vcc, s[2:3]
	v_add_u32_e32 v2, s7, v2
	s_waitcnt vmcnt(1)
	ds_write_b128 v1, v[6:9]
	s_waitcnt vmcnt(0)
	ds_write_b128 v1, v[10:13] offset:16
	v_add_u32_e32 v1, s7, v1
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz .LBB3_36
.LBB3_37:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_mov_b32_e32 v57, 0
	s_barrier
.LBB3_38:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_mul_lo_u32 v74, v57, s35
	s_and_saveexec_b64 s[0:1], s[52:53]
	s_cbranch_execz .LBB3_45
; %bb.39:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b64 v[0:1], v74 offset:16
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, s[72:73], v[0:1]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_45
; %bb.40:                               ;   in Loop: Header=BB3_17 Depth=1
	v_and_b32_e32 v3, 0x1e000000, v1
	v_mov_b32_e32 v2, v41
	v_cmp_eq_u64_e32 vcc, 0, v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_45
; %bb.41:                               ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s4, v79, 20
	v_mov_b32_e32 v1, v41
	v_readlane_b32 s16, v79, 32
	v_readlane_b32 s17, v79, 33
	v_readlane_b32 s14, v79, 30
	v_readlane_b32 s15, v79, 31
	v_lshl_add_u64 v[2:3], v[0:1], 2, s[16:17]
	global_load_dword v2, v[2:3], off
	v_lshlrev_b32_e32 v3, 3, v57
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[14:15]
	ds_read_b32 v7, v3 offset:1796
	global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1
	v_readlane_b32 s5, v79, 21
	v_readlane_b32 s6, v79, 22
	v_readlane_b32 s7, v79, 23
	v_readlane_b32 s8, v79, 24
	v_readlane_b32 s9, v79, 25
	v_readlane_b32 s10, v79, 26
	v_readlane_b32 s11, v79, 27
	v_readlane_b32 s12, v79, 28
	v_readlane_b32 s13, v79, 29
	v_readlane_b32 s18, v79, 34
	v_readlane_b32 s19, v79, 35
	s_waitcnt vmcnt(1)
	v_ashrrev_i32_e32 v8, 31, v2
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[2:3], s[2:3], v7, v2, 0
	v_mov_b32_e32 v6, v3
	v_mad_u64_u32 v[6:7], s[2:3], v7, v8, v[6:7]
	v_mov_b32_e32 v3, v6
	s_waitcnt vmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[4:5], v[2:3]
	buffer_inv sc1
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_45
; %bb.42:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[2:3], 0
.LBB3_43:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1
	s_sleep 1
	s_waitcnt vmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[2:3], vcc, s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz .LBB3_43
; %bb.44:                               ;   in Loop: Header=BB3_17 Depth=1
	buffer_inv sc1
.LBB3_45:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	s_and_saveexec_b64 s[0:1], s[52:53]
; %bb.46:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_write_b32 v41, v62 offset:1984
; %bb.47:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	ds_read_b32 v75, v74
	s_mov_b64 s[0:1], 0
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr10_vgpr11
                                        ; implicit-def: $vgpr8
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_i32_e32 vcc, 9, v75
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[66:67], exec, s[4:5]
	s_cbranch_execz .LBB3_74
; %bb.48:                               ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_eq_u32_e32 vcc, 10, v75
	s_mov_b64 s[4:5], -1
                                        ; implicit-def: $vgpr10_vgpr11
                                        ; implicit-def: $vgpr8
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB3_55
; %bb.49:                               ;   in Loop: Header=BB3_17 Depth=1
	v_mov_b64_e32 v[10:11], v[58:59]
	v_mov_b32_e32 v8, v43
	s_and_saveexec_b64 s[48:49], s[46:47]
	s_cbranch_execz .LBB3_54
; %bb.50:                               ;   in Loop: Header=BB3_17 Depth=1
	s_memrealtime s[0:1]
	v_cmp_ne_u64_e32 vcc, 0, v[58:59]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s1, s1, 10
	s_mul_hi_u32 s2, s0, 10
	s_mul_i32 s50, s0, 10
	s_add_i32 s51, s2, s1
	s_and_saveexec_b64 s[70:71], vcc
	s_cbranch_execz .LBB3_53
; %bb.51:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b32 s0, 0xc28f5c29
	v_mul_lo_u32 v0, v43, s0
	v_alignbit_b32 v0, v0, v0, 1
	s_mov_b32 s0, 0x51eb852
	v_cmp_gt_i32_e32 vcc, 10, v43
	v_cmp_gt_u32_e64 s[0:1], s0, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_and_b64 exec, exec, s[0:1]
	s_cbranch_execz .LBB3_53
; %bb.52:                               ;   in Loop: Header=BB3_17 Depth=1
	s_load_dwordx2 s[0:1], s[38:39], 0xb8
	v_writelane_b32 v79, s64, 45
	v_mov_b32_e32 v0, s51
	v_sub_co_u32_e32 v2, vcc, s50, v58
	s_waitcnt lgkmcnt(0)
	global_load_dword v40, v41, s[0:1] offset:4
	v_writelane_b32 v79, s65, 46
	s_add_u32 s64, s38, 0x1b0
	s_addc_u32 s65, s39, 0
	v_writelane_b32 v79, s38, 47
	v_subb_co_u32_e32 v0, vcc, v0, v59, vcc
	s_nop 0
	v_writelane_b32 v79, s39, 48
	v_cvt_f64_u32_e32 v[0:1], v0
	v_readlane_b32 s38, v79, 6
	v_readlane_b32 s39, v79, 7
	v_writelane_b32 v79, s96, 49
	v_ldexp_f64 v[0:1], v[0:1], 32
	v_cvt_f64_u32_e32 v[2:3], v2
	s_mov_b32 s2, 0
	v_writelane_b32 v79, s97, 50
	v_add_f64 v[0:1], v[0:1], v[2:3]
	s_mov_b32 s3, 0x412e8480
	v_writelane_b32 v79, s98, 51
	v_div_scale_f64 v[2:3], s[0:1], s[2:3], s[2:3], v[0:1]
	v_writelane_b32 v79, s99, 52
	v_rcp_f64_e32 v[4:5], v[2:3]
	v_readlane_b32 s96, v79, 4
	v_readlane_b32 s97, v79, 5
	v_writelane_b32 v79, s84, 53
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v79, s85, 54
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_readlane_b32 s84, v79, 2
	v_readlane_b32 s85, v79, 3
	v_readlane_b32 s98, v79, 1
	v_readlane_b32 s82, v79, 0
	v_writelane_b32 v79, s44, 55
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v79, s45, 56
	v_writelane_b32 v79, s46, 57
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_div_scale_f64 v[6:7], vcc, v[0:1], s[2:3], v[0:1]
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_writelane_b32 v79, s47, 58
	v_mul_f64 v[8:9], v[6:7], v[4:5]
	v_writelane_b32 v79, s43, 59
                                        ; implicit-def: $vgpr78 : SGPR spill to VGPR lane
	v_fma_f64 v[2:3], -v[2:3], v[8:9], v[6:7]
	v_writelane_b32 v79, s60, 60
	v_writelane_b32 v78, s62, 0
	v_div_fmas_f64 v[2:3], v[2:3], v[4:5], v[8:9]
	v_writelane_b32 v79, s61, 61
	v_writelane_b32 v78, s63, 1
	v_div_fixup_f64 v[76:77], v[2:3], s[2:3], v[0:1]
	s_mov_b64 s[4:5], s[38:39]
	s_mov_b64 s[6:7], s[96:97]
	s_mov_b64 s[8:9], s[64:65]
	s_mov_b64 s[10:11], s[84:85]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s98
	s_mov_b32 s14, s82
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v0, v41
	v_mov_b32_e32 v1, v41
	v_writelane_b32 v79, s58, 62
	v_writelane_b32 v78, s88, 2
	s_nop 0
	v_writelane_b32 v79, s59, 63
	v_writelane_b32 v78, s89, 3
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	v_mov_b32_e32 v2, s0
	v_readlane_b32 s0, v79, 44
	s_mov_b64 s[4:5], s[38:39]
	s_mov_b64 s[6:7], s[96:97]
	s_mov_b64 s[8:9], s[64:65]
	s_mov_b64 s[10:11], s[84:85]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s98
	s_mov_b32 s14, s82
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	v_writelane_b32 v78, s54, 4
	s_mov_b64 s[4:5], s[38:39]
	s_mov_b64 s[6:7], s[96:97]
	v_writelane_b32 v78, s55, 5
	s_load_dwordx2 s[54:55], s[0:1], 0x0
	s_mov_b64 s[8:9], s[64:65]
	s_mov_b64 s[10:11], s[84:85]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s98
	s_mov_b32 s14, s82
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v43
	v_mov_b32_e32 v4, v41
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, v41
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[54:55]
	s_mov_b64 s[4:5], s[38:39]
	s_mov_b64 s[6:7], s[96:97]
	s_mov_b64 s[8:9], s[64:65]
	s_mov_b64 s[10:11], s[84:85]
	s_mov_b32 s12, s34
	s_mov_b32 s13, s98
	s_mov_b32 s14, s82
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v76
	v_mov_b32_e32 v4, v77
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, v41
	s_swappc_b64 s[30:31], s[54:55]
	s_mov_b64 s[4:5], s[38:39]
	v_readlane_b32 s38, v79, 47
	s_mov_b64 s[6:7], s[96:97]
	s_mov_b64 s[8:9], s[64:65]
	v_readlane_b32 s64, v79, 45
	s_mov_b64 s[10:11], s[84:85]
	v_readlane_b32 s84, v79, 53
	s_mov_b32 s12, s34
	s_mov_b32 s13, s98
	v_readlane_b32 s96, v79, 49
	s_mov_b32 s14, s82
	v_mov_b32_e32 v31, v42
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v40
	v_mov_b32_e32 v4, v41
	v_mov_b32_e32 v5, v41
	v_mov_b32_e32 v6, v41
	v_mov_b32_e32 v7, v41
	v_mov_b32_e32 v8, v41
	v_mov_b32_e32 v9, v41
	v_mov_b32_e32 v10, v41
	v_mov_b32_e32 v11, v41
	v_mov_b32_e32 v12, v41
	v_mov_b32_e32 v13, v41
	v_mov_b32_e32 v14, v41
	v_mov_b32_e32 v15, v41
	v_mov_b32_e32 v16, v41
	v_mov_b32_e32 v17, 1
	v_readlane_b32 s39, v79, 48
	v_readlane_b32 s65, v79, 46
	v_readlane_b32 s85, v79, 54
	v_readlane_b32 s97, v79, 50
	v_readlane_b32 s98, v79, 51
	v_readlane_b32 s99, v79, 52
	s_swappc_b64 s[30:31], s[54:55]
	v_readlane_b32 s56, v79, 16
	v_readlane_b32 s58, v79, 18
	v_readlane_b32 s59, v79, 19
	v_readlane_b32 s24, v79, 12
	v_readlane_b32 s88, v78, 2
	s_mov_b32 s72, -2
	v_readlane_b32 s62, v78, 0
	v_readlane_b32 s60, v79, 60
	v_readlane_b32 s58, v79, 62
	v_readlane_b32 s54, v78, 4
	v_readlane_b32 s46, v79, 57
	v_readlane_b32 s44, v79, 55
	v_readlane_b32 s25, v79, 13
	v_readlane_b32 s89, v78, 3
	s_movk_i32 s78, 0xaf
	s_movk_i32 s77, 0xb8
	s_movk_i32 s76, 0xb6
	s_movk_i32 s75, 0xad
	s_movk_i32 s74, 0x88
	s_brev_b32 s73, -2
	v_readlane_b32 s63, v78, 1
	v_readlane_b32 s61, v79, 61
	v_readlane_b32 s59, v79, 63
	v_readlane_b32 s43, v79, 59
	v_readlane_b32 s55, v78, 5
	v_readlane_b32 s47, v79, 58
	v_readlane_b32 s45, v79, 56
	s_movk_i32 s42, 0x700
	s_mov_b64 s[40:41], s[24:25]
	v_readlane_b32 s57, v79, 17
	v_readlane_b32 s26, v79, 14
	v_readlane_b32 s27, v79, 15
.LBB3_53:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[70:71]
	v_add_u32_e32 v8, 1, v43
	v_mov_b64_e32 v[10:11], s[50:51]
.LBB3_54:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[48:49]
	s_mov_b64 s[0:1], exec
	s_xor_b64 s[4:5], exec, -1
.LBB3_55:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[36:37]
	s_and_b64 s[2:3], s[0:1], exec
	s_and_b64 s[0:1], s[4:5], exec
	s_andn2_saveexec_b64 s[4:5], s[66:67]
	s_cbranch_execnz .LBB3_75
.LBB3_56:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB3_76
.LBB3_57:                               ;   in Loop: Header=BB3_17 Depth=1
	v_and_b32_e32 v0, -4, v75
	v_cmp_ne_u32_e32 vcc, s74, v0
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB3_67
; %bb.58:                               ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s75, v75
	s_mov_b64 s[12:13], 0
	s_mov_b64 s[10:11], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB3_77
; %bb.59:                               ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v75
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.60:                               ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v75
	s_mov_b64 s[10:11], exec
	s_and_b64 s[12:13], vcc, exec
; %bb.61:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[14:15], s[0:1]
; %bb.62:                               ;   in Loop: Header=BB3_17 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v75
	v_cmp_lt_i32_e64 s[0:1], s78, v75
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[16:17], vcc, exec
	s_andn2_b64 s[12:13], s[12:13], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[10:11], s[10:11], s[16:17]
	s_or_b64 s[12:13], s[12:13], s[0:1]
; %bb.63:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[10:11], s[10:11], exec
	s_and_b64 s[12:13], s[12:13], exec
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execnz .LBB3_78
.LBB3_64:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execz .LBB3_66
.LBB3_65:                               ;   in Loop: Header=BB3_17 Depth=1
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	global_load_dword v0, v41, s[8:9]
	s_andn2_b64 s[10:11], s[10:11], exec
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v0, v0, v75
	global_store_dword v41, v0, s[8:9]
.LBB3_66:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_orn2_b64 s[0:1], s[10:11], exec
.LBB3_67:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[0:1]
	s_cbranch_execz .LBB3_96
; %bb.68:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b32 v0, v41 offset:1992
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s0, v0
	s_cmp_eq_u32 s0, -1
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 s[0:1], s[52:53], s[0:1]
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB3_84
; %bb.69:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_b64 vcc, exec, s[54:55]
	s_cbranch_vccnz .LBB3_79
; %bb.70:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_b64 vcc, exec, s[64:65]
	s_cbranch_vccnz .LBB3_80
; %bb.71:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b32 s12, 1
	s_mov_b32 s13, 0
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s14, s80
	s_mov_b32 s15, 0
	s_mov_b32 s16, 0
	s_mov_b32 s17, 0
	s_mov_b32 s18, 0
.LBB3_72:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[0:1], v41, s[10:11]
	s_cmp_lt_i32 s12, s87
	s_cselect_b64 s[20:21], -1, 0
	s_cmp_lt_i32 s13, s34
	s_cselect_b64 s[22:23], -1, 0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s[0:1], s81, v1
	s_cmp_lg_u64 s[0:1], 0
	v_cmp_eq_u32_e32 vcc, s86, v0
	s_addc_u32 s16, s16, 0
	s_cmp_lg_u64 vcc, 0
	s_addc_u32 s15, s15, 0
	s_and_b64 s[22:23], s[22:23], vcc
	s_and_b64 s[0:1], s[20:21], s[0:1]
	s_addc_u32 s18, s18, 0
	s_cmp_lg_u64 s[22:23], 0
	s_addc_u32 s17, s17, 0
	s_add_i32 s13, s13, 2
	s_add_i32 s12, s12, 2
	s_add_i32 s14, s14, -2
	s_add_u32 s10, s10, 8
	s_addc_u32 s11, s11, 0
	s_cmp_lg_u32 s14, 0
	s_cbranch_scc1 .LBB3_72
; %bb.73:                               ;   in Loop: Header=BB3_17 Depth=1
	s_add_i32 s10, s17, s18
	s_add_i32 s11, s15, s16
	s_mov_b32 s82, s80
	s_mov_b64 s[0:1], s[88:89]
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB3_81
	s_branch .LBB3_83
.LBB3_74:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[66:67]
	s_cbranch_execz .LBB3_56
.LBB3_75:                               ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_ne_u32_e32 vcc, 0, v75
	s_andn2_b64 s[0:1], s[0:1], exec
	s_and_b64 s[6:7], vcc, exec
	s_or_b64 s[0:1], s[0:1], s[6:7]
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execnz .LBB3_57
.LBB3_76:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB3_16
	s_branch .LBB3_97
.LBB3_77:                               ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB3_64
.LBB3_78:                               ;   in Loop: Header=BB3_17 Depth=1
	v_add_u32_e32 v0, 0xffffff72, v75
	v_cmp_gt_u32_e32 vcc, 7, v0
	v_cmp_lt_u32_e64 s[0:1], 6, v0
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[14:15], vcc, exec
	s_andn2_b64 s[12:13], s[12:13], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[10:11], s[10:11], s[14:15]
	s_or_b64 s[12:13], s[12:13], s[0:1]
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execnz .LBB3_65
	s_branch .LBB3_66
.LBB3_79:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b32 s11, 0
	s_mov_b32 s10, 0
	s_branch .LBB3_83
.LBB3_80:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b32 s82, 0
	s_mov_b32 s11, 0
	s_mov_b32 s10, 0
	s_cbranch_execz .LBB3_83
.LBB3_81:                               ;   in Loop: Header=BB3_17 Depth=1
	s_lshl_b64 s[0:1], s[82:83], 2
	s_add_u32 s0, s96, s0
	s_addc_u32 s1, s97, s1
.LBB3_82:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v0, v41, s[0:1]
	s_cmp_lt_i32 s82, s34
	s_cselect_b64 s[12:13], -1, 0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e32 vcc, s86, v0
	s_cmp_lg_u64 vcc, 0
	s_addc_u32 s11, s11, 0
	s_and_b64 s[12:13], s[12:13], vcc
	s_addc_u32 s10, s10, 0
	s_add_i32 s82, s82, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_eq_u32 s56, s82
	s_cbranch_scc0 .LBB3_82
.LBB3_83:                               ;   in Loop: Header=BB3_17 Depth=1
	v_mov_b32_e32 v0, s11
	v_mov_b32_e32 v1, s10
	ds_write2_b32 v63, v0, v1 offset1:1
.LBB3_84:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_barrier
	ds_read_u16 v8, v74 offset:106
	ds_read_b32 v2, v41 offset:1992
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_i32_e32 vcc, v2, v8
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB3_94
; %bb.85:                               ;   in Loop: Header=BB3_17 Depth=1
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	global_load_dword v0, v41, s[8:9]
	ds_read_b32 v9, v41 offset:1988
	ds_read_u16 v1, v74 offset:104
	ds_read_b32 v3, v74
	s_mov_b64 s[10:11], -1
	s_waitcnt lgkmcnt(2)
	v_cvt_f32_u32_e32 v5, v9
	v_sub_u32_e32 v7, 0, v9
	s_waitcnt lgkmcnt(0)
	v_add_u32_e32 v4, v3, v1
	v_add_u32_e32 v3, v2, v9
	v_rcp_iflag_f32_e32 v1, v5
	v_max_i32_e32 v5, v3, v8
	v_cmp_lt_i32_e32 vcc, v3, v8
	v_mul_f32_e32 v1, 0x4f7ffffe, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cndmask_b32_e64 v6, 1, 2, vcc
	v_subb_co_u32_e32 v5, vcc, v5, v3, vcc
	v_mul_lo_u32 v7, v7, v1
	v_mul_hi_u32 v7, v1, v7
	v_add_u32_e32 v1, v1, v7
	v_mul_hi_u32 v1, v5, v1
	v_mul_lo_u32 v7, v1, v9
	v_sub_u32_e32 v5, v5, v7
	v_add_u32_e32 v7, 1, v1
	v_cmp_ge_u32_e32 vcc, v5, v9
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v7, vcc
	v_sub_u32_e32 v7, v5, v9
	v_cndmask_b32_e32 v5, v5, v7, vcc
	v_add_u32_e32 v7, 1, v1
	v_cmp_ge_u32_e32 vcc, v5, v9
	v_mov_b32_e32 v5, 0
	s_nop 0
	v_cndmask_b32_e32 v1, v1, v7, vcc
	v_add_u32_e32 v10, v6, v1
	v_cmp_lt_u32_e32 vcc, 1, v10
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB3_89
; %bb.86:                               ;   in Loop: Header=BB3_17 Depth=1
	v_and_b32_e32 v11, -2, v10
	v_mov_b32_e32 v5, v4
	v_lshlrev_b32_e32 v12, 1, v9
	v_mov_b32_e32 v1, 0
	s_mov_b64 s[10:11], 0
	v_mov_b32_e32 v14, v11
	v_mov_b64_e32 v[6:7], v[2:3]
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v13, 0
.LBB3_87:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_u32_e32 v14, -2, v14
	v_cmp_eq_u32_e32 vcc, 0, v14
	v_add3_u32 v1, v7, v5, v1
	s_waitcnt vmcnt(0)
	v_add3_u32 v0, v6, v4, v0
	v_add_u32_e32 v13, 1, v13
	v_add_u32_e32 v3, 1, v3
	v_add_u32_e32 v7, v7, v12
	s_or_b64 s[10:11], vcc, s[10:11]
	v_add_u32_e32 v6, v6, v12
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB3_87
; %bb.88:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_mul_lo_u32 v5, v11, v9
	v_cmp_ne_u32_e32 vcc, v10, v11
	v_add_u32_e32 v2, v2, v5
	v_add_u32_e32 v5, v3, v13
	v_add_u32_e32 v0, v0, v1
	s_orn2_b64 s[10:11], vcc, exec
.LBB3_89:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[8:9], s[10:11]
	s_cbranch_execz .LBB3_93
; %bb.90:                               ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[10:11], 0
.LBB3_91:                               ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_waitcnt vmcnt(0)
	v_add3_u32 v0, v4, v2, v0
	v_add_u32_e32 v2, v2, v9
	v_cmp_ge_i32_e32 vcc, v2, v8
	s_or_b64 s[10:11], vcc, s[10:11]
	v_add_u32_e32 v5, 1, v5
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB3_91
; %bb.92:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[10:11]
.LBB3_93:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_getpc_b64 s[8:9]
	s_add_u32 s8, s8, g_sink@rel32@lo+4
	s_addc_u32 s9, s9, g_sink@rel32@hi+12
	s_waitcnt vmcnt(0)
	global_store_dword v41, v0, s[8:9]
.LBB3_94:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_and_b64 exec, exec, s[52:53]
; %bb.95:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_write_b32 v41, v5 offset:1984
.LBB3_96:                               ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_or_b64 s[2:3], s[2:3], exec
	v_mov_b64_e32 v[10:11], v[58:59]
	v_mov_b32_e32 v8, v43
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB3_16
.LBB3_97:                               ;   in Loop: Header=BB3_17 Depth=1
	s_barrier
	s_and_saveexec_b64 s[6:7], s[52:53]
	s_cbranch_execz .LBB3_15
; %bb.98:                               ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b64 v[0:1], v74 offset:8
	v_mov_b32_e32 v2, v41
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v3, 0x1e000000, v1
	v_cmp_eq_u64_e32 vcc, 0, v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_15
; %bb.99:                               ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s8, v79, 20
	v_mov_b32_e32 v1, v41
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	s_andn2_b64 vcc, exec, s[60:61]
	v_mov_b32_e32 v40, 0
	v_lshl_add_u64 v[2:3], v[0:1], 2, s[20:21]
	global_load_dword v6, v[2:3], off
	v_add_u32_e32 v2, s43, v0
	v_readlane_b32 s9, v79, 21
	v_readlane_b32 s10, v79, 22
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
	s_cbranch_vccnz .LBB3_101
; %bb.100:                              ;   in Loop: Header=BB3_17 Depth=1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshl_add_u64 v[4:5], v[2:3], 2, s[84:85]
	global_load_dword v40, v[4:5], off
.LBB3_101:                              ;   in Loop: Header=BB3_17 Depth=1
	s_waitcnt vmcnt(0)
	v_cmp_gt_i32_e32 vcc, 1, v40
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB3_104
; %bb.102:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s8, v79, 20
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	buffer_wbl2 sc1
	s_mov_b64 s[2:3], exec
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[18:19]
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[2:3], v[46:47] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s9, v79, 21
	v_readlane_b32 s10, v79, 22
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
	v_lshl_add_u64 v[4:5], v[2:3], 0, 1
	v_lshl_add_u32 v3, v57, 3, s42
                                        ; implicit-def: $vgpr74
                                        ; implicit-def: $vgpr2
	s_andn2_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execnz .LBB3_105
.LBB3_103:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB3_15
	s_branch .LBB3_136
.LBB3_104:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB3_103
.LBB3_105:                              ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b32 v9, v41 offset:1984
	ds_read_b32 v7, v74
	s_mov_b64 s[14:15], -1
	s_waitcnt lgkmcnt(1)
	v_cmp_eq_u32_e32 vcc, 0, v9
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v3, -4, v7
	v_cmp_eq_u32_e64 s[10:11], s74, v3
	v_cmp_ne_u32_e64 s[0:1], s74, v3
	s_cbranch_vccnz .LBB3_107
; %bb.106:                              ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[12:13], s[2:3]
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB3_135
	s_branch .LBB3_118
.LBB3_107:                              ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[10:11], 0
	s_mov_b64 s[14:15], 0
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB3_117
; %bb.108:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s75, v7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB3_114
; %bb.109:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v7
	s_and_saveexec_b64 s[16:17], vcc
	s_xor_b64 s[16:17], exec, s[16:17]
; %bb.110:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v7
	s_and_b64 s[14:15], vcc, exec
; %bb.111:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[16:17], s[16:17]
; %bb.112:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s78, v7
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[18:19], vcc, exec
	s_or_b64 s[14:15], s[14:15], s[18:19]
; %bb.113:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], s[14:15], exec
.LBB3_114:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[0:1]
; %bb.115:                              ;   in Loop: Header=BB3_17 Depth=1
	v_add_u32_e32 v3, 0xffffff72, v7
	v_cmp_lt_u32_e32 vcc, 6, v3
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[16:17], vcc, exec
	s_or_b64 s[14:15], s[14:15], s[16:17]
; %bb.116:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_and_b64 s[14:15], s[14:15], exec
.LBB3_117:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_mov_b64 s[12:13], s[2:3]
                                        ; implicit-def: $vgpr4_vgpr5
                                        ; implicit-def: $vgpr3
	s_and_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB3_135
.LBB3_118:                              ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[12:13], -1
	s_xor_b64 s[14:15], s[10:11], -1
	s_and_saveexec_b64 s[10:11], s[14:15]
	s_cbranch_execz .LBB3_122
; %bb.119:                              ;   in Loop: Header=BB3_17 Depth=1
	v_add_u32_e32 v3, 0xffffff72, v7
	v_cmp_gt_u32_e32 vcc, 43, v3
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[12:13], vcc
; %bb.120:                              ;   in Loop: Header=BB3_17 Depth=1
	s_movk_i32 s16, 0x7f
	s_movk_i32 s17, 0x603
	v_lshrrev_b64 v[4:5], v3, s[16:17]
	v_and_b32_e32 v3, 1, v4
	v_cmp_eq_u32_e32 vcc, 1, v3
	s_and_b64 s[16:17], vcc, exec
; %bb.121:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_orn2_b64 s[12:13], s[16:17], exec
.LBB3_122:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_ashrrev_i32_e32 v3, 31, v2
	v_ashrrev_i32_e32 v4, 31, v9
	v_lshl_add_u64 v[2:3], v[2:3], 3, s[40:41]
	v_cndmask_b32_e64 v5, 0, v4, s[12:13]
	v_cndmask_b32_e64 v4, 1, v9, s[12:13]
	global_atomic_add_x2 v[2:3], v[2:3], v[4:5], off sc0
	v_lshlrev_b32_e32 v9, 3, v57
	ds_read_b32 v12, v9 offset:1796
	s_mov_b64 s[12:13], s[2:3]
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[12:13], s[10:11], v12, v40, 0
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[2:3], 0, v[4:5]
	v_cmp_eq_u64_e32 vcc, v[2:3], v[12:13]
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB3_134
; %bb.123:                              ;   in Loop: Header=BB3_17 Depth=1
	v_mov_b64_e32 v[2:3], 1
	buffer_wbl2 sc1
	s_and_saveexec_b64 s[12:13], s[14:15]
	s_cbranch_execz .LBB3_133
; %bb.124:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s75, v7
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execz .LBB3_156
; %bb.125:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s76, v7
	s_and_saveexec_b64 s[18:19], vcc
	s_xor_b64 s[18:19], exec, s[18:19]
; %bb.126:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s77, v7
	s_and_b64 s[16:17], vcc, exec
                                        ; implicit-def: $vgpr7
; %bb.127:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[18:19], s[18:19]
; %bb.128:                              ;   in Loop: Header=BB3_17 Depth=1
	v_cmp_lt_i32_e32 vcc, s78, v7
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[20:21], vcc, exec
	s_or_b64 s[16:17], s[16:17], s[20:21]
; %bb.129:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[18:19]
	s_and_b64 s[16:17], s[16:17], exec
                                        ; implicit-def: $vgpr7
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB3_157
.LBB3_130:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[14:15]
	v_mov_b64_e32 v[2:3], 1
	s_and_saveexec_b64 s[14:15], s[16:17]
.LBB3_131:                              ;   in Loop: Header=BB3_17 Depth=1
	v_mov_b64_e32 v[2:3], v[40:41]
.LBB3_132:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[14:15]
.LBB3_133:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[12:13]
	v_readlane_b32 s12, v79, 20
	v_readlane_b32 s22, v79, 30
	v_readlane_b32 s23, v79, 31
	v_readlane_b32 s13, v79, 21
	s_or_b64 s[12:13], s[2:3], exec
	v_lshl_add_u64 v[4:5], v[0:1], 3, s[22:23]
	;;#ASMSTART
	flat_atomic_add_x2 v[4:5], v[4:5], v[2:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s14, v79, 22
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[2:3]
	v_readlane_b32 s15, v79, 23
	v_readlane_b32 s16, v79, 24
	v_readlane_b32 s17, v79, 25
	v_readlane_b32 s18, v79, 26
	v_readlane_b32 s19, v79, 27
	v_readlane_b32 s20, v79, 28
	v_readlane_b32 s21, v79, 29
	v_readlane_b32 s24, v79, 32
	v_readlane_b32 s25, v79, 33
	v_readlane_b32 s26, v79, 34
	v_readlane_b32 s27, v79, 35
.LBB3_134:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_andn2_b64 s[10:11], s[2:3], exec
	s_and_b64 s[12:13], s[12:13], exec
	v_add_u32_e32 v3, 0x700, v9
	s_or_b64 s[12:13], s[10:11], s[12:13]
.LBB3_135:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_andn2_b64 s[0:1], s[2:3], exec
	s_and_b64 s[2:3], s[12:13], exec
	s_or_b64 s[2:3], s[0:1], s[2:3]
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB3_15
.LBB3_136:                              ;   in Loop: Header=BB3_17 Depth=1
	ds_read_b32 v7, v3 offset:4
	v_ashrrev_i32_e32 v9, 31, v6
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[2:3], s[0:1], v7, v6, 0
	v_mov_b32_e32 v6, v3
	v_mad_u64_u32 v[6:7], s[0:1], v7, v9, v[6:7]
	v_mov_b32_e32 v3, v6
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_15
; %bb.137:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s0, v79, 8
	v_readlane_b32 s1, v79, 9
	v_readlane_b32 s2, v79, 10
	v_readlane_b32 s3, v79, 11
	v_mad_u64_u32 v[2:3], s[0:1], v0, 24, s[0:1]
	global_load_dword v2, v[2:3], off
	s_movk_i32 s0, 0x384
	s_waitcnt vmcnt(0)
	v_cmp_ne_u32_e32 vcc, s0, v2
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB3_15
; %bb.138:                              ;   in Loop: Header=BB3_17 Depth=1
	v_and_b32_e32 v2, -2, v2
	s_movk_i32 s0, 0x386
	v_cmp_ne_u32_e32 vcc, s0, v2
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB3_148
; %bb.139:                              ;   in Loop: Header=BB3_17 Depth=1
	s_mov_b64 s[2:3], exec
	v_mbcnt_lo_u32_b32 v2, s2, 0
	v_mbcnt_hi_u32_b32 v40, s3, v2
	v_cmp_eq_u32_e32 vcc, 0, v40
                                        ; implicit-def: $vgpr2_vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB3_141
; %bb.140:                              ;   in Loop: Header=BB3_17 Depth=1
	s_bcnt1_i32_b64 s2, s[2:3]
	v_mov_b32_e32 v2, s2
	v_readlane_b32 s2, v79, 36
	v_mov_b32_e32 v3, v41
	v_readlane_b32 s3, v79, 37
	s_nop 4
	global_atomic_add_x2 v[2:3], v41, v[2:3], s[2:3] sc0
.LBB3_141:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v79, 38
	v_readlane_b32 s1, v79, 39
	v_readlane_b32 s12, v79, 20
	v_readlane_b32 s15, v79, 23
	v_mov_b32_e32 v6, v41
	v_readlane_b32 s13, v79, 21
	v_readlane_b32 s14, v79, 22
	global_load_dwordx2 v[4:5], v41, s[0:1]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s1, v3
	v_readfirstlane_b32 s0, v2
	v_readlane_b32 s16, v79, 24
	v_readlane_b32 s17, v79, 25
	v_lshl_add_u64 v[2:3], s[0:1], 0, v[40:41]
	v_or_b32_e32 v7, s15, v3
	v_cmp_ne_u64_e32 vcc, 0, v[6:7]
	v_readlane_b32 s18, v79, 26
	v_readlane_b32 s19, v79, 27
	v_readlane_b32 s20, v79, 28
	v_readlane_b32 s21, v79, 29
	v_readlane_b32 s22, v79, 30
	v_readlane_b32 s23, v79, 31
	v_readlane_b32 s24, v79, 32
	v_readlane_b32 s25, v79, 33
	v_readlane_b32 s26, v79, 34
	v_readlane_b32 s27, v79, 35
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[10:11], exec, s[0:1]
	s_cbranch_execz .LBB3_143
; %bb.142:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s16, v79, 20
	v_readlane_b32 s18, v79, 22
	v_readlane_b32 s19, v79, 23
	s_sub_u32 s0, 0, s18
	v_cvt_f32_u32_e32 v6, s18
	v_cvt_f32_u32_e32 v7, s19
	s_subb_u32 s1, 0, s19
	v_readlane_b32 s17, v79, 21
	v_readlane_b32 s20, v79, 24
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	v_readlane_b32 s21, v79, 25
	v_readlane_b32 s22, v79, 26
	v_readlane_b32 s23, v79, 27
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s24, v79, 28
	v_readlane_b32 s25, v79, 29
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s12, s0, s2
	s_mul_hi_u32 s14, s0, s3
	s_mul_i32 s13, s1, s3
	s_add_i32 s12, s14, s12
	s_mul_i32 s15, s0, s3
	s_add_i32 s12, s12, s13
	s_mul_i32 s14, s3, s12
	s_mul_hi_u32 s16, s3, s15
	s_mul_hi_u32 s13, s3, s12
	s_add_u32 s14, s16, s14
	s_addc_u32 s13, 0, s13
	s_mul_hi_u32 s17, s2, s15
	s_mul_i32 s15, s2, s15
	s_add_u32 s14, s14, s15
	s_mul_hi_u32 s16, s2, s12
	s_addc_u32 s13, s13, s17
	s_addc_u32 s14, s16, 0
	s_mul_i32 s12, s2, s12
	s_add_u32 s12, s13, s12
	s_addc_u32 s13, 0, s14
	s_add_u32 s3, s3, s12
	s_addc_u32 s2, s2, s13
	s_mul_i32 s12, s0, s2
	s_mul_hi_u32 s13, s0, s3
	s_add_i32 s12, s13, s12
	s_mul_i32 s1, s1, s3
	s_add_i32 s12, s12, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s13, s2, s0
	s_mul_i32 s14, s2, s0
	s_mul_i32 s16, s3, s12
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s15, s3, s12
	s_add_u32 s0, s0, s16
	s_addc_u32 s15, 0, s15
	s_add_u32 s0, s0, s14
	s_mul_hi_u32 s1, s2, s12
	s_addc_u32 s0, s15, s13
	s_addc_u32 s1, s1, 0
	s_mul_i32 s12, s2, s12
	s_add_u32 s0, s0, s12
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v2, s2, 0
	v_mul_hi_u32 v40, v2, s3
	v_lshl_add_u64 v[6:7], v[40:41], 0, v[6:7]
	v_mad_u64_u32 v[14:15], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v14
	v_mad_u64_u32 v[12:13], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v15, vcc
	v_mov_b32_e32 v7, s83
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[12:13]
	v_mul_lo_u32 v9, s19, v6
	v_mul_lo_u32 v12, s18, v7
	v_mad_u64_u32 v[6:7], s[0:1], s18, v6, 0
	v_add3_u32 v7, v7, v12, v9
	v_sub_u32_e32 v9, v3, v7
	v_mov_b32_e32 v12, s19
	v_sub_co_u32_e32 v6, vcc, v2, v6
	v_readlane_b32 s26, v79, 30
	s_nop 0
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, vcc
	v_subrev_co_u32_e64 v13, s[0:1], s18, v6
	v_subb_co_u32_e32 v7, vcc, v3, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v14, s[2:3], 0, v9, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s19, v14
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s18, v13
	v_subrev_co_u32_e64 v12, s[0:1], s18, v13
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s19, v14
	v_subbrev_co_u32_e64 v9, s[0:1], 0, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, v15, v16, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v15
	v_cmp_le_u32_e32 vcc, s19, v7
	v_readlane_b32 s27, v79, 31
	v_cndmask_b32_e64 v9, v14, v9, s[0:1]
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s18, v6
	v_readlane_b32 s28, v79, 32
	v_readlane_b32 s29, v79, 33
	v_cndmask_b32_e64 v15, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s19, v7
	v_readlane_b32 s30, v79, 34
	v_readlane_b32 s31, v79, 35
	v_cndmask_b32_e32 v14, v14, v15, vcc
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e64 v9, v13, v12, s[0:1]
	v_cndmask_b32_e32 v6, v6, v9, vcc
.LBB3_143:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[10:11]
	s_cbranch_execz .LBB3_145
; %bb.144:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s16, v79, 20
	v_readlane_b32 s18, v79, 22
	s_sub_i32 s2, 0, s18
	v_readlane_b32 s17, v79, 21
	v_cvt_f32_u32_e32 v6, s18
	v_readlane_b32 s19, v79, 23
	v_readlane_b32 s20, v79, 24
	v_readlane_b32 s21, v79, 25
	v_rcp_iflag_f32_e32 v6, v6
	v_readlane_b32 s22, v79, 26
	v_readlane_b32 s23, v79, 27
	v_readlane_b32 s24, v79, 28
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s25, v79, 29
	v_readlane_b32 s26, v79, 30
	v_readlane_b32 s27, v79, 31
	v_mul_lo_u32 v7, s2, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v2, v6
	v_mul_lo_u32 v6, v6, s18
	v_sub_u32_e32 v6, v2, v6
	v_subrev_u32_e32 v7, s18, v6
	v_cmp_le_u32_e32 vcc, s18, v6
	v_readlane_b32 s28, v79, 32
	v_readlane_b32 s29, v79, 33
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s18, v6
	v_cmp_le_u32_e32 vcc, s18, v6
	v_readlane_b32 s30, v79, 34
	v_readlane_b32 s31, v79, 35
	v_cndmask_b32_e32 v40, v6, v7, vcc
	v_mov_b64_e32 v[6:7], v[40:41]
.LBB3_145:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[4:5], v[6:7], 3, v[4:5]
	flat_store_dwordx2 v[4:5], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0
.LBB3_146:                              ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_atomic_cmpswap_x2 v[4:5], v41, v[0:3], s[58:59] sc0
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB3_146
; %bb.147:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
                                        ; implicit-def: $vgpr0_vgpr1
.LBB3_148:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB3_15
; %bb.149:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s0, v79, 40
	v_readlane_b32 s1, v79, 41
	v_readlane_b32 s8, v79, 20
	v_readlane_b32 s11, v79, 23
	v_mov_b64_e32 v[2:3], s[0:1]
	v_readlane_b32 s0, v79, 42
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[2:3], v[46:47] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	v_readlane_b32 s1, v79, 43
	v_or_b32_e32 v7, s11, v3
	v_mov_b32_e32 v6, v41
	v_readlane_b32 s9, v79, 21
	v_cmp_ne_u64_e32 vcc, 0, v[6:7]
	v_readlane_b32 s10, v79, 22
	global_load_dwordx2 v[4:5], v41, s[0:1]
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB3_151
; %bb.150:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s16, v79, 20
	v_readlane_b32 s18, v79, 22
	v_readlane_b32 s19, v79, 23
	s_sub_u32 s0, 0, s18
	v_cvt_f32_u32_e32 v6, s18
	v_cvt_f32_u32_e32 v7, s19
	s_subb_u32 s1, 0, s19
	v_readlane_b32 s17, v79, 21
	v_readlane_b32 s20, v79, 24
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	v_readlane_b32 s21, v79, 25
	v_readlane_b32 s22, v79, 26
	v_readlane_b32 s23, v79, 27
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s24, v79, 28
	v_readlane_b32 s25, v79, 29
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s10, s0, s2
	s_mul_hi_u32 s12, s0, s3
	s_mul_i32 s11, s1, s3
	s_add_i32 s10, s12, s10
	s_mul_i32 s13, s0, s3
	s_add_i32 s10, s10, s11
	s_mul_i32 s12, s3, s10
	s_mul_hi_u32 s14, s3, s13
	s_mul_hi_u32 s11, s3, s10
	s_add_u32 s12, s14, s12
	s_addc_u32 s11, 0, s11
	s_mul_hi_u32 s15, s2, s13
	s_mul_i32 s13, s2, s13
	s_add_u32 s12, s12, s13
	s_mul_hi_u32 s14, s2, s10
	s_addc_u32 s11, s11, s15
	s_addc_u32 s12, s14, 0
	s_mul_i32 s10, s2, s10
	s_add_u32 s10, s11, s10
	s_addc_u32 s11, 0, s12
	s_add_u32 s3, s3, s10
	s_addc_u32 s2, s2, s11
	s_mul_i32 s10, s0, s2
	s_mul_hi_u32 s11, s0, s3
	s_add_i32 s10, s11, s10
	s_mul_i32 s1, s1, s3
	s_add_i32 s10, s10, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s11, s2, s0
	s_mul_i32 s12, s2, s0
	s_mul_i32 s14, s3, s10
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s13, s3, s10
	s_add_u32 s0, s0, s14
	s_addc_u32 s13, 0, s13
	s_add_u32 s0, s0, s12
	s_mul_hi_u32 s1, s2, s10
	s_addc_u32 s0, s13, s11
	s_addc_u32 s1, s1, 0
	s_mul_i32 s10, s2, s10
	s_add_u32 s0, s0, s10
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v2, s2, 0
	v_mul_hi_u32 v40, v2, s3
	v_lshl_add_u64 v[6:7], v[40:41], 0, v[6:7]
	v_mad_u64_u32 v[14:15], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v14
	v_mad_u64_u32 v[12:13], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v15, vcc
	v_mov_b32_e32 v7, s83
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[12:13]
	v_mul_lo_u32 v9, s19, v6
	v_mul_lo_u32 v12, s18, v7
	v_mad_u64_u32 v[6:7], s[0:1], s18, v6, 0
	v_add3_u32 v7, v7, v12, v9
	v_sub_u32_e32 v9, v3, v7
	v_mov_b32_e32 v12, s19
	v_sub_co_u32_e32 v6, vcc, v2, v6
	v_readlane_b32 s26, v79, 30
	s_nop 0
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, vcc
	v_subrev_co_u32_e64 v13, s[0:1], s18, v6
	v_subb_co_u32_e32 v7, vcc, v3, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v14, s[2:3], 0, v9, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s19, v14
	v_subb_co_u32_e64 v9, s[0:1], v9, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s18, v13
	v_subrev_co_u32_e64 v12, s[0:1], s18, v13
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s19, v14
	v_subbrev_co_u32_e64 v9, s[0:1], 0, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v15, v15, v16, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v15
	v_cmp_le_u32_e32 vcc, s19, v7
	v_readlane_b32 s27, v79, 31
	v_cndmask_b32_e64 v9, v14, v9, s[0:1]
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s18, v6
	v_readlane_b32 s28, v79, 32
	v_readlane_b32 s29, v79, 33
	v_cndmask_b32_e64 v15, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s19, v7
	v_readlane_b32 s30, v79, 34
	v_readlane_b32 s31, v79, 35
	v_cndmask_b32_e32 v14, v14, v15, vcc
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e64 v9, v13, v12, s[0:1]
	v_cndmask_b32_e32 v6, v6, v9, vcc
.LBB3_151:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB3_153
; %bb.152:                              ;   in Loop: Header=BB3_17 Depth=1
	v_readlane_b32 s8, v79, 20
	v_readlane_b32 s10, v79, 22
	s_sub_i32 s2, 0, s10
	v_readlane_b32 s9, v79, 21
	v_cvt_f32_u32_e32 v6, s10
	v_readlane_b32 s11, v79, 23
	v_readlane_b32 s12, v79, 24
	v_readlane_b32 s13, v79, 25
	v_rcp_iflag_f32_e32 v6, v6
	v_readlane_b32 s14, v79, 26
	v_readlane_b32 s15, v79, 27
	v_readlane_b32 s16, v79, 28
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_readlane_b32 s17, v79, 29
	v_readlane_b32 s18, v79, 30
	v_readlane_b32 s19, v79, 31
	v_mul_lo_u32 v7, s2, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v2, v6
	v_mul_lo_u32 v6, v6, s10
	v_sub_u32_e32 v6, v2, v6
	v_subrev_u32_e32 v7, s10, v6
	v_cmp_le_u32_e32 vcc, s10, v6
	v_readlane_b32 s20, v79, 32
	v_readlane_b32 s21, v79, 33
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s10, v6
	v_cmp_le_u32_e32 vcc, s10, v6
	v_readlane_b32 s22, v79, 34
	v_readlane_b32 s23, v79, 35
	v_cndmask_b32_e32 v40, v6, v7, vcc
	v_mov_b64_e32 v[6:7], v[40:41]
.LBB3_153:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[4:5], v[6:7], 3, v[4:5]
	;;#ASMSTART
	global_store_dwordx2 v[4:5], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0
	buffer_wbl2 sc1
	s_waitcnt lgkmcnt(0)
.LBB3_154:                              ;   Parent Loop BB3_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b64_e32 v[4:5], s[62:63]
	;;#ASMSTART
	flat_atomic_cmpswap_x2 v[4:5], v[4:5], v[0:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB3_154
; %bb.155:                              ;   in Loop: Header=BB3_17 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_branch .LBB3_15
.LBB3_156:                              ;   in Loop: Header=BB3_17 Depth=1
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB3_130
.LBB3_157:                              ;   in Loop: Header=BB3_17 Depth=1
	v_add_u32_e32 v2, 0xffffff72, v7
	v_cmp_lt_u32_e32 vcc, 6, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[18:19], vcc, exec
	s_or_b64 s[16:17], s[16:17], s[18:19]
	s_or_b64 exec, exec, s[14:15]
	v_mov_b64_e32 v[2:3], 1
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB3_131
	s_branch .LBB3_132
.LBB3_158:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z13worker_kernelN6mirage7runtime13RuntimeConfigE
		.amdhsa_group_segment_fixed_size 2000
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 688
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
		.amdhsa_next_free_vgpr max(totalnumvgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
		.amdhsa_next_free_sgpr max(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)-6
		.amdhsa_accum_offset (((((alignto(max(1, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63)+1)*4
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
	.size	_Z13worker_kernelN6mirage7runtime13RuntimeConfigE, .Lfunc_end3-_Z13worker_kernelN6mirage7runtime13RuntimeConfigE
                                        ; -- End function
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr, max(80, amdgpu.max_num_vgpr)
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, max(0, amdgpu.max_num_agpr)
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr, max(100, amdgpu.max_num_sgpr)
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_named_barrier, max(0, amdgpu.max_num_named_barrier)
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.private_seg_size, 0
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, 1
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.has_dyn_sized_stack, 1
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.has_recursion, 1
	.set _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.has_indirect_call, 1
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 10824
; TotalNumSgprs: _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6
; NumVgprs: _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr
; NumAgprs: _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr
; TotalNumVgprs: totalnumvgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr)
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 2000 bytes/workgroup (compile time only)
; SGPRBlocks: (alignto(max(max(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), 1), 8)/8)-1
; VGPRBlocks: (alignto(max(max(totalnumvgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0), 1), 8)/8)-1
; NumSGPRsForWavesPerEU: max(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)
; NumVGPRsForWavesPerEU: max(totalnumvgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
; AccumOffset: ((alignto(max(1, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1+1)*4
; Occupancy: occupancy(8, 8, 512, 8, 8, max(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), max(totalnumvgprs(_Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0))
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: (((alignto(max(1, _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE ; -- Begin function _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
	.globl	_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
	.p2align	8
	.type	_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE,@function
_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE: ; @_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
; %bb.0:
                                        ; implicit-def: $vgpr62 : SGPR spill to VGPR lane
	v_mov_b32_e32 v28, v0
	v_writelane_b32 v62, s10, 0
	v_and_b32_e32 v0, 0x3ff, v28
	v_writelane_b32 v62, s9, 1
	s_mov_b64 s[62:63], s[0:1]
	v_cmp_eq_u32_e32 vcc, 0, v0
	s_movk_i32 s32, 0x610
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB4_305
; %bb.1:
	s_mov_b32 s46, s8
	s_mov_b64 s[60:61], s[2:3]
	s_load_dwordx4 s[72:75], s[4:5], 0x0
	s_load_dwordx8 s[80:87], s[4:5], 0x20
	s_load_dwordx2 s[54:55], s[4:5], 0x40
	s_load_dwordx8 s[64:71], s[4:5], 0x58
	s_load_dwordx8 s[88:95], s[4:5], 0x80
	s_load_dwordx2 s[76:77], s[4:5], 0x158
	s_load_dwordx4 s[0:3], s[4:5], 0x148
	s_ashr_i32 s47, s8, 31
	s_lshl_b64 s[34:35], s[46:47], 3
	s_mov_b64 s[58:59], s[4:5]
	s_waitcnt lgkmcnt(0)
	s_add_u32 s4, s70, s34
	s_addc_u32 s5, s71, s35
	s_cmp_lt_i32 s8, s73
	s_mov_b64 s[96:97], s[6:7]
	s_cselect_b64 s[78:79], -1, 0
	s_cmp_ge_i32 s8, s73
	s_cbranch_scc0 .LBB4_12
; %bb.2:
	s_sub_i32 s6, s46, s73
	s_cmp_ge_i32 s6, s72
	s_mov_b32 s33, 0
	s_cbranch_scc1 .LBB4_11
; %bb.3:
	v_cvt_f32_u32_e32 v0, s74
	s_add_i32 s7, s46, s74
	s_sub_i32 s8, s7, s73
	s_max_i32 s8, s72, s8
	v_rcp_iflag_f32_e32 v0, v0
	s_add_i32 s10, s73, s8
	s_cmp_lg_u32 s10, s7
	s_cselect_b64 s[8:9], -1, 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_addc_u32 s7, s74, s46
	s_sub_i32 s11, 0, s74
	s_sub_i32 s7, s10, s7
	v_readfirstlane_b32 s12, v0
	s_mul_i32 s11, s11, s12
	s_mul_hi_u32 s11, s12, s11
	s_add_i32 s12, s12, s11
	s_mul_hi_u32 s11, s7, s12
	s_mul_i32 s12, s11, s74
	s_sub_i32 s7, s7, s12
	s_add_i32 s12, s11, 1
	s_sub_i32 s13, s7, s74
	s_cmp_ge_u32 s7, s74
	s_cselect_b32 s11, s12, s11
	s_cselect_b32 s7, s13, s7
	s_add_i32 s12, s11, 1
	s_cmp_ge_u32 s7, s74
	s_cselect_b32 s7, s12, s11
	s_cmp_lg_u64 s[8:9], 0
	s_addc_u32 s33, s7, 1
	s_mov_b32 s10, 0
	s_cmp_lt_u32 s33, 2
	s_mov_b64 s[8:9], -1
	s_cbranch_scc1 .LBB4_7
; %bb.4:
	s_and_b32 s10, s33, -2
	s_add_i32 s7, s6, s74
	s_lshl_b32 s13, s74, 1
	s_mov_b32 s11, s72
	s_mov_b32 s12, s72
	s_mov_b32 s14, s13
	s_mov_b32 s15, 0
	s_mov_b32 s16, s10
	s_mov_b64 s[8:9], s[6:7]
.LBB4_5:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s7, s9, s12
	s_add_i32 s17, s8, s11
	v_mov_b32_e32 v0, s17
	v_mov_b32_e32 v1, s7
	s_add_i32 s9, s9, s14
	s_add_i32 s8, s8, s13
	s_add_i32 s16, s16, -2
	scratch_store_dwordx2 off, v[0:1], s15
	s_add_i32 s15, s15, 8
	s_cmp_lg_u32 s16, 0
	s_cbranch_scc1 .LBB4_5
; %bb.6:
	s_mul_i32 s7, s10, s74
	s_add_i32 s6, s6, s7
	s_cmp_lg_u32 s33, s10
	s_cselect_b64 s[8:9], -1, 0
.LBB4_7:
	s_and_b64 vcc, exec, s[8:9]
	s_cbranch_vccz .LBB4_11
; %bb.8:
	s_lshl2_add_u32 s7, s10, 0
.LBB4_9:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s8, s72, s6
	v_mov_b32_e32 v0, s8
	s_add_i32 s10, s10, 1
	s_add_i32 s6, s6, s74
	scratch_store_dword off, v0, s7
	s_add_i32 s7, s7, 4
	s_cmp_lt_i32 s6, s72
	s_cbranch_scc1 .LBB4_9
; %bb.10:
	s_mov_b32 s33, s10
.LBB4_11:
	s_mov_b64 s[6:7], 0
	s_branch .LBB4_13
.LBB4_12:
	s_mov_b64 s[6:7], -1
                                        ; implicit-def: $sgpr33
.LBB4_13:
	s_load_dwordx2 s[4:5], s[4:5], 0x0
	s_mov_b32 s8, 0
	s_andn2_b64 vcc, exec, s[6:7]
	s_mov_b32 s49, 0
	s_mov_b32 s52, 0
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v62, s4, 2
	s_nop 1
	v_writelane_b32 v62, s5, 3
	s_add_i32 s4, s74, s73
	v_writelane_b32 v62, s4, 4
	s_nop 1
	v_writelane_b32 v62, s5, 5
	s_mov_b64 s[4:5], 0
	v_writelane_b32 v62, s4, 6
	s_nop 1
	v_writelane_b32 v62, s5, 7
	s_cbranch_vccnz .LBB4_39
; %bb.14:
	v_readlane_b32 s4, v62, 4
	v_readlane_b32 s5, v62, 5
	s_mov_b32 s6, s4
	s_ashr_i32 s7, s4, 31
	v_writelane_b32 v62, s4, 4
	s_nop 1
	v_writelane_b32 v62, s5, 5
	s_lshl_b64 s[4:5], s[6:7], 3
	s_add_u32 s4, s70, s4
	s_addc_u32 s5, s71, s5
	s_load_dwordx2 s[4:5], s[4:5], 0x0
	s_cmp_eq_u64 s[0:1], 0
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v62, s4, 6
	s_nop 1
	v_writelane_b32 v62, s5, 7
	s_cbranch_scc1 .LBB4_28
; %bb.15:
	s_load_dword s99, s[58:59], 0x18
	v_mbcnt_lo_u32_b32 v0, exec_lo, 0
	v_mbcnt_hi_u32_b32 v0, exec_hi, v0
	v_cmp_eq_u32_e32 vcc, 0, v0
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB4_17
; %bb.16:
	v_mov_b32_e32 v0, 0
	global_load_dword v0, v0, s[2:3] sc1
.LBB4_17:
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v0
	s_cmp_ge_i32 s4, s72
	s_cbranch_scc1 .LBB4_22
; %bb.18:
	v_mov_b32_e32 v0, 0
	s_branch .LBB4_20
.LBB4_19:                               ;   in Loop: Header=BB4_20 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v1
	s_cmp_lt_i32 s4, s72
	s_cbranch_scc0 .LBB4_22
.LBB4_20:                               ; =>This Inner Loop Header: Depth=1
	v_mbcnt_lo_u32_b32 v1, exec_lo, 0
	v_mbcnt_hi_u32_b32 v1, exec_hi, v1
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_sleep 1
	s_sleep 1
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB4_19
; %bb.21:                               ;   in Loop: Header=BB4_20 Depth=1
	global_load_dword v1, v0, s[2:3] sc1
	s_branch .LBB4_19
.LBB4_22:
	s_cmp_lt_i32 s72, 1
	s_mov_b32 s33, 0
	buffer_wbl2 sc1
	s_waitcnt lgkmcnt(0)
	;;#ASMSTART
	s_getreg_b32 s49, hwreg(HW_REG_XCC_ID, 0, 16)
	;;#ASMEND
	s_cbranch_scc1 .LBB4_27
; %bb.23:
	v_mov_b32_e32 v0, 0
	s_mov_b32 s2, 0
	s_branch .LBB4_25
.LBB4_24:                               ;   in Loop: Header=BB4_25 Depth=1
	s_add_i32 s2, s2, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_eq_u32 s72, s2
	s_cbranch_scc1 .LBB4_27
.LBB4_25:                               ; =>This Inner Loop Header: Depth=1
	global_load_dword v1, v0, s[0:1]
	s_waitcnt vmcnt(0)
	v_cmp_ne_u32_e32 vcc, s49, v1
	s_cbranch_vccnz .LBB4_24
; %bb.26:                               ;   in Loop: Header=BB4_25 Depth=1
	s_lshl_b32 s3, s33, 2
	s_add_i32 s33, s33, 1
	v_mov_b32_e32 v1, s2
	scratch_store_dword off, v1, s3
	s_branch .LBB4_24
.LBB4_27:
	v_writelane_b32 v62, s78, 26
	s_add_u32 s52, s58, 0x1b0
	s_addc_u32 s53, s59, 0
	v_writelane_b32 v62, s79, 27
	v_writelane_b32 v62, s76, 24
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v62, s77, 25
	v_writelane_b32 v62, s88, 16
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	s_mov_b64 s[4:5], s[62:63]
	v_writelane_b32 v62, s89, 17
	v_writelane_b32 v62, s90, 18
	v_writelane_b32 v62, s91, 19
	v_writelane_b32 v62, s92, 20
	v_writelane_b32 v62, s93, 21
	v_writelane_b32 v62, s94, 22
	v_writelane_b32 v62, s95, 23
	v_writelane_b32 v62, s54, 14
	s_mov_b64 s[6:7], s[60:61]
	s_mov_b64 s[8:9], s[52:53]
	v_writelane_b32 v62, s55, 15
	v_writelane_b32 v62, s72, 10
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s46
	v_writelane_b32 v62, s73, 11
	v_writelane_b32 v62, s74, 12
	v_writelane_b32 v62, s75, 13
	v_mov_b32_e32 v31, v28
	v_readlane_b32 s48, v62, 1
	v_readlane_b32 s98, v62, 0
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	v_writelane_b32 v62, s58, 8
	v_mov_b32_e32 v40, v28
	s_mov_b64 s[50:51], s[46:47]
	v_writelane_b32 v62, s59, 9
	s_mov_b64 s[54:55], s[60:61]
	s_mov_b64 s[36:37], s[62:63]
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.4@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.4@rel32@hi+12
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s15, 59, 0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mov_b64 s[4:5], s[36:37]
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s50
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s15
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[38:39], s[0:1], 0x0
	s_mov_b64 s[4:5], s[36:37]
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s50
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s50
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[36:37]
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s50
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s49
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[36:37]
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s50
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s33
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[4:5], s[36:37]
	s_mov_b64 s[6:7], s[54:55]
	s_mov_b64 s[8:9], s[52:53]
	s_mov_b64 s[10:11], s[96:97]
	s_mov_b32 s12, s50
	s_mov_b32 s13, s48
	s_mov_b32 s14, s98
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, s50
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 1
	s_swappc_b64 s[30:31], s[38:39]
	s_mov_b64 s[60:61], s[54:55]
	v_readlane_b32 s58, v62, 8
	v_readlane_b32 s72, v62, 10
	v_readlane_b32 s54, v62, 14
	v_readlane_b32 s88, v62, 16
	v_readlane_b32 s76, v62, 24
	v_readlane_b32 s78, v62, 26
	v_mov_b32_e32 v28, v40
	s_mov_b64 s[62:63], s[36:37]
	v_readlane_b32 s59, v62, 9
	s_mov_b64 s[46:47], s[50:51]
	s_mul_i32 s8, s49, s99
	v_readlane_b32 s73, v62, 11
	v_readlane_b32 s74, v62, 12
	v_readlane_b32 s75, v62, 13
	v_readlane_b32 s55, v62, 15
	v_readlane_b32 s89, v62, 17
	v_readlane_b32 s90, v62, 18
	v_readlane_b32 s91, v62, 19
	v_readlane_b32 s92, v62, 20
	v_readlane_b32 s93, v62, 21
	v_readlane_b32 s94, v62, 22
	v_readlane_b32 s95, v62, 23
	v_readlane_b32 s77, v62, 25
	v_readlane_b32 s79, v62, 27
	s_branch .LBB4_38
.LBB4_28:
                                        ; implicit-def: $sgpr33
                                        ; implicit-def: $sgpr8
	s_cbranch_execz .LBB4_38
; %bb.29:
	s_mov_b32 s8, 0
	s_cmp_ge_i32 s46, s72
	s_mov_b32 s33, 0
	s_cbranch_scc1 .LBB4_38
; %bb.30:
	v_cvt_f32_u32_e32 v0, s73
	s_add_i32 s1, s46, s73
	s_max_i32 s0, s72, s1
	s_cmp_lt_i32 s1, s72
	v_rcp_iflag_f32_e32 v0, v0
	s_cselect_b64 s[2:3], -1, 0
	s_addc_u32 s5, s46, s73
	s_sub_i32 s6, 0, s73
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_sub_i32 s0, s0, s5
	s_mov_b32 s4, 0
	v_readfirstlane_b32 s5, v0
	s_mul_i32 s6, s6, s5
	s_mul_hi_u32 s6, s5, s6
	s_add_i32 s5, s5, s6
	s_mul_hi_u32 s5, s0, s5
	s_mul_i32 s6, s5, s73
	s_sub_i32 s0, s0, s6
	s_add_i32 s7, s5, 1
	s_sub_i32 s6, s0, s73
	s_cmp_ge_u32 s0, s73
	s_cselect_b32 s5, s7, s5
	s_cselect_b32 s0, s6, s0
	s_add_i32 s6, s5, 1
	s_cmp_ge_u32 s0, s73
	s_cselect_b32 s0, s6, s5
	s_cmp_lg_u64 s[2:3], 0
	s_addc_u32 s33, s0, 1
	s_mov_b64 s[2:3], -1
	s_cmp_lt_u32 s33, 2
	s_mov_b32 s0, s46
	s_cbranch_scc1 .LBB4_34
; %bb.31:
	s_and_b32 s4, s33, -2
	s_lshl_b32 s2, s73, 1
	s_mov_b32 s0, s46
	s_mov_b32 s3, s2
	s_mov_b32 s5, 0
	s_mov_b32 s6, s4
.LBB4_32:                               ; =>This Inner Loop Header: Depth=1
	v_mov_b64_e32 v[0:1], s[0:1]
	s_add_i32 s1, s1, s3
	s_add_i32 s0, s0, s2
	s_add_i32 s6, s6, -2
	scratch_store_dwordx2 off, v[0:1], s5
	s_add_i32 s5, s5, 8
	s_cmp_lg_u32 s6, 0
	s_cbranch_scc1 .LBB4_32
; %bb.33:
	s_mul_i32 s0, s4, s73
	s_add_i32 s0, s46, s0
	s_cmp_lg_u32 s33, s4
	s_cselect_b64 s[2:3], -1, 0
.LBB4_34:
	s_and_b64 vcc, exec, s[2:3]
	s_cbranch_vccz .LBB4_38
; %bb.35:
	s_lshl2_add_u32 s1, s4, 0
.LBB4_36:                               ; =>This Inner Loop Header: Depth=1
	v_mov_b32_e32 v0, s0
	s_add_i32 s4, s4, 1
	s_add_i32 s0, s0, s73
	scratch_store_dword off, v0, s1
	s_add_i32 s1, s1, 4
	s_cmp_ge_i32 s0, s72
	s_cbranch_scc0 .LBB4_36
; %bb.37:
	s_mov_b32 s33, s4
.LBB4_38:
	v_readlane_b32 s0, v62, 4
	s_mov_b32 s49, 1
	s_mov_b32 s52, s0
	v_readlane_b32 s1, v62, 5
.LBB4_39:
	v_writelane_b32 v62, s8, 28
	s_load_dwordx16 s[0:15], s[58:59], 0xb8
	s_cmp_gt_i32 s33, 0
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v62, s0, 29
	s_nop 1
	v_writelane_b32 v62, s1, 30
	v_writelane_b32 v62, s2, 31
	v_writelane_b32 v62, s3, 32
	v_writelane_b32 v62, s4, 33
	v_writelane_b32 v62, s5, 34
	v_writelane_b32 v62, s6, 35
	v_writelane_b32 v62, s7, 36
	v_writelane_b32 v62, s8, 37
	v_writelane_b32 v62, s9, 38
	v_writelane_b32 v62, s10, 39
	v_writelane_b32 v62, s11, 40
	v_writelane_b32 v62, s12, 41
	v_writelane_b32 v62, s13, 42
	v_writelane_b32 v62, s14, 43
	v_writelane_b32 v62, s15, 44
	s_load_dwordx4 s[0:3], s[58:59], 0xf8
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v62, s0, 45
	s_nop 1
	v_writelane_b32 v62, s1, 46
	v_writelane_b32 v62, s2, 47
	v_writelane_b32 v62, s3, 48
	s_cselect_b64 s[0:1], -1, 0
	v_writelane_b32 v62, s0, 49
	s_cmp_lt_i32 s33, 1
	s_nop 0
	v_writelane_b32 v62, s1, 50
	s_cbranch_scc1 .LBB4_42
; %bb.40:
	v_mov_b32_e32 v0, 0
	s_movk_i32 s0, 0x200
	v_mov_b32_e32 v1, v0
	s_mov_b32 s1, s33
.LBB4_41:                               ; =>This Inner Loop Header: Depth=1
	scratch_store_dwordx2 off, v[0:1], s0
	s_add_i32 s1, s1, -1
	s_add_i32 s0, s0, 8
	s_cmp_eq_u32 s1, 0
	s_cbranch_scc0 .LBB4_41
.LBB4_42:
	s_add_u32 s98, s86, s34
	s_addc_u32 s99, s87, s35
	s_ashr_i32 s0, s73, 31
	v_writelane_b32 v62, s0, 51
	s_mov_b32 s0, s73
	s_cmp_lg_u64 s[76:77], 0
	v_writelane_b32 v62, s0, 52
	s_cselect_b64 s[0:1], -1, 0
	v_writelane_b32 v62, s0, 53
	s_ashr_i32 s73, s72, 31
                                        ; implicit-def: $vgpr63 : SGPR spill to VGPR lane
	v_mov_b32_e32 v40, 0
	v_writelane_b32 v62, s1, 54
	s_add_u32 s0, s72, -1
	s_addc_u32 s1, s73, -1
	v_writelane_b32 v62, s0, 55
	v_mov_b32_e32 v41, v40
	v_mov_b32_e32 v42, v40
	v_writelane_b32 v62, s1, 56
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	v_readlane_b32 s2, v62, 4
	v_readlane_b32 s3, v62, 5
	s_cmp_gt_i32 s2, 0
	s_cselect_b64 s[2:3], -1, 0
	s_cmp_lg_u64 s[0:1], 0
	s_cselect_b32 s0, 54, 0
	s_abs_i32 s53, s33
	v_cvt_f32_u32_e32 v0, s53
	v_writelane_b32 v62, s2, 57
	s_mul_hi_i32 s1, s46, 0x70
	v_mov_b32_e32 v43, v40
	v_rcp_iflag_f32_e32 v0, v0
	v_writelane_b32 v62, s3, 58
	v_writelane_b32 v62, s0, 59
	s_load_dword s0, s[58:59], 0xa8
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_accvgpr_write_b32 a40, 0
	v_mov_b64_e32 v[58:59], v[42:43]
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v62, s0, 60
	s_sub_i32 s0, 0, s53
	v_mul_lo_u32 v1, s0, v0
	s_mul_i32 s0, s46, 0x70
	v_writelane_b32 v62, s0, 61
	v_mul_hi_u32 v1, v0, v1
	v_add_u32_e32 v0, v0, v1
	v_writelane_b32 v62, s1, 62
	s_load_dwordx16 s[0:15], s[58:59], 0xb8
	v_mov_b64_e32 v[14:15], v[40:41]
	s_mov_b32 s38, s46
	v_accvgpr_write_b32 a37, v0
	s_movk_i32 s39, 0x70
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s4, 32
	s_addc_u32 s1, s5, 0
	v_writelane_b32 v62, s0, 63
	v_accvgpr_write_b32 a41, 0
	v_readlane_b32 s74, v62, 2
	v_writelane_b32 v63, s1, 0
	s_add_u32 s0, s64, 8
	s_addc_u32 s1, s65, 0
	v_writelane_b32 v63, s0, 1
	v_accvgpr_write_b32 a38, 0
	v_accvgpr_write_b32 a39, v40
	v_writelane_b32 v63, s1, 2
	s_mov_b32 s0, 1
	v_writelane_b32 v63, s0, 3
	v_mov_b64_e32 v[56:57], v[40:41]
	v_mov_b64_e32 v[16:17], v[42:43]
	v_mov_b32_e32 v60, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v29, 0
	v_mov_b64_e32 v[30:31], 0
	s_mov_b64 s[34:35], 0
	s_mov_b32 s51, 0
	v_writelane_b32 v63, s1, 4
	v_readlane_b32 s75, v62, 3
                                        ; implicit-def: $agpr32_agpr33
                                        ; implicit-def: $agpr34_agpr35
	s_branch .LBB4_45
.LBB4_43:                               ;   in Loop: Header=BB4_45 Depth=1
	v_accvgpr_read_b32 v4, a32
	v_accvgpr_read_b32 v0, a34
	v_accvgpr_read_b32 v5, a33
	v_accvgpr_read_b32 v1, a35
.LBB4_44:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_readlane_b32 s0, v63, 5
	v_readlane_b32 s1, v63, 6
	s_and_b64 s[0:1], exec, s[0:1]
	v_accvgpr_write_b32 a33, v5
	v_accvgpr_write_b32 a35, v1
	s_or_b64 s[34:35], s[0:1], s[34:35]
	v_accvgpr_write_b32 a32, v4
	v_accvgpr_write_b32 a34, v0
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB4_305
.LBB4_45:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_48 Depth 2
                                        ;     Child Loop BB4_78 Depth 2
                                        ;     Child Loop BB4_85 Depth 2
                                        ;     Child Loop BB4_91 Depth 2
                                        ;     Child Loop BB4_96 Depth 2
                                        ;     Child Loop BB4_99 Depth 2
                                        ;     Child Loop BB4_102 Depth 2
                                        ;     Child Loop BB4_107 Depth 2
                                        ;     Child Loop BB4_113 Depth 2
                                        ;     Child Loop BB4_116 Depth 2
                                        ;     Child Loop BB4_119 Depth 2
                                        ;     Child Loop BB4_123 Depth 2
                                        ;       Child Loop BB4_127 Depth 3
                                        ;     Child Loop BB4_133 Depth 2
                                        ;     Child Loop BB4_143 Depth 2
                                        ;       Child Loop BB4_148 Depth 3
                                        ;     Child Loop BB4_176 Depth 2
                                        ;       Child Loop BB4_180 Depth 3
                                        ;     Child Loop BB4_197 Depth 2
                                        ;       Child Loop BB4_202 Depth 3
                                        ;         Child Loop BB4_223 Depth 4
                                        ;     Child Loop BB4_235 Depth 2
                                        ;     Child Loop BB4_273 Depth 2
                                        ;     Child Loop BB4_278 Depth 2
                                        ;     Child Loop BB4_289 Depth 2
                                        ;     Child Loop BB4_301 Depth 2
	v_cmp_eq_u32_e32 vcc, 1, v60
	s_nop 1
	v_cndmask_b32_e32 v47, v15, v17, vcc
	v_cndmask_b32_e32 v46, v14, v16, vcc
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_eq_u64_e32 vcc, v[46:47], v[0:1]
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB4_55
; %bb.46:                               ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b64 s[2:3], 0
	s_branch .LBB4_48
.LBB4_47:                               ;   in Loop: Header=BB4_48 Depth=2
	s_or_b64 exec, exec, s[4:5]
	s_and_b64 s[4:5], exec, s[6:7]
	s_or_b64 s[2:3], s[4:5], s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execz .LBB4_54
.LBB4_48:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_cmp_ne_u32_e32 vcc, 0, v60
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz .LBB4_50
; %bb.49:                               ;   in Loop: Header=BB4_48 Depth=2
	v_mov_b32_e32 v0, s38
	v_mov_b32_e32 v1, s52
	v_cmp_eq_u32_e32 vcc, 1, v60
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[86:87]
	;;#ASMSTART
	global_load_dwordx2 v[0:1], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cndmask_b32_e32 v59, v59, v1, vcc
	v_cndmask_b32_e32 v58, v58, v0, vcc
	v_cmp_eq_u32_e32 vcc, 0, v60
	s_nop 1
	v_cndmask_b32_e32 v57, v57, v1, vcc
	v_cndmask_b32_e32 v56, v56, v0, vcc
.LBB4_50:                               ;   in Loop: Header=BB4_48 Depth=2
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execz .LBB4_52
; %bb.51:                               ;   in Loop: Header=BB4_48 Depth=2
	v_mov_b64_e32 v[0:1], s[98:99]
	flat_load_dwordx2 v[56:57], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
.LBB4_52:                               ;   in Loop: Header=BB4_48 Depth=2
	s_or_b64 exec, exec, s[4:5]
	v_cmp_eq_u32_e32 vcc, 1, v60
	s_mov_b64 s[6:7], -1
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_ge_u64_e32 vcc, v[46:47], v[0:1]
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB4_47
; %bb.53:                               ;   in Loop: Header=BB4_48 Depth=2
	v_add_u32_e32 v0, 1, v60
	v_cmp_ne_u32_e32 vcc, s49, v60
	s_sleep 1
	s_nop 0
	v_cndmask_b32_e32 v60, 0, v0, vcc
	v_cmp_eq_u32_e32 vcc, 1, v60
	s_nop 1
	v_cndmask_b32_e32 v47, v15, v17, vcc
	v_cndmask_b32_e32 v46, v14, v16, vcc
	v_cndmask_b32_e32 v1, v57, v59, vcc
	v_cndmask_b32_e32 v0, v56, v58, vcc
	v_cmp_ne_u64_e32 vcc, v[46:47], v[0:1]
	s_orn2_b64 s[6:7], vcc, exec
	s_branch .LBB4_47
.LBB4_54:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[2:3]
.LBB4_55:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_cmp_ne_u32_e32 vcc, 0, v60
                                        ; implicit-def: $vgpr2_vgpr3
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[4:5], exec, s[0:1]
	s_cbranch_execz .LBB4_61
; %bb.56:                               ;   in Loop: Header=BB4_45 Depth=1
	v_or_b32_e32 v41, s83, v47
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	buffer_wbl2 sc1
	s_waitcnt vmcnt(0)
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB4_58
; %bb.57:                               ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v0, s82
	v_cvt_f32_u32_e32 v1, s83
	s_sub_u32 s0, 0, s82
	s_subb_u32 s1, 0, s83
	v_mov_b32_e32 v3, v40
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmac_f32_e32 v0, 0xcf800000, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v1
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[0:1], s[0:1], v46, s2, 0
	v_mul_hi_u32 v2, v46, s3
	v_lshl_add_u64 v[0:1], v[2:3], 0, v[0:1]
	v_mad_u64_u32 v[4:5], s[0:1], v47, s3, 0
	v_add_co_u32_e32 v0, vcc, v0, v4
	v_mad_u64_u32 v[2:3], s[0:1], v47, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v0, vcc, v1, v5, vcc
	v_mov_b32_e32 v1, s51
	s_nop 0
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[2:3]
	v_mul_lo_u32 v2, s83, v0
	v_mul_lo_u32 v3, s82, v1
	v_mad_u64_u32 v[0:1], s[0:1], s82, v0, 0
	v_add3_u32 v1, v1, v3, v2
	v_sub_u32_e32 v2, v47, v1
	v_mov_b32_e32 v3, s83
	v_sub_co_u32_e32 v0, vcc, v46, v0
	s_nop 1
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, vcc
	v_subrev_co_u32_e64 v4, s[0:1], s82, v0
	v_subb_co_u32_e32 v1, vcc, v47, v1, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v2, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s83, v5
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s82, v4
	v_subrev_co_u32_e64 v3, s[0:1], s82, v4
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s83, v5
	v_subbrev_co_u32_e64 v2, s[0:1], 0, v2, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, v6, v7, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v6
	v_cmp_le_u32_e32 vcc, s83, v1
	s_nop 0
	v_cndmask_b32_e64 v2, v5, v2, s[0:1]
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e64 v6, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s83, v1
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v2, vcc
	v_cndmask_b32_e64 v2, v4, v3, s[0:1]
	v_cndmask_b32_e32 v0, v0, v2, vcc
.LBB4_58:                               ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB4_60
; %bb.59:                               ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v0, s82
	s_sub_i32 s2, 0, s82
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v1, s2, v0
	v_mul_hi_u32 v1, v0, v1
	v_add_u32_e32 v0, v0, v1
	v_mul_hi_u32 v0, v46, v0
	v_mul_lo_u32 v0, v0, s82
	v_sub_u32_e32 v0, v46, v0
	v_subrev_u32_e32 v1, s82, v0
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_subrev_u32_e32 v1, s82, v0
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_mov_b32_e32 v1, v40
.LBB4_60:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s0, v62, 6
	v_readlane_b32 s1, v62, 7
	v_mov_b32_e32 v2, s75
	v_cmp_eq_u32_e32 vcc, 1, v60
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s0
	v_cndmask_b32_e32 v3, v2, v3, vcc
	v_mov_b32_e32 v2, s74
	v_cndmask_b32_e32 v2, v2, v4, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 3, v[2:3]
	;;#ASMSTART
	global_load_dwordx2 v[2:3], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
.LBB4_61:                               ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execz .LBB4_67
; %bb.62:                               ;   in Loop: Header=BB4_45 Depth=1
	;;#ASMSTART
	;;#ASMEND
	v_or_b32_e32 v41, s83, v15
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB4_64
; %bb.63:                               ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v0, s82
	v_cvt_f32_u32_e32 v1, s83
	s_sub_u32 s0, 0, s82
	s_subb_u32 s1, 0, s83
	v_mov_b32_e32 v3, v40
	v_fmac_f32_e32 v0, 0x4f800000, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmac_f32_e32 v0, 0xcf800000, v1
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v1
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[0:1], s[0:1], v14, s2, 0
	v_mul_hi_u32 v2, v14, s3
	v_lshl_add_u64 v[0:1], v[2:3], 0, v[0:1]
	v_mad_u64_u32 v[4:5], s[0:1], v15, s3, 0
	v_add_co_u32_e32 v0, vcc, v0, v4
	v_mad_u64_u32 v[2:3], s[0:1], v15, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v0, vcc, v1, v5, vcc
	v_mov_b32_e32 v1, s51
	s_nop 0
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc
	v_lshl_add_u64 v[0:1], v[0:1], 0, v[2:3]
	v_mul_lo_u32 v2, s83, v0
	v_mul_lo_u32 v3, s82, v1
	v_mad_u64_u32 v[0:1], s[0:1], s82, v0, 0
	v_add3_u32 v1, v1, v3, v2
	v_sub_u32_e32 v2, v15, v1
	v_mov_b32_e32 v3, s83
	v_sub_co_u32_e32 v0, vcc, v14, v0
	s_nop 1
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, vcc
	v_subrev_co_u32_e64 v4, s[0:1], s82, v0
	v_subb_co_u32_e32 v1, vcc, v15, v1, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v2, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s83, v5
	v_subb_co_u32_e64 v2, s[0:1], v2, v3, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s82, v4
	v_subrev_co_u32_e64 v3, s[0:1], s82, v4
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s83, v5
	v_subbrev_co_u32_e64 v2, s[0:1], 0, v2, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v6, v6, v7, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v6
	v_cmp_le_u32_e32 vcc, s83, v1
	s_nop 0
	v_cndmask_b32_e64 v2, v5, v2, s[0:1]
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e64 v6, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s83, v1
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_nop 1
	v_cndmask_b32_e32 v1, v1, v2, vcc
	v_cndmask_b32_e64 v2, v4, v3, s[0:1]
	v_cndmask_b32_e32 v0, v0, v2, vcc
.LBB4_64:                               ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB4_66
; %bb.65:                               ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v0, s82
	s_sub_i32 s2, 0, s82
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v1, s2, v0
	v_mul_hi_u32 v1, v0, v1
	v_add_u32_e32 v0, v0, v1
	v_mul_hi_u32 v0, v14, v0
	v_mul_lo_u32 v0, v0, s82
	v_sub_u32_e32 v0, v14, v0
	v_subrev_u32_e32 v1, s82, v0
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_subrev_u32_e32 v1, s82, v0
	v_cmp_le_u32_e32 vcc, s82, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v1, vcc
	v_mov_b32_e32 v1, v40
.LBB4_66:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[74:75]
	flat_load_dwordx2 v[2:3], v[0:1] sc0 sc1
	s_waitcnt vmcnt(0)
.LBB4_67:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u64_e64 s[0:1], 0, v[2:3]
	v_cmp_ne_u64_e32 vcc, 0, v[2:3]
                                        ; implicit-def: $vgpr0_vgpr1
                                        ; implicit-def: $vgpr4_vgpr5
	s_nop 0
	v_writelane_b32 v63, s0, 5
	s_nop 1
	v_writelane_b32 v63, s1, 6
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	v_writelane_b32 v63, s0, 7
	s_nop 1
	v_writelane_b32 v63, s1, 8
	s_cbranch_execz .LBB4_296
; %bb.68:                               ;   in Loop: Header=BB4_45 Depth=1
	v_mad_u64_u32 v[0:1], s[0:1], v2, 24, s[66:67]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v3, 24, v[2:3]
	v_mov_b32_e32 v1, v2
	global_load_dword v4, v[0:1], off
	global_load_dwordx4 v[42:45], v[0:1], off offset:8
	v_accvgpr_write_b32 a45, v17
	s_movk_i32 s0, 0x386
	v_accvgpr_write_b32 a44, v16
	v_accvgpr_write_b32 a43, v15
	v_accvgpr_write_b32 a42, v14
	s_mov_b64 s[2:3], 0
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr14_vgpr15
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
                                        ; implicit-def: $vgpr0_vgpr1
	s_waitcnt vmcnt(1)
	v_cmp_lt_i32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB4_243
; %bb.69:                               ;   in Loop: Header=BB4_45 Depth=1
	v_writelane_b32 v63, s0, 9
	s_mov_b64 s[4:5], 0
                                        ; implicit-def: $sgpr40_sgpr41
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
	s_nop 0
	v_writelane_b32 v63, s1, 10
	s_movk_i32 s0, 0x38d
	v_cmp_lt_i32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB4_153
; %bb.70:                               ;   in Loop: Header=BB4_45 Depth=1
	v_writelane_b32 v63, s0, 11
                                        ; implicit-def: $sgpr40_sgpr41
                                        ; implicit-def: $vgpr12
                                        ; implicit-def: $vgpr22
	s_nop 1
	v_writelane_b32 v63, s1, 12
	s_movk_i32 s0, 0x38e
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_mov_b64 s[0:1], -1
	s_mov_b64 s[2:3], exec
	v_writelane_b32 v63, s2, 13
	s_nop 1
	v_writelane_b32 v63, s3, 14
	s_and_b64 s[2:3], s[2:3], vcc
	s_mov_b64 exec, s[2:3]
	s_cbranch_execz .LBB4_152
; %bb.71:                               ;   in Loop: Header=BB4_45 Depth=1
	s_memrealtime s[0:1]
	v_cmp_ne_u64_e32 vcc, 0, v[30:31]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s1, s1, 10
	s_mul_hi_u32 s2, s0, 10
	s_mul_i32 s40, s0, 10
	s_add_i32 s41, s2, s1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB4_74
; %bb.72:                               ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s0, 0xc28f5c29
	v_mul_lo_u32 v0, v29, s0
	v_alignbit_b32 v0, v0, v0, 2
	s_mov_b32 s0, 0x28f5c29
	v_cmp_gt_i32_e32 vcc, 10, v29
	v_cmp_gt_u32_e64 s[0:1], s0, v0
	s_or_b64 s[0:1], vcc, s[0:1]
	s_and_b64 exec, exec, s[0:1]
	s_cbranch_execz .LBB4_74
; %bb.73:                               ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v62, 29
	v_readlane_b32 s1, v62, 30
	v_mov_b32_e32 v0, s41
	v_sub_co_u32_e32 v2, vcc, s40, v30
	v_readlane_b32 s2, v62, 31
	v_readlane_b32 s3, v62, 32
	s_nop 0
	global_load_dword v41, v40, s[0:1] offset:4
	v_readlane_b32 s4, v62, 33
	v_readlane_b32 s5, v62, 34
	v_readlane_b32 s6, v62, 35
	v_readlane_b32 s7, v62, 36
	v_readlane_b32 s8, v62, 37
	v_readlane_b32 s9, v62, 38
	v_readlane_b32 s10, v62, 39
	v_readlane_b32 s11, v62, 40
	v_readlane_b32 s12, v62, 41
	v_readlane_b32 s13, v62, 42
	v_readlane_b32 s14, v62, 43
	v_readlane_b32 s15, v62, 44
	v_subb_co_u32_e32 v0, vcc, v0, v31, vcc
	v_readlane_b32 s50, v62, 0
	v_writelane_b32 v62, s54, 14
	v_cvt_f64_u32_e32 v[0:1], v0
	v_ldexp_f64 v[0:1], v[0:1], 32
	v_writelane_b32 v62, s55, 15
	s_add_u32 s54, s58, 0x1b0
	v_cvt_f64_u32_e32 v[2:3], v2
	s_mov_b32 s2, 0
	v_readlane_b32 s48, v62, 1
	s_addc_u32 s55, s59, 0
	v_writelane_b32 v62, s58, 8
	v_add_f64 v[0:1], v[0:1], v[2:3]
	s_mov_b32 s3, 0x412e8480
	v_writelane_b32 v62, s59, 9
	v_div_scale_f64 v[2:3], s[0:1], s[2:3], s[2:3], v[0:1]
	v_writelane_b32 v62, s72, 10
	v_rcp_f64_e32 v[4:5], v[2:3]
	s_mov_b32 s12, s46
	v_writelane_b32 v62, s73, 11
	v_writelane_b32 v62, s74, 12
	v_writelane_b32 v62, s75, 13
	v_writelane_b32 v62, s88, 16
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_writelane_b32 v62, s89, 17
	v_writelane_b32 v63, s46, 15
	v_writelane_b32 v62, s90, 18
	v_fma_f64 v[6:7], -v[2:3], v[4:5], 1.0
	v_writelane_b32 v63, s47, 16
	v_writelane_b32 v62, s91, 19
	v_fmac_f64_e32 v[4:5], v[4:5], v[6:7]
	v_div_scale_f64 v[6:7], vcc, v[0:1], s[2:3], v[0:1]
	s_mov_b64 s[10:11], s[96:97]
	v_writelane_b32 v63, s96, 17
	v_writelane_b32 v62, s92, 20
	v_mul_f64 v[8:9], v[6:7], v[4:5]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_begin@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_begin@gotpcrel32@hi+12
	v_writelane_b32 v63, s97, 18
	v_writelane_b32 v62, s93, 21
	v_fma_f64 v[2:3], -v[2:3], v[8:9], v[6:7]
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	s_mov_b64 s[6:7], s[60:61]
	v_writelane_b32 v63, s60, 19
	v_writelane_b32 v62, s94, 22
	v_div_fmas_f64 v[2:3], v[2:3], v[4:5], v[8:9]
	v_writelane_b32 v63, s61, 20
	v_writelane_b32 v62, s95, 23
	v_div_fixup_f64 v[0:1], v[2:3], s[2:3], v[0:1]
	s_mov_b64 s[4:5], s[62:63]
	v_writelane_b32 v63, s62, 21
	v_writelane_b32 v62, s76, 24
	v_accvgpr_write_b32 a51, v1
	v_accvgpr_write_b32 a47, v31
	v_writelane_b32 v63, s63, 22
	v_writelane_b32 v62, s77, 25
	v_accvgpr_write_b32 a50, v0
	s_mov_b64 s[8:9], s[54:55]
	s_mov_b32 s13, s48
	s_mov_b32 s14, s50
	v_accvgpr_write_b32 a46, v30
	v_mov_b32_e32 v31, v28
	v_mov_b32_e32 v0, v40
	v_mov_b32_e32 v1, v40
	v_writelane_b32 v62, s78, 26
	v_writelane_b32 v63, s40, 23
	v_accvgpr_write_b32 a36, v28
	v_writelane_b32 v62, s79, 27
	v_writelane_b32 v63, s41, 24
	v_accvgpr_write_b32 a48, v29
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, .L.str.3@rel32@lo+4
	s_addc_u32 s1, s1, .L.str.3@rel32@hi+12
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_printf_append_string_n@gotpcrel32@lo+4
	s_addc_u32 s3, s3, __ockl_printf_append_string_n@gotpcrel32@hi+12
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	v_readlane_b32 s12, v63, 15
	v_readlane_b32 s4, v63, 21
	v_readlane_b32 s6, v63, 19
	v_readlane_b32 s10, v63, 17
	v_readlane_b32 s13, v63, 16
	v_mov_b32_e32 v2, s0
	v_readlane_b32 s0, v62, 59
	v_readlane_b32 s5, v63, 22
	v_readlane_b32 s7, v63, 20
	s_mov_b64 s[8:9], s[54:55]
	v_readlane_b32 s11, v63, 18
	s_mov_b32 s13, s48
	s_mov_b32 s14, s50
	v_accvgpr_read_b32 v31, a36
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_printf_append_args@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_printf_append_args@gotpcrel32@hi+12
	s_load_dwordx2 s[96:97], s[0:1], 0x0
	v_readlane_b32 s12, v63, 15
	v_readlane_b32 s4, v63, 21
	v_readlane_b32 s6, v63, 19
	v_readlane_b32 s10, v63, 17
	v_readlane_b32 s13, v63, 16
	v_readlane_b32 s5, v63, 22
	v_readlane_b32 s7, v63, 20
	s_mov_b64 s[8:9], s[54:55]
	v_readlane_b32 s11, v63, 18
	s_mov_b32 s13, s48
	s_mov_b32 s14, s50
	v_accvgpr_read_b32 v31, a36
	v_mov_b32_e32 v2, 1
	v_accvgpr_read_b32 v3, a48
	v_mov_b32_e32 v4, v40
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, v40
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[96:97]
	v_readlane_b32 s12, v63, 15
	v_accvgpr_read_b32 v4, a50
	v_readlane_b32 s4, v63, 21
	v_readlane_b32 s6, v63, 19
	v_readlane_b32 s10, v63, 17
	v_readlane_b32 s13, v63, 16
	v_accvgpr_read_b32 v5, a51
	v_readlane_b32 s5, v63, 22
	v_readlane_b32 s7, v63, 20
	s_mov_b64 s[8:9], s[54:55]
	v_readlane_b32 s11, v63, 18
	s_mov_b32 s13, s48
	s_mov_b32 s14, s50
	v_accvgpr_read_b32 v31, a36
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v4
	v_mov_b32_e32 v4, v5
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, v40
	s_swappc_b64 s[30:31], s[96:97]
	v_readlane_b32 s12, v63, 15
	v_readlane_b32 s4, v63, 21
	v_readlane_b32 s6, v63, 19
	v_readlane_b32 s10, v63, 17
	v_readlane_b32 s13, v63, 16
	v_readlane_b32 s5, v63, 22
	v_readlane_b32 s7, v63, 20
	s_mov_b64 s[8:9], s[54:55]
	v_readlane_b32 s54, v62, 14
	v_readlane_b32 s11, v63, 18
	s_mov_b32 s13, s48
	s_mov_b32 s14, s50
	v_accvgpr_read_b32 v31, a36
	v_mov_b32_e32 v2, 1
	v_mov_b32_e32 v3, v41
	v_mov_b32_e32 v4, v40
	v_mov_b32_e32 v5, v40
	v_mov_b32_e32 v6, v40
	v_mov_b32_e32 v7, v40
	v_mov_b32_e32 v8, v40
	v_mov_b32_e32 v9, v40
	v_mov_b32_e32 v10, v40
	v_mov_b32_e32 v11, v40
	v_mov_b32_e32 v12, v40
	v_mov_b32_e32 v13, v40
	v_mov_b32_e32 v14, v40
	v_mov_b32_e32 v15, v40
	v_mov_b32_e32 v16, v40
	v_mov_b32_e32 v17, 1
	v_readlane_b32 s55, v62, 15
	s_swappc_b64 s[30:31], s[96:97]
	v_readlane_b32 s72, v62, 10
	v_readlane_b32 s74, v62, 12
	v_readlane_b32 s75, v62, 13
	v_accvgpr_read_b32 v30, a46
	v_readlane_b32 s40, v63, 23
	v_readlane_b32 s78, v62, 26
	v_readlane_b32 s76, v62, 24
	v_readlane_b32 s88, v62, 16
	v_readlane_b32 s74, v62, 2
	v_readlane_b32 s62, v63, 21
	v_readlane_b32 s60, v63, 19
	v_readlane_b32 s58, v62, 8
	v_readlane_b32 s96, v63, 17
	v_readlane_b32 s46, v63, 15
	v_accvgpr_read_b32 v29, a48
	v_accvgpr_read_b32 v31, a47
	v_accvgpr_read_b32 v28, a36
	v_readlane_b32 s41, v63, 24
	v_readlane_b32 s79, v62, 27
	v_readlane_b32 s77, v62, 25
	v_readlane_b32 s89, v62, 17
	v_readlane_b32 s90, v62, 18
	v_readlane_b32 s91, v62, 19
	v_readlane_b32 s92, v62, 20
	v_readlane_b32 s93, v62, 21
	v_readlane_b32 s94, v62, 22
	v_readlane_b32 s95, v62, 23
	v_readlane_b32 s73, v62, 11
	v_readlane_b32 s75, v62, 3
	v_readlane_b32 s63, v63, 22
	v_readlane_b32 s61, v63, 20
	v_readlane_b32 s59, v62, 9
	v_readlane_b32 s97, v63, 18
	v_readlane_b32 s47, v63, 16
.LBB4_74:                               ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[36:37]
	v_readlane_b32 s8, v62, 29
	v_readlane_b32 s22, v62, 43
	v_readlane_b32 s23, v62, 44
	v_readlane_b32 s18, v62, 39
	v_readlane_b32 s19, v62, 40
	s_nop 2
	global_load_dword v0, v40, s[22:23]
	s_nop 0
	global_load_dword v1, v40, s[18:19]
	v_readlane_b32 s0, v62, 45
	v_readlane_b32 s1, v62, 46
	v_readlane_b32 s12, v62, 33
	v_readlane_b32 s13, v62, 34
	v_readlane_b32 s9, v62, 30
	v_readlane_b32 s16, v62, 37
	v_readlane_b32 s17, v62, 38
	global_load_dword v2, v40, s[0:1]
	v_readlane_b32 s10, v62, 31
	v_readlane_b32 s11, v62, 32
	v_readlane_b32 s14, v62, 35
	v_readlane_b32 s15, v62, 36
	v_readlane_b32 s20, v62, 41
	v_readlane_b32 s21, v62, 42
	v_readlane_b32 s2, v62, 47
	v_readlane_b32 s3, v62, 48
	s_waitcnt vmcnt(2)
	v_readfirstlane_b32 s12, v0
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s0, v1
	s_lshl_b32 s1, s0, 16
	s_cmp_eq_u32 s1, 0xffff0000
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s13, v2
	s_cbranch_scc1 .LBB4_87
; %bb.75:                               ;   in Loop: Header=BB4_45 Depth=1
	global_load_dwordx2 v[0:1], v40, s[8:9]
	s_ashr_i32 s6, s1, 16
	s_ashr_i32 s4, s1, 14
	s_bfe_i32 s5, s0, 0x1000f
	s_add_u32 s0, s88, s4
	s_addc_u32 s1, s89, s5
	global_load_dword v2, v40, s[0:1]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s2, v0
	v_readfirstlane_b32 s3, v1
	s_sub_i32 s3, s3, s2
	s_add_u32 s4, s16, s4
	s_addc_u32 s5, s17, s5
	global_load_dword v0, v40, s[4:5]
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s5, v2
	s_cmp_lt_i32 s3, 1
	s_mul_i32 s4, s6, 0x4b0
	s_cbranch_scc1 .LBB4_80
; %bb.76:                               ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s6, s5, 1
	s_add_i32 s7, s5, s4
	s_mov_b32 s8, 0
	s_branch .LBB4_78
.LBB4_77:                               ;   in Loop: Header=BB4_78 Depth=2
	s_add_i32 s8, s8, 1
	s_cmp_ge_i32 s8, s3
	s_cbranch_scc1 .LBB4_80
.LBB4_78:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_add_i32 s9, s6, s8
	v_readlane_b32 s10, v62, 60
	s_cmp_lt_i32 s9, s10
	s_waitcnt vmcnt(0)
	v_cmp_ge_i32_e32 vcc, s9, v0
	s_cselect_b64 s[10:11], -1, 0
	s_and_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 vcc, exec, s[10:11]
	s_cbranch_vccnz .LBB4_77
; %bb.79:                               ;   in Loop: Header=BB4_78 Depth=2
	s_add_i32 s10, s2, s8
	s_ashr_i32 s11, s10, 31
	s_lshl_b64 s[10:11], s[10:11], 3
	s_add_u32 s10, s94, s10
	s_addc_u32 s11, s95, s11
	global_load_dwordx2 v[2:3], v40, s[10:11]
	s_add_i32 s10, s7, s8
	s_ashr_i32 s11, s10, 31
	s_lshl_b64 s[10:11], s[10:11], 3
	s_add_u32 s10, s90, s10
	s_addc_u32 s11, s91, s11
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[2:3], s[10:11] offset:8
	s_branch .LBB4_77
.LBB4_80:                               ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s5, s3, s5
	s_add_i32 s6, s5, 1
	v_readlane_b32 s7, v62, 60
	s_cmp_ge_i32 s6, s7
	v_mov_b32_e32 v1, s5
	s_cselect_b64 s[2:3], -1, 0
	s_cmp_lt_i32 s6, s7
	global_store_dword v40, v1, s[0:1]
	s_cbranch_scc0 .LBB4_82
; %bb.81:                               ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s0, s5, s4
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 3
	s_add_u32 s0, s90, s0
	s_addc_u32 s1, s91, s1
	global_load_dwordx2 v[2:3], v40, s[0:1]
	s_load_dwordx2 s[0:1], s[58:59], 0xa0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u64_e32 vcc, s[0:1], v[2:3]
	v_cmp_ge_i32_e64 s[0:1], s5, v0
	s_and_b64 s[2:3], vcc, s[0:1]
.LBB4_82:                               ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB4_87
; %bb.83:                               ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v0, -1
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	global_store_dword v40, v0, s[26:27]
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	global_load_dwordx2 v[0:1], v40, s[18:19]
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_sub_i32 s2, s1, s0
	s_cmp_lt_i32 s2, 1
	s_cbranch_scc1 .LBB4_87
; %bb.84:                               ;   in Loop: Header=BB4_45 Depth=1
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 2
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	s_mov_b32 s3, 0
.LBB4_85:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v0, v40, s[0:1]
	s_add_i32 s4, s13, s3
	s_ashr_i32 s5, s4, 31
	s_lshr_b32 s5, s5, 28
	s_add_i32 s5, s4, s5
	s_and_b32 s5, s5, -16
	s_sub_i32 s4, s4, s5
	s_ashr_i32 s5, s4, 31
	s_lshl_b64 s[4:5], s[4:5], 2
	s_add_u32 s4, s28, s4
	s_addc_u32 s5, s29, s5
	s_add_i32 s3, s3, 1
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0
	s_cmp_lt_i32 s3, s2
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[4:5]
	s_cbranch_scc1 .LBB4_85
; %bb.86:                               ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s13, s13, s3
.LBB4_87:                               ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	global_load_dword v0, v40, s[18:19] offset:4
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	s_waitcnt vmcnt(0)
	v_cmp_gt_i32_e32 vcc, 1, v0
	v_readfirstlane_b32 s6, v0
	s_cbranch_vccnz .LBB4_100
; %bb.88:                               ;   in Loop: Header=BB4_45 Depth=1
	s_cmp_eq_u32 s6, 1
	s_cbranch_scc1 .LBB4_93
; %bb.89:                               ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s1, s6, -2
	s_lshr_b32 s0, s1, 1
	s_add_i32 s0, s0, 1
	s_and_b32 s2, s0, 7
	s_cmp_lt_u32 s1, 14
	s_cbranch_scc1 .LBB4_94
; %bb.90:                               ;   in Loop: Header=BB4_45 Depth=1
	s_and_b32 s3, s0, -8
	v_readlane_b32 s0, v62, 63
	s_mov_b32 s4, 0
	v_readlane_b32 s1, v63, 0
	s_mov_b32 s50, 0
.LBB4_91:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_nop 3
	global_load_dwordx4 v[2:5], v40, s[0:1] offset:-32
	global_load_dwordx4 v[6:9], v40, s[0:1] offset:-16
	global_load_dwordx4 v[10:13], v40, s[0:1]
	global_load_dwordx4 v[14:17], v40, s[0:1] offset:16
	v_mov_b32_e32 v0, s4
	s_add_i32 s50, s50, 16
	s_add_i32 s4, s4, 64
	s_add_u32 s0, s0, 64
	s_addc_u32 s1, s1, 0
	s_add_i32 s3, s3, -8
	s_cmp_lg_u32 s3, 0
	s_waitcnt vmcnt(3)
	ds_write_b128 v0, v[2:5]
	s_waitcnt vmcnt(2)
	ds_write_b128 v0, v[6:9] offset:16
	s_waitcnt vmcnt(1)
	ds_write_b128 v0, v[10:13] offset:32
	s_waitcnt vmcnt(0)
	ds_write_b128 v0, v[14:17] offset:48
	s_cbranch_scc1 .LBB4_91
; %bb.92:                               ;   in Loop: Header=BB4_45 Depth=1
	s_cmp_lg_u32 s2, 0
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB4_95
	s_branch .LBB4_97
.LBB4_93:                               ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
	s_cbranch_execnz .LBB4_98
	s_branch .LBB4_100
.LBB4_94:                               ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
	s_cbranch_execz .LBB4_97
.LBB4_95:                               ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	s_lshl_b32 s3, s50, 2
	s_lshl_b64 s[0:1], s[50:51], 2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_96:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dwordx2 v[2:3], v40, s[0:1]
	v_mov_b32_e32 v0, s3
	s_add_i32 s3, s3, 8
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_add_i32 s2, s2, -1
	s_cmp_lg_u32 s2, 0
	s_waitcnt vmcnt(0)
	ds_write_b64 v0, v[2:3]
	s_cbranch_scc1 .LBB4_96
.LBB4_97:                               ;   in Loop: Header=BB4_45 Depth=1
	s_and_b32 s50, s6, 0x7ffffffe
	s_cmp_lg_u32 s6, s50
	s_cselect_b64 s[0:1], -1, 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccz .LBB4_100
.LBB4_98:                               ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	s_lshl_b64 s[0:1], s[50:51], 2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	s_add_u32 s0, s20, s0
	s_addc_u32 s1, s21, s1
	s_sub_i32 s2, s6, s50
	s_lshl_b32 s3, s50, 2
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_99:                               ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v1, v40, s[0:1]
	s_add_u32 s0, s0, 4
	v_mov_b32_e32 v0, s3
	s_addc_u32 s1, s1, 0
	s_add_i32 s2, s2, -1
	s_add_i32 s3, s3, 4
	s_cmp_lg_u32 s2, 0
	s_waitcnt vmcnt(0)
	ds_write_b32 v0, v1
	s_cbranch_scc1 .LBB4_99
.LBB4_100:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	global_load_dword v0, v40, s[26:27]
	s_mov_b32 s2, 0
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	s_lshl_b32 s1, s0, 16
	s_cmp_eq_u32 s1, 0xffff0000
	s_cbranch_scc1 .LBB4_109
; %bb.101:                              ;   in Loop: Header=BB4_45 Depth=1
	s_ashr_i32 s2, s1, 16
	s_lshl_b32 s1, s0, 16
	s_ashr_i32 s3, s1, 14
	s_bfe_i32 s4, s0, 0x1000f
	v_mov_b32_e32 v1, s2
	s_add_u32 s0, s88, s3
	global_load_dword v0, v40, s[18:19]
	s_nop 0
	global_store_dword v40, v1, s[26:27]
	global_store_dword v40, v40, s[16:17]
	global_store_dword v40, v40, s[18:19]
	s_addc_u32 s1, s89, s4
	global_load_dword v1, v40, s[0:1]
	s_add_u32 s0, s24, s3
	s_addc_u32 s1, s25, s4
	global_load_dword v2, v40, s[0:1]
	s_mulk_i32 s2, 0x4b0
	s_mov_b64 s[4:5], s[92:93]
	s_waitcnt vmcnt(5)
	v_readfirstlane_b32 s1, v0
	s_waitcnt vmcnt(1)
	v_readfirstlane_b32 s7, v1
	s_add_i32 s2, s7, s2
	s_waitcnt vmcnt(0)
	v_sub_u32_e32 v0, v2, v1
	v_med3_i32 v0, v0, 1, 8
	s_nop 0
	v_readfirstlane_b32 s0, v0
	s_mov_b32 s8, s0
.LBB4_102:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[10:11], s[2:3], 3
	s_add_u32 s10, s90, s10
	s_addc_u32 s11, s91, s11
	global_load_dwordx2 v[0:1], v40, s[10:11]
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[0:1], s[4:5]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	s_add_i32 s2, s2, 1
	s_add_i32 s8, s8, -1
	s_cmp_eq_u32 s8, 0
	s_cbranch_scc0 .LBB4_102
; %bb.103:                              ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s5, s0, s7
	s_ashr_i32 s2, s5, 31
	s_lshr_b32 s2, s2, 20
	s_add_i32 s2, s5, s2
	s_and_b32 s2, s2, 0xfffff000
	s_sub_i32 s4, s6, s1
	s_sub_i32 s2, s5, s2
	s_cmp_lg_u32 s2, 0
	s_cselect_b32 s2, s2, 0x1000
	v_readlane_b32 s16, v62, 29
	v_mov_b32_e32 v0, s2
	s_cmp_lt_i32 s4, 1
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	global_store_dword v40, v0, s[22:23]
	s_cbranch_scc1 .LBB4_117
; %bb.104:                              ;   in Loop: Header=BB4_45 Depth=1
	s_cmp_eq_u32 s4, 1
	s_cbranch_scc1 .LBB4_110
; %bb.105:                              ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s3, s4, -2
	s_lshr_b32 s2, s3, 1
	s_add_i32 s2, s2, 1
	s_and_b32 s6, s2, 7
	s_cmp_lt_u32 s3, 14
	s_cbranch_scc1 .LBB4_111
; %bb.106:                              ;   in Loop: Header=BB4_45 Depth=1
	s_and_b32 s8, s2, -8
	v_readlane_b32 s2, v62, 63
	s_lshl_b32 s7, s1, 2
	s_mov_b32 s50, 0
	v_readlane_b32 s3, v63, 0
.LBB4_107:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s7
	ds_read2_b32 v[2:3], v0 offset1:1
	ds_read2_b32 v[4:5], v0 offset0:2 offset1:3
	ds_read2_b32 v[6:7], v0 offset0:4 offset1:5
	ds_read2_b32 v[8:9], v0 offset0:6 offset1:7
	ds_read2_b32 v[10:11], v0 offset0:8 offset1:9
	ds_read2_b32 v[12:13], v0 offset0:10 offset1:11
	ds_read2_b32 v[14:15], v0 offset0:12 offset1:13
	ds_read2_b32 v[16:17], v0 offset0:14 offset1:15
	s_add_i32 s50, s50, 16
	s_waitcnt lgkmcnt(6)
	global_store_dwordx4 v40, v[2:5], s[2:3] offset:-32
	s_waitcnt lgkmcnt(4)
	global_store_dwordx4 v40, v[6:9], s[2:3] offset:-16
	s_waitcnt lgkmcnt(2)
	global_store_dwordx4 v40, v[10:13], s[2:3]
	s_waitcnt lgkmcnt(0)
	global_store_dwordx4 v40, v[14:17], s[2:3] offset:16
	s_add_u32 s2, s2, 64
	s_addc_u32 s3, s3, 0
	s_add_i32 s8, s8, -8
	s_add_i32 s7, s7, 64
	s_cmp_lg_u32 s8, 0
	s_cbranch_scc1 .LBB4_107
; %bb.108:                              ;   in Loop: Header=BB4_45 Depth=1
	s_cmp_lg_u32 s6, 0
	s_cselect_b64 s[2:3], -1, 0
	s_and_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB4_112
	s_branch .LBB4_114
.LBB4_109:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
	s_mov_b32 s0, 0
	s_branch .LBB4_123
.LBB4_110:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
	s_cbranch_execnz .LBB4_115
	s_branch .LBB4_117
.LBB4_111:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
	s_cbranch_execz .LBB4_114
.LBB4_112:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	s_lshl_b64 s[2:3], s[50:51], 2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	s_add_u32 s2, s20, s2
	s_addc_u32 s3, s21, s3
	s_lshl_b32 s7, s1, 2
	s_lshl2_add_u32 s7, s50, s7
	s_lshl_b32 s6, s6, 3
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_113:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s7
	ds_read2_b32 v[0:1], v0 offset1:1
	s_waitcnt lgkmcnt(0)
	global_store_dwordx2 v40, v[0:1], s[2:3]
	s_add_u32 s2, s2, 8
	s_addc_u32 s3, s3, 0
	s_add_i32 s7, s7, 8
	s_add_i32 s6, s6, -8
	s_cmp_lg_u32 s6, 0
	s_cbranch_scc1 .LBB4_113
.LBB4_114:                              ;   in Loop: Header=BB4_45 Depth=1
	s_and_b32 s50, s4, 0x7ffffffe
	s_cmp_lg_u32 s4, s50
	s_cselect_b64 s[2:3], -1, 0
	s_and_b64 vcc, exec, s[2:3]
	s_cbranch_vccz .LBB4_117
.LBB4_115:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	s_lshl_b64 s[2:3], s[50:51], 2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	s_add_u32 s2, s20, s2
	s_addc_u32 s3, s21, s3
	s_lshl_b32 s1, s1, 2
	s_lshl2_add_u32 s1, s50, s1
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_116:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_mov_b32_e32 v0, s1
	ds_read_b32 v0, v0
	s_add_i32 s50, s50, 1
	s_waitcnt lgkmcnt(0)
	global_store_dword v40, v0, s[2:3]
	s_add_u32 s2, s2, 4
	s_addc_u32 s3, s3, 0
	s_add_i32 s1, s1, 4
	s_cmp_ge_i32 s50, s4
	s_cbranch_scc0 .LBB4_116
.LBB4_117:                              ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s1, s5, 0xfff
	s_ashr_i32 s2, s1, 31
	s_lshr_b32 s2, s2, 20
	s_add_i32 s1, s1, s2
	s_ashr_i32 s2, s1, 12
	s_cmp_ge_i32 s4, s2
	s_cbranch_scc1 .LBB4_120
; %bb.118:                              ;   in Loop: Header=BB4_45 Depth=1
	s_ashr_i32 s5, s4, 31
	v_readlane_b32 s16, v62, 29
	s_lshl_b64 s[6:7], s[4:5], 2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	s_add_u32 s6, s20, s6
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	s_addc_u32 s7, s21, s7
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_119:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_ashr_i32 s1, s12, 31
	s_lshr_b32 s1, s1, 28
	s_add_i32 s1, s12, s1
	s_and_b32 s1, s1, -16
	s_sub_i32 s8, s12, s1
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 2
	s_add_u32 s8, s28, s8
	s_addc_u32 s9, s29, s9
	global_load_dword v0, v40, s[8:9]
	s_add_i32 s12, s12, 1
	s_add_i32 s4, s4, 1
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[6:7]
	s_add_u32 s6, s6, 4
	s_addc_u32 s7, s7, 0
	s_cmp_lt_i32 s4, s2
	s_cbranch_scc1 .LBB4_119
.LBB4_120:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 1
	s_branch .LBB4_123
.LBB4_121:                              ;   in Loop: Header=BB4_123 Depth=2
	s_add_i32 s1, s7, 0xfff
	s_ashr_i32 s3, s1, 31
	s_lshr_b32 s3, s3, 20
	s_add_i32 s1, s1, s3
	s_ashr_i32 s1, s1, 12
	s_add_i32 s2, s1, s2
	s_add_i32 s1, s6, 1
	v_readlane_b32 s8, v62, 45
	s_add_i32 s0, s7, s0
	s_mov_b32 s50, 1
	v_mov_b32_e32 v0, s1
	v_readlane_b32 s10, v62, 47
	v_readlane_b32 s11, v62, 48
	v_readlane_b32 s9, v62, 46
	s_nop 3
	global_store_dword v40, v0, s[10:11]
.LBB4_122:                              ;   in Loop: Header=BB4_123 Depth=2
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB4_130
.LBB4_123:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_127 Depth 3
	s_cmp_eq_u32 s50, 0
	s_cselect_b64 s[4:5], -1, 0
	s_cmp_lt_i32 s0, 8
	s_cselect_b64 s[6:7], -1, 0
	s_and_b64 s[4:5], s[4:5], s[6:7]
	s_andn2_b64 vcc, exec, s[4:5]
	s_mov_b64 s[4:5], -1
	s_cbranch_vccnz .LBB4_122
; %bb.124:                              ;   in Loop: Header=BB4_123 Depth=2
	v_readlane_b32 s4, v62, 45
	v_readlane_b32 s6, v62, 47
	v_readlane_b32 s7, v62, 48
	s_load_dword s1, s[58:59], 0x108
	v_readlane_b32 s5, v62, 46
	s_mov_b32 s50, 0
	s_nop 1
	global_load_dword v0, v40, s[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_le_i32_e64 s[4:5], s1, v0
	v_readfirstlane_b32 s6, v0
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB4_122
; %bb.125:                              ;   in Loop: Header=BB4_123 Depth=2
	v_readlane_b32 s16, v62, 29
	v_mov_b32_e32 v0, s6
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	s_ashr_i32 s7, s6, 31
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s24, v62, 37
	s_lshl_b64 s[8:9], s[6:7], 2
	v_readlane_b32 s18, v62, 31
	global_store_dword v40, v0, s[26:27]
	v_mov_b32_e32 v0, s0
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s25, v62, 38
	global_store_dword v40, v0, s[16:17]
	v_mov_b32_e32 v0, s2
	s_add_u32 s8, s24, s8
	s_addc_u32 s9, s25, s9
	global_store_dword v40, v0, s[18:19]
	global_load_dword v0, v40, s[8:9]
	s_sub_i32 s1, 8, s0
	s_min_u32 s1, s1, 8
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s3, v0
	v_cmp_gt_i32_e32 vcc, 1, v0
	s_min_i32 s7, s3, s1
	s_cbranch_vccnz .LBB4_128
; %bb.126:                              ;   in Loop: Header=BB4_123 Depth=2
	s_mul_i32 s8, s6, 0x4b0
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 3
	s_add_u32 s8, s90, s8
	s_addc_u32 s9, s91, s9
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[10:11], s[0:1], 3
	s_add_u32 s10, s92, s10
	s_addc_u32 s11, s93, s11
	s_mov_b32 s1, s7
.LBB4_127:                              ;   Parent Loop BB4_45 Depth=1
                                        ;     Parent Loop BB4_123 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	global_load_dwordx2 v[2:3], v40, s[8:9]
	s_add_u32 s8, s8, 8
	s_addc_u32 s9, s9, 0
	s_waitcnt vmcnt(0)
	global_store_dwordx2 v40, v[2:3], s[10:11]
	s_add_u32 s10, s10, 8
	s_addc_u32 s11, s11, 0
	s_add_i32 s1, s1, -1
	s_cmp_eq_u32 s1, 0
	s_cbranch_scc0 .LBB4_127
.LBB4_128:                              ;   in Loop: Header=BB4_123 Depth=2
	s_ashr_i32 s1, s7, 31
	s_lshr_b32 s1, s1, 20
	s_add_i32 s1, s7, s1
	s_and_b32 s1, s1, 0xfffff000
	s_sub_i32 s1, s7, s1
	s_cmp_lg_u32 s1, 0
	v_cmp_lt_i32_e32 vcc, 0, v0
	s_cselect_b32 s1, s1, 0x1000
	v_readlane_b32 s16, v62, 29
	v_mov_b32_e32 v0, s1
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	s_and_b64 vcc, exec, vcc
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	global_store_dword v40, v0, s[22:23]
	s_cbranch_vccz .LBB4_121
; %bb.129:                              ;   in Loop: Header=BB4_123 Depth=2
	s_ashr_i32 s1, s12, 31
	s_lshr_b32 s1, s1, 28
	s_add_i32 s1, s12, s1
	s_and_b32 s1, s1, -16
	s_sub_i32 s8, s12, s1
	s_ashr_i32 s9, s8, 31
	s_lshl_b64 s[8:9], s[8:9], 2
	s_add_u32 s8, s28, s8
	s_addc_u32 s9, s29, s9
	global_load_dword v0, v40, s[8:9]
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[8:9], s[2:3], 2
	s_add_u32 s8, s20, s8
	s_addc_u32 s9, s21, s9
	s_add_i32 s12, s12, 1
	s_waitcnt vmcnt(0)
	global_store_dword v40, v0, s[8:9]
	s_branch .LBB4_121
.LBB4_130:                              ;   in Loop: Header=BB4_45 Depth=1
	s_cmp_lg_u32 s50, 0
	s_cbranch_scc1 .LBB4_132
; %bb.131:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_mov_b32_e32 v0, -1
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	global_store_dword v40, v0, s[26:27]
.LBB4_132:                              ;   in Loop: Header=BB4_45 Depth=1
	s_add_i32 s1, s50, -1
	s_lshl_b64 s[6:7], s[50:51], 2
	v_readlane_b32 s16, v62, 29
	v_readlane_b32 s17, v62, 30
	s_add_u32 s4, s16, s6
	v_readlane_b32 s18, v62, 31
	s_addc_u32 s5, s17, s7
	v_readlane_b32 s19, v62, 32
	s_add_u32 s6, s18, s6
	s_addc_u32 s7, s19, s7
	v_mov_b32_e32 v0, s0
	v_mov_b32_e32 v1, s2
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
.LBB4_133:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_add_i32 s1, s1, 1
	global_store_dword v40, v0, s[4:5]
	global_store_dword v40, v1, s[6:7]
	s_add_u32 s4, s4, 4
	s_addc_u32 s5, s5, 0
	s_add_u32 s6, s6, 4
	s_addc_u32 s7, s7, 0
	s_cmp_lt_i32 s1, 1
	s_cbranch_scc1 .LBB4_133
; %bb.134:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s16, v62, 29
	v_mov_b32_e32 v0, s12
	v_readlane_b32 s30, v62, 43
	v_readlane_b32 s31, v62, 44
	v_readlane_b32 s4, v62, 45
	v_readlane_b32 s5, v62, 46
	s_cmp_lg_u32 s0, 0
	v_readlane_b32 s17, v62, 30
	v_readlane_b32 s18, v62, 31
	global_store_dword v40, v0, s[30:31]
	v_mov_b32_e32 v0, s13
	v_readlane_b32 s19, v62, 32
	v_readlane_b32 s20, v62, 33
	v_readlane_b32 s21, v62, 34
	v_readlane_b32 s22, v62, 35
	v_readlane_b32 s23, v62, 36
	v_readlane_b32 s24, v62, 37
	v_readlane_b32 s25, v62, 38
	v_readlane_b32 s26, v62, 39
	v_readlane_b32 s27, v62, 40
	v_readlane_b32 s28, v62, 41
	v_readlane_b32 s29, v62, 42
	v_readlane_b32 s6, v62, 47
	v_readlane_b32 s7, v62, 48
	global_store_dword v40, v0, s[4:5]
	s_memrealtime s[2:3]
	s_cbranch_scc0 .LBB4_140
; %bb.135:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s0, 0
	v_lshl_add_u32 v0, v61, 2, s0
	scratch_load_dword v0, v0, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v8, v61, 3, s0
	scratch_load_dwordx2 v[4:5], v8, off
	s_waitcnt vmcnt(1)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[68:69]
	global_load_dwordx2 v[2:3], v[2:3], off
	s_waitcnt vmcnt(1)
	v_or_b32_e32 v41, s81, v5
	v_lshl_add_u64 v[6:7], v[4:5], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v8, v[6:7], off
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[4:5], exec, s[0:1]
	s_cbranch_execz .LBB4_137
; %bb.136:                              ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v6, s80
	v_cvt_f32_u32_e32 v7, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s6, s0, s2
	s_mul_hi_u32 s8, s0, s3
	s_mul_i32 s7, s1, s3
	s_add_i32 s6, s8, s6
	s_mul_i32 s9, s0, s3
	s_add_i32 s6, s6, s7
	s_mul_i32 s8, s3, s6
	s_mul_hi_u32 s10, s3, s9
	s_mul_hi_u32 s7, s3, s6
	s_add_u32 s8, s10, s8
	s_addc_u32 s7, 0, s7
	s_mul_hi_u32 s11, s2, s9
	s_mul_i32 s9, s2, s9
	s_add_u32 s8, s8, s9
	s_mul_hi_u32 s10, s2, s6
	s_addc_u32 s7, s7, s11
	s_addc_u32 s8, s10, 0
	s_mul_i32 s6, s2, s6
	s_add_u32 s6, s7, s6
	s_addc_u32 s7, 0, s8
	s_add_u32 s3, s3, s6
	s_addc_u32 s2, s2, s7
	s_mul_i32 s6, s0, s2
	s_mul_hi_u32 s7, s0, s3
	s_add_i32 s6, s7, s6
	s_mul_i32 s1, s1, s3
	s_add_i32 s6, s6, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s7, s2, s0
	s_mul_i32 s8, s2, s0
	s_mul_i32 s10, s3, s6
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s9, s3, s6
	s_add_u32 s0, s0, s10
	s_addc_u32 s9, 0, s9
	s_add_u32 s0, s0, s8
	s_mul_hi_u32 s1, s2, s6
	s_addc_u32 s0, s9, s7
	s_addc_u32 s1, s1, 0
	s_mul_i32 s6, s2, s6
	s_add_u32 s0, s0, s6
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s2, 0
	v_mul_hi_u32 v8, v4, s3
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s51
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v8, s81, v6
	v_mul_lo_u32 v9, s80, v7
	v_mad_u64_u32 v[6:7], s[0:1], s80, v6, 0
	v_add3_u32 v7, v7, v9, v8
	v_sub_u32_e32 v8, v5, v7
	v_mov_b32_e32 v9, s81
	v_sub_co_u32_e32 v4, vcc, v4, v6
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v8, v9, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s80, v4
	v_subb_co_u32_e32 v5, vcc, v5, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v10, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v10
	v_subb_co_u32_e64 v6, s[0:1], v6, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v8
	v_subrev_co_u32_e64 v9, s[0:1], s80, v8
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v10
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, v11, v12, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v5
	v_cmp_ne_u32_e64 s[0:1], 0, v11
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v4
	v_cndmask_b32_e64 v6, v10, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v5
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v5, v6, vcc
	v_cndmask_b32_e64 v5, v8, v9, s[0:1]
	v_cndmask_b32_e32 v6, v4, v5, vcc
                                        ; implicit-def: $vgpr4_vgpr5
.LBB4_137:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[4:5]
	s_cbranch_execz .LBB4_139
; %bb.138:                              ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v5, s80
	s_waitcnt lgkmcnt(0)
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v7, v40
	v_rcp_iflag_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x4f7ffffe, v5
	v_cvt_u32_f32_e32 v5, v5
	v_mul_lo_u32 v6, s2, v5
	v_mul_hi_u32 v6, v5, v6
	v_add_u32_e32 v5, v5, v6
	v_mul_hi_u32 v5, v4, v5
	v_mul_lo_u32 v5, v5, s80
	v_sub_u32_e32 v4, v4, v5
	v_subrev_u32_e32 v5, s80, v4
	v_cmp_le_u32_e32 vcc, s80, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s80, v4
	v_cmp_le_u32_e32 vcc, s80, v4
	s_nop 1
	v_cndmask_b32_e32 v6, v4, v5, vcc
.LBB4_139:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_accvgpr_read_b32 v4, a40
	v_readlane_b32 s0, v63, 3
	v_accvgpr_read_b32 v5, a41
	v_mov_b32_e32 v41, v4
	s_waitcnt lgkmcnt(0)
	s_mov_b32 s2, s0
	s_mov_b32 s3, s0
	s_waitcnt vmcnt(1)
	v_lshl_add_u64 v[2:3], v[6:7], 3, v[2:3]
	v_lshl_add_u64 v[4:5], v[40:41], 0, s[2:3]
	flat_store_dwordx2 v[2:3], v[4:5] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[84:85]
	v_mov_b64_e32 v[2:3], 1
	global_atomic_add_x2 v[0:1], v[2:3], off
	v_add_u32_e32 v0, 1, v61
	v_sub_u32_e32 v2, 0, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_max_i32_e32 v0, v2, v0
	v_accvgpr_read_b32 v2, a37
	v_mul_hi_u32 v2, v0, v2
	v_mul_lo_u32 v2, v2, s53
	v_sub_u32_e32 v0, v0, v2
	v_subrev_u32_e32 v2, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_readlane_b32 s1, v63, 4
	v_writelane_b32 v63, s0, 3
	v_cndmask_b32_e32 v0, v0, v2, vcc
	v_subrev_u32_e32 v2, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_writelane_b32 v63, s1, 4
	s_nop 0
	v_cndmask_b32_e32 v0, v0, v2, vcc
	v_xor_b32_e32 v0, v0, v1
	v_sub_u32_e32 v22, v0, v1
	s_branch .LBB4_151
.LBB4_140:                              ;   in Loop: Header=BB4_45 Depth=1
                                        ; implicit-def: $vgpr22
	s_cbranch_execz .LBB4_151
; %bb.141:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v62, 57
	v_readlane_b32 s1, v62, 58
	s_andn2_b64 vcc, exec, s[0:1]
	v_mov_b32_e32 v22, v61
	s_cbranch_vccnz .LBB4_151
; %bb.142:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s50, 0
.LBB4_143:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_148 Depth 3
	s_lshl_b64 s[4:5], s[50:51], 3
	s_add_u32 s0, s54, s4
	s_addc_u32 s1, s55, s5
	v_mov_b64_e32 v[0:1], s[0:1]
	v_mov_b64_e32 v[2:3], 1
	s_add_u32 s0, s70, s4
	;;#ASMSTART
	flat_atomic_add_x2 v[2:3], v[0:1], v[2:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_addc_u32 s1, s71, s5
	global_load_dwordx2 v[0:1], v40, s[0:1]
	v_or_b32_e32 v41, s83, v3
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB4_145
; %bb.144:                              ;   in Loop: Header=BB4_143 Depth=2
	v_cvt_f32_u32_e32 v4, s82
	v_cvt_f32_u32_e32 v5, s83
	s_sub_u32 s0, 0, s82
	s_subb_u32 s1, 0, s83
	v_mov_b32_e32 v7, v40
	v_fmac_f32_e32 v4, 0x4f800000, v5
	v_rcp_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v5, 0x2f800000, v4
	v_trunc_f32_e32 v5, v5
	v_fmac_f32_e32 v4, 0xcf800000, v5
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v4, v4
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s2, v5
	v_readfirstlane_b32 s3, v4
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s10, s0, s3
	s_mul_i32 s9, s1, s3
	s_add_i32 s8, s10, s8
	s_mul_i32 s11, s0, s3
	s_add_i32 s8, s8, s9
	s_mul_i32 s10, s3, s8
	s_mul_hi_u32 s12, s3, s11
	s_mul_hi_u32 s9, s3, s8
	s_add_u32 s10, s12, s10
	s_addc_u32 s9, 0, s9
	s_mul_hi_u32 s13, s2, s11
	s_mul_i32 s11, s2, s11
	s_add_u32 s10, s10, s11
	s_mul_hi_u32 s12, s2, s8
	s_addc_u32 s9, s9, s13
	s_addc_u32 s10, s12, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s8, s9, s8
	s_addc_u32 s9, 0, s10
	s_add_u32 s3, s3, s8
	s_addc_u32 s2, s2, s9
	s_mul_i32 s8, s0, s2
	s_mul_hi_u32 s9, s0, s3
	s_add_i32 s8, s9, s8
	s_mul_i32 s1, s1, s3
	s_add_i32 s8, s8, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s9, s2, s0
	s_mul_i32 s10, s2, s0
	s_mul_i32 s12, s3, s8
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s11, s3, s8
	s_add_u32 s0, s0, s12
	s_addc_u32 s11, 0, s11
	s_add_u32 s0, s0, s10
	s_mul_hi_u32 s1, s2, s8
	s_addc_u32 s0, s11, s9
	s_addc_u32 s1, s1, 0
	s_mul_i32 s8, s2, s8
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[4:5], s[0:1], v2, s2, 0
	v_mul_hi_u32 v6, v2, s3
	v_lshl_add_u64 v[4:5], v[6:7], 0, v[4:5]
	v_mad_u64_u32 v[8:9], s[0:1], v3, s3, 0
	v_add_co_u32_e32 v4, vcc, v4, v8
	v_mad_u64_u32 v[6:7], s[0:1], v3, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v9, vcc
	v_mov_b32_e32 v5, s51
	s_nop 0
	v_addc_co_u32_e32 v7, vcc, 0, v7, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[6:7]
	v_mul_lo_u32 v6, s83, v4
	v_mul_lo_u32 v7, s82, v5
	v_mad_u64_u32 v[4:5], s[0:1], s82, v4, 0
	v_add3_u32 v5, v5, v7, v6
	v_sub_u32_e32 v6, v3, v5
	v_mov_b32_e32 v7, s83
	v_sub_co_u32_e32 v4, vcc, v2, v4
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v6, v7, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s82, v4
	v_subb_co_u32_e32 v5, vcc, v3, v5, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v9, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s83, v9
	v_subb_co_u32_e64 v6, s[0:1], v6, v7, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s82, v8
	v_subrev_co_u32_e64 v7, s[0:1], s82, v8
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s83, v9
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, v10, v11, s[2:3]
	v_cmp_ne_u32_e64 s[0:1], 0, v10
	v_cmp_le_u32_e32 vcc, s83, v5
	s_nop 0
	v_cndmask_b32_e64 v6, v9, v6, s[0:1]
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s82, v4
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s83, v5
	s_nop 1
	v_cndmask_b32_e32 v9, v9, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v9
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cndmask_b32_e64 v6, v8, v7, s[0:1]
	v_cndmask_b32_e32 v4, v4, v6, vcc
.LBB4_145:                              ;   in Loop: Header=BB4_143 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB4_147
; %bb.146:                              ;   in Loop: Header=BB4_143 Depth=2
	v_cvt_f32_u32_e32 v4, s82
	s_waitcnt lgkmcnt(0)
	s_sub_i32 s2, 0, s82
	v_rcp_iflag_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, s2, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v2, v4
	v_mul_lo_u32 v4, v4, s82
	v_sub_u32_e32 v4, v2, v4
	v_subrev_u32_e32 v5, s82, v4
	v_cmp_le_u32_e32 vcc, s82, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s82, v4
	v_cmp_le_u32_e32 vcc, s82, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_mov_b32_e32 v5, v40
.LBB4_147:                              ;   in Loop: Header=BB4_143 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[0:1], v[4:5], 3, v[0:1]
	v_mov_b64_e32 v[4:5], 0
	;;#ASMSTART
	global_store_dwordx2 v[0:1], v[4:5], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	s_waitcnt lgkmcnt(0)
	s_add_u32 s2, s86, s4
	s_mov_b64 s[0:1], 0
	s_addc_u32 s3, s87, s5
	v_lshl_add_u64 v[0:1], v[2:3], 0, 1
	buffer_wbl2 sc1
.LBB4_148:                              ;   Parent Loop BB4_45 Depth=1
                                        ;     Parent Loop BB4_143 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_mov_b64_e32 v[4:5], s[2:3]
	;;#ASMSTART
	flat_atomic_cmpswap_x2 v[4:5], v[4:5], v[0:3] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_nop 0
	v_cmp_eq_u64_e32 vcc, v[4:5], v[2:3]
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB4_148
; %bb.149:                              ;   in Loop: Header=BB4_143 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_add_i32 s50, s50, 1
	v_readlane_b32 s0, v62, 4
	s_cmp_eq_u32 s50, s0
	v_readlane_b32 s1, v62, 5
	s_cbranch_scc0 .LBB4_143
; %bb.150:                              ;   in Loop: Header=BB4_45 Depth=1
	v_mov_b32_e32 v22, v61
.LBB4_151:                              ;   in Loop: Header=BB4_45 Depth=1
	v_add_u32_e32 v12, 1, v29
	s_xor_b64 s[0:1], exec, -1
.LBB4_152:                              ;   in Loop: Header=BB4_45 Depth=1
	s_waitcnt lgkmcnt(0)
	v_readlane_b32 s2, v63, 13
	v_readlane_b32 s3, v63, 14
	s_or_b64 exec, exec, s[2:3]
	s_and_b64 s[4:5], s[0:1], exec
	v_readlane_b32 s0, v63, 11
	v_readlane_b32 s1, v63, 12
                                        ; implicit-def: $vgpr4
.LBB4_153:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_saveexec_b64 s[6:7], s[0:1]
	v_accvgpr_read_b32 v2, a40
	v_accvgpr_read_b32 v0, a34
	v_readlane_b32 s0, v63, 9
	v_mov_b64_e32 v[14:15], s[40:41]
	v_accvgpr_read_b32 v3, a41
	v_accvgpr_read_b32 v1, a35
	v_readlane_b32 s1, v63, 10
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execz .LBB4_242
; %bb.154:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0x387
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_mov_b64 s[0:1], -1
                                        ; implicit-def: $vgpr2_vgpr3
                                        ; implicit-def: $vgpr22
                                        ; implicit-def: $vgpr0_vgpr1
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB4_241
; %bb.155:                              ;   in Loop: Header=BB4_45 Depth=1
	s_load_dword s0, s[58:59], 0x140
	s_waitcnt vmcnt(0)
	v_sub_co_u32_e32 v4, vcc, v44, v42
	v_accvgpr_read_b32 v0, a34
	s_nop 0
	v_subb_co_u32_e32 v5, vcc, v45, v43, vcc
	v_cmp_lt_i32_e32 vcc, 0, v4
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u32_e64 s[0:1], s0, v4
	s_and_b64 s[12:13], vcc, s[0:1]
	s_mov_b64 s[0:1], -1
	s_mov_b64 s[10:11], 0
	v_accvgpr_read_b32 v1, a35
	s_and_saveexec_b64 s[2:3], s[12:13]
	s_cbranch_execz .LBB4_167
; %bb.156:                              ;   in Loop: Header=BB4_45 Depth=1
	v_mov_b64_e32 v[0:1], s[64:65]
	v_mad_u64_u32 v[0:1], s[0:1], v42, s39, v[0:1]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v43, s39, v[2:3]
	v_mov_b32_e32 v1, v2
	global_load_dword v2, v[0:1], off
	s_movk_i32 s10, 0x88
	s_mov_b64 s[0:1], 0
	s_mov_b64 s[12:13], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v3, -4, v2
	v_cmp_ne_u32_e32 vcc, s10, v3
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB4_166
; %bb.157:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e32 vcc, s0, v2
	s_mov_b64 s[14:15], 0
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[12:13], exec, s[0:1]
	s_cbranch_execz .LBB4_163
; %bb.158:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e32 vcc, s0, v2
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.159:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s14, 0xb8
	v_cmp_lt_i32_e32 vcc, s14, v2
	s_mov_b64 s[16:17], exec
	s_and_b64 s[14:15], vcc, exec
                                        ; implicit-def: $vgpr2
; %bb.160:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[18:19], s[0:1]
	s_cbranch_execz .LBB4_162
; %bb.161:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v2
	s_movk_i32 s0, 0xaf
	v_cmp_lt_i32_e64 s[0:1], s0, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[20:21], vcc, exec
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[16:17], s[16:17], s[20:21]
	s_or_b64 s[14:15], s[14:15], s[0:1]
.LBB4_162:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[18:19]
	s_and_b64 s[16:17], s[16:17], exec
	s_and_b64 s[14:15], s[14:15], exec
                                        ; implicit-def: $vgpr2
.LBB4_163:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[12:13], s[12:13]
; %bb.164:                              ;   in Loop: Header=BB4_45 Depth=1
	v_add_u32_e32 v2, 0xffffff72, v2
	v_cmp_gt_u32_e32 vcc, 7, v2
	v_cmp_lt_u32_e64 s[0:1], 6, v2
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 s[18:19], vcc, exec
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[16:17], s[16:17], s[18:19]
	s_or_b64 s[14:15], s[14:15], s[0:1]
; %bb.165:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_orn2_b64 s[12:13], s[16:17], exec
	s_and_b64 s[0:1], s[14:15], exec
.LBB4_166:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[10:11], s[12:13], exec
	s_orn2_b64 s[0:1], s[0:1], exec
.LBB4_167:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[2:3]
	v_accvgpr_read_b32 v2, a40
	v_accvgpr_read_b32 v3, a41
	v_lshl_add_u64 v[2:3], v[2:3], 0, 1
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB4_229
; %bb.168:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v62, 55
	v_readlane_b32 s1, v62, 56
	s_nop 1
	v_lshl_add_u64 v[6:7], s[0:1], 0, v[4:5]
	v_or_b32_e32 v41, s73, v7
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[2:3], exec, s[0:1]
	s_cbranch_execz .LBB4_170
; %bb.169:                              ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v4, s72
	v_cvt_f32_u32_e32 v5, s73
	s_sub_u32 s0, 0, s72
	s_subb_u32 s1, 0, s73
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v4, 0x4f800000, v5
	v_rcp_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v5, 0x2f800000, v4
	v_trunc_f32_e32 v5, v5
	v_fmac_f32_e32 v4, 0xcf800000, v5
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v4, v4
	v_readfirstlane_b32 s14, v5
	v_readfirstlane_b32 s15, v4
	s_mul_i32 s16, s0, s14
	s_mul_hi_u32 s18, s0, s15
	s_mul_i32 s17, s1, s15
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s15
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s15, s16
	s_mul_hi_u32 s20, s15, s19
	s_mul_hi_u32 s17, s15, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s14, s19
	s_mul_i32 s19, s14, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s14, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s14, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s15, s15, s16
	s_addc_u32 s14, s14, s17
	s_mul_i32 s16, s0, s14
	s_mul_hi_u32 s17, s0, s15
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s15
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s15
	s_mul_hi_u32 s17, s14, s0
	s_mul_i32 s18, s14, s0
	s_mul_i32 s20, s15, s16
	s_mul_hi_u32 s0, s15, s0
	s_mul_hi_u32 s19, s15, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s14, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s14, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s15, s15, s0
	s_addc_u32 s14, s14, s1
	v_mad_u64_u32 v[4:5], s[0:1], v6, s14, 0
	v_mul_hi_u32 v8, v6, s15
	v_lshl_add_u64 v[4:5], v[8:9], 0, v[4:5]
	v_mad_u64_u32 v[10:11], s[0:1], v7, s15, 0
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_mad_u64_u32 v[8:9], s[0:1], v7, s14, 0
	s_nop 0
	v_addc_co_u32_e32 v4, vcc, v5, v11, vcc
	v_mov_b32_e32 v5, s51
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[8:9]
	v_mul_lo_u32 v10, s73, v4
	v_mul_lo_u32 v11, s72, v5
	v_mad_u64_u32 v[8:9], s[0:1], s72, v4, 0
	v_add3_u32 v12, v9, v11, v10
	v_sub_u32_e32 v9, v7, v12
	v_mov_b32_e32 v10, s73
	v_sub_co_u32_e32 v13, vcc, v6, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v9, v10, vcc
	v_subrev_co_u32_e64 v9, s[0:1], s72, v13
	s_nop 1
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s73, v8
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s72, v9
	s_nop 1
	v_cndmask_b32_e64 v9, 0, -1, s[0:1]
	v_cmp_eq_u32_e64 s[0:1], s73, v8
	s_nop 1
	v_cndmask_b32_e64 v14, v10, v9, s[0:1]
	v_lshl_add_u64 v[8:9], v[4:5], 0, 2
	v_lshl_add_u64 v[10:11], v[4:5], 0, 1
	v_cmp_ne_u32_e64 s[0:1], 0, v14
	s_nop 1
	v_cndmask_b32_e64 v9, v11, v9, s[0:1]
	v_subb_co_u32_e32 v11, vcc, v7, v12, vcc
	v_cmp_le_u32_e32 vcc, s73, v11
	v_cndmask_b32_e64 v8, v10, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s72, v13
	s_nop 1
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s73, v11
	s_nop 1
	v_cndmask_b32_e32 v11, v12, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cndmask_b32_e32 v4, v4, v8, vcc
.LBB4_170:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB4_172
; %bb.171:                              ;   in Loop: Header=BB4_45 Depth=1
	v_cvt_f32_u32_e32 v4, s72
	s_sub_i32 s2, 0, s72
	v_rcp_iflag_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, s2, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v6, v4
	v_mul_lo_u32 v5, v4, s72
	v_sub_u32_e32 v5, v6, v5
	v_add_u32_e32 v8, 1, v4
	v_subrev_u32_e32 v9, s72, v5
	v_cmp_le_u32_e32 vcc, s72, v5
	s_nop 1
	v_cndmask_b32_e32 v5, v5, v9, vcc
	v_cndmask_b32_e32 v4, v4, v8, vcc
	v_add_u32_e32 v8, 1, v4
	v_cmp_le_u32_e32 vcc, s72, v5
	v_mov_b32_e32 v5, v40
	s_nop 0
	v_cndmask_b32_e32 v4, v4, v8, vcc
.LBB4_172:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_accvgpr_read_b32 v8, a40
	v_accvgpr_read_b32 v9, a41
	v_readlane_b32 s0, v62, 53
	v_cmp_eq_u64_e32 vcc, 0, v[8:9]
	v_readlane_b32 s1, v62, 54
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB4_194
; %bb.173:                              ;   in Loop: Header=BB4_45 Depth=1
	v_cmp_le_u64_e32 vcc, s[72:73], v[6:7]
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB4_193
; %bb.174:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b64 s[14:15], 0
	s_mov_b64 s[16:17], 0
	s_branch .LBB4_176
.LBB4_175:                              ;   in Loop: Header=BB4_176 Depth=2
	s_add_u32 s16, s16, 1
	s_addc_u32 s17, s17, 0
	v_cmp_ge_u64_e32 vcc, s[16:17], v[4:5]
	s_or_b64 s[14:15], vcc, s[14:15]
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB4_193
.LBB4_176:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_180 Depth 3
	v_readlane_b32 s18, v62, 49
	v_readlane_b32 s19, v62, 50
	s_andn2_b64 vcc, exec, s[18:19]
	s_cbranch_vccnz .LBB4_175
; %bb.177:                              ;   in Loop: Header=BB4_176 Depth=2
	s_mul_i32 s18, s17, s72
	s_mul_i32 s19, s16, s73
	v_mov_b32_e32 v8, s72
	s_add_i32 s20, s19, s18
	v_mad_u64_u32 v[8:9], s[18:19], s16, v8, v[42:43]
	v_add_u32_e32 v9, s20, v9
	s_mov_b32 s28, 0
	s_mov_b32 s29, s33
	s_branch .LBB4_180
.LBB4_178:                              ;   in Loop: Header=BB4_180 Depth=3
	s_or_b64 exec, exec, s[20:21]
	v_readlane_b32 s20, v62, 28
	s_nop 1
	v_add_u32_e32 v10, s20, v12
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[10:11], v[10:11], 2, s[76:77]
	global_load_dword v12, v[10:11], off
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v12, v12, v13
	global_store_dword v[10:11], v12, off
.LBB4_179:                              ;   in Loop: Header=BB4_180 Depth=3
	s_or_b64 exec, exec, s[18:19]
	s_add_i32 s29, s29, -1
	s_add_i32 s28, s28, 4
	s_cmp_eq_u32 s29, 0
	s_cbranch_scc1 .LBB4_175
.LBB4_180:                              ;   Parent Loop BB4_45 Depth=1
                                        ;     Parent Loop BB4_176 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	scratch_load_dword v10, off, s28
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[12:13], v[8:9], 0, v[10:11]
	v_cmp_lt_u64_e32 vcc, v[12:13], v[44:45]
	s_and_saveexec_b64 s[18:19], vcc
	s_cbranch_execz .LBB4_179
; %bb.181:                              ;   in Loop: Header=BB4_180 Depth=3
	v_mov_b64_e32 v[10:11], s[64:65]
	v_mad_u64_u32 v[10:11], s[20:21], v12, s39, v[10:11]
	v_mov_b32_e32 v12, v11
	v_mad_u64_u32 v[12:13], s[20:21], v13, s39, v[12:13]
	v_mov_b32_e32 v11, v12
	global_load_dword v14, v[10:11], off
	global_load_dwordx2 v[12:13], v[10:11], off offset:8
	s_movk_i32 s20, 0x88
	s_mov_b64 s[22:23], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v13, -4, v14
	v_cmp_ne_u32_e32 vcc, s20, v13
	s_and_saveexec_b64 s[20:21], vcc
	s_cbranch_execz .LBB4_191
; %bb.182:                              ;   in Loop: Header=BB4_180 Depth=3
	s_movk_i32 s22, 0xad
	v_cmp_lt_i32_e32 vcc, s22, v14
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[22:23], vcc
	s_xor_b64 s[22:23], exec, s[22:23]
	s_cbranch_execz .LBB4_188
; %bb.183:                              ;   in Loop: Header=BB4_180 Depth=3
	s_movk_i32 s24, 0xb6
	v_cmp_lt_i32_e32 vcc, s24, v14
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[26:27], vcc
	s_xor_b64 s[26:27], exec, s[26:27]
; %bb.184:                              ;   in Loop: Header=BB4_180 Depth=3
	s_movk_i32 s24, 0xb9
	v_cmp_gt_i32_e32 vcc, s24, v14
	s_and_b64 s[24:25], vcc, exec
                                        ; implicit-def: $vgpr14
; %bb.185:                              ;   in Loop: Header=BB4_180 Depth=3
	s_andn2_saveexec_b64 s[26:27], s[26:27]
; %bb.186:                              ;   in Loop: Header=BB4_180 Depth=3
	s_movk_i32 s30, 0xb0
	v_cmp_gt_i32_e32 vcc, s30, v14
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[30:31], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[30:31]
; %bb.187:                              ;   in Loop: Header=BB4_180 Depth=3
	s_or_b64 exec, exec, s[26:27]
	s_and_b64 s[24:25], s[24:25], exec
                                        ; implicit-def: $vgpr14
.LBB4_188:                              ;   in Loop: Header=BB4_180 Depth=3
	s_andn2_saveexec_b64 s[22:23], s[22:23]
; %bb.189:                              ;   in Loop: Header=BB4_180 Depth=3
	v_add_u32_e32 v13, 0xffffff72, v14
	v_cmp_gt_u32_e32 vcc, 7, v13
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[26:27]
; %bb.190:                              ;   in Loop: Header=BB4_180 Depth=3
	s_or_b64 exec, exec, s[22:23]
	s_orn2_b64 s[22:23], s[24:25], exec
.LBB4_191:                              ;   in Loop: Header=BB4_180 Depth=3
	s_or_b64 exec, exec, s[20:21]
	v_mov_b32_e32 v13, 1
	s_and_saveexec_b64 s[20:21], s[22:23]
	s_cbranch_execz .LBB4_178
; %bb.192:                              ;   in Loop: Header=BB4_180 Depth=3
	global_load_ushort v13, v[10:11], off offset:106
	s_branch .LBB4_178
.LBB4_193:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[2:3]
	;;#ASMSTART
	;;#ASMEND
.LBB4_194:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_cmp_le_u64_e32 vcc, s[72:73], v[6:7]
	v_mov_b32_e32 v22, v61
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB4_228
; %bb.195:                              ;   in Loop: Header=BB4_45 Depth=1
	v_mov_b32_e32 v7, v2
	s_mov_b64 s[16:17], 0
	v_mov_b32_e32 v22, v61
	s_mov_b64 s[18:19], 0
	s_branch .LBB4_197
.LBB4_196:                              ;   in Loop: Header=BB4_197 Depth=2
	s_add_u32 s18, s18, 1
	s_addc_u32 s19, s19, 0
	v_cmp_ge_u64_e32 vcc, s[18:19], v[4:5]
	s_or_b64 s[16:17], vcc, s[16:17]
	s_andn2_b64 exec, exec, s[16:17]
	s_cbranch_execz .LBB4_227
.LBB4_197:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_202 Depth 3
                                        ;         Child Loop BB4_223 Depth 4
	v_readlane_b32 s0, v62, 49
	v_readlane_b32 s1, v62, 50
	s_andn2_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB4_196
; %bb.198:                              ;   in Loop: Header=BB4_197 Depth=2
	s_mul_i32 s0, s19, s72
	s_mul_i32 s1, s18, s73
	v_mov_b32_e32 v6, s72
	s_add_i32 s2, s1, s0
	v_mad_u64_u32 v[8:9], s[0:1], s18, v6, v[42:43]
	v_add_u32_e32 v9, s2, v9
	s_mov_b32 s30, 0
	s_branch .LBB4_202
.LBB4_199:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[24:25]
	v_mov_b32_e32 v14, v22
.LBB4_200:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[22:23]
	v_mov_b32_e32 v22, v14
.LBB4_201:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[20:21]
	s_add_i32 s30, s30, 1
	s_cmp_eq_u32 s30, s33
	s_cbranch_scc1 .LBB4_196
.LBB4_202:                              ;   Parent Loop BB4_45 Depth=1
                                        ;     Parent Loop BB4_197 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB4_223 Depth 4
	s_lshl_b32 s0, s30, 2
	s_nop 0
	scratch_load_dword v10, off, s0
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshl_add_u64 v[10:11], v[8:9], 0, v[10:11]
	v_cmp_lt_u64_e32 vcc, v[10:11], v[44:45]
	s_and_saveexec_b64 s[20:21], vcc
	s_cbranch_execz .LBB4_201
; %bb.203:                              ;   in Loop: Header=BB4_202 Depth=3
	v_mov_b64_e32 v[12:13], s[64:65]
	v_mad_u64_u32 v[12:13], s[0:1], v10, s39, v[12:13]
	v_mov_b32_e32 v6, v13
	v_mad_u64_u32 v[14:15], s[0:1], v11, s39, v[6:7]
	v_mov_b32_e32 v13, v14
	global_load_dword v6, v[12:13], off
	s_movk_i32 s0, 0x88
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v14, -4, v6
	v_cmp_ne_u32_e32 vcc, s0, v14
	s_mov_b64 s[0:1], -1
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[22:23], vcc
	s_cbranch_execz .LBB4_219
; %bb.204:                              ;   in Loop: Header=BB4_202 Depth=3
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e32 vcc, s0, v6
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[24:25], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[2:3], exec, s[0:1]
	s_cbranch_execnz .LBB4_207
; %bb.205:                              ;   in Loop: Header=BB4_202 Depth=3
	s_andn2_saveexec_b64 s[2:3], s[2:3]
	s_cbranch_execnz .LBB4_212
.LBB4_206:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[2:3]
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[26:27], s[28:29]
	s_cbranch_execnz .LBB4_213
	s_branch .LBB4_218
.LBB4_207:                              ;   in Loop: Header=BB4_202 Depth=3
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e32 vcc, s0, v6
	s_mov_b64 s[26:27], 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.208:                              ;   in Loop: Header=BB4_202 Depth=3
	s_movk_i32 s26, 0xb8
	v_cmp_lt_i32_e32 vcc, s26, v6
	s_mov_b64 s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
                                        ; implicit-def: $vgpr6
; %bb.209:                              ;   in Loop: Header=BB4_202 Depth=3
	s_andn2_saveexec_b64 s[28:29], s[0:1]
	s_cbranch_execz .LBB4_211
; %bb.210:                              ;   in Loop: Header=BB4_202 Depth=3
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e32 vcc, s0, v6
	s_movk_i32 s0, 0xaf
	v_cmp_lt_i32_e64 s[0:1], s0, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[36:37], vcc, exec
	s_andn2_b64 s[26:27], s[26:27], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[24:25], s[24:25], s[36:37]
	s_or_b64 s[26:27], s[26:27], s[0:1]
.LBB4_211:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[28:29]
	s_and_b64 s[24:25], s[24:25], exec
	s_and_b64 s[28:29], s[26:27], exec
                                        ; implicit-def: $vgpr6
	s_andn2_saveexec_b64 s[2:3], s[2:3]
	s_cbranch_execz .LBB4_206
.LBB4_212:                              ;   in Loop: Header=BB4_202 Depth=3
	v_add_u32_e32 v6, 0xffffff72, v6
	v_cmp_gt_u32_e32 vcc, 7, v6
	v_cmp_lt_u32_e64 s[0:1], 6, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_and_b64 s[26:27], vcc, exec
	s_or_b64 s[24:25], s[24:25], s[26:27]
	s_andn2_b64 s[26:27], s[28:29], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[28:29], s[26:27], s[0:1]
	s_or_b64 exec, exec, s[2:3]
                                        ; implicit-def: $vgpr14
	s_and_saveexec_b64 s[26:27], s[28:29]
	s_cbranch_execz .LBB4_218
.LBB4_213:                              ;   in Loop: Header=BB4_202 Depth=3
	s_mov_b32 s0, 0
	v_lshl_add_u32 v6, v22, 2, s0
	scratch_load_dword v14, v6, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v6, v22, 3, s0
	scratch_load_dwordx2 v[18:19], v6, off
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v15, 31, v14
	v_lshl_add_u64 v[16:17], v[14:15], 3, s[68:69]
	global_load_dwordx2 v[16:17], v[16:17], off
	s_waitcnt vmcnt(1)
	v_or_b32_e32 v41, s81, v19
	v_lshl_add_u64 v[20:21], v[18:19], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v6, v[20:21], off
                                        ; implicit-def: $vgpr20_vgpr21
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[28:29], exec, s[0:1]
	s_cbranch_execz .LBB4_215
; %bb.214:                              ;   in Loop: Header=BB4_202 Depth=3
	v_cvt_f32_u32_e32 v6, s80
	v_cvt_f32_u32_e32 v20, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v25, v40
	v_fmac_f32_e32 v6, 0x4f800000, v20
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v20, 0x2f800000, v6
	v_trunc_f32_e32 v20, v20
	v_fmac_f32_e32 v6, 0xcf800000, v20
	v_cvt_u32_f32_e32 v20, v20
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s2, v20
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s31, s0, s2
	s_mul_hi_u32 s37, s0, s3
	s_mul_i32 s36, s1, s3
	s_add_i32 s31, s37, s31
	s_mul_i32 s40, s0, s3
	s_add_i32 s31, s31, s36
	s_mul_i32 s37, s3, s31
	s_mul_hi_u32 s41, s3, s40
	s_mul_hi_u32 s36, s3, s31
	s_add_u32 s37, s41, s37
	s_addc_u32 s36, 0, s36
	s_mul_hi_u32 s42, s2, s40
	s_mul_i32 s40, s2, s40
	s_add_u32 s37, s37, s40
	s_mul_hi_u32 s41, s2, s31
	s_addc_u32 s36, s36, s42
	s_addc_u32 s37, s41, 0
	s_mul_i32 s31, s2, s31
	s_add_u32 s31, s36, s31
	s_addc_u32 s36, 0, s37
	s_add_u32 s3, s3, s31
	s_addc_u32 s2, s2, s36
	s_mul_i32 s31, s0, s2
	s_mul_hi_u32 s36, s0, s3
	s_add_i32 s31, s36, s31
	s_mul_i32 s1, s1, s3
	s_add_i32 s31, s31, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s36, s2, s0
	s_mul_i32 s37, s2, s0
	s_mul_i32 s41, s3, s31
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s40, s3, s31
	s_add_u32 s0, s0, s41
	s_addc_u32 s40, 0, s40
	s_add_u32 s0, s0, s37
	s_mul_hi_u32 s1, s2, s31
	s_addc_u32 s0, s40, s36
	s_addc_u32 s1, s1, 0
	s_mul_i32 s31, s2, s31
	s_add_u32 s0, s0, s31
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[20:21], s[0:1], v18, s2, 0
	v_mul_hi_u32 v24, v18, s3
	v_lshl_add_u64 v[20:21], v[24:25], 0, v[20:21]
	v_mad_u64_u32 v[26:27], s[0:1], v19, s3, 0
	v_add_co_u32_e32 v6, vcc, v20, v26
	v_mad_u64_u32 v[24:25], s[0:1], v19, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v20, vcc, v21, v27, vcc
	v_mov_b32_e32 v21, s51
	s_nop 0
	v_addc_co_u32_e32 v25, vcc, 0, v25, vcc
	v_lshl_add_u64 v[20:21], v[20:21], 0, v[24:25]
	v_mul_lo_u32 v6, s81, v20
	v_mul_lo_u32 v23, s80, v21
	v_mad_u64_u32 v[20:21], s[0:1], s80, v20, 0
	v_add3_u32 v6, v21, v23, v6
	v_sub_u32_e32 v21, v19, v6
	v_mov_b32_e32 v23, s81
	v_sub_co_u32_e32 v18, vcc, v18, v20
	s_nop 1
	v_subb_co_u32_e64 v20, s[0:1], v21, v23, vcc
	v_subrev_co_u32_e64 v24, s[0:1], s80, v18
	v_subb_co_u32_e32 v6, vcc, v19, v6, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v21, s[2:3], 0, v20, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v21
	v_subb_co_u32_e64 v20, s[0:1], v20, v23, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v25, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v24
	v_subrev_co_u32_e64 v23, s[0:1], s80, v24
	s_nop 0
	v_cndmask_b32_e64 v26, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v21
	v_subbrev_co_u32_e64 v20, s[0:1], 0, v20, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v25, v25, v26, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v6
	v_cmp_ne_u32_e64 s[0:1], 0, v25
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v18
	v_cndmask_b32_e64 v20, v21, v20, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v21, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v6
	s_nop 1
	v_cndmask_b32_e32 v19, v19, v21, vcc
	v_cmp_ne_u32_e32 vcc, 0, v19
	s_nop 1
	v_cndmask_b32_e32 v21, v6, v20, vcc
	v_cndmask_b32_e64 v6, v24, v23, s[0:1]
	v_cndmask_b32_e32 v20, v18, v6, vcc
                                        ; implicit-def: $vgpr18_vgpr19
.LBB4_215:                              ;   in Loop: Header=BB4_202 Depth=3
	s_andn2_saveexec_b64 s[0:1], s[28:29]
	s_cbranch_execz .LBB4_217
; %bb.216:                              ;   in Loop: Header=BB4_202 Depth=3
	v_cvt_f32_u32_e32 v6, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v21, v40
	v_rcp_iflag_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_mul_lo_u32 v19, s2, v6
	v_mul_hi_u32 v19, v6, v19
	v_add_u32_e32 v6, v6, v19
	v_mul_hi_u32 v6, v18, v6
	v_mul_lo_u32 v6, v6, s80
	v_sub_u32_e32 v6, v18, v6
	v_subrev_u32_e32 v18, s80, v6
	v_cmp_le_u32_e32 vcc, s80, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v18, vcc
	v_subrev_u32_e32 v18, s80, v6
	v_cmp_le_u32_e32 vcc, s80, v6
	s_nop 1
	v_cndmask_b32_e32 v20, v6, v18, vcc
.LBB4_217:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[16:17], v[20:21], 3, v[16:17]
	v_or_b32_e32 v19, v11, v7
	v_mov_b32_e32 v18, v10
	flat_store_dwordx2 v[16:17], v[18:19] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[14:15], v[14:15], 3, s[84:85]
	v_mov_b64_e32 v[16:17], 1
	global_atomic_add_x2 v[14:15], v[16:17], off
	v_add_u32_e32 v6, 1, v22
	v_sub_u32_e32 v15, 0, v6
	v_ashrrev_i32_e32 v14, 31, v6
	v_max_i32_e32 v6, v15, v6
	v_accvgpr_read_b32 v15, a37
	v_mul_hi_u32 v15, v6, v15
	v_mul_lo_u32 v15, v15, s53
	v_sub_u32_e32 v6, v6, v15
	v_subrev_u32_e32 v15, s53, v6
	v_cmp_le_u32_e32 vcc, s53, v6
	s_andn2_b64 s[24:25], s[24:25], exec
	s_nop 0
	v_cndmask_b32_e32 v6, v6, v15, vcc
	v_subrev_u32_e32 v15, s53, v6
	v_cmp_le_u32_e32 vcc, s53, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v15, vcc
	v_xor_b32_e32 v6, v6, v14
	v_sub_u32_e32 v14, v6, v14
.LBB4_218:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[26:27]
	s_orn2_b64 s[0:1], s[24:25], exec
.LBB4_219:                              ;   in Loop: Header=BB4_202 Depth=3
	s_or_b64 exec, exec, s[22:23]
	s_and_saveexec_b64 s[22:23], s[0:1]
	s_cbranch_execz .LBB4_200
; %bb.220:                              ;   in Loop: Header=BB4_202 Depth=3
	global_load_ushort v6, v[12:13], off offset:106
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_e32 vcc, 0, v6
	s_and_saveexec_b64 s[24:25], vcc
	s_cbranch_execz .LBB4_199
; %bb.221:                              ;   in Loop: Header=BB4_202 Depth=3
	v_min_i32_sdwa v6, s33, v6 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_0
	v_or_b32_e32 v11, v11, v7
	s_mov_b32 s31, 0
	s_movk_i32 s36, 0x200
	s_mov_b64 s[26:27], 0
	s_branch .LBB4_223
.LBB4_222:                              ;   in Loop: Header=BB4_223 Depth=4
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[14:15], v[18:19], 3, v[14:15]
	flat_store_dwordx2 v[14:15], v[10:11] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[12:13], v[12:13], 3, s[84:85]
	v_mov_b64_e32 v[14:15], 1
	global_atomic_add_x2 v[12:13], v[14:15], off
	v_add_u32_e32 v6, -1, v6
	s_add_i32 s31, s31, 4
	s_add_i32 s36, s36, 8
	v_cmp_eq_u32_e32 vcc, 0, v6
	s_or_b64 s[26:27], vcc, s[26:27]
	s_andn2_b64 exec, exec, s[26:27]
	s_cbranch_execz .LBB4_199
.LBB4_223:                              ;   Parent Loop BB4_45 Depth=1
                                        ;     Parent Loop BB4_197 Depth=2
                                        ;       Parent Loop BB4_202 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	scratch_load_dword v12, off, s31
	scratch_load_dwordx2 v[16:17], off, s36
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v13, 31, v12
	v_lshl_add_u64 v[14:15], v[12:13], 3, s[68:69]
	global_load_dwordx2 v[14:15], v[14:15], off
	v_or_b32_e32 v41, s81, v17
	v_lshl_add_u64 v[18:19], v[16:17], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[18:19], s36
                                        ; implicit-def: $vgpr18_vgpr19
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[28:29], exec, s[0:1]
	s_cbranch_execz .LBB4_225
; %bb.224:                              ;   in Loop: Header=BB4_223 Depth=4
	v_cvt_f32_u32_e32 v18, s80
	v_cvt_f32_u32_e32 v19, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v21, v40
	v_fmac_f32_e32 v18, 0x4f800000, v19
	v_rcp_f32_e32 v18, v18
	s_nop 0
	v_mul_f32_e32 v18, 0x5f7ffffc, v18
	v_mul_f32_e32 v19, 0x2f800000, v18
	v_trunc_f32_e32 v19, v19
	v_fmac_f32_e32 v18, 0xcf800000, v19
	v_cvt_u32_f32_e32 v19, v19
	v_cvt_u32_f32_e32 v18, v18
	v_readfirstlane_b32 s2, v19
	v_readfirstlane_b32 s3, v18
	s_mul_i32 s37, s0, s2
	s_mul_hi_u32 s41, s0, s3
	s_mul_i32 s40, s1, s3
	s_add_i32 s37, s41, s37
	s_mul_i32 s42, s0, s3
	s_add_i32 s37, s37, s40
	s_mul_i32 s41, s3, s37
	s_mul_hi_u32 s43, s3, s42
	s_mul_hi_u32 s40, s3, s37
	s_add_u32 s41, s43, s41
	s_addc_u32 s40, 0, s40
	s_mul_hi_u32 s44, s2, s42
	s_mul_i32 s42, s2, s42
	s_add_u32 s41, s41, s42
	s_mul_hi_u32 s43, s2, s37
	s_addc_u32 s40, s40, s44
	s_addc_u32 s41, s43, 0
	s_mul_i32 s37, s2, s37
	s_add_u32 s37, s40, s37
	s_addc_u32 s40, 0, s41
	s_add_u32 s3, s3, s37
	s_addc_u32 s2, s2, s40
	s_mul_i32 s37, s0, s2
	s_mul_hi_u32 s40, s0, s3
	s_add_i32 s37, s40, s37
	s_mul_i32 s1, s1, s3
	s_add_i32 s37, s37, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s40, s2, s0
	s_mul_i32 s41, s2, s0
	s_mul_i32 s43, s3, s37
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s42, s3, s37
	s_add_u32 s0, s0, s43
	s_addc_u32 s42, 0, s42
	s_add_u32 s0, s0, s41
	s_mul_hi_u32 s1, s2, s37
	s_addc_u32 s0, s42, s40
	s_addc_u32 s1, s1, 0
	s_mul_i32 s37, s2, s37
	s_add_u32 s0, s0, s37
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[18:19], s[0:1], v16, s2, 0
	v_mul_hi_u32 v20, v16, s3
	v_lshl_add_u64 v[18:19], v[20:21], 0, v[18:19]
	v_mad_u64_u32 v[24:25], s[0:1], v17, s3, 0
	v_add_co_u32_e32 v18, vcc, v18, v24
	v_mad_u64_u32 v[20:21], s[0:1], v17, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v18, vcc, v19, v25, vcc
	v_mov_b32_e32 v19, s51
	s_nop 0
	v_addc_co_u32_e32 v21, vcc, 0, v21, vcc
	v_lshl_add_u64 v[18:19], v[18:19], 0, v[20:21]
	v_mul_lo_u32 v20, s81, v18
	v_mul_lo_u32 v21, s80, v19
	v_mad_u64_u32 v[18:19], s[0:1], s80, v18, 0
	v_add3_u32 v19, v19, v21, v20
	v_sub_u32_e32 v20, v17, v19
	v_mov_b32_e32 v21, s81
	v_sub_co_u32_e32 v16, vcc, v16, v18
	s_nop 1
	v_subb_co_u32_e64 v18, s[0:1], v20, v21, vcc
	v_subrev_co_u32_e64 v20, s[0:1], s80, v16
	v_subb_co_u32_e32 v17, vcc, v17, v19, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v23, s[2:3], 0, v18, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v23
	v_subb_co_u32_e64 v18, s[0:1], v18, v21, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v24, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v20
	v_subrev_co_u32_e64 v21, s[0:1], s80, v20
	s_nop 0
	v_cndmask_b32_e64 v25, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v23
	v_subbrev_co_u32_e64 v18, s[0:1], 0, v18, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v24, v24, v25, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v17
	v_cmp_ne_u32_e64 s[0:1], 0, v24
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v16
	v_cndmask_b32_e64 v18, v23, v18, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v23, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v17
	s_nop 1
	v_cndmask_b32_e32 v19, v19, v23, vcc
	v_cmp_ne_u32_e32 vcc, 0, v19
	s_nop 1
	v_cndmask_b32_e32 v19, v17, v18, vcc
	v_cndmask_b32_e64 v17, v20, v21, s[0:1]
	v_cndmask_b32_e32 v18, v16, v17, vcc
                                        ; implicit-def: $vgpr16_vgpr17
.LBB4_225:                              ;   in Loop: Header=BB4_223 Depth=4
	s_andn2_saveexec_b64 s[0:1], s[28:29]
	s_cbranch_execz .LBB4_222
; %bb.226:                              ;   in Loop: Header=BB4_223 Depth=4
	v_cvt_f32_u32_e32 v17, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v19, v40
	v_rcp_iflag_f32_e32 v17, v17
	s_nop 0
	v_mul_f32_e32 v17, 0x4f7ffffe, v17
	v_cvt_u32_f32_e32 v17, v17
	v_mul_lo_u32 v18, s2, v17
	v_mul_hi_u32 v18, v17, v18
	v_add_u32_e32 v17, v17, v18
	v_mul_hi_u32 v17, v16, v17
	v_mul_lo_u32 v17, v17, s80
	v_sub_u32_e32 v16, v16, v17
	v_subrev_u32_e32 v17, s80, v16
	v_cmp_le_u32_e32 vcc, s80, v16
	s_nop 1
	v_cndmask_b32_e32 v16, v16, v17, vcc
	v_subrev_u32_e32 v17, s80, v16
	v_cmp_le_u32_e32 vcc, s80, v16
	s_nop 1
	v_cndmask_b32_e32 v18, v16, v17, vcc
	s_branch .LBB4_222
.LBB4_227:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[16:17]
.LBB4_228:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_andn2_b64 s[10:11], s[10:11], exec
.LBB4_229:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_and_saveexec_b64 s[0:1], s[10:11]
	s_xor_b64 s[10:11], exec, s[0:1]
	s_cbranch_execz .LBB4_240
; %bb.230:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v62, 61
	v_readlane_b32 s1, v62, 62
	v_accvgpr_read_b32 v8, a40
	v_accvgpr_read_b32 v9, a41
	v_lshl_add_u64 v[4:5], v[0:1], 0, s[0:1]
	global_load_ushort v6, v[4:5], off offset:106
	v_readlane_b32 s0, v62, 53
	v_cmp_eq_u64_e32 vcc, 0, v[8:9]
	v_readlane_b32 s1, v62, 54
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB4_232
; %bb.231:                              ;   in Loop: Header=BB4_45 Depth=1
	global_load_dword v4, v[4:5], off offset:8
	v_readlane_b32 s2, v62, 28
	s_waitcnt vmcnt(0)
	s_nop 0
	v_add_u32_e32 v4, s2, v4
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshl_add_u64 v[4:5], v[4:5], 2, s[76:77]
	global_store_dword v[4:5], v6, off
	;;#ASMSTART
	;;#ASMEND
.LBB4_232:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_min_i32_e32 v14, s33, v6
	v_cmp_lt_i32_e32 vcc, 0, v14
	s_and_saveexec_b64 s[12:13], vcc
	s_cbranch_execz .LBB4_239
; %bb.233:                              ;   in Loop: Header=BB4_45 Depth=1
	v_lshl_add_u64 v[4:5], v[42:43], 0, s[46:47]
	v_or_b32_e32 v5, v5, v2
	s_mov_b32 s18, 0
	s_movk_i32 s19, 0x200
	s_mov_b64 s[14:15], 0
	s_branch .LBB4_235
.LBB4_234:                              ;   in Loop: Header=BB4_235 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[8:9], v[12:13], 3, v[8:9]
	flat_store_dwordx2 v[8:9], v[4:5] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[6:7], v[6:7], 3, s[84:85]
	v_mov_b64_e32 v[8:9], 1
	global_atomic_add_x2 v[6:7], v[8:9], off
	v_add_u32_e32 v14, -1, v14
	s_add_i32 s18, s18, 4
	s_add_i32 s19, s19, 8
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_or_b64 s[14:15], vcc, s[14:15]
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB4_239
.LBB4_235:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v6, off, s18
	scratch_load_dwordx2 v[10:11], off, s19
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[68:69]
	global_load_dwordx2 v[8:9], v[8:9], off
	v_or_b32_e32 v41, s81, v11
	v_lshl_add_u64 v[12:13], v[10:11], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[12:13], s19
                                        ; implicit-def: $vgpr12_vgpr13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[16:17], exec, s[0:1]
	s_cbranch_execz .LBB4_237
; %bb.236:                              ;   in Loop: Header=BB4_235 Depth=2
	v_cvt_f32_u32_e32 v12, s80
	v_cvt_f32_u32_e32 v13, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v17, v40
	v_fmac_f32_e32 v12, 0x4f800000, v13
	v_rcp_f32_e32 v12, v12
	s_nop 0
	v_mul_f32_e32 v12, 0x5f7ffffc, v12
	v_mul_f32_e32 v13, 0x2f800000, v12
	v_trunc_f32_e32 v13, v13
	v_fmac_f32_e32 v12, 0xcf800000, v13
	v_cvt_u32_f32_e32 v13, v13
	v_cvt_u32_f32_e32 v12, v12
	v_readfirstlane_b32 s2, v13
	v_readfirstlane_b32 s3, v12
	s_mul_i32 s20, s0, s2
	s_mul_hi_u32 s22, s0, s3
	s_mul_i32 s21, s1, s3
	s_add_i32 s20, s22, s20
	s_mul_i32 s23, s0, s3
	s_add_i32 s20, s20, s21
	s_mul_i32 s22, s3, s20
	s_mul_hi_u32 s24, s3, s23
	s_mul_hi_u32 s21, s3, s20
	s_add_u32 s22, s24, s22
	s_addc_u32 s21, 0, s21
	s_mul_hi_u32 s25, s2, s23
	s_mul_i32 s23, s2, s23
	s_add_u32 s22, s22, s23
	s_mul_hi_u32 s24, s2, s20
	s_addc_u32 s21, s21, s25
	s_addc_u32 s22, s24, 0
	s_mul_i32 s20, s2, s20
	s_add_u32 s20, s21, s20
	s_addc_u32 s21, 0, s22
	s_add_u32 s3, s3, s20
	s_addc_u32 s2, s2, s21
	s_mul_i32 s20, s0, s2
	s_mul_hi_u32 s21, s0, s3
	s_add_i32 s20, s21, s20
	s_mul_i32 s1, s1, s3
	s_add_i32 s20, s20, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s21, s2, s0
	s_mul_i32 s22, s2, s0
	s_mul_i32 s24, s3, s20
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s23, s3, s20
	s_add_u32 s0, s0, s24
	s_addc_u32 s23, 0, s23
	s_add_u32 s0, s0, s22
	s_mul_hi_u32 s1, s2, s20
	s_addc_u32 s0, s23, s21
	s_addc_u32 s1, s1, 0
	s_mul_i32 s20, s2, s20
	s_add_u32 s0, s0, s20
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[12:13], s[0:1], v10, s2, 0
	v_mul_hi_u32 v16, v10, s3
	v_lshl_add_u64 v[12:13], v[16:17], 0, v[12:13]
	v_mad_u64_u32 v[18:19], s[0:1], v11, s3, 0
	v_add_co_u32_e32 v12, vcc, v12, v18
	v_mad_u64_u32 v[16:17], s[0:1], v11, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v12, vcc, v13, v19, vcc
	v_mov_b32_e32 v13, s51
	s_nop 0
	v_addc_co_u32_e32 v17, vcc, 0, v17, vcc
	v_lshl_add_u64 v[12:13], v[12:13], 0, v[16:17]
	v_mul_lo_u32 v15, s81, v12
	v_mul_lo_u32 v16, s80, v13
	v_mad_u64_u32 v[12:13], s[0:1], s80, v12, 0
	v_add3_u32 v13, v13, v16, v15
	v_sub_u32_e32 v15, v11, v13
	v_mov_b32_e32 v16, s81
	v_sub_co_u32_e32 v10, vcc, v10, v12
	s_nop 1
	v_subb_co_u32_e64 v12, s[0:1], v15, v16, vcc
	v_subrev_co_u32_e64 v15, s[0:1], s80, v10
	v_subb_co_u32_e32 v11, vcc, v11, v13, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v17, s[2:3], 0, v12, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v17
	v_subb_co_u32_e64 v12, s[0:1], v12, v16, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v18, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v15
	v_subrev_co_u32_e64 v16, s[0:1], s80, v15
	s_nop 0
	v_cndmask_b32_e64 v19, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v17
	v_subbrev_co_u32_e64 v12, s[0:1], 0, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v18, v18, v19, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v11
	v_cmp_ne_u32_e64 s[0:1], 0, v18
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v10
	v_cndmask_b32_e64 v12, v17, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v17, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v11
	s_nop 1
	v_cndmask_b32_e32 v13, v13, v17, vcc
	v_cmp_ne_u32_e32 vcc, 0, v13
	s_nop 1
	v_cndmask_b32_e32 v13, v11, v12, vcc
	v_cndmask_b32_e64 v11, v15, v16, s[0:1]
	v_cndmask_b32_e32 v12, v10, v11, vcc
                                        ; implicit-def: $vgpr10_vgpr11
.LBB4_237:                              ;   in Loop: Header=BB4_235 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[16:17]
	s_cbranch_execz .LBB4_234
; %bb.238:                              ;   in Loop: Header=BB4_235 Depth=2
	v_cvt_f32_u32_e32 v11, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v13, v40
	v_rcp_iflag_f32_e32 v11, v11
	s_nop 0
	v_mul_f32_e32 v11, 0x4f7ffffe, v11
	v_cvt_u32_f32_e32 v11, v11
	v_mul_lo_u32 v12, s2, v11
	v_mul_hi_u32 v12, v11, v12
	v_add_u32_e32 v11, v11, v12
	v_mul_hi_u32 v11, v10, v11
	v_mul_lo_u32 v11, v11, s80
	v_sub_u32_e32 v10, v10, v11
	v_subrev_u32_e32 v11, s80, v10
	v_cmp_le_u32_e32 vcc, s80, v10
	s_nop 1
	v_cndmask_b32_e32 v10, v10, v11, vcc
	v_subrev_u32_e32 v11, s80, v10
	v_cmp_le_u32_e32 vcc, s80, v10
	s_nop 1
	v_cndmask_b32_e32 v12, v10, v11, vcc
	s_branch .LBB4_234
.LBB4_239:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[12:13]
	v_mov_b32_e32 v22, v61
.LBB4_240:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_xor_b64 s[0:1], exec, -1
.LBB4_241:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_andn2_b64 s[2:3], s[4:5], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[4:5], s[2:3], s[0:1]
	v_readlane_b32 s0, v63, 9
	v_mov_b64_e32 v[14:15], v[30:31]
	v_mov_b32_e32 v12, v29
	v_readlane_b32 s1, v63, 10
.LBB4_242:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_b64 s[2:3], s[4:5], exec
                                        ; implicit-def: $vgpr4
.LBB4_243:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB4_255
; %bb.244:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0x386
	v_cmp_eq_u32_e32 vcc, s0, v4
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB4_254
; %bb.245:                              ;   in Loop: Header=BB4_45 Depth=1
	s_waitcnt vmcnt(0)
	v_sub_co_u32_e32 v4, vcc, v44, v42
	v_readlane_b32 s0, v62, 51
	s_nop 0
	v_subb_co_u32_e32 v5, vcc, v45, v43, vcc
	v_or_b32_e32 v41, s0, v5
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB4_247
; %bb.246:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s19, v62, 52
	v_readlane_b32 s18, v62, 51
	s_sub_u32 s0, 0, s19
	v_cvt_f32_u32_e32 v6, s19
	v_cvt_f32_u32_e32 v7, s18
	s_subb_u32 s1, 0, s18
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s10, v7
	v_readfirstlane_b32 s11, v6
	s_mul_i32 s12, s0, s10
	s_mul_hi_u32 s14, s0, s11
	s_mul_i32 s13, s1, s11
	s_add_i32 s12, s14, s12
	s_mul_i32 s15, s0, s11
	s_add_i32 s12, s12, s13
	s_mul_i32 s14, s11, s12
	s_mul_hi_u32 s16, s11, s15
	s_mul_hi_u32 s13, s11, s12
	s_add_u32 s14, s16, s14
	s_addc_u32 s13, 0, s13
	s_mul_hi_u32 s17, s10, s15
	s_mul_i32 s15, s10, s15
	s_add_u32 s14, s14, s15
	s_mul_hi_u32 s16, s10, s12
	s_addc_u32 s13, s13, s17
	s_addc_u32 s14, s16, 0
	s_mul_i32 s12, s10, s12
	s_add_u32 s12, s13, s12
	s_addc_u32 s13, 0, s14
	s_add_u32 s11, s11, s12
	s_addc_u32 s10, s10, s13
	s_mul_i32 s12, s0, s10
	s_mul_hi_u32 s13, s0, s11
	s_add_i32 s12, s13, s12
	s_mul_i32 s1, s1, s11
	s_add_i32 s12, s12, s1
	s_mul_i32 s0, s0, s11
	s_mul_hi_u32 s13, s10, s0
	s_mul_i32 s14, s10, s0
	s_mul_i32 s16, s11, s12
	s_mul_hi_u32 s0, s11, s0
	s_mul_hi_u32 s15, s11, s12
	s_add_u32 s0, s0, s16
	s_addc_u32 s15, 0, s15
	s_add_u32 s0, s0, s14
	s_mul_hi_u32 s1, s10, s12
	s_addc_u32 s0, s15, s13
	s_addc_u32 s1, s1, 0
	s_mul_i32 s12, s10, s12
	s_add_u32 s0, s0, s12
	s_addc_u32 s1, 0, s1
	s_add_u32 s11, s11, s0
	s_addc_u32 s10, s10, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s10, 0
	v_mul_hi_u32 v8, v4, s11
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s11, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s10, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s51
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v10, s18, v6
	v_mul_lo_u32 v11, s19, v7
	v_mad_u64_u32 v[8:9], s[0:1], s19, v6, 0
	v_add3_u32 v13, v9, v11, v10
	v_sub_u32_e32 v9, v5, v13
	v_mov_b32_e32 v10, s18
	v_sub_co_u32_e32 v16, vcc, v4, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v9, v10, vcc
	v_subrev_co_u32_e64 v9, s[0:1], s19, v16
	s_nop 1
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s18, v8
	s_nop 1
	v_cndmask_b32_e64 v10, 0, -1, s[0:1]
	v_cmp_le_u32_e64 s[0:1], s19, v9
	s_nop 1
	v_cndmask_b32_e64 v9, 0, -1, s[0:1]
	v_cmp_eq_u32_e64 s[0:1], s18, v8
	s_nop 1
	v_cndmask_b32_e64 v17, v10, v9, s[0:1]
	v_lshl_add_u64 v[8:9], v[6:7], 0, 2
	v_lshl_add_u64 v[10:11], v[6:7], 0, 1
	v_cmp_ne_u32_e64 s[0:1], 0, v17
	s_nop 1
	v_cndmask_b32_e64 v9, v11, v9, s[0:1]
	v_subb_co_u32_e32 v11, vcc, v5, v13, vcc
	v_cmp_le_u32_e32 vcc, s18, v11
	v_cndmask_b32_e64 v8, v10, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s19, v16
	s_nop 1
	v_cndmask_b32_e64 v16, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s18, v11
	s_nop 1
	v_cndmask_b32_e32 v11, v13, v16, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e32 v6, v6, v8, vcc
.LBB4_247:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB4_249
; %bb.248:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s9, v62, 52
	s_sub_i32 s8, 0, s9
	s_nop 0
	v_cvt_f32_u32_e32 v6, s9
	v_rcp_iflag_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x4f7ffffe, v6
	v_cvt_u32_f32_e32 v6, v6
	v_mul_lo_u32 v7, s8, v6
	v_mul_hi_u32 v7, v6, v7
	v_add_u32_e32 v6, v6, v7
	v_mul_hi_u32 v6, v4, v6
	v_mul_lo_u32 v7, v6, s9
	v_sub_u32_e32 v7, v4, v7
	v_add_u32_e32 v8, 1, v6
	v_subrev_u32_e32 v9, s9, v7
	v_cmp_le_u32_e32 vcc, s9, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v9, vcc
	v_cndmask_b32_e32 v6, v6, v8, vcc
	v_add_u32_e32 v8, 1, v6
	v_cmp_le_u32_e32 vcc, s9, v7
	v_mov_b32_e32 v7, v40
	s_nop 0
	v_cndmask_b32_e32 v6, v6, v8, vcc
.LBB4_249:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_readlane_b32 s1, v62, 52
	v_readlane_b32 s0, v62, 51
	s_nop 0
	v_mul_lo_u32 v10, v7, s1
	v_mul_lo_u32 v11, v6, s0
	v_mad_u64_u32 v[8:9], s[0:1], v6, s1, 0
	v_add3_u32 v9, v9, v11, v10
	v_sub_co_u32_e32 v10, vcc, v4, v8
	s_nop 1
	v_subb_co_u32_e32 v11, vcc, v5, v9, vcc
	v_cmp_ge_u64_e32 vcc, s[46:47], v[10:11]
                                        ; implicit-def: $vgpr8_vgpr9
                                        ; implicit-def: $vgpr4_vgpr5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.250:                              ;   in Loop: Header=BB4_45 Depth=1
	v_mad_u64_u32 v[4:5], s[8:9], v6, s46, v[10:11]
	v_mul_lo_u32 v8, v6, s47
	v_mul_lo_u32 v9, v7, s46
	v_add3_u32 v5, v9, v5, v8
	v_lshl_add_u64 v[8:9], v[4:5], 0, v[6:7]
                                        ; implicit-def: $vgpr6_vgpr7
; %bb.251:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[0:1], s[0:1]
; %bb.252:                              ;   in Loop: Header=BB4_45 Depth=1
	v_lshl_add_u64 v[6:7], v[6:7], 0, 1
	v_mul_lo_u32 v10, v7, s46
	v_mul_lo_u32 v11, v6, s47
	v_mad_u64_u32 v[4:5], s[8:9], v6, s46, 0
	v_mad_u64_u32 v[8:9], s[8:9], v6, s46, v[6:7]
	v_add3_u32 v5, v5, v11, v10
	v_add3_u32 v9, v10, v9, v11
; %bb.253:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_lshl_add_u64 v[4:5], v[4:5], 0, v[42:43]
	v_lshl_add_u64 v[44:45], v[8:9], 0, v[42:43]
	v_mov_b64_e32 v[42:43], v[4:5]
.LBB4_254:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_or_b64 s[2:3], s[2:3], exec
.LBB4_255:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_accvgpr_read_b32 v4, a32
	v_accvgpr_read_b32 v5, a33
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB4_295
; %bb.256:                              ;   in Loop: Header=BB4_45 Depth=1
	v_accvgpr_read_b32 v4, a32
	s_waitcnt vmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[42:43], v[44:45]
	s_mov_b64 s[0:1], -1
	s_mov_b64 s[6:7], 0
	v_accvgpr_read_b32 v5, a33
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execnz .LBB4_259
; %bb.257:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execnz .LBB4_270
.LBB4_258:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[6:7]
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execnz .LBB4_284
	s_branch .LBB4_294
.LBB4_259:                              ;   in Loop: Header=BB4_45 Depth=1
	v_mov_b64_e32 v[0:1], s[64:65]
	v_mad_u64_u32 v[4:5], s[0:1], v42, s39, v[0:1]
	v_mov_b32_e32 v0, v5
	v_mad_u64_u32 v[0:1], s[0:1], v43, s39, v[0:1]
	v_mov_b32_e32 v5, v0
	global_load_dword v0, v[4:5], off
	s_movk_i32 s0, 0x88
	s_mov_b64 s[2:3], 0
	s_mov_b64 s[10:11], -1
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v1, -4, v0
	v_cmp_ne_u32_e64 s[0:1], s0, v1
	s_and_saveexec_b64 s[6:7], s[0:1]
	s_cbranch_execz .LBB4_269
; %bb.260:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xad
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_mov_b64 s[12:13], 0
	s_mov_b64 s[14:15], 0
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_xor_b64 s[10:11], exec, s[2:3]
	s_cbranch_execz .LBB4_266
; %bb.261:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xb6
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_xor_b64 s[2:3], exec, s[2:3]
; %bb.262:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xb8
	v_cmp_lt_i32_e64 s[0:1], s0, v0
	s_mov_b64 s[14:15], exec
	s_and_b64 s[12:13], s[0:1], exec
                                        ; implicit-def: $vgpr0
; %bb.263:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[16:17], s[2:3]
	s_cbranch_execz .LBB4_265
; %bb.264:                              ;   in Loop: Header=BB4_45 Depth=1
	s_movk_i32 s0, 0xb0
	v_cmp_gt_i32_e64 s[0:1], s0, v0
	s_movk_i32 s2, 0xaf
	v_cmp_lt_i32_e64 s[2:3], s2, v0
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[14:15], s[14:15], s[0:1]
	s_andn2_b64 s[0:1], s[12:13], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_or_b64 s[12:13], s[0:1], s[2:3]
.LBB4_265:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], s[14:15], exec
	s_and_b64 s[12:13], s[12:13], exec
                                        ; implicit-def: $vgpr0
.LBB4_266:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_saveexec_b64 s[10:11], s[10:11]
; %bb.267:                              ;   in Loop: Header=BB4_45 Depth=1
	v_add_u32_e32 v0, 0xffffff72, v0
	v_cmp_gt_u32_e64 s[0:1], 7, v0
	v_cmp_lt_u32_e64 s[2:3], 6, v0
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[14:15], s[14:15], s[0:1]
	s_andn2_b64 s[0:1], s[12:13], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_or_b64 s[12:13], s[0:1], s[2:3]
; %bb.268:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_orn2_b64 s[10:11], s[14:15], exec
	s_and_b64 s[2:3], s[12:13], exec
.LBB4_269:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_b64 s[6:7], s[10:11], exec
	s_orn2_b64 s[0:1], s[2:3], exec
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $vgpr22
	s_and_saveexec_b64 s[8:9], s[0:1]
	s_cbranch_execz .LBB4_258
.LBB4_270:                              ;   in Loop: Header=BB4_45 Depth=1
	v_accvgpr_read_b32 v0, a40
	v_accvgpr_read_b32 v1, a41
	v_readlane_b32 s2, v62, 53
	v_cmp_eq_u64_e64 s[0:1], 1, v[0:1]
	v_readlane_b32 s3, v62, 54
	s_and_b64 s[0:1], s[0:1], s[2:3]
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB4_275
; %bb.271:                              ;   in Loop: Header=BB4_45 Depth=1
	s_and_saveexec_b64 s[10:11], vcc
	v_readlane_b32 s14, v62, 28
	s_cbranch_execz .LBB4_274
; %bb.272:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v63, 1
	v_readlane_b32 s1, v63, 2
	s_mov_b64 s[12:13], 0
	s_nop 0
	v_mov_b64_e32 v[0:1], s[0:1]
	v_mad_u64_u32 v[0:1], s[0:1], v42, s39, v[0:1]
	v_mov_b32_e32 v2, v1
	v_mad_u64_u32 v[2:3], s[0:1], v43, s39, v[2:3]
	v_mov_b32_e32 v1, v2
	v_mov_b64_e32 v[2:3], v[42:43]
.LBB4_273:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_dword v6, v[0:1], off
	v_lshl_add_u64 v[2:3], v[2:3], 0, 1
	s_mov_b64 s[0:1], 0x70
	v_lshl_add_u64 v[0:1], v[0:1], 0, s[0:1]
	v_cmp_ge_u64_e64 s[0:1], v[2:3], v[44:45]
	s_or_b64 s[12:13], s[0:1], s[12:13]
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v6, s14, v6
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[6:7], v[6:7], 2, s[76:77]
	global_load_dword v8, v[6:7], off
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v8, 1, v8
	global_store_dword v[6:7], v8, off
	s_andn2_b64 exec, exec, s[12:13]
	s_cbranch_execnz .LBB4_273
.LBB4_274:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[10:11]
	;;#ASMSTART
	;;#ASMEND
.LBB4_275:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[2:3]
	v_mov_b32_e32 v22, v61
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB4_283
; %bb.276:                              ;   in Loop: Header=BB4_45 Depth=1
	v_accvgpr_read_b32 v0, a40
	v_accvgpr_read_b32 v1, a41
	v_mov_b32_e32 v1, v0
	s_mov_b64 s[12:13], 0
	v_mov_b64_e32 v[2:3], v[42:43]
	v_mov_b32_e32 v22, v61
	s_branch .LBB4_278
.LBB4_277:                              ;   in Loop: Header=BB4_278 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[8:9], v[12:13], 3, v[8:9]
	v_or_b32_e32 v11, v3, v1
	v_mov_b32_e32 v10, v2
	flat_store_dwordx2 v[8:9], v[10:11] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[6:7], v[6:7], 3, s[84:85]
	v_mov_b64_e32 v[8:9], 1
	global_atomic_add_x2 v[6:7], v[8:9], off
	v_add_u32_e32 v0, 1, v22
	v_sub_u32_e32 v7, 0, v0
	v_ashrrev_i32_e32 v6, 31, v0
	v_max_i32_e32 v0, v7, v0
	v_accvgpr_read_b32 v7, a37
	v_mul_hi_u32 v7, v0, v7
	v_mul_lo_u32 v7, v7, s53
	v_sub_u32_e32 v0, v0, v7
	v_subrev_u32_e32 v7, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	v_lshl_add_u64 v[2:3], v[2:3], 0, 1
	s_nop 0
	v_cndmask_b32_e32 v0, v0, v7, vcc
	v_subrev_u32_e32 v7, s53, v0
	v_cmp_le_u32_e32 vcc, s53, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v7, vcc
	v_xor_b32_e32 v0, v0, v6
	v_cmp_ge_u64_e32 vcc, v[2:3], v[44:45]
	s_or_b64 s[12:13], vcc, s[12:13]
	v_sub_u32_e32 v22, v0, v6
	s_andn2_b64 exec, exec, s[12:13]
	s_cbranch_execz .LBB4_282
.LBB4_278:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_mov_b32 s0, 0
	v_lshl_add_u32 v0, v22, 2, s0
	scratch_load_dword v6, v0, off
	s_movk_i32 s0, 0x200
	v_lshl_add_u32 v0, v22, 3, s0
	scratch_load_dwordx2 v[10:11], v0, off
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshl_add_u64 v[8:9], v[6:7], 3, s[68:69]
	global_load_dwordx2 v[8:9], v[8:9], off
	v_or_b32_e32 v41, s81, v11
	v_lshl_add_u64 v[12:13], v[10:11], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 v0, v[12:13], off
                                        ; implicit-def: $vgpr12_vgpr13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[14:15], exec, s[0:1]
	s_cbranch_execz .LBB4_280
; %bb.279:                              ;   in Loop: Header=BB4_278 Depth=2
	v_cvt_f32_u32_e32 v0, s80
	v_cvt_f32_u32_e32 v12, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v15, v40
	v_fmac_f32_e32 v0, 0x4f800000, v12
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v12, 0x2f800000, v0
	v_trunc_f32_e32 v12, v12
	v_fmac_f32_e32 v0, 0xcf800000, v12
	v_cvt_u32_f32_e32 v12, v12
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s2, v12
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s18, s0, s3
	s_mul_i32 s17, s1, s3
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s3
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s3, s16
	s_mul_hi_u32 s20, s3, s19
	s_mul_hi_u32 s17, s3, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s2, s19
	s_mul_i32 s19, s2, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s2, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s3, s3, s16
	s_addc_u32 s2, s2, s17
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s17, s0, s3
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s3
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s17, s2, s0
	s_mul_i32 s18, s2, s0
	s_mul_i32 s20, s3, s16
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s19, s3, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s2, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[12:13], s[0:1], v10, s2, 0
	v_mul_hi_u32 v14, v10, s3
	v_lshl_add_u64 v[12:13], v[14:15], 0, v[12:13]
	v_mad_u64_u32 v[16:17], s[0:1], v11, s3, 0
	v_add_co_u32_e32 v0, vcc, v12, v16
	v_mad_u64_u32 v[14:15], s[0:1], v11, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v12, vcc, v13, v17, vcc
	v_mov_b32_e32 v13, s51
	s_nop 0
	v_addc_co_u32_e32 v15, vcc, 0, v15, vcc
	v_lshl_add_u64 v[12:13], v[12:13], 0, v[14:15]
	v_mul_lo_u32 v0, s81, v12
	v_mul_lo_u32 v14, s80, v13
	v_mad_u64_u32 v[12:13], s[0:1], s80, v12, 0
	v_add3_u32 v0, v13, v14, v0
	v_sub_u32_e32 v13, v11, v0
	v_mov_b32_e32 v14, s81
	v_sub_co_u32_e32 v10, vcc, v10, v12
	s_nop 1
	v_subb_co_u32_e64 v12, s[0:1], v13, v14, vcc
	v_subrev_co_u32_e64 v15, s[0:1], s80, v10
	v_subb_co_u32_e32 v0, vcc, v11, v0, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v13, s[2:3], 0, v12, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v13
	v_subb_co_u32_e64 v12, s[0:1], v12, v14, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v15
	v_subrev_co_u32_e64 v14, s[0:1], s80, v15
	s_nop 0
	v_cndmask_b32_e64 v17, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v13
	v_subbrev_co_u32_e64 v12, s[0:1], 0, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v16, v16, v17, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v0
	v_cmp_ne_u32_e64 s[0:1], 0, v16
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v10
	v_cndmask_b32_e64 v12, v13, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v0
	s_nop 1
	v_cndmask_b32_e32 v11, v11, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	s_nop 1
	v_cndmask_b32_e32 v13, v0, v12, vcc
	v_cndmask_b32_e64 v0, v15, v14, s[0:1]
	v_cndmask_b32_e32 v12, v10, v0, vcc
                                        ; implicit-def: $vgpr10_vgpr11
.LBB4_280:                              ;   in Loop: Header=BB4_278 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[14:15]
	s_cbranch_execz .LBB4_277
; %bb.281:                              ;   in Loop: Header=BB4_278 Depth=2
	v_cvt_f32_u32_e32 v0, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v13, v40
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	v_mul_lo_u32 v11, s2, v0
	v_mul_hi_u32 v11, v0, v11
	v_add_u32_e32 v0, v0, v11
	v_mul_hi_u32 v0, v10, v0
	v_mul_lo_u32 v0, v0, s80
	v_sub_u32_e32 v0, v10, v0
	v_subrev_u32_e32 v10, s80, v0
	v_cmp_le_u32_e32 vcc, s80, v0
	s_nop 1
	v_cndmask_b32_e32 v0, v0, v10, vcc
	v_subrev_u32_e32 v10, s80, v0
	v_cmp_le_u32_e32 vcc, s80, v0
	s_nop 1
	v_cndmask_b32_e32 v12, v0, v10, vcc
	s_branch .LBB4_277
.LBB4_282:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[12:13]
.LBB4_283:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_andn2_b64 s[6:7], s[6:7], exec
	s_or_b64 exec, exec, s[8:9]
	s_and_saveexec_b64 s[0:1], s[6:7]
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB4_294
.LBB4_284:                              ;   in Loop: Header=BB4_45 Depth=1
	global_load_ushort v0, v[4:5], off offset:106
	v_accvgpr_read_b32 v2, a40
	v_accvgpr_read_b32 v3, a41
	v_readlane_b32 s0, v62, 53
	v_cmp_eq_u64_e32 vcc, 1, v[2:3]
	v_readlane_b32 s1, v62, 54
	s_and_b64 s[2:3], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[2:3]
	s_cbranch_execz .LBB4_286
; %bb.285:                              ;   in Loop: Header=BB4_45 Depth=1
	global_load_dword v1, v[4:5], off offset:8
	v_readlane_b32 s2, v62, 28
	s_waitcnt vmcnt(0)
	s_nop 0
	v_add_u32_e32 v2, s2, v1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshl_add_u64 v[2:3], v[2:3], 2, s[76:77]
	global_store_dword v[2:3], v0, off
	;;#ASMSTART
	;;#ASMEND
.LBB4_286:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_min_i32_e32 v10, s33, v0
	v_cmp_lt_i32_e32 vcc, 0, v10
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB4_293
; %bb.287:                              ;   in Loop: Header=BB4_45 Depth=1
	v_accvgpr_read_b32 v0, a40
	v_or_b32_e32 v43, v43, v0
	s_mov_b32 s14, 0
	s_movk_i32 s15, 0x200
	s_mov_b64 s[10:11], 0
	v_accvgpr_read_b32 v1, a41
	s_branch .LBB4_289
.LBB4_288:                              ;   in Loop: Header=BB4_289 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[8:9], 3, v[2:3]
	flat_store_dwordx2 v[2:3], v[42:43] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[84:85]
	v_mov_b64_e32 v[2:3], 1
	global_atomic_add_x2 v[0:1], v[2:3], off
	v_add_u32_e32 v10, -1, v10
	s_add_i32 s14, s14, 4
	s_add_i32 s15, s15, 8
	v_cmp_eq_u32_e32 vcc, 0, v10
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execz .LBB4_293
.LBB4_289:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v0, off, s14
	scratch_load_dwordx2 v[6:7], off, s15
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[68:69]
	global_load_dwordx2 v[2:3], v[2:3], off
	v_or_b32_e32 v41, s81, v7
	v_lshl_add_u64 v[8:9], v[6:7], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[8:9], s15
                                        ; implicit-def: $vgpr8_vgpr9
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[12:13], exec, s[0:1]
	s_cbranch_execz .LBB4_291
; %bb.290:                              ;   in Loop: Header=BB4_289 Depth=2
	v_cvt_f32_u32_e32 v8, s80
	v_cvt_f32_u32_e32 v9, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v13, v40
	v_fmac_f32_e32 v8, 0x4f800000, v9
	v_rcp_f32_e32 v8, v8
	s_nop 0
	v_mul_f32_e32 v8, 0x5f7ffffc, v8
	v_mul_f32_e32 v9, 0x2f800000, v8
	v_trunc_f32_e32 v9, v9
	v_fmac_f32_e32 v8, 0xcf800000, v9
	v_cvt_u32_f32_e32 v9, v9
	v_cvt_u32_f32_e32 v8, v8
	v_readfirstlane_b32 s2, v9
	v_readfirstlane_b32 s3, v8
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s18, s0, s3
	s_mul_i32 s17, s1, s3
	s_add_i32 s16, s18, s16
	s_mul_i32 s19, s0, s3
	s_add_i32 s16, s16, s17
	s_mul_i32 s18, s3, s16
	s_mul_hi_u32 s20, s3, s19
	s_mul_hi_u32 s17, s3, s16
	s_add_u32 s18, s20, s18
	s_addc_u32 s17, 0, s17
	s_mul_hi_u32 s21, s2, s19
	s_mul_i32 s19, s2, s19
	s_add_u32 s18, s18, s19
	s_mul_hi_u32 s20, s2, s16
	s_addc_u32 s17, s17, s21
	s_addc_u32 s18, s20, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s16, s17, s16
	s_addc_u32 s17, 0, s18
	s_add_u32 s3, s3, s16
	s_addc_u32 s2, s2, s17
	s_mul_i32 s16, s0, s2
	s_mul_hi_u32 s17, s0, s3
	s_add_i32 s16, s17, s16
	s_mul_i32 s1, s1, s3
	s_add_i32 s16, s16, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s17, s2, s0
	s_mul_i32 s18, s2, s0
	s_mul_i32 s20, s3, s16
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s19, s3, s16
	s_add_u32 s0, s0, s20
	s_addc_u32 s19, 0, s19
	s_add_u32 s0, s0, s18
	s_mul_hi_u32 s1, s2, s16
	s_addc_u32 s0, s19, s17
	s_addc_u32 s1, s1, 0
	s_mul_i32 s16, s2, s16
	s_add_u32 s0, s0, s16
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[8:9], s[0:1], v6, s2, 0
	v_mul_hi_u32 v12, v6, s3
	v_lshl_add_u64 v[8:9], v[12:13], 0, v[8:9]
	v_mad_u64_u32 v[14:15], s[0:1], v7, s3, 0
	v_add_co_u32_e32 v8, vcc, v8, v14
	v_mad_u64_u32 v[12:13], s[0:1], v7, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v8, vcc, v9, v15, vcc
	v_mov_b32_e32 v9, s51
	s_nop 0
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_lshl_add_u64 v[8:9], v[8:9], 0, v[12:13]
	v_mul_lo_u32 v11, s81, v8
	v_mul_lo_u32 v12, s80, v9
	v_mad_u64_u32 v[8:9], s[0:1], s80, v8, 0
	v_add3_u32 v9, v9, v12, v11
	v_sub_u32_e32 v11, v7, v9
	v_mov_b32_e32 v12, s81
	v_sub_co_u32_e32 v6, vcc, v6, v8
	s_nop 1
	v_subb_co_u32_e64 v8, s[0:1], v11, v12, vcc
	v_subrev_co_u32_e64 v11, s[0:1], s80, v6
	v_subb_co_u32_e32 v7, vcc, v7, v9, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v13, s[2:3], 0, v8, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v13
	v_subb_co_u32_e64 v8, s[0:1], v8, v12, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v14, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v11
	v_subrev_co_u32_e64 v12, s[0:1], s80, v11
	s_nop 0
	v_cndmask_b32_e64 v15, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v13
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v14, v14, v15, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v7
	v_cmp_ne_u32_e64 s[0:1], 0, v14
	s_nop 0
	v_cndmask_b32_e64 v9, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v6
	v_cndmask_b32_e64 v8, v13, v8, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v13, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v7
	s_nop 1
	v_cndmask_b32_e32 v9, v9, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v9
	s_nop 1
	v_cndmask_b32_e32 v9, v7, v8, vcc
	v_cndmask_b32_e64 v7, v11, v12, s[0:1]
	v_cndmask_b32_e32 v8, v6, v7, vcc
                                        ; implicit-def: $vgpr6_vgpr7
.LBB4_291:                              ;   in Loop: Header=BB4_289 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[12:13]
	s_cbranch_execz .LBB4_288
; %bb.292:                              ;   in Loop: Header=BB4_289 Depth=2
	v_cvt_f32_u32_e32 v7, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v9, v40
	v_rcp_iflag_f32_e32 v7, v7
	s_nop 0
	v_mul_f32_e32 v7, 0x4f7ffffe, v7
	v_cvt_u32_f32_e32 v7, v7
	v_mul_lo_u32 v8, s2, v7
	v_mul_hi_u32 v8, v7, v8
	v_add_u32_e32 v7, v7, v8
	v_mul_hi_u32 v7, v6, v7
	v_mul_lo_u32 v7, v7, s80
	v_sub_u32_e32 v6, v6, v7
	v_subrev_u32_e32 v7, s80, v6
	v_cmp_le_u32_e32 vcc, s80, v6
	s_nop 1
	v_cndmask_b32_e32 v6, v6, v7, vcc
	v_subrev_u32_e32 v7, s80, v6
	v_cmp_le_u32_e32 vcc, s80, v6
	s_nop 1
	v_cndmask_b32_e32 v8, v6, v7, vcc
	s_branch .LBB4_288
.LBB4_293:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[8:9]
	v_mov_b32_e32 v22, v61
.LBB4_294:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[6:7]
	v_accvgpr_read_b32 v0, a34
	v_accvgpr_read_b32 v2, a40
	v_accvgpr_read_b32 v1, a35
	v_mov_b32_e32 v12, v29
	v_mov_b64_e32 v[14:15], v[30:31]
	v_accvgpr_read_b32 v3, a41
.LBB4_295:                              ;   in Loop: Header=BB4_45 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_accvgpr_read_b32 v8, a42
	v_lshl_add_u64 v[6:7], v[46:47], 0, 1
	v_cmp_eq_u32_e32 vcc, 1, v60
	v_accvgpr_read_b32 v10, a44
	v_accvgpr_read_b32 v11, a45
	v_accvgpr_read_b32 v9, a43
	v_cndmask_b32_e32 v11, v11, v7, vcc
	v_cndmask_b32_e32 v10, v10, v6, vcc
	v_cmp_eq_u32_e32 vcc, 0, v60
	v_accvgpr_write_b32 a41, v3
	v_mov_b64_e32 v[30:31], v[14:15]
	v_cndmask_b32_e32 v9, v9, v7, vcc
	v_cndmask_b32_e32 v8, v8, v6, vcc
	v_mov_b64_e32 v[16:17], v[10:11]
	v_accvgpr_write_b32 a40, v2
	v_mov_b64_e32 v[14:15], v[8:9]
	v_mov_b32_e32 v29, v12
	v_mov_b32_e32 v61, v22
.LBB4_296:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v63, 7
	v_readlane_b32 s1, v63, 8
	s_andn2_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB4_44
; %bb.297:                              ;   in Loop: Header=BB4_45 Depth=1
	s_andn2_b64 vcc, exec, s[78:79]
	s_cbranch_vccnz .LBB4_43
; %bb.298:                              ;   in Loop: Header=BB4_45 Depth=1
	v_readlane_b32 s0, v62, 49
	v_readlane_b32 s1, v62, 50
	s_andn2_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB4_43
; %bb.299:                              ;   in Loop: Header=BB4_45 Depth=1
	s_mov_b32 s8, 0
	s_movk_i32 s9, 0x200
	s_mov_b32 s10, s33
	s_branch .LBB4_301
.LBB4_300:                              ;   in Loop: Header=BB4_301 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_waitcnt vmcnt(0)
	v_lshl_add_u64 v[2:3], v[6:7], 3, v[2:3]
	flat_store_dwordx2 v[2:3], a[38:39] sc0 sc1
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	;;#ASMEND
	v_lshl_add_u64 v[0:1], v[0:1], 3, s[84:85]
	v_mov_b64_e32 v[2:3], 1
	global_atomic_add_x2 v[0:1], v[2:3], off
	s_add_i32 s10, s10, -1
	s_add_i32 s8, s8, 4
	s_add_i32 s9, s9, 8
	s_cmp_eq_u32 s10, 0
	s_cbranch_scc1 .LBB4_43
.LBB4_301:                              ;   Parent Loop BB4_45 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	scratch_load_dword v0, off, s8
	scratch_load_dwordx2 v[4:5], off, s9
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_add_u64 v[2:3], v[0:1], 3, s[68:69]
	global_load_dwordx2 v[2:3], v[2:3], off
	v_or_b32_e32 v41, s81, v5
	v_lshl_add_u64 v[6:7], v[4:5], 0, 1
	v_cmp_ne_u64_e32 vcc, 0, v[40:41]
	scratch_store_dwordx2 off, v[6:7], s9
                                        ; implicit-def: $vgpr6_vgpr7
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[6:7], exec, s[0:1]
	s_cbranch_execz .LBB4_303
; %bb.302:                              ;   in Loop: Header=BB4_301 Depth=2
	v_cvt_f32_u32_e32 v6, s80
	v_cvt_f32_u32_e32 v7, s81
	s_sub_u32 s0, 0, s80
	s_subb_u32 s1, 0, s81
	v_mov_b32_e32 v9, v40
	v_fmac_f32_e32 v6, 0x4f800000, v7
	v_rcp_f32_e32 v6, v6
	s_nop 0
	v_mul_f32_e32 v6, 0x5f7ffffc, v6
	v_mul_f32_e32 v7, 0x2f800000, v6
	v_trunc_f32_e32 v7, v7
	v_fmac_f32_e32 v6, 0xcf800000, v7
	v_cvt_u32_f32_e32 v7, v7
	v_cvt_u32_f32_e32 v6, v6
	v_readfirstlane_b32 s2, v7
	v_readfirstlane_b32 s3, v6
	s_mul_i32 s11, s0, s2
	s_mul_hi_u32 s13, s0, s3
	s_mul_i32 s12, s1, s3
	s_add_i32 s11, s13, s11
	s_mul_i32 s14, s0, s3
	s_add_i32 s11, s11, s12
	s_mul_i32 s13, s3, s11
	s_mul_hi_u32 s15, s3, s14
	s_mul_hi_u32 s12, s3, s11
	s_add_u32 s13, s15, s13
	s_addc_u32 s12, 0, s12
	s_mul_hi_u32 s16, s2, s14
	s_mul_i32 s14, s2, s14
	s_add_u32 s13, s13, s14
	s_mul_hi_u32 s15, s2, s11
	s_addc_u32 s12, s12, s16
	s_addc_u32 s13, s15, 0
	s_mul_i32 s11, s2, s11
	s_add_u32 s11, s12, s11
	s_addc_u32 s12, 0, s13
	s_add_u32 s3, s3, s11
	s_addc_u32 s2, s2, s12
	s_mul_i32 s11, s0, s2
	s_mul_hi_u32 s12, s0, s3
	s_add_i32 s11, s12, s11
	s_mul_i32 s1, s1, s3
	s_add_i32 s11, s11, s1
	s_mul_i32 s0, s0, s3
	s_mul_hi_u32 s12, s2, s0
	s_mul_i32 s13, s2, s0
	s_mul_i32 s15, s3, s11
	s_mul_hi_u32 s0, s3, s0
	s_mul_hi_u32 s14, s3, s11
	s_add_u32 s0, s0, s15
	s_addc_u32 s14, 0, s14
	s_add_u32 s0, s0, s13
	s_mul_hi_u32 s1, s2, s11
	s_addc_u32 s0, s14, s12
	s_addc_u32 s1, s1, 0
	s_mul_i32 s11, s2, s11
	s_add_u32 s0, s0, s11
	s_addc_u32 s1, 0, s1
	s_add_u32 s3, s3, s0
	s_addc_u32 s2, s2, s1
	v_mad_u64_u32 v[6:7], s[0:1], v4, s2, 0
	v_mul_hi_u32 v8, v4, s3
	v_lshl_add_u64 v[6:7], v[8:9], 0, v[6:7]
	v_mad_u64_u32 v[10:11], s[0:1], v5, s3, 0
	v_add_co_u32_e32 v6, vcc, v6, v10
	v_mad_u64_u32 v[8:9], s[0:1], v5, s2, 0
	s_nop 0
	v_addc_co_u32_e32 v6, vcc, v7, v11, vcc
	v_mov_b32_e32 v7, s51
	s_nop 0
	v_addc_co_u32_e32 v9, vcc, 0, v9, vcc
	v_lshl_add_u64 v[6:7], v[6:7], 0, v[8:9]
	v_mul_lo_u32 v8, s81, v6
	v_mul_lo_u32 v9, s80, v7
	v_mad_u64_u32 v[6:7], s[0:1], s80, v6, 0
	v_add3_u32 v7, v7, v9, v8
	v_sub_u32_e32 v8, v5, v7
	v_mov_b32_e32 v9, s81
	v_sub_co_u32_e32 v4, vcc, v4, v6
	s_nop 1
	v_subb_co_u32_e64 v6, s[0:1], v8, v9, vcc
	v_subrev_co_u32_e64 v8, s[0:1], s80, v4
	v_subb_co_u32_e32 v5, vcc, v5, v7, vcc
	s_nop 0
	v_subbrev_co_u32_e64 v10, s[2:3], 0, v6, s[0:1]
	v_cmp_le_u32_e64 s[2:3], s81, v10
	v_subb_co_u32_e64 v6, s[0:1], v6, v9, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, 0, -1, s[2:3]
	v_cmp_le_u32_e64 s[2:3], s80, v8
	v_subrev_co_u32_e64 v9, s[0:1], s80, v8
	s_nop 0
	v_cndmask_b32_e64 v12, 0, -1, s[2:3]
	v_cmp_eq_u32_e64 s[2:3], s81, v10
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v11, v11, v12, s[2:3]
	v_cmp_le_u32_e32 vcc, s81, v5
	v_cmp_ne_u32_e64 s[0:1], 0, v11
	s_nop 0
	v_cndmask_b32_e64 v7, 0, -1, vcc
	v_cmp_le_u32_e32 vcc, s80, v4
	v_cndmask_b32_e64 v6, v10, v6, s[0:1]
	s_nop 0
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, s81, v5
	s_nop 1
	v_cndmask_b32_e32 v7, v7, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v7
	s_nop 1
	v_cndmask_b32_e32 v7, v5, v6, vcc
	v_cndmask_b32_e64 v5, v8, v9, s[0:1]
	v_cndmask_b32_e32 v6, v4, v5, vcc
                                        ; implicit-def: $vgpr4_vgpr5
.LBB4_303:                              ;   in Loop: Header=BB4_301 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB4_300
; %bb.304:                              ;   in Loop: Header=BB4_301 Depth=2
	v_cvt_f32_u32_e32 v5, s80
	s_sub_i32 s2, 0, s80
	v_mov_b32_e32 v7, v40
	v_rcp_iflag_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x4f7ffffe, v5
	v_cvt_u32_f32_e32 v5, v5
	v_mul_lo_u32 v6, s2, v5
	v_mul_hi_u32 v6, v5, v6
	v_add_u32_e32 v5, v5, v6
	v_mul_hi_u32 v5, v4, v5
	v_mul_lo_u32 v5, v5, s80
	v_sub_u32_e32 v4, v4, v5
	v_subrev_u32_e32 v5, s80, v4
	v_cmp_le_u32_e32 vcc, s80, v4
	s_nop 1
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_subrev_u32_e32 v5, s80, v4
	v_cmp_le_u32_e32 vcc, s80, v4
	s_nop 1
	v_cndmask_b32_e32 v6, v4, v5, vcc
	s_branch .LBB4_300
.LBB4_305:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
		.amdhsa_group_segment_fixed_size 64
		.amdhsa_private_segment_fixed_size 1552
		.amdhsa_kernarg_size 688
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
		.amdhsa_next_free_vgpr max(totalnumvgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
		.amdhsa_next_free_sgpr max(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)-6
		.amdhsa_accum_offset (((((alignto(max(1, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63)+1)*4
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
.Lfunc_end4:
	.size	_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE, .Lfunc_end4-_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
                                        ; -- End function
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr, max(64, amdgpu.max_num_vgpr)
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, max(52, amdgpu.max_num_agpr)
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr, max(100, amdgpu.max_num_sgpr)
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_named_barrier, max(0, amdgpu.max_num_named_barrier)
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.private_seg_size, 1552
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, 1
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.has_dyn_sized_stack, 1
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.has_recursion, 1
	.set _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.has_indirect_call, 1
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 23364
; TotalNumSgprs: _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6
; NumVgprs: _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr
; NumAgprs: _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr
; TotalNumVgprs: totalnumvgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr)
; ScratchSize: 1552
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 64 bytes/workgroup (compile time only)
; SGPRBlocks: (alignto(max(max(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), 1), 8)/8)-1
; VGPRBlocks: (alignto(max(max(totalnumvgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0), 1), 8)/8)-1
; NumSGPRsForWavesPerEU: max(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+6, 1, 0)
; NumVGPRsForWavesPerEU: max(totalnumvgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0)
; AccumOffset: ((alignto(max(1, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1+1)*4
; Occupancy: occupancy(8, 8, 512, 8, 8, max(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.numbered_sgpr+extrasgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_vcc, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.uses_flat_scratch, 1), 1, 0), max(totalnumvgprs(_Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_agpr, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 1, 0))
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: (((alignto(max(1, _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.num_vgpr), 4)/4)-1)&~65536)&63
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
	.protected	g_sink                  ; @g_sink
	.type	g_sink,@object
	.section	.bss,"aw",@nobits
	.globl	g_sink
	.p2align	2, 0x0
g_sink:
	.long	0                               ; 0x0
	.size	g_sink, 4

	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"[ELECTION] block=%d xcd=%d -> SCHEDULER (sched_id=%d)\n"
	.size	.L.str, 55

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"[WORKER_XCD] worker_id=%d block=%d xcd=%d\n"
	.size	.L.str.1, 43

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"[FWD_PASS] iter=%d time_ms=%.3f num_active_tokens=%d\n"
	.size	.L.str.3, 54

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	"[SCHED_XCD] sched_id=%d xcd=%d workers_on_xcd=%d block=%d\n"
	.size	.L.str.4, 59

	.type	__hip_cuid_e31445b71b03028d,@object ; @__hip_cuid_e31445b71b03028d
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_e31445b71b03028d
__hip_cuid_e31445b71b03028d:
	.byte	0                               ; 0x0
	.size	__hip_cuid_e31445b71b03028d, 1

	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym g_sink
	.addrsig_sym __hip_cuid_e31445b71b03028d
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           432
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 432
    .max_flat_workgroup_size: 1024
    .name:           _Z11init_kernelN6mirage7runtime13RuntimeConfigE
    .private_segment_fixed_size: 0
    .sgpr_count:     27
    .sgpr_spill_count: 0
    .symbol:         _Z11init_kernelN6mirage7runtime13RuntimeConfigE.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     6
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           432
        .value_kind:     by_value
      - .offset:         432
        .size:           4
        .value_kind:     by_value
      - .offset:         440
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         444
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         448
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         452
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         454
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         456
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         458
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         460
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         462
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         480
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         488
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         496
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         504
        .size:           2
        .value_kind:     hidden_grid_dims
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 696
    .max_flat_workgroup_size: 1024
    .name:           _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi
    .private_segment_fixed_size: 0
    .sgpr_count:     46
    .sgpr_spill_count: 0
    .symbol:         _Z14prepare_kernelN6mirage7runtime13RuntimeConfigEi.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     12
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           432
        .value_kind:     by_value
      - .offset:         432
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         436
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         440
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         444
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         446
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         448
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         450
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         452
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         454
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         472
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         480
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         488
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         496
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         512
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         520
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         528
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         536
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         544
        .size:           8
        .value_kind:     hidden_completion_action
      - .offset:         632
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 2072
    .kernarg_segment_align: 8
    .kernarg_segment_size: 688
    .max_flat_workgroup_size: 256
    .name:           _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE
    .private_segment_fixed_size: 1552
    .sgpr_count:     106
    .sgpr_spill_count: 187
    .symbol:         _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: true
    .vgpr_count:     125
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           432
        .value_kind:     by_value
      - .offset:         432
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         436
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         440
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         444
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         446
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         448
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         450
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         452
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         454
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         472
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         480
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         488
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         496
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         512
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         520
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         528
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         536
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         544
        .size:           8
        .value_kind:     hidden_completion_action
      - .offset:         632
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 2000
    .kernarg_segment_align: 8
    .kernarg_segment_size: 688
    .max_flat_workgroup_size: 256
    .name:           _Z13worker_kernelN6mirage7runtime13RuntimeConfigE
    .private_segment_fixed_size: 0
    .sgpr_count:     106
    .sgpr_spill_count: 70
    .symbol:         _Z13worker_kernelN6mirage7runtime13RuntimeConfigE.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: true
    .vgpr_count:     80
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     52
    .args:
      - .offset:         0
        .size:           432
        .value_kind:     by_value
      - .offset:         432
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         436
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         440
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         444
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         446
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         448
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         450
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         452
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         454
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         472
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         480
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         488
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         496
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         512
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         520
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         528
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         536
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         544
        .size:           8
        .value_kind:     hidden_completion_action
      - .offset:         632
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 64
    .kernarg_segment_align: 8
    .kernarg_segment_size: 688
    .max_flat_workgroup_size: 1024
    .name:           _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE
    .private_segment_fixed_size: 1552
    .sgpr_count:     106
    .sgpr_spill_count: 115
    .symbol:         _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: true
    .vgpr_count:     116
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
