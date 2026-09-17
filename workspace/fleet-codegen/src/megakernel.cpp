// Fleet MEGAKERNEL CONTROL FLOW — the real persistent worker and scheduler
// loops, compiled for gfx950.
//
//   src/megakernel_loops.inc  = persistent_kernel.cuh lines 693-1913, VERBATIM
//                               (sed-extracted, not retyped)
//   runtime_header.h          = Fleet source, #included unmodified
//   mpk_atoms.cuh             = Fleet source, #included unmodified
//
// Only the leaf compute kernels (_execute_task / _execute_gang_task) are
// stubbed — they are CK-tile GEMM/FMHA, not control flow. Everything that
// decides *what runs where and when* is the genuine article.

#include "hipshim.h"

// ---- knobs the megakernel expects from the build system ----
#define MPK_TARGET_CC 94
#define MIRAGE_BACKEND_USE_ROCM 1
#define MODE_OFFLINE 1
#define MPK_ENABLE_GANG_TASKS 1
#define MAX_WORKER_PER_SCHEDULER 128
#define MPK_MAX_NUM_BATCHED_REQUESTS 1
#define MPK_MAX_NUM_BATCHED_TOKENS 8
#define MPK_MAX_NUM_PAGES 16
#define MPK_PAGE_SIZE 4096
#define MPK_MAX_SEQ_LENGTH 1200
#define MPK_MAX_TOKENS_PER_REQUEST 8
#define WORKER_NUM_THREADS 256
#define __launch_bounds__(...) __attribute__((amdgpu_flat_work_group_size(1, 256)))

#include <algorithm>
#include "mpk_atoms.cuh"     // Fleet source, unmodified
#include "runtime_header.h"  // Fleet source, unmodified

using namespace mirage::runtime;

// ---- host-side bits the extracted region references ----

extern "C" int printf(const char *, ...);
static inline void __nanosleep_stub(unsigned) {}

// cp.async shims (copy_sm80.cuh is NVIDIA PTX; on AMD these degrade to copies)
namespace kernel {
__device__ __forceinline__ void cp_async_fence() {}
template <int N> __device__ __forceinline__ void cp_async_wait() {}
} // namespace kernel
__device__ __forceinline__ void load_smem(char *smem_ptr, char const *gmem_ptr) {
  *reinterpret_cast<__attribute__((address_space(3))) long4 *>(
      (__attribute__((address_space(3))) void *)smem_ptr) =
      *reinterpret_cast<long4 const *>(gmem_ptr);
}

// ---- leaf compute kernels: stubbed (CK-tile, not control flow) ----
__device__ __forceinline__ void _execute_task(TaskDesc const *task_desc,
                                              RuntimeConfig const &cfg);
__device__ __forceinline__ void _execute_gang_task(TaskDesc const *task_desc,
                                                   RuntimeConfig const &cfg,
                                                   int tile_idx);

__device__ int g_sink;
__device__ __forceinline__ void _execute_task(TaskDesc const *task_desc,
                                              RuntimeConfig const &) {
  g_sink += (int)task_desc->task_type;
}
__device__ __forceinline__ void _execute_gang_task(TaskDesc const *task_desc,
                                                   RuntimeConfig const &,
                                                   int tile_idx) {
  g_sink += (int)task_desc->task_type + tile_idx;
}

// ===========================================================================
// VERBATIM: persistent_kernel.cuh:693-1913
//   execute_worker(), execute_scheduler(), persistent_kernel,
//   worker_kernel, scheduler_kernel
// ===========================================================================
#include "megakernel_loops.inc"
