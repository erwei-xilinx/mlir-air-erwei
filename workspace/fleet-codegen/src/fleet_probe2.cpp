// Counterfactual probe: Fleet's naive fallback path vs its two-level path,
// plus the non-temporal load helpers. All Fleet blocks verbatim.
#include "hipshim.h"
#include "mpk_atoms.cuh" // Fleet source, unmodified

struct RuntimeConfig {
  int num_events;
  EventCounter *all_event_counters;
  EventCounter *xcd_local_event_counters;
};

// ===========================================================================
// VERBATIM: persistent_kernel.cuh:1276-1284 — the non-XCD-aware fallback
// ("Fallback: per-task fence + global atomic (NVIDIA, or uncounted events)")
// This is what EVERY task does without Fleet's two-level counting.
// ===========================================================================
__global__ void k_naive_signal(RuntimeConfig config, int event_index,
                               int num_triggers, unsigned long long iteration_num,
                               int *fired_out) {
  EventCounter count = 0;
  bool event_fired = false;
  {
    threadfence_gpu();
    count = atom_add_release_gpu_u64(
        &config.all_event_counters[event_index], 1);
    event_fired =
        (count + 1) == static_cast<EventCounter>(num_triggers) * iteration_num;
  }
  *fired_out = event_fired ? 1 : 0;
}

// ===========================================================================
// Fleet's non-temporal helpers (mpk_atoms.cuh:67-96), used for cross-XCD
// scheduler polling and (under MPK_NT_WEIGHT_LOADS) weight streaming.
// ===========================================================================
__global__ void k_nt_roundtrip(unsigned long long *p, unsigned long long v,
                               unsigned long long *out) {
  st_nt_u64(p, v);
  *out = ld_nt_u64(p);
}

// Write-through store (mpk_atoms.cuh:107-117): sc0 sc1, bypasses L2 entirely.
__global__ void k_wt_store(void *p, unsigned long long v) {
  st_wt_u64(p, v);
}
