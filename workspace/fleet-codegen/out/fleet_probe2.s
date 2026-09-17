	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.amdhsa_code_object_version 6
	.text
	.protected	_Z14k_naive_signal13RuntimeConfigiiyPi ; -- Begin function _Z14k_naive_signal13RuntimeConfigiiyPi
	.globl	_Z14k_naive_signal13RuntimeConfigiiyPi
	.p2align	8
	.type	_Z14k_naive_signal13RuntimeConfigiiyPi,@function
_Z14k_naive_signal13RuntimeConfigiiyPi: ; @_Z14k_naive_signal13RuntimeConfigiiyPi
; %bb.0:
	s_load_dwordx2 s[4:5], s[0:1], 0x18
	s_load_dwordx2 s[6:7], s[0:1], 0x8
	v_mov_b64_e32 v[0:1], 1
	s_load_dwordx4 s[0:3], s[0:1], 0x20
	buffer_wbl2 sc1
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s9, s4, 31
	s_mov_b32 s8, s4
	s_lshl_b64 s[8:9], s[8:9], 3
	s_add_u32 s6, s6, s8
	s_addc_u32 s7, s7, s9
	s_ashr_i32 s4, s5, 31
	v_mov_b64_e32 v[2:3], s[6:7]
	s_mul_hi_u32 s6, s0, s5
	s_mul_i32 s4, s0, s4
	;;#ASMSTART
	flat_atomic_add_x2 v[0:1], v[2:3], v[0:1] sc0 sc1
s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMEND
	s_add_i32 s4, s6, s4
	s_mul_i32 s1, s1, s5
	v_lshl_add_u64 v[0:1], v[0:1], 0, 1
	s_add_i32 s1, s4, s1
	s_mul_i32 s0, s0, s5
	v_cmp_eq_u64_e32 vcc, s[0:1], v[0:1]
	v_mov_b32_e32 v4, 0
	s_nop 0
	v_cndmask_b32_e64 v0, 0, 1, vcc
	global_store_dword v4, v0, s[2:3]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z14k_naive_signal13RuntimeConfigiiyPi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 48
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
.Lfunc_end0:
	.size	_Z14k_naive_signal13RuntimeConfigiiyPi, .Lfunc_end0-_Z14k_naive_signal13RuntimeConfigiiyPi
                                        ; -- End function
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.num_vgpr, 5
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.num_agpr, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.numbered_sgpr, 10
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.num_named_barrier, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.private_seg_size, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.uses_vcc, 1
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.uses_flat_scratch, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.has_dyn_sized_stack, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.has_recursion, 0
	.set _Z14k_naive_signal13RuntimeConfigiiyPi.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 164
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
	.protected	_Z14k_nt_roundtripPyyS_ ; -- Begin function _Z14k_nt_roundtripPyyS_
	.globl	_Z14k_nt_roundtripPyyS_
	.p2align	8
	.type	_Z14k_nt_roundtripPyyS_,@function
_Z14k_nt_roundtripPyyS_:                ; @_Z14k_nt_roundtripPyyS_
; %bb.0:
	s_load_dwordx4 s[4:7], s[0:1], 0x0
	v_mov_b32_e32 v4, 0
	s_load_dwordx2 s[0:1], s[0:1], 0x10
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s6
	v_mov_b32_e32 v1, s7
	v_mov_b64_e32 v[2:3], s[4:5]
	;;#ASMSTART
	global_store_dwordx2 v[2:3], v[0:1], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	;;#ASMSTART
	global_load_dwordx2 v[0:1], v[2:3], off nt
s_waitcnt vmcnt(0)
	;;#ASMEND
	global_store_dwordx2 v4, v[0:1], s[0:1]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z14k_nt_roundtripPyyS_
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 24
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
		.amdhsa_next_free_sgpr 8
		.amdhsa_accum_offset 8
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
.Lfunc_end1:
	.size	_Z14k_nt_roundtripPyyS_, .Lfunc_end1-_Z14k_nt_roundtripPyyS_
                                        ; -- End function
	.set _Z14k_nt_roundtripPyyS_.num_vgpr, 5
	.set _Z14k_nt_roundtripPyyS_.num_agpr, 0
	.set _Z14k_nt_roundtripPyyS_.numbered_sgpr, 8
	.set _Z14k_nt_roundtripPyyS_.num_named_barrier, 0
	.set _Z14k_nt_roundtripPyyS_.private_seg_size, 0
	.set _Z14k_nt_roundtripPyyS_.uses_vcc, 0
	.set _Z14k_nt_roundtripPyyS_.uses_flat_scratch, 0
	.set _Z14k_nt_roundtripPyyS_.has_dyn_sized_stack, 0
	.set _Z14k_nt_roundtripPyyS_.has_recursion, 0
	.set _Z14k_nt_roundtripPyyS_.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 112
; TotalNumSgprs: 14
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
; NumSGPRsForWavesPerEU: 14
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
	.protected	_Z10k_wt_storePvy       ; -- Begin function _Z10k_wt_storePvy
	.globl	_Z10k_wt_storePvy
	.p2align	8
	.type	_Z10k_wt_storePvy,@function
_Z10k_wt_storePvy:                      ; @_Z10k_wt_storePvy
; %bb.0:
	s_load_dwordx4 s[0:3], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s0
	v_mov_b32_e32 v1, s1
	v_mov_b32_e32 v2, s2
	v_mov_b32_e32 v3, s3
	;;#ASMSTART
	global_store_dwordx2 v[0:1], v[2:3], off sc0 sc1
	;;#ASMEND
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z10k_wt_storePvy
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 16
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
		.amdhsa_next_free_sgpr 4
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
.Lfunc_end2:
	.size	_Z10k_wt_storePvy, .Lfunc_end2-_Z10k_wt_storePvy
                                        ; -- End function
	.set _Z10k_wt_storePvy.num_vgpr, 4
	.set _Z10k_wt_storePvy.num_agpr, 0
	.set _Z10k_wt_storePvy.numbered_sgpr, 4
	.set _Z10k_wt_storePvy.num_named_barrier, 0
	.set _Z10k_wt_storePvy.private_seg_size, 0
	.set _Z10k_wt_storePvy.uses_vcc, 0
	.set _Z10k_wt_storePvy.uses_flat_scratch, 0
	.set _Z10k_wt_storePvy.has_dyn_sized_stack, 0
	.set _Z10k_wt_storePvy.has_recursion, 0
	.set _Z10k_wt_storePvy.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 48
; TotalNumSgprs: 10
; NumVgprs: 4
; NumAgprs: 0
; TotalNumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 10
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
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.set amdgpu.max_num_named_barrier, 0
	.text
	.type	__hip_cuid_81e095de9eb92bbb,@object ; @__hip_cuid_81e095de9eb92bbb
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_81e095de9eb92bbb
__hip_cuid_81e095de9eb92bbb:
	.byte	0                               ; 0x0
	.size	__hip_cuid_81e095de9eb92bbb, 1

	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_81e095de9eb92bbb
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           24
        .value_kind:     by_value
      - .offset:         24
        .size:           4
        .value_kind:     by_value
      - .offset:         28
        .size:           4
        .value_kind:     by_value
      - .offset:         32
        .size:           8
        .value_kind:     by_value
      - .address_space:  global
        .offset:         40
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 48
    .max_flat_workgroup_size: 1024
    .name:           _Z14k_naive_signal13RuntimeConfigiiyPi
    .private_segment_fixed_size: 0
    .sgpr_count:     16
    .sgpr_spill_count: 0
    .symbol:         _Z14k_naive_signal13RuntimeConfigiiyPi.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     5
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .offset:         8
        .size:           8
        .value_kind:     by_value
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .max_flat_workgroup_size: 1024
    .name:           _Z14k_nt_roundtripPyyS_
    .private_segment_fixed_size: 0
    .sgpr_count:     14
    .sgpr_spill_count: 0
    .symbol:         _Z14k_nt_roundtripPyyS_.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     5
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .offset:         8
        .size:           8
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 16
    .max_flat_workgroup_size: 1024
    .name:           _Z10k_wt_storePvy
    .private_segment_fixed_size: 0
    .sgpr_count:     10
    .sgpr_spill_count: 0
    .symbol:         _Z10k_wt_storePvy.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     4
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
