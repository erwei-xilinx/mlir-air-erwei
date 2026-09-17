// Fleet device-code probe.
//
// Blocks marked "VERBATIM" are copied byte-for-byte from the Fleet sources at
// the cited file:line. mpk_atoms.cuh is #included directly, unmodified.
// Everything else is scaffolding to give those blocks callable entry points.

#include "hipshim.h"
#include "mpk_atoms.cuh" // <-- Fleet source, included unmodified

// ===========================================================================
// VERBATIM: persistent_kernel.cuh:186-190
// ===========================================================================
__device__ __forceinline__ int get_current_xcd_id() {
  int xcd_id;
  asm volatile ("s_getreg_b32 %0, hwreg(HW_REG_XCC_ID, 0, 16)" : "=s"(xcd_id));
  return xcd_id;
}

// Trimmed stand-in for RuntimeConfig: only the fields the Fleet blocks touch.
struct RuntimeConfig {
  int num_workers;
  int num_events;
  unsigned long long per_worker_queue_len;
  unsigned long long *worker_queue_last_ready_task_id;
  unsigned long long **worker_queues;
  EventCounter *all_event_counters;
  int *all_event_num_triggers;
  int *xcd_leader_worker;
  int *worker_xcd_map;
  int *xcd_event_num_tasks;
  EventCounter *xcd_local_event_counters;
};

// ===========================================================================
// VERBATIM: persistent_kernel.cuh:200-208
// ===========================================================================
__device__ __forceinline__ bool elect_xcd_leader(
    RuntimeConfig const &config,
    int worker_id,
    int xcd_id) {
  // Use atomicCAS to elect first worker on each XCD as leader
  // -1 means no leader yet
  int old = atomicCAS(&config.xcd_leader_worker[xcd_id], -1, worker_id);
  return (old == -1 || old == worker_id);
}

__device__ void _execute_gang_task(void *, RuntimeConfig const &, int);

// ---------------------------------------------------------------------------
// K1: XCD identity + leader election
// ---------------------------------------------------------------------------
__global__ void k_xcd_identity(RuntimeConfig config, int worker_id, int *out) {
  int xcd = get_current_xcd_id();
  config.worker_xcd_map[worker_id] = xcd;
  threadfence_gpu();
  *out = elect_xcd_leader(config, worker_id, xcd) ? 1 : 0;
}

// ---------------------------------------------------------------------------
// K2: scheduler-side Chiplet-task broadcast
//     VERBATIM body: persistent_kernel.cuh:1645-1656
// ---------------------------------------------------------------------------
__global__ void k_gang_broadcast(RuntimeConfig config,
                                 int dispatch_count,
                                 int *my_workers,
                                 unsigned long long *worker_queue_next_free_task_pos,
                                 unsigned long long task_id_encoded) {
  // Pass 2: Broadcast the gang task to dispatch_count workers
  for (int widx = 0; widx < dispatch_count; widx++) {
    int nw = my_workers[widx];
    size_t last_task_id =
        worker_queue_next_free_task_pos[widx]++;
    st_local_u64(
        &config.worker_queues[nw][last_task_id %
                                  config.per_worker_queue_len],
        task_id_encoded);
    fence_local();
    atom_add_local_u64(
        &config.worker_queue_last_ready_task_id[nw], 1);
  }
}

// ---------------------------------------------------------------------------
// K3: worker-side tile strip-mine
//     VERBATIM body: persistent_kernel.cuh:1100-1108
// ---------------------------------------------------------------------------
__global__ void k_gang_strip(RuntimeConfig config,
                             void *task_desc,
                             int block_xcd_local_rank,
                             int block_workers_on_xcd,
                             int n_tile_start_in,
                             int n_tile_count_in,
                             int *gang_tiles_executed) {
  int n_tile_start = n_tile_start_in;
  int n_tile_count = n_tile_count_in;
  int my_tiles = 0;
  for (int t = block_xcd_local_rank; t < n_tile_count; t += block_workers_on_xcd) {
    int tile_idx = n_tile_start + t;
    _execute_gang_task(task_desc, config, tile_idx);
    my_tiles++;
  }
  if (threadIdx.x == 0) *gang_tiles_executed = my_tiles;
}

// ---------------------------------------------------------------------------
// K4: two-level (XCD-local -> global) event signalling
//     VERBATIM body: persistent_kernel.cuh:1226-1251
// ---------------------------------------------------------------------------
__global__ void k_two_level_signal(RuntimeConfig config,
                                   int xcd_id,
                                   int event_index,
                                   int xcd_threshold,
                                   int num_triggers,
                                   int gang_tiles_executed,
                                   unsigned long long iteration_num,
                                   int *fired_out) {
  int xcd_slot = xcd_id * config.num_events + event_index;
  EventCounter count = 0;
  bool event_fired = false;
  bool is_gang = true;

  if (gang_tiles_executed == 0 && is_gang) {
    // No work done — skip event signaling entirely
  } else {
    int event_increment = is_gang ? gang_tiles_executed : 1;
    EventCounter local_count = atom_add_local_u64(
        reinterpret_cast<unsigned long long int *>(
            &config.xcd_local_event_counters[xcd_slot]),
        event_increment) + event_increment;
    EventCounter needed_local =
        static_cast<EventCounter>(xcd_threshold) * iteration_num;

    if (local_count == needed_local) {
      // Last worker/task on this XCD — flush + signal global
      threadfence_gpu();
      // Gang: flush 1 (one task done). Non-gang: flush xcd_threshold.
      int flush_amount = is_gang ? 1 : xcd_threshold;
      count = atom_add_release_gpu_u64(
          &config.all_event_counters[event_index], flush_amount);
      event_fired =
          (count + flush_amount) ==
          static_cast<EventCounter>(num_triggers) * iteration_num;
    }
  }
  *fired_out = event_fired ? 1 : 0;
}

// ---------------------------------------------------------------------------
// K5: M-major windowed traversal
//     VERBATIM body: gang_linear_mi300.cuh:61-76
// ---------------------------------------------------------------------------
__global__ void k_mmajor_traversal(int m_tiles, int n_tiles, int wgm,
                                   int tile_idx, int *out_m, int *out_n) {
  // HipKittens Algorithm 1, Step 2: windowed traversal
  // When wgm <= 0 or wgm >= m_tiles, use full M-major (W = m_tiles)
  int W = (wgm > 0 && wgm < m_tiles) ? wgm : m_tiles;

  int tid_per_group = W * n_tiles;           // tiles in one window
  int group_id = tile_idx / tid_per_group;   // which window of M-rows
  int first_row = group_id * W;
  int win_h = m_tiles - first_row;           // remaining rows
  if (win_h > W) win_h = W;                  // clamp to window height
  int local = tile_idx % tid_per_group;      // position within window
  // Handle tail group (fewer rows than W)
  if (local >= win_h * n_tiles) {
    return;
  }
  int m_tile = first_row + (local % win_h);  // fast index: sweep M within column
  int n_tile = local / win_h;                // slow index: advance N after win_h rows

  *out_m = m_tile;
  *out_n = n_tile;
}

// ---------------------------------------------------------------------------
// K6: the worker's queue poll (L2-local) vs dependency wait (device scope)
//     VERBATIM bodies: persistent_kernel.cuh:837-839 and :943-951
// ---------------------------------------------------------------------------
__global__ void k_poll_vs_depwait(RuntimeConfig config, int worker_queue_id,
                                  int event_index, unsigned long long needed,
                                  unsigned long long *out) {
  // --- intra-XCD: scheduler is on same XCD, L2-local load ---
  unsigned long long last_task_pos =
      ld_local_u64(&config.worker_queue_last_ready_task_id[worker_queue_id]);

  // --- cross-XCD: dependency counter, device-scope acquire ---
  unsigned long long actual_counts = __atomic_load_n(
      reinterpret_cast<unsigned long long *>(&config.all_event_counters[event_index]),
      __ATOMIC_RELAXED);
  __builtin_amdgcn_fence(__ATOMIC_ACQUIRE, "agent");
  while (actual_counts < needed) {
    actual_counts = __atomic_load_n(
        reinterpret_cast<unsigned long long *>(&config.all_event_counters[event_index]),
        __ATOMIC_RELAXED);
    __builtin_amdgcn_s_sleep(1);
  }
  __builtin_amdgcn_fence(__ATOMIC_ACQUIRE, "agent");
  *out = last_task_pos + actual_counts;
}
