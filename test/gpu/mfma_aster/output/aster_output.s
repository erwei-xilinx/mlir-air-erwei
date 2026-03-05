  ; Module: air_forward_module
  .amdgcn_target "amdgcn-amd-amdhsa--gfx942"
  .text
  .globl forward
  .p2align 8
  .type forward,@function
forward:
  s_load_dwordx2 s[2:3], s[0:1], 0
  s_load_dwordx2 s[4:5], s[0:1], 8
  s_load_dwordx2 s[0:1], s[0:1], 16
  s_waitcnt lgkmcnt(0)
  v_lshlrev_b32_e64 v1, 5, v0
  v_ashrrev_i32_e64 v10, 4, v0
  v_mov_b32_e32 v2, -512
  v_mul_lo_u32 v2, v2, v10
  v_add_u32 v1, v1, v2
  v_and_b32 v2, 63, v0
  v_ashrrev_i32_e64 v11, 4, v2
  v_lshlrev_b32_e64 v2, 3, v11
  v_add_u32 v1, v1, v2
  global_load_dwordx2 v[2:3], v1, s[2:3]
  global_load_dwordx2 v[8:9], v1, s[4:5]
  v_mov_b32_e32 v4, 0
  v_mov_b32_e32 v5, 0
  v_mov_b32_e32 v6, 0
  v_mov_b32_e32 v7, 0
  s_waitcnt vmcnt(0)
  v_mfma_f32_16x16x16_f16 v[4:7], v[2:3], v[8:9], v[4:7]
  v_lshlrev_b32_e64 v1, 2, v11
  v_lshlrev_b32_e64 v0, 2, v0
  v_mov_b32_e32 v2, -64
  v_mul_lo_u32 v2, v2, v10
  v_add_u32 v3, v0, v2
  v_lshlrev_b32_e64 v8, 8, v11
  v_add_u32 v3, v3, v8
  global_store_dword v3, v4, s[0:1]
  v_add_u32 v3, 1, v1
  v_lshlrev_b32_e64 v3, 6, v3
  v_add_u32 v3, v3, v0
  v_add_u32 v3, v3, v2
  global_store_dword v3, v5, s[0:1]
  v_add_u32 v3, 2, v1
  v_lshlrev_b32_e64 v3, 6, v3
  v_add_u32 v3, v3, v0
  v_add_u32 v3, v3, v2
  global_store_dword v3, v6, s[0:1]
  v_add_u32 v1, 3, v1
  v_lshlrev_b32_e64 v1, 6, v1
  v_add_u32 v0, v1, v0
  v_add_u32 v0, v0, v2
  global_store_dword v0, v7, s[0:1]
  s_waitcnt vmcnt(0)
  s_endpgm
  .section .rodata,"a",@progbits
  .p2align 6, 0x0
  .amdhsa_kernel forward
    .amdhsa_kernarg_size 24
    .amdhsa_user_sgpr_count 2
    .amdhsa_user_sgpr_kernarg_segment_ptr 1
    .amdhsa_system_sgpr_workgroup_id_x 0
    .amdhsa_next_free_vgpr 12
    .amdhsa_next_free_sgpr 6
    .amdhsa_accum_offset 12
  .end_amdhsa_kernel
  .text
.Lfunc_end0:
  .size forward, .Lfunc_end0-forward

  .amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count: 0
    .args:
      - .access: read_only
        .actual_access: read_only
        .address_space: generic
        .offset: 0
        .size: 8
        .value_kind: global_buffer
      - .access: read_only
        .actual_access: read_only
        .address_space: generic
        .offset: 8
        .size: 8
        .value_kind: global_buffer
      - .access: write_only
        .actual_access: write_only
        .address_space: generic
        .offset: 16
        .size: 8
        .value_kind: global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language: Assembler
    .max_flat_workgroup_size: 1024
    .name: forward
    .private_segment_fixed_size: 0
    .sgpr_count: 6
    .sgpr_spill_count: 0
    .symbol: forward.kd
    .vgpr_count: 12
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdgcn_target: amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
---

  .end_amdgpu_metadata
