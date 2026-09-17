# A Fleet-style megakernel in MLIR-AIR on GPU — what exists, what's missing

Analysis of the AIR compute model against Fleet's megakernel
(`../fleet-chiplet-megakernel`, compiled evidence in `fleet-codegen/`).

**Short answer to "can we reuse the `fused_decode` structure?"** Yes for the
*operator schedule* — wave loop, `index_switch` arms, per-wave weight feeds all
transfer. The dispatch nesting does not, but that is not an AIR limitation:
`fused_decode` puts its wave loop outside `air.launch` because of the NPU
runtime, and the GPU backend is free to lower a persistent kernel however we
like.

**The AIR compute model already specifies Fleet's hierarchy, level for level.**
`docs/AIRComputeModel.md` §4.2 defines the four-level MI3xx mapping, including
`backend-granularity=XCD`. The gap is in the *implementation*
(`AIRToROCDLPass`), not the model.

---

## 1. AIR's hierarchy already matches Fleet's — on paper

`docs/AIRComputeModel.md` §4.2, "Device-scale mapping via nested segments
(MI3xx)", is Fleet's Table 3 written in AIR vocabulary:

| Level | AIR construct | MI3xx granularity (doc §4.2) | Fleet (Table 3) |
|---|---|---|---|
| 1 | `air.launch` (unit iteration space) | whole-device dispatch | **device-task** |
| 2 | outer `air.segment`, `backend-granularity=XCD`, space = 8 | all 8 XCDs concurrently | **Chiplet-task** |
| 3 | inner `air.segment`, space = CUs per XCD | one CU | **CU-task** |
| 4 | `air.herd`, space ≤ 32 | concurrent warps on that CU | **wavefront-task** |

Quoting the doc directly: *"The `backend-granularity=XCD` attribute on the outer
segment is the only MI3xx-specific annotation required; all other tiling falls
out of the standard segment and herd iteration space mechanisms."*

And on nesting: *"The nesting depth of `air.segment` is unbounded by the model;
backends may impose device-specific limits (e.g. two levels on MI3xx — XCD and
CU)."*

`air.launch` also already accepts an `affinity` token list that binds work to
*"a specific column range on NPU or a specific XCD on GPU"* (§2.1).

### Correction to an earlier claim

An earlier draft of this file asserted "`air.segment` is exactly Fleet's
Chiplet-task." That is wrong as stated. **`air.segment`'s default GPU mapping is
one workgroup / thread block** — the doc says so explicitly: *"When
`backend-granularity` is absent the backend applies its default mapping (e.g.,
one workgroup / thread block on GPU)."* XCD is an **opt-in granularity** on that
same op, not its meaning.

The corrected statement is stronger, not weaker: AIR does not merely have a level
that *resembles* a chiplet — it has a spec'd, named attribute for exactly it,
plus two-level nesting so Chiplet-task and CU-task are both expressible.

### What the implementation actually does

`AIRToROCDLPass.cpp:455-460` takes grid dims from `air.launch` and block dims
from `air.herd`:

```cpp
gridXVal = sizeOrOne(launchSizes, 0, launchOp);     // launch -> grid
blkIdx.push_back(sizeOrOne(herdSizes, 0, herdOp));  // herd   -> block
```

and `:472-473` drops segment entirely:

```cpp
deleteAirSegment(launchOp, builder, gpuLaunchOp);
```

So the intermediate level — the one the model reserves for XCD *and* CU — is
erased, `backend-granularity` is unimplemented, and nested segments are not
handled. That is the real gap: **the model is done, the lowering is not.**

### The memory model is the harder gap

§4.3 maps AIR memory spaces to GPU **address spaces**:

| AIR | GPU address space | scope |
|---|---|---|
| L3 | 0 generic/global | HBM |
| L2 | 3 local | **workgroup LDS** |
| L1 | 5 private | per-thread VGPR/scratch |

Note what this means: **AIR's `L2` is LDS, not the XCD's 4 MB L2 cache.** Fleet's
entire result is about cache residency and coherence scope in a hardware cache
that has no address space at all — it is transparent. AIR's memory model is an
*address-space* model; Fleet's problem is a *cache-scope* problem, and the two
are orthogonal.

Nothing in AIR today can say "this weight tile should stay resident in this
chiplet's L2" or "this access is agent-scope, not system-scope." That vocabulary
does not exist yet at any level of the stack.

---

## 2. What `fused_decode` actually is

`programming_examples/fused_decode/fused_decode.py`, 5274 lines. Its README:
*"one dispatch = 16 decoder layers + LM head."* So it is genuinely a megakernel
on NPU. The mechanism, though, is completely different from Fleet's.

### The wave loop (`fused_decode.py:5177-5187`)

```python
def _emit_wave_loop(lo, hi):
    for _iv in for_(idx(lo), idx(hi), idx(1)):
        launch(sizes=[1, 1],
               operands=list(_fa) + [_iv],
               attributes={"air.preserve_shim_dma_order": UnitAttr.get()},
               )(launch_body)
        yield_([])
```

`UNI_WAVES = UNI_DEC + UNI_LM` — one wave per decoder layer plus one per
lm-head vocab chunk.

### The opcode dispatch (`fused_decode.py:1183-1185`)

```
# UNIFIED=1: ONE air.launch in for_(0, UNI_DEC+UNI_LM); per-wave arm =
# (iv<UNI_DEC)?1:0 drives the herds' on-core index_switch AND a launch-scope
# index_switch selecting decode vs vocab host feeds.
```

`_arm_of_wave` (`fused_decode.py:1930`) computes an arm per wave — `0 = lm-head,
1 = conv layer, 2 = attention layer` — and `scf.index_switch` selects the
operator body. **This is structurally the same thing as Fleet's `_execute_task`
if/else chain over `task_type`.** Both are an opcode dispatch inside a loop.

The difference is *when it resolves*:

| | Fleet | `fused_decode` |
|---|---|---|
| schedule lives in | `TaskDesc[]` in HBM, read at runtime | loop induction variable |
| dispatch | `if (task_type == X && variant_id == Y)` at runtime | `index_switch`, **folds to a constant** |
| who distributes work | 8 scheduler workgroups, on device | the compiler, at build time |
| cost | 8 CUs (3.1%), queue polls, event counters | zero runtime cost |
| flexibility | dynamic batching, any task graph | one baked schedule |

`_arm_of_wave`'s own docstring is explicit: *"The wave loop is fully unrolled by
the time it reaches the shim, so every one of these folds to a constant."*

---

## 3. The loop nesting is an NPU artifact, not a constraint

`fused_decode` puts the wave loop outside the launch:

```python
for _iv in for_(idx(lo), idx(hi), idx(1)):
    launch(sizes=[1, 1], operands=list(_fa) + [_iv], ...)(launch_body)
```

That shape exists to serve the **NPU runtime**: `AIRRtToNpuPass.cpp:125` handles
`scf::ForOp`/`WhileOp` by flattening the loop into a single unrolled instruction
sequence inside one xclbin, so N waves cost 1 dispatch. The builder's own
comments confirm the nesting is driven by device resource limits, not by the
model — peeling the loop per weight group was *"tried and abandoned: each peeled
launch carries its own segment, which multiplies the device-level resources
(segment symbols, locks, and packet ids — the 5-bit dma_bd Packet ID field caps
that at ~4 launches)."*

**The GPU backend inherits none of that.** `AIRToROCDLPass` is our code; today it
walks every `air.launch` and emits a `gpu::LaunchOp` per occurrence
(`:441`), which would turn a loop of launches into N dispatches — but nothing in
the AIR model requires that lowering. We are free to emit exactly what Fleet
emits: one `gpu.launch` with the grid sized to the hardware and the wave loop
inside the kernel body.

So this is a **codegen choice to make**, not a blocker to work around. The two
backends can legitimately lower the same source differently:

```
NPU:  AIRRtToNpu   — unroll the loop into one instruction stream
GPU:  AIRToROCDL   — keep the loop, put it inside a persistent gpu.launch
```

Two reasonable GPU forms, and the choice is open:

1. **Loop inside the launch** (Fleet's shape). One `air.launch`, grid = hardware,
   `scf.for` over waves in the body, device-scope barrier between waves.
2. **Loop outside, fused by the pass.** Keep `fused_decode`'s source shape
   unchanged and teach `AIRToROCDL` to recognise a loop-of-launches over a
   uniform body and fuse it into one persistent kernel.

Form 2 preserves source compatibility between the NPU and GPU paths, which is
worth something given `fused_decode.py` is 5274 lines that already work.

---

## 4. What AIR already has that Fleet had to hand-write

This is the encouraging part. From the multi-GPU work (PRs #1576–#1582):

**Event waits already lower correctly.** `AIRGpuChannelToCachelinePass.cpp:13`:

```
//   put -> air.translate + cooperative memref.store (flag at lane 31)
//   get -> scf.while spin loop + gpu.shuffle idx broadcast of lane 31
```

`scf::WhileOp::create` at line 221, with `memref.atomic_rmw` for the observable
read (line 186). Compare to what we disassembled out of Fleet's `worker_kernel`:

```
global_load_dwordx2 v[4:5], v[0:1], off sc0 sc1   ; event counter
s_sleep 1
v_cmp_ge_u64_e32 vcc, v[4:5], v[2:3]
s_cbranch_execnz 65528                            ; spin
```

Same construct. AIR generates it from `air.channel.get`; Fleet writes it by
hand. **AIR's channel abstraction already covers Fleet's dependency mechanism** —
it is currently wired for cross-rank (device-to-device) rather than cross-XCD,
but the lowering exists.

**Topology discovery has a precedent.** Fleet reads `s_getreg_b32
hwreg(HW_REG_XCC_ID)` (6 sites in our compiled object) because HIP will not tell
you which chiplet you landed on. AIR would need the same query to implement
segment→XCD, and `air.rank`'s rank-id has the analogous shape one level up.

---

## 5. What is genuinely missing

All of it is in the lowering and the memory model. None of it is in the compute
model.

| # | Gap | Where | Effort |
|---|---|---|---|
| 1 | `backend-granularity=XCD` is spec'd but unimplemented; `deleteAirSegment` erases the level entirely | `AIRToROCDLPass.cpp:473` | Medium |
| 2 | Nested segments (XCD × CU, doc §4.2) not handled — the pass assumes one segment per launch | `AIRToROCDLPass.cpp:442` | Medium |
| 3 | No segment-id query. Fleet needs `s_getreg_b32 hwreg(HW_REG_XCC_ID)` because HIP will not tell a workgroup which chiplet it landed on; AIR needs the same to give the outer segment's iteration variable a physical meaning | new lowering | Small |
| 4 | Persistent-kernel form: grid sized to hardware, wave loop inside the kernel | `AIRToROCDLPass` | Medium |
| 5 | **Cache scope has no representation anywhere.** AIR memory spaces are address spaces (§4.3: L2 = LDS); Fleet's result is about the XCD L2 *cache* and agent-vs-system coherence scope | dialect + lowering | **Largest** |
| 6 | Device-scope barrier / event counters at wave boundaries | partly exists (§4 below) | Medium |

Gap 3 deserves a note: the doc says segment instances "stamp out concurrently"
across all 8 XCDs, but on a real GPU you cannot *place* a workgroup on a chosen
XCD through the API — you can only discover where you landed. Fleet handles this
by having every worker read `XCC_ID` and a software scheduler bind work
accordingly (6 `s_getreg` sites in our compiled object). Any AIR implementation
of `backend-granularity=XCD` faces the identical problem, and `affinity` tokens
(§2.1, *"a specific XCD on GPU"*) are the natural place to hang the answer.

Gap 5 is the one to think hardest about, and Fleet's own code shows why: its
`ld_local_u64` uses C++ `volatile` to mean "L2-local", and clang lowers that to
`flat_load ... sc0 sc1` — **system scope**, the opposite of the intent (isolated
test in `fleet-codegen/MEGAKERNEL.md`). A dialect carrying scope as an attribute
and lowering it deliberately cannot make that mistake. That is the strongest
argument for doing this in AIR rather than in C++.

---

## 6. Recommendation

**Take the static path.** Keep `fused_decode`'s schedule structure — wave loop,
`index_switch` arms, per-wave weight feeds — and change only the dispatch:

1. Implement `backend-granularity=XCD` and nested segments per doc §4.2 — this
   is writing the lowering for a spec that already exists.
2. Emit a persistent `gpu.launch` (either loop shape from §3; form 2 keeps the
   `fused_decode` source shared between backends).
3. Add cache-scope vocabulary — the genuinely new design work (gap 5).
4. Reuse `AIRGpuChannelToCachelinePass`'s spin-loop lowering for wave barriers.

For one model with a fixed schedule, **the static form should beat Fleet**, not
merely match it. Fleet spends 8 CUs on schedulers, plus descriptor fetches, queue
polls and event counters, to rediscover at runtime a schedule that is fully known
at compile time. Our measurements put concrete numbers on that overhead:
`scheduler_kernel` is 4411 instructions and `worker_kernel` is 1978, of which
only a handful do useful work — the rest is dispatch machinery a compiler can
fold away. AIR already folds it (`_arm_of_wave` → constants).

What you would give up is what `fused_decode` already gives up on NPU: dynamic
batching and variable sequence length. The NPU side solves that with host-side
instruction patching (`decode_insts_gen.py`, `DecodeInstsGen`) — serving any `L`
from one template. The GPU equivalent is simpler: kernel arguments.

**Suggested first milestone** — not the LLM. Take
`test/gpu/4k_4k_mul` (already passing end-to-end on gfx950 per commit
`475e783a`) and make a two-wave version: one `air.launch`, grid `[8, N]`, an
`scf.for` of 2 inside, `index_switch` selecting GEMM-A vs GEMM-B, `air.segment`
mapped to XCD. If that emits one `gpu.launch_func` and the ISA shows one
`s_getreg XCC_ID` per segment, every hard part is proven and the rest is scale.

---

## Caveats

- The GPU path is not CI-exercised (commit `475e783a`: *"had rotted because it is
  not exercised by CI"*). Expect more drift beyond the three API fixes.
- `air.segment`'s TableGen description in `AIR.td` is literally the word
  `Segment`; the real specification lives in `docs/AIRComputeModel.md` (§2.2,
  §4.2). The op doc is worth syncing to the model doc.
- I have not run any of this. The Fleet-side numbers are compiled facts; the AIR
  side here is source reading.
