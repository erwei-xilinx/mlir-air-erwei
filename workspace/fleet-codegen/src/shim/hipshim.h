// Minimal HIP-mode shim so Fleet's megakernel can be compiled with a stock
// clang (-x hip --offload-device-only -nogpuinc) without a ROCm install.
//
// NOTHING HERE IS FLEET CODE. It only recreates the HIP environment that
// Fleet's headers expect. Fleet's own sources are included unmodified.
#pragma once

#define __HIP_PLATFORM_AMD__ 1
#define MIRAGE_AMD_MI300 1

#define __device__ __attribute__((device))
#define __host__ __attribute__((host))
#define __forceinline__ inline __attribute__((always_inline))
#define __global__ __attribute__((global))
#define __shared__ __attribute__((shared))
#define __align__(n) __attribute__((aligned(n)))
#define assert(x) ((void)0)

#define DEV __attribute__((device)) __attribute__((always_inline)) inline

// ---- thread / block / grid indexing -> clang AMDGPU builtins ----
struct __fleet_tid_x { DEV operator unsigned() const { return __builtin_amdgcn_workitem_id_x(); } };
struct __fleet_tid_y { DEV operator unsigned() const { return __builtin_amdgcn_workitem_id_y(); } };
struct __fleet_tid_z { DEV operator unsigned() const { return __builtin_amdgcn_workitem_id_z(); } };
struct __fleet_bid_x { DEV operator unsigned() const { return __builtin_amdgcn_workgroup_id_x(); } };
struct __fleet_bid_y { DEV operator unsigned() const { return __builtin_amdgcn_workgroup_id_y(); } };
struct __fleet_bid_z { DEV operator unsigned() const { return __builtin_amdgcn_workgroup_id_z(); } };
struct __fleet_bdim  { DEV operator unsigned() const { return __builtin_amdgcn_workgroup_size_x(); } };
struct __fleet_gdim  { DEV operator unsigned() const { return __builtin_amdgcn_grid_size_x(); } };

struct __fleet_tid3  { __fleet_tid_x x; __fleet_tid_y y; __fleet_tid_z z; };
struct __fleet_bid3  { __fleet_bid_x x; __fleet_bid_y y; __fleet_bid_z z; };
struct __fleet_bdim3 { __fleet_bdim  x, y, z; };
struct __fleet_gdim3 { __fleet_gdim  x, y, z; };

static __attribute__((device)) __fleet_tid3  threadIdx;
static __attribute__((device)) __fleet_bid3  blockIdx;
static __attribute__((device)) __fleet_bdim3 blockDim;
static __attribute__((device)) __fleet_gdim3 gridDim;

DEV void __syncthreads() { __builtin_amdgcn_s_barrier(); }

DEV void __nanosleep(unsigned ns) {
  unsigned u = ns ? (ns + 63) / 64 : 1;
  for (unsigned i = 0; i < u; i++) __builtin_amdgcn_s_sleep(1);
}
DEV unsigned long long get_wallclock_ns() {
  return __builtin_amdgcn_s_memrealtime() * 10;
}

// ---- device min/max (CUDA/HIP builtins, used unqualified by Fleet) ----
DEV int min(int a, int b) { return a < b ? a : b; }
DEV int max(int a, int b) { return a > b ? a : b; }
DEV unsigned min(unsigned a, unsigned b) { return a < b ? a : b; }
DEV long long min(long long a, long long b) { return a < b ? a : b; }

// ---- atomics: HIP's atomicAdd/atomicCAS are agent (device) scope ----
DEV unsigned long long atomicAdd(unsigned long long *p, unsigned long long v) {
  return __scoped_atomic_fetch_add(p, v, __ATOMIC_RELAXED, __MEMORY_SCOPE_DEVICE);
}
DEV int atomicAdd(int *p, int v) {
  return __scoped_atomic_fetch_add(p, v, __ATOMIC_RELAXED, __MEMORY_SCOPE_DEVICE);
}
DEV unsigned long long atomicCAS(unsigned long long *p, unsigned long long cmp,
                                 unsigned long long v) {
  __scoped_atomic_compare_exchange_n(p, &cmp, v, false, __ATOMIC_RELAXED,
                                     __ATOMIC_RELAXED, __MEMORY_SCOPE_DEVICE);
  return cmp;
}
DEV int atomicCAS(int *p, int cmp, int v) {
  __scoped_atomic_compare_exchange_n(p, &cmp, v, false, __ATOMIC_RELAXED,
                                     __ATOMIC_RELAXED, __MEMORY_SCOPE_DEVICE);
  return cmp;
}

struct __attribute__((aligned(16))) long4 { long x, y, z, w; };

typedef unsigned long long EventCounter;
typedef __SIZE_TYPE__ size_t;

// device-side printf (the real one is an OpenCL builtin from ROCm device libs)
extern "C" __attribute__((device)) int printf(const char *, ...);
