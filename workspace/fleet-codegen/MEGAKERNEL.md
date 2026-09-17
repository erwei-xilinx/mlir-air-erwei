# How Qwen3 runs inside Fleet's megakernel

Every claim below is backed by an artifact in `out/` produced by `./build.sh`,
or by a line in `src/megakernel_loops.inc` — which is
`persistent_kernel.cuh:180-1918` extracted verbatim and re-extracted on every
build. Line numbers cited as `loops.inc:N` map to `persistent_kernel.cuh:N+179`.

Compiled with clang 22.1.8 for **gfx950** (MI350 / CDNA4).

---

## 0. What actually happens when you run Qwen3

```
demo.py:1252          mpk()                       ← ONE call, whole generation
   └─ launch_func()
        ├─ worker_kernel   <<<240 blocks, 256 thr>>>   on worker_stream
        └─ scheduler_kernel<<<  8 blocks, 128 thr>>>   on scheduler_stream
```

248 blocks on a 256-CU part. They start, and they do not exit until the
sequence is finished. Prefill and decode both happen inside that launch; the
host never re-enters.

The two streams are launched from `launch_persistent_kernel`, with
`split_worker_scheduler = true` hardcoded at `persistent_kernel.cuh:2036`.

### Resource footprint of the compiled kernels

From `out/megakernel.s` metadata:

| kernel | LDS | scratch | SGPR | VGPR |
|---|--:|--:|--:|--:|
| `init_kernel` | 0 | 0 | 27 | 6 |
| `prepare_kernel` | 0 | 0 | 46 | 12 |
| `persistent_kernel` (fused) | 2072 | 1552 | 106 | 125 |
| `worker_kernel` | 2000 | 0 | 106 | 80 |
| `scheduler_kernel` | 64 | 1552 | 106 | 116 |

`worker_kernel`'s 2000 B of LDS is the task staging buffer, and it matches the
budget comment at `loops.inc:516` ("Make sure overall smem usage here do not
exceed 3KB"). Note this is the *control-flow only* build — the real kernel also
requests ~58 KB dynamic LDS for compute tiles, which is what pins occupancy to
one block per CU.

---

## Mechanism 1 — One launch, not 250

Standard serving issues ~250 kernel launches per decode token across Qwen3-8B's
36 layers (paper §2.2). Fleet issues **one launch for the entire sequence**.

The prefill→decode transition is a device-side function, not a host decision.
`prepare_next_batch()` at `loops.inc:202-357` runs between task-graph
iterations and does, on-GPU:

- `loops.inc:203` — `__shared__ int smem_kv_indices[MPK_MAX_NUM_PAGES]`
- append generated tokens, advance `config.step[request_id]`
- free KV pages back to a device-resident ring (`page_queue`, `page_queue_tail`)
- test EOS / `max_seq_length` and retire the request
- rebuild `qo_indptr_buffer` / `paged_kv_indptr_buffer` for the next batch

Prefill is just an iteration carrying many tokens (`MPK_MAX_TOKENS_PER_REQUEST`,
8 on AMD); decode carries 1. Same task graph, same code, different token count.

**Evidence:** `prepare_kernel` and the `EVENT_END_OF_TASK_GRAPH` handler both
compile into `out/megakernel.o`; `llvm-nm out/megakernel.o` lists all five
kernels with no host-side driver present.

---

## Mechanism 2 — Blocks never retire

Two independent mechanisms pin the resident set.

**Occupancy cap.** `loops.inc:1679` (= `persistent_kernel.cuh:1858`):

```cpp
__global__ __launch_bounds__(WORKER_NUM_THREADS, 1) void worker_kernel(...)
```

**No exit path.** The body is `while (true)` at `loops.inc:647`, and it only
leaves via `TASK_TERMINATE`. In the compiled object this is a backward branch:

```
out/megakernel.dis, worker_kernel+0x7f0:
        s_branch 65467              ; 0xFFBB = -69 → back-edge of while(true)
```

`worker_kernel` contains **96 branch instructions in 1978 instructions** — this
is a control-flow-dominated dispatch loop, not a compute kernel. For contrast,
its instruction mix is led by `v_readlane_b32` (302) and `v_mov_b32` (182):
register shuffling and bookkeeping, with only 31 memory operations total.

---

## Mechanism 3 — Software replaces the hardware dispatcher

This is the defining move, and it is the largest single piece of code:
**`scheduler_kernel` = 4411 instructions, 201 branches.**

### It discovers the topology at runtime

`loops.inc:7-11` (= `persistent_kernel.cuh:186-190`):

```cpp
__device__ __forceinline__ int get_current_xcd_id() {
  int xcd_id;
  asm volatile ("s_getreg_b32 %0, hwreg(HW_REG_XCC_ID, 0, 16)" : "=s"(xcd_id));
  return xcd_id;
}
```

Six `s_getreg_b32 ... XCC_ID` sites survive into `out/megakernel.s`. Workers
publish `worker_id → xcd_id` into a global map; each scheduler spins until all
workers have reported (`loops.inc:1244-1247`), then claims every worker on its
own XCD:

```cpp
my_xcd = get_current_xcd_id();
for (int w = 0; w < config.num_workers; w++)
  if (config.worker_xcd_map[w] == my_xcd) my_workers[my_num_workers++] = w;
```

Nothing about "8 XCDs" is baked into the kernel — it is read off the silicon.

### It runs an event state machine

Inside `while (true)` at `loops.inc:1293`, the scheduler dispatches on
`e.event_type`:

| event | handler |
|---|---|
| `is_termination_event` | `loops.inc:1330` — push `TASK_TERMINATE` to every worker |
| `EVENT_END_OF_TASK_GRAPH` | `loops.inc:1349` — iteration boundary, `prepare_next_batch` |
| `EVENT_LAUNCH_DEPENDENT_TASKS` | `loops.inc:1425` — the main path, gang or round-robin |
| `EVENT_LAUNCH_MASSIVE_TASKS` | `loops.inc:1577` — split across schedulers |

The gang branch at `loops.inc:1443-1477` is where a Chiplet-task is bound to a
chiplet:

```cpp
size_t my_gang_task = e.first_task_id + sched_id;   // scheduler k takes task k
int tiles_per_xcd  = config.all_tasks[my_gang_task].task_metadata.n_tile_count;
int dispatch_count = (tiles_per_xcd < my_num_workers) ? tiles_per_xcd : my_num_workers;
for (int widx = 0; widx < dispatch_count; widx++)   // SAME task id to all
    st_local_u64(&config.worker_queues[my_workers[widx]][...], ...);
```

One task descriptor, broadcast to ~30 workers that all live on one XCD and
therefore share one 4 MB L2. That is the entire Chiplet-task abstraction.

---

## Mechanism 4 — Work is data, staged through LDS

There is no launch per operator. There is an array of `TaskDesc` and a loop that
consumes it.

`TaskDesc` is 16-byte aligned, and the worker bulk-copies it into LDS in 128-bit
chunks (`loops.inc:717-724`):

```cpp
constexpr int TASK_SIZE = sizeof(TaskDesc) / 16;    // 128b copy-async
for (int i = threadIdx.x; i < num_loaded_tasks * TASK_SIZE; i += blockDim.x)
    load_smem(reinterpret_cast<char*>(task_descs) + i*16, ...);
```

**Evidence — this is visible as LDS traffic in the object:**

```
worker_kernel, ds ops = 41
     15 ds_read_b32      6 ds_write_b32
      5 ds_write_b64     5 ds_read_b64
      4 ds_write_b128    2 ds_write2_b32
```

The `ds_write_b128` ×4 are the descriptor stages. A conventional GEMM kernel has
no reason to move 128-bit *descriptors* through LDS — this is an interpreter
loading its next instruction.

The dispatch itself is **generated** as an if/else chain over
`(task_type, variant_id)` — `src/kernel/runtime.cc:1561`:

```cpp
code.e("$ (task_desc->task_type == $ && task_desc->variant_id == $) {", cond, ...);
```

That is an opcode dispatch. Every operator in Qwen3 — QKV, attention, SiLU,
down-proj, argmax — is a case in one `__device__` function.

> **Scope note:** in this build `_execute_task` / `_execute_gang_task` are
> stubbed (`src/megakernel.cpp:62-73`), because the real bodies are CK-tile
> GEMM/FMHA requiring the `composable_kernel` submodule. The *queue machinery*
> above is real; the leaf compute is not.

---

## Mechanism 5 — Dependencies are events, not kernel boundaries

No kernel boundary means no free barrier. The RMSNorm→QKV edge is an explicit
counter.

**The worker waits** (`loops.inc:764-782`). In `out/megakernel.dis`:

```
worker_kernel ~+0x9f88:
        global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1   ; event counter, device scope
        s_sleep 1
        v_cmp_ge_u64_e32 vcc, v[4:5], v[2:3]              ; actual >= needed ?
        s_cbranch_execnz 65528                            ; 0xFFF8 = -8, spin
```

**The worker signals** (`loops.inc:1036-1072`) with the two-level protocol —
`buffer_wbl2` and the device atomic are both behind `s_cbranch_execz`, so only
the last worker on each XCD pays. `worker_kernel` contains 4 `buffer_wbl2` and 9
atomics total for the entire runtime.

The isolated proof is in `out/fleet_probe.s` vs `out/fleet_probe2.s`: Fleet's own
non-XCD fallback emits `buffer_wbl2 sc1` + `flat_atomic_add_x2 sc0 sc1`
*unconditionally*; the two-level path emits the identical pair *branch-guarded*.
Same instructions, different control flow — that is the 14.5× reduction, and it
is a compile-time property.

---

## A finding: `ld_local_u64` is not L2-local in the generated code

`mpk_atoms.cuh:313-329` defines the intra-XCD fast path, with this comment:

```
// Intra-XCD (same L2 partition) memory operations.
// Regular stores are immediately visible to regular loads on the same XCD.
// No buffer_wbl2 (L2→HBM writeback) or NT loads needed.
```

```cpp
__device__ __forceinline__ unsigned long long ld_local_u64(unsigned long long const *addr) {
  return *((volatile unsigned long long const *)addr);
}
```

The intent is "don't cache this in a register." But clang's AMDGPU backend
lowers a C++ `volatile` access as system-scope coherent. Isolated test
(`k_vol` vs `k_plain`, same TU, same flags):

| source | gfx950 lowering |
|---|---|
| `*(volatile u64*)p` — Fleet's `ld_local_u64` | `flat_load_dwordx2 v[2:3], v[0:1] sc0 sc1` |
| `p[0]` — plain load | `global_load_dwordx2` *(no modifier, L2-cached)* |
| `*(volatile u64*)p = v` — `st_local_u64` | `flat_store_dwordx2 v[0:1], v[2:3] sc0 sc1` |
| `p[0] = v` — plain store | `global_store_dwordx2` *(no modifier)* |

By the paper's own §2.1, `SC0=1 or SC1=1` engages the coherence infrastructure
and a `Coherent_Cache_Bypass` L2 policy — the thing the hierarchical
synchronization design exists to avoid. It also becomes `flat_` rather than
`global_`, adding address-space resolution.

**Where it lands** — every scheduler→worker queue write and worker queue poll:

| | `flat_` (volatile path) | `global_` | `sc0 sc1` total | mem ops |
|---|--:|--:|--:|--:|
| `worker_kernel` | 7 | 24 | 9 | 31 |
| `scheduler_kernel` | 11 | 97 | 11 | 108 |

**How much this matters — scoped honestly:**

- It does **not** touch the weight path. The paper's headline result (L2 hit
  rate 38.9%→51.0%, HBM reads −18%) is about GEMM weight tiles, measured on
  hardware, and is unaffected.
- It does **not** invalidate the two-level event counting. Those use `atomicAdd`
  with explicit agent scope, and the branch-guard structure is confirmed present.
- It **does** mean the dispatch path the comments describe as free L2 traffic
  issues system-scope accesses instead. Cost lands on dispatch latency, on a
  spin loop, in the code the paper argues should be the cheap part.

A targeted fix would be `__builtin_nontemporal_load` or an agent-scope
`__scoped_atomic_load_n(..., __MEMORY_SCOPE_DEVICE)` instead of `volatile`.
Untested — no MI350 here to measure whether it moves TPOT.

---

## Caveats

- Leaf compute kernels are stubbed; this is the **control-flow** build.
- Upstream LLVM 22, not ROCm's clang fork. Same AMDGPU backend, so lowering is
  representative; instruction scheduling may differ.
- Never executed. All results are static compilation facts.
- `src/shim/` is hand-written and is not Fleet code; it recreates the HIP
  environment so a stock clang can compile Fleet's sources unmodified.
