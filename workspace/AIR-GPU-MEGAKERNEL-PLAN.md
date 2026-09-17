# Fleet-style megakernel in MLIR-AIR on GPU — feasibility and plan

Companion to `AIR-GPU-MEGAKERNEL.md` (model analysis) and
`fleet-codegen/MEGAKERNEL.md` (compiled evidence from Fleet).

**Verdict: feasible, and the risk is lower than it first appears.** Every
mechanism Fleet needs is already expressible on the target — I compiled the two
that mattered. `syncscope("agent")` gives Fleet's exact fence
(`buffer_wbl2 sc1`); `rocdl.global.load.lds` with `aux=18` gives its exact weight
load (`nt sc1`). No new dialect concept is required. The work is lowering, and
the critical path is a persistent-kernel form plus an intra-device
`channel_type`.

---

## Part 1 — Feasibility

### 1.0 Fleet 的实际结构,和我们要写的结构

先把两者分清,后面所有讨论都基于这个区分。

**Fleet 不是"一次 launch"。** 活跃路径是 4 次 launch(`persistent_kernel.cuh`):

| 行 | kernel | grid | 行为 |
|---|---|---|---|
| `:1961` | `init_kernel` | 1 | 跑完退出 |
| `:2264` | `prepare_kernel` | 240 | 跑完退出 |
| `:2287` | `worker_kernel` | 240 | **常驻** |
| `:2293` | `scheduler_kernel` | 8 | **常驻** |
| `:2322` | `persistent_kernel` | 248 | 合并路径,死代码(`split_worker_scheduler=true` 写死在 `:2036`) |

worker 和 scheduler 是两个**不同的 kernel**、两个 stream、并发常驻。

**Launch 和 iteration 是正交的两轴。** 一次 `worker_kernel` launch 内部有 N 次 task-graph
iteration(N = token 数),`iteration_num = task_id >> 32`,scheduler 每过完一遍 graph 加一。

**我们要写的是 1 个常驻 launch**,不是抄 Fleet,而是因为砍掉了 scheduler:

| | Fleet | AIR 重写 |
|---|---|---|
| 常驻 kernel | worker + scheduler,2 个并发 | 1 个 |
| 调度 | 运行时 task queue + event counter | 编译期 `index_switch` |
| CU 开销 | 8 个 CU 跑 scheduler(3.1%) | 0 |

### 1.1 Proven, by compiling it

**Synchronization: MLIR already emits Fleet's exact three-tier protocol.**

`llvm.fence` / `llvm.atomicrmw` / `llvm.load` / `llvm.store` all carry an
optional `syncscope` StrAttr (`LLVMOps.td:389, 478, 2256, 2357`). Compiled to
gfx950 with LLVM 22 (`fleet-codegen/evidence/scope.ll`):

| MLIR syncscope | gfx950 output | Fleet equivalent |
|---|---|---|
| `syncscope("workgroup")` | *(no writeback, no scope bits)* | `fence_local()` |
| `syncscope("agent")` | `buffer_wbl2 sc1` | `threadfence_gpu()` |
| *(default = system)* | `buffer_wbl2 sc0 sc1`, atomic `sc1` | the naive fallback |

`syncscope("agent")` → `buffer_wbl2 sc1` is **byte-identical** to Fleet's
`__builtin_amdgcn_fence(__ATOMIC_RELEASE, "agent")`. The hierarchical
synchronization scheme — the paper's headline mechanism, §5.2 — needs **zero new
target infrastructure**. It is a matter of AIR choosing to emit the attribute.

This also means AIR can avoid Fleet's own bug: its `ld_local_u64` uses C++
`volatile` for "L2-local" and gets `flat_load ... sc0 sc1` (system scope) — the
opposite of intent. An attribute that names the scope cannot silently degrade.

**The AIR→GPU path runs on the real target.** Commit `475e783a` built the GPU
config and ran `test/gpu/4k_4k_mul` end to end on gfx950 ("Output Matched!").
The pipeline is real:

```
air-opt -air-to-rocdl → air-opt -air-gpu-outlining → mlir-opt(rocdl-attach-target,
  convert-gpu-to-rocdl, gpu-module-to-binary, gpu-to-llvm) → link mgpu runtime
```

**No cooperative launch needed.** `mgpuLaunchKernel` uses plain
`hipModuleLaunchKernel` (`gpu_runtime.cpp:94-103`). That is not a blocker,
because **Fleet does not use cooperative launch either** — it pins residency with
`__launch_bounds__(256, 1)` plus a ~58 KB LDS claim, then launches
`worker_kernel<<<240>>>` and `scheduler_kernel<<<8>>>` on two ordinary streams.
MLIR has the equivalent knobs: `known_block_size` on `gpu.func` (`GPUOps.td:167`)
and `rocdl.flat_work_group_size` (`LowerGpuOpsToROCDLOps.cpp:411`).

**Spin-wait lowering already exists.** `AIRGpuChannelToCachelinePass` turns
`air.channel.get` into `scf.while` + `memref.atomic_rmw` (`:221`, `:229`) —
structurally what we disassembled from Fleet's `worker_kernel` dependency wait.

### 1.2 The model is ahead of the implementation

`docs/AIRComputeModel.md` §4.2 already specifies the four-level MI3xx mapping —
`air.launch` / outer `air.segment` (`backend-granularity=XCD`, space 8) / inner
`air.segment` (CUs) / `air.herd` (warps) — which is Fleet's Table 3 level for
level. `air.launch` already accepts `affinity` tokens binding to *"a specific XCD
on GPU"* (§2.1). **Nothing in the compute model needs to be invented.**

> **但 §4.2 那套四层嵌套在 GPU dispatch 语义下站不住** —— 详见 §1.5。本文最终采用
> 一层 segment(= workgroup)+ chiplet 查询 op,`backend-granularity` 砍掉。
> 这段保留是为了说明"模型比实现走得远"这个判断仍然成立:缺的是 lowering,
> 而模型该怎么修是另一个问题。

### 1.3 Measured gaps

| # | Gap | Evidence | Risk |
|---|---|---|---|
| 1 | **No intra-device `channel_type`.** `air-to-rocdl` registers 3 patterns — `AffineApplyToSub`, `DMAMemcpyToSub`, `SCFForToSub` (`:421`) — and no Channel op appears in any GPU pass. The only GPU channel type, `gpu_symmetric_heap`, is cross-rank. Target primitive exists (`rocdl.global.load.lds`); this is a missing lowering, not a missing capability (§1.4) | `fused_decode.py`: **99 ChannelPut/Get vs 1 dma_memcpy** | MED |
| 2 | `air.segment` 被删(`deleteAirSegment`, `:473`),IV 不绑任何东西;且 `:545` 的 kernel-arg 替换**少了 `numNonKernelArgs` 偏移**,给 segment 加 iteration space 就会静默踩坏 IV | 现有测试的 segment 都没有 iteration space,所以没暴露 | MED |
| 3 | 无 chiplet identity。ROCDL **没有** `s_getreg`/XCC_ID op(查过 `ROCDLOps.td`,0 处)。要 `llvm.inline_asm`(AIR 目前一处未用);`chiplet_block_id`/`chiplet_dim_blocks` 还要全局 map + 屏障 | Fleet 有 6 处 `s_getreg XCC_ID` | MED |
| 4 | No persistent-kernel form: every `air.launch` becomes its own `gpu::LaunchOp` (`:441`) | — | MED |
| 5 | cache 行为无词汇。§4.3 把 L2 映到 LDS,XCD L2 *cache* 无表示。**解法已定**:不新造 attribute,用 `nontemporal` + `syncscope` 合成 `$aux`(§1.5) | 已验证可表达(§1.1) | LOW |
| 6 | No Python→GPU path. `aircc` has no GPU support (`grep rocdl python/air/compiler/aircc/` → empty) despite `buildingGPU.md` documenting one. The working example is a **248-line hand-written MLIR file** | — | MED |
| 7 | GPU path not in CI — "rotted because it is not exercised by CI" (`475e783a`) | — | MED |

### 1.4 What `air.channel` is, in Fleet terms — and why this is NOT the hard problem

An earlier draft called the channel semantics mismatch the "one genuinely hard
problem," reasoning that AIR channels are two-sided rendezvous while Fleet's
communication is one-sided RMA. **That was wrong for this use case.** The
rendezvous-vs-RMA tension is real for *cross-rank* traffic — which is exactly why
`gpu_symmetric_heap` exists and why the IRIS comparison in
`MultiGPUAbstractionNotes.md` matters — but it does not apply to the data
movement inside one GPU, which is what a megakernel is made of.

**The existing GPU channel type is for the wrong axis.** `gpu_symmetric_heap` is
*GPU-to-GPU* messaging over XGMI, requiring an enclosing `air.rank` (doc §2.5).
There is no channel type for the L3→L2→L1 movement inside a device. That is the
gap — a missing `channel_type`, not a missing semantics.

#### The target already has the primitive

`rocdl.global.load.lds` (`ROCDLOps.td:893`) is a direct HBM→LDS async copy — the
AMD equivalent of `cp.async`, and structurally an `air.channel.put`/`get` pair:

```
rocdl.global.load.lds $globalPtr, $ldsPtr, $size, $offset, $aux
                      └─ L3 ──┘  └─ L2 ─┘  └ transfer ┘  └ cache policy
```

`$aux` is the cache-policy field. Compiled to gfx950 (`fleet-codegen/evidence/lds.ll`):

| `$aux` | gfx950 | Fleet |
|---|---|---|
| `0` | `global_load_lds_dword v0, s[0:1]` | default |
| `2` | `... nt` | activation stores, §4.1 |
| `18` | `... nt sc1` | **weight streaming, `amd_buffer_coherence_enum(18)`** |

`aux=18` reproduces Fleet's weight-load policy exactly — the `sc1|nt` cache
modifier its GEMM kernels use to keep weights streaming without evicting
resident tiles. So the channel's cache policy is not new infrastructure either;
it is an attribute that lowers to `$aux`.

#### Full correspondence

| AIR channel concept | AIE mechanism | GPU mechanism | Fleet counterpart |
|---|---|---|---|
| `put`/`get` L3→L2 | shim DMA → memtile | `rocdl.global.load.lds` | weight tile load |
| `put`/`get` L2→L1 | memtile DMA → core | `ds_read` | LDS → VGPR |
| `depth` (in-flight) | DMA double-buffering | pipeline stages | CK-tile `GemmPipeline` |
| `broadcast_shape` | stream-switch fan-out | one descriptor → N workgroups | **Chiplet-task broadcast** |
| rendezvous | locks | atomics + `syncscope` | event counters |
| — | *(no cache exists)* | **`$aux` bits** | §4.1 cache-modifier policy |

The `broadcast_shape` row is worth dwelling on. Fleet's Chiplet-task dispatch is
*"the scheduler broadcasts the same task to all workers in a single chiplet"* —
one descriptor, ~30 consumers, all sharing one L2. That is precisely
`air.channel` with `broadcast_shape` matching the inner segment's iteration
space. AIR already has the vocabulary.

#### Taxonomy: six forms of L2 reuse in Fleet, only one of them chiplet-specific

Cooperative tiling is the headline, but it is not the founding mechanism and not
the largest win at small batch. Surveying the paper and the kernels:

| # | Form | Mechanism | Chiplet-specific? | Evidence |
|---|---|---|---|---|
| **A** | **Cooperative weight tiling** | R workers on one XCD sweep M sharing a weight column; hit rate `(R-1)/R` | **yes** | `gang_linear_kernel` M-major; 38.9%→51.0% at bs=32 |
| **B** | **Cross-operator persistence** | 算子之间没有 kernel 边界 ⇒ L2 不被 flush | no | §2.2 — *the* megakernel motivation |
| **C** | **Operator fusion** | fused SiLU removes an intermediate buffer write+read | **no — proven** | §4.1: 9.4%→17.4%; CU-task control gives 8.1%→16.5% |
| **D** | **Activation fan-out in a fused GEMM** | one activation feeds gate *and* up | no | `d_input_base` → `d_gate_weight` + `d_up_weight`; source of the bs=1 baseline |
| **E** | **Activation residency** | activations ~1 MB vs 368 MB weights, trivially resident | no | `gang_linear_n_tiling` comment; Table 5 |
| **F** | **Anti-pollution policy** | NT activation stores so transients don't evict weight tiles | no | §4.1 three-tier cache policy |

**关于 B 的一条更正。** 本文早期版本写成"跨 launch 持久化",错了。§2.2 讲的是
*baseline*:kernel-at-a-time 每 token ~250 次 launch,每个边界 flush 一次 L2。Fleet 的
做法是**消除边界**,不是让数据持久。而且 Fleet 根本没有持久化机制 —— §4.1 三档 cache
policy(权重 `streaming`、activation `nt`、scheduler 通信 `nt`)**全是 evict/bypass**,
没有一条是"留住"。权重能命中是因为 ~30 个 worker 在短窗口内都碰了它。

所以 **form B 不需要任何 IR 构造**,Phase 3 一个常驻 launch 就全给了。早期草稿提过一个
`air.resident` attribute,**已撤回** —— 它解决的是 Fleet 没有的问题。若将来要做
NVIDIA 式 persisting window,那是 beyond-Fleet 的特性,不能拿 Fleet 当依据。

Form **A** is what `broadcast_shape` + XCD placement expresses, and it is the only
one that needs chiplet awareness. The paper is candid about this: for form C it
runs the control experiment and concludes *"the L2 benefit comes from eliminating
intermediate buffer traffic rather than from XCD-scoped coordination."* And at
bs=1–16 (`m_tiles = 1`, no cooperative sharing) Table 4 shows all three configs
at nearly identical L2 hit rates — Fleet's 1.13–1.16× there comes from dispatch
overhead, not L2 at all.

Note also form **G**, the *direction* of reuse: `gang_linear_n_tiling_kernel`
exists as an A/B control in which consecutive workers share the same activation
row and stream the weights instead. Which axis to reuse is a tunable, not a
property of the hardware.

**Why this is good news for AIR.** Most of these are not new work:

| form | AIR construct | status |
|---|---|---|
| A | `broadcast_shape` + `air.chiplet_*` 查询(§1.5) | new (Phases 1/5/6) |
| B | one persistent `air.launch` | **Phase 3** |
| C | operator fusion | **AIR already does this** — it is a tiling/fusion compiler |
| D | one producer, two consumers | **already** in the dependency graph |
| E | footprint | DLTI capacity, for the cost model |
| F | cache policy on stores | Phase 1 |

C and D come essentially free from what AIR already is. That means the AIR path
can reach Fleet's *bs=1* behaviour (the 9.4%→17.4% fusion win) with no chiplet
work at all — and it sharpens Phase 3's justification: the persistent kernel is
not merely a launch-overhead optimization, it is the mechanism for form B.

**A README overclaim worth not inheriting.** `fleet-chiplet-megakernel/README.md`
states *"Subsequent decode iterations reuse cached weights instead of re-reading
from HBM."* Table 5 puts per-XCD per-layer weights at 46 MB against a 4 MB L2,
and Table 4 shows HBM reads bottoming at 0.63x — not the near-zero that
cross-iteration weight caching would produce. The paper itself never makes this
claim.

#### The XCD L2 *is* the GPU's implementation of `broadcast_shape`

This is the sharpest framing, and it reframes what needs designing.

Fleet's L2 value is **entirely cross-consumer reuse**. Its own model: with
`R = min(W, m_tiles)` workers on an XCD sharing a weight tile, expected L2 hit
rate is `(R-1)/R` — worker 0 misses to HBM, workers 1..R-1 hit in L2. In AIR's
hierarchy those workers are *sibling instances of the inner segment*, all nested
under one XCD-bound outer segment.

So the structure is: **one logical transfer, N sibling consumers, one HBM read.**
AIR already names that — `broadcast_shape`.

| AIR construct | AIE realization | GPU realization |
|---|---|---|
| channel, `broadcast_shape = [N]`, consumers = sibling segment instances | stream switch fans one transfer to N tiles — **spatial**, one L3 read | N independent loads; XCD L2 collapses them to one HBM read — **temporal** |

Identical semantics, different mechanism: AIE does it in space with an
interconnect, the GPU does it in time with a cache.

**Consequence for the design.** The structure is `broadcast_shape` + segment
placement; the cache-policy attribute is only a tuning knob on it. And the knob
is *derivable*: Fleet chose `streaming` (not "persist") because weight tiles are
read once per GEMM and need not survive across layers — the policy is tuned to
reuse **distance**, which is set by the broadcast degree and the traversal order,
both already in the IR. Fleet hand-tuned three tiers; AIR could infer them.

**One honest asymmetry to spec explicitly.** On AIE the fan-out is architectural —
one read, N deliveries, guaranteed by the interconnect. On GPU it is
**best-effort**: the collapse happens only if the N loads land on the same XCD
*and* within the eviction window. Results are correct either way; only
performance differs. So `broadcast_shape` means *semantics* on AIE and a
*performance hint* on GPU, and the model doc must say so rather than let the AIE
guarantee be assumed to carry over.

Neighbouring vocabulary already exists: `air.shared_resident_ring`
(`AIRDependencyScheduleOpt.cpp:3892`) merges loops that re-read the same streams
so they share a resident buffer — the same instinct (residency driven by shared
consumption), expressed for scratchpad rather than cache.

#### The thing that genuinely has no model

**The XCD L2 cache is not a level in AIR's memory hierarchy.** §4.3 maps
L3→global, L2→**LDS**, L1→private. The 4 MB per-XCD cache sits *between* AIR's
L3 and L2 and is transparent — no address space, not addressable, so `memref`
cannot name it.

And Fleet's entire result is about residency in that invisible level.

The resolution is not to add a fourth memory level. It is to recognise that
**the XCD L2 is not a memory space — it is a residency property of a transfer**,
expressed as a cache-policy attribute (→ `$aux`) plus placement (→ segment→XCD).
Fleet's contribution is not a data path at all; it is (1) *where* the mover runs,
(2) *what the cache does* with what it touched, and (3) *how wide* the
synchronization reaches. Channels carry (2); segments carry (1); `syncscope`
carries (3).

> 补充:"residency property of a **transfer**" 对 form A 成立。form B(跨 iteration)
> 曾被提议为 buffer 属性并配一个 `air.resident` attribute —— **已撤回**,理由见上方
> form B 的更正:Fleet 没有持久化机制。关于"什么能命名什么不能",见 §1.5 末尾。

### 1.5 要写成什么样 —— 骨架(已定的设计)

**结论先行:segment 绑 workgroup,一层。chiplet 不是层级,是查出来的值。**
这跟 doc §4.2 的两层嵌套 segment 冲突,见本节末。

```mlir
air.launch (%b) in (%nb = %c1) args(%w = %W, %a = %A) : ... {

  // 一层 segment = 一个 workgroup。240 个实例 = grid,跟 gpu.launch 一一对应
  air.segment @wg (%c) in (%nc = %c240) args(%sw = %w, %sa = %a) : ... {

    // chiplet 是查出来的,不是上一级给的
    %xcd  = air.chiplet_id         : index
    %rank = air.chiplet_block_id   : index
    %n    = air.chiplet_dim_blocks : index

    // ① N-split。strided<[?,1]> = K 连续,对应 Fleet make_tuple(K,1)
    %off = arith.muli %xcd, %slice_n : index
    %wslice = memref.subview %sw[%off, 0] [%slice_n, %K] [1, 1]
        : memref<?x?xbf16> to memref<?x?xbf16, strided<[?, 1], offset: ?>>

    // ② wave 循环在 segment 里面
    scf.for %wave = %c0 to %nw step %c1 {
      scf.index_switch %arm
      case 0 {
        // ③ M-major。用 %rank 不是 %c —— 工作划分在 (xcd, rank) 坐标系里
        //    = gang_linear_mi300.cuh:75-76
        %m  = arith.remui %rank, %Wh : index
        %nt = arith.divui %rank, %Wh : index
        %wt = memref.subview %wslice[%nt, 0] [%c64, %K] [1, 1] : ...
        %at = memref.subview %sa[%m, 0] [%c64, %K] [1, 1] : ...

        // ④ cache 行为:现成属性,不新造
        air.channel.put @w[] (%wt[...][...][...]) : ...          // 权重: nontemporal + agent
        air.channel.put @a[] (%at[...][...][...]) {nontemporal} : ...  // activation: 不污染
        air.herd @h tile (%t) in (%ntt = %c8) args(...) : ... { ... }
        scf.yield
      }
      default { scf.yield }
    }
    air.segment_terminator
  }
}
```

#### 为什么一层不是两层

doc §4.2 规定 outer segment = XCD、inner segment = CU。在 GPU 上站不住,四条理由:

1. **GPU 只有平铺 dispatch。** workgroup 在 launch 那一刻全部存在,不可能从一个
   workgroup 内部再 spawn。嵌套 segment 读起来是嵌套分配,实际是对平铺 grid 的重新解释。
2. **segment body 在 GPU 上没有执行者。** §1.1:33 说 launch/segment 的 body 在
   *host/controller* 层执行 —— GPU 没有 controller。一层之后 body 就在那个 workgroup 里跑,问题消失。
3. **鸡生蛋。** 内层 `in (%nc = %n_on_xcd)`:算这个值需要所有实例已启动并报到,
   而它又是实例数。一层之后它只是 body 里一个普通 SSA value。
4. **级数对不上。** `gpu.launch` 只给 grid × block 两级,AIR 要四级,必然塌缩,
   §4.2 没说塌缩到哪。

反过来的证据:骨架里 `%c` 几乎没用 —— 权重切分用 `%xcd`,tile 遍历用 `%rank`。
**Fleet 的工作划分完全在 (xcd, rank) 坐标系,blockIdx 只是查表的身份证。**
说明这三个值必须是一等 SSA value,不能是隐式层级关系。

#### 三个新 op,命名照 `gpu.cluster_*`

NVIDIA thread block cluster(一组 block 共享 GPC)是精确对口的先例,而且四个值全有:

| Fleet | gpu dialect | air |
|---|---|---|
| `%xcd` | `gpu.cluster_id` | `air.chiplet_id` |
| `%rank` | `gpu.cluster_block_id` *"block id **within the cluster**"* | `air.chiplet_block_id` |
| `%n_on_xcd` | `gpu.cluster_dim_blocks` *"blocks **in the cluster**"* | `air.chiplet_dim_blocks` |
| 8 | `gpu.cluster_dim` | `air.chiplet_dim` |

分开的多个 op,不是一个返回三元组 —— 跟 `block_id`/`block_dim`/`subgroup_id` 一脉。

**为什么不直接复用 `gpu.cluster_*`:** 语义差别是"指定 vs 发现"。NVIDIA 的 cluster
在 launch 时指定、硬件保证 co-residency,那几个 op 是 launch config 的确定函数;AMD 上
XCD 是落到哪算哪,`chiplet_block_id` 要全局 map + 屏障才能算出来。同一个 op 在一个后端是
几条算术、在另一个后端要等 240 个 workgroup 全部报到 —— 这个代价差别不该藏在同名 op 后面。

#### 术语:chiplet / XCD / XCC 三个词

| 词 | 出处 | 性质 |
|---|---|---|
| **XCC** | LLVM `SIDefines.h:546` `ID_XCC_ID = 20` | 硬件里**唯一真实存在**的名字 |
| **XCD** | AMD 架构术语(Accelerator Complex Die);论文 §2.1、AIR doc §2.2:543 | **LLVM 里 0 处匹配** |
| **chiplet** | 通用工业术语;论文用作抽象名 | **AMD 不这么叫**,LLVM 里 0 处匹配 |

XCC 和 XCD 严格说不是一回事(核心 vs die),MI300/MI350 上一对一所以混用。
**选 `chiplet`**:AIR dialect 其他地方都是中立词(L1/L2/L3、segment、launch),
只有 `air.herd` 是 AIE 味;而且砍掉 `backend-granularity = "XCD"` 之后,doc 里
"XCD" 这个词没有别的用户,统一成 `chiplet` 零成本。映射 `chiplet_* ↔ XCC_ID` 只在
lowering 里出现一次。

#### 砍掉 `backend-granularity = "XCD"`

一层 segment 之后它没有用了 —— 没有 XCD 粒度的 segment。原本它提供的信息全部有别的来源:

| 要知道的 | 砍了之后从哪来 |
|---|---|
| 开几个 workgroup | segment 的 iteration space,本来就显式 |
| 要读 XCC_ID | `air.chiplet_id` 存在本身 |
| 要建全局 map + 屏障 | `air.chiplet_dim_blocks` 存在本身 |
| 权重怎么切 | `%xcd` 的 def-use |

顺带消掉 doc 矛盾 #1,以及"三个名字指同一个东西"的糟糕情况。

#### co-residency 从性能问题升级成正确性问题

`air.chiplet_dim_blocks` 要等所有 workgroup 报到(Fleet `:1244-1247`):

```cpp
while (atomicAdd(config.worker_xcd_ready_count, 0) < config.num_workers)
  __nanosleep(100);
```

**如果 GPU 分批调度 —— 200 个驻留、40 个排队等槽位 —— 这个屏障永远等不到,直接挂死。**

AIR 本来就有这个保证(§2.1:205 *"all `air.segment` ops ... are **co-resident on the
device** when the launch body begins executing"*;§1.1:27 *"groups **co-resident** work"*),
跟 XCD 无关,所以砍 attribute 不影响它。但 `AIRToROCDL` **现在没实现**。Phase 3 必须:

1. grid ≤ 设备能同时驻留的 workgroup 数
2. `known_block_size` + LDS 占用把 occupancy 钉成 1(Fleet:`__launch_bounds__(256,1)` + ~58KB LDS)
3. **verifier:iteration space 超了要报错**,不能默默生成一个会 hang 的 kernel

第 3 条是新的。引入 `chiplet_dim_blocks` 之后,co-residency 第一次从"超了只是慢"
变成"超了就 hang"。

#### ④ 那一档:不新造 attribute

早期草稿提过 `#air.cache_policy<streaming|uncached|...>`,**已撤回** —— 它把两个正交的轴
揉成一个 enum,值必然重叠(`streaming`=aux18=`nt|sc1` 和 `uncached`=aux2=`nt`,都是 nt,
差的是作用域位)。两个轴都有现成归宿:

| 轴 | 现成的 | 验证 |
|---|---|---|
| 作用域 | `syncscope` | `syncscope("agent")` → `buffer_wbl2 sc1` ✓ |
| 时间局部性 | `nontemporal` UnitAttr | `!nontemporal` → `global_store ... nt` ✓ |

`$aux` 就是两者的位打包:`aux = (nontemporal ? 2 : 0) | (agent ? 16 : 0)`。
AMD 在时间局部性这轴上只有 nt 一个 bit,做不出 enum;NVVM 才有五档
(`evict_normal/first/last/unchanged/no_allocate`),跨厂商时再说。

#### ①②③④ 缺一个 = 0%,不是打折

| 漏掉 | 后果 |
|---|---|
| ① N-split 用 `%xcd` | XCD k 可能在读切片 j → 全 miss |
| ② segment 包住循环 | 每 iteration 重建,chiplet 绑定丢失 |
| ③ M-major | 30 个 worker 各读各的列,窗口内无重复 → 全 miss |
| ④ nontemporal 分档 | activation 把权重挤掉 → 全 miss |

这解释了论文 Table 4:bs≤16 时 `m_tiles=1`,R=1,没有 worker 共享同一权重 tile,
四样凑齐也没用 —— **那 1.13× 是省下的调度开销,跟 L2 无关**,L2 收益 bs≥32 才出现。

#### 命名不了的东西

没有任何 SSA value 能表示"XCD cache 里的那坨数据":cache 不可寻址;同一段字节可同时在
8 个 L2 里且内容可能发散;命中与否是运行时 best-effort。`memref.subview` 出来的
`%wslice` **保持源的 memory space,还在 HBM**。

| 能命名 | 用什么 |
|---|---|
| 哪些字节 | `%wslice` : memref,HBM space |
| 哪个 chiplet | `%xcd` : `air.chiplet_id` 的结果 |
| cache 里有什么 | **命名不了,也不该命名** |

`%wslice` 的价值在别处:让编译器看出 N 个 consumer 是否读同一段 —— 重叠才有命中。

#### 与 doc 的冲突(需要 doc owner 定夺)

| # | 冲突 | 出处 |
|---|---|---|
| 1 | segment 缺省=workgroup vs 内层 segment=CU,粒度不同 | §2.2:545 vs §4.2:960 |
| 2 | "multi-XCD `air.launch` iteration space" vs "launch carries **no** iteration space" | §2.2:543 vs §4.2:963 |
| 3 | "segment body 在 host/controller 执行" —— GPU 没有 controller | §1.1:33 |
| 4 | 嵌套 segment 暗示嵌套 spawn,GPU 只有平铺 dispatch | §4.2 整节 |

本节的设计消掉 1、3、4;2 需要裁决。代价是 **§4.2 整节要重写**。

### 1.6 Verdict

Feasible, and less risky than the first draft of this document concluded. The
target proves out at every level that matters: `syncscope` gives the exact fence
tiers, `rocdl.global.load.lds` gives the data path *with* Fleet's cache
modifiers, and one end-to-end example already runs on gfx950. No gap requires a
new dialect concept — the compute model (§4.2) and the target instruction set
both already have what is needed. The work is lowering.

**Do not start from `fused_decode`.** 5274 lines built on 99 channel ops, none of
which the GPU path can lower, is the worst possible first target. Start from
`4k_4k_mul`, which already works.

---

## Part 2 — Plan

Seven phases, each a PR with a gate that can fail. Phases 1–4 are the critical
path; 5–6 are the actual Fleet result; 7 is the LLM.

### Phase 0 — Put the GPU path in CI
Nothing else is safe until this exists. The path rotted once already.

- Add `check-air-gpu` running `test/gpu/4k_4k_mul` + the Conversion lit tests.
- If no GPU runner is available, split it: lit tests (IR-only, `REQUIRES: gpu`
  off) always run; the execution test gates on a runner.

**Gate:** CI fails when `air-to-rocdl` breaks.
**Effort:** small. **Do this first regardless of everything below.**

### Phase 1 — 定 chiplet 词汇 + 砍掉两个自造 attribute
设计步骤,无代码。详见 §1.5。

- 加三个 op,命名照 `gpu.cluster_*`:`air.chiplet_id` / `air.chiplet_block_id` /
  `air.chiplet_dim_blocks`。选 `chiplet` 不选 `xcd`(术语依据见 §1.5)。
- **砍 `backend-granularity = "XCD"`** —— 一层 segment 之后无用。
- **不新造 cache policy attribute** —— 用现成 `nontemporal` + `syncscope`,
  lowering 合成 `$aux`。
- 加 intra-device `channel_type`(`"gpu_lds_async"`),降到 `rocdl.global.load.lds`。
- **spec `broadcast_shape` 在 GPU 上的含义**:N 个 consumer 在同一 chiplet 内,
  由 L2 折叠成一次 HBM 读。必须写明 AIE/GPU 的不对称 —— AIE 上是**语义保证**
  (互连保证一读 N 送),GPU 上是**性能提示**(落在同一 XCD 且在驱逐窗口内才折叠,
  否则结果照样对、只是慢)。
- §4.2 需要重写(一层 segment)。§2.2:543 与 §4.2:963 的矛盾需要裁决。

**Gate:** spec 合入 `docs/AIRComputeModel.md`。**Effort:** small。

### Phase 2 — chiplet identity

**先修 bug。** `deleteAirSegment`(`AIRToROCDLPass.cpp:545`)用
`segmentBlock.getArgument(i)` 从 0 开始替换 kernel 参数,但 block arg 布局是
`[ids..., sizes..., kernel_args...]`(同文件 `:488` 自己的注释)。launch 那边正确地
偏移了 `numNonKernelArgs`,segment 这边没有。**一旦给 segment 加 iteration space,
`%x` 会被静默替换成第一个 kernel operand。** 现在没暴露是因为所有测试的 segment
都没有 iteration space。先修这个 + 补一个带 iteration space 的 lit test。

然后:

- 实现三个 chiplet op。`air.chiplet_id` → `llvm.inline_asm
  "s_getreg_b32 $0, hwreg(HW_REG_XCC_ID, 0, 16)"`(ROCDL dialect **没有**这个 op,
  查过 `ROCDLOps.td`,0 处匹配)。
- `air.chiplet_block_id` / `air.chiplet_dim_blocks` → 全局 worker→chiplet map +
  屏障 + 数一遍(对应 Fleet `:1083-1094` 算 rank、`:1244-1247` 等报到)。

**Gate:** gfx950 上跑起来,ISA 里出现 `s_getreg_b32 ... XCC_ID`,且不同 segment
实例报出不同的 chiplet id。**Effort:** ~2–3 周(比原估多,因为多了 map+屏障)。

### Phase 3 — Persistent kernel form
- Teach `AIRToROCDL` to emit a single `gpu.launch` with grid sized to the device
  and the wave loop inside the kernel body.
- **形状要求:`air.segment` 必须包住 `scf.for`,不能反过来。** XCD 绑定要活过所有
  iteration;放循环里就每次重建,绑定丢失。对应的心智模型翻转:**megakernel 里一个
  segment instance 是常驻 worker,不是"每算子一个工作单元"** —— 它对应 Fleet 那个
  `while(true)` 到 `TASK_TERMINATE` 的 workgroup。这跟 AIE 里 segment 每次 launch
  实例化是反的。
- Recommended shape: **recognise a loop-of-launches over a uniform body and fuse
  it**, rather than requiring source restructuring. That keeps `fused_decode.py`
  source-compatible across NPU and GPU, which matters given it is 5274 working
  lines.
- Set `known_block_size` / `rocdl.flat_work_group_size` to pin occupancy.
- **co-residency 现在是正确性前提,不只是性能。** `air.chiplet_dim_blocks` 的屏障
  要等所有 workgroup 报到;若 GPU 分批调度则**永久挂死**。必须:
  (a) grid ≤ 设备可同时驻留的 workgroup 数;
  (b) occupancy 钉成 1;
  (c) **verifier:iteration space 超了报错**,不能默默生成会 hang 的 kernel。
  AIR 本来就承诺 co-residency(§2.1:205、§1.1:27),但 `AIRToROCDL` 没实现。

**Gate:** a two-wave `4k_4k_mul` variant — one `air.launch`, `scf.for` of 2
inside, `index_switch` selecting GEMM-A vs GEMM-B — emits **one**
`gpu.launch_func`, and the result matches. This is the milestone that proves the
whole thesis; everything after it is scale.
**Effort:** ~2–4 weeks.

### Phase 4 — Scope vocabulary
- Add a memory/sync scope attribute on AIR data-movement and channel ops:
  `{workgroup, agent, system}`.
- Lower to `syncscope(...)` on `llvm.fence` / `llvm.atomicrmw` / loads / stores.
  §1.1 proves the instruction mapping.
- Default the intra-segment path to `agent`, not system.

**Gate:** a lit test asserting `buffer_wbl2 sc1` (not `sc0 sc1`) appears for an
intra-segment sync, and is *absent* for an intra-herd one. Exactly the fence
audit in `fleet-codegen/MEGAKERNEL.md`, run as a regression test.
**Effort:** ~2–3 weeks.

### Phase 5 — Intra-device channels
Re-scoped down after §1.4: the target primitive exists and carries the cache
policy, so this is a lowering, not a semantics project.

- Lower `air.channel.put`/`get` with the Phase 1 `channel_type` to
  `rocdl.global.load.lds`, cache policy → `$aux`.
- `depth` → pipeline stages / multi-buffering in LDS.
- `broadcast_shape` over the inner segment's iteration space → Chiplet-task
  broadcast (one transfer, all workgroups on the XCD).
- Scope from Phase 4 for the completion signal: intra-segment gets `agent`.

**Gate:** a channel-based producer/consumer example runs on gfx950; the ISA shows
`global_load_lds_dword ... nt sc1` for a channel declared `streaming`, and the
fence audit shows one branch-guarded `buffer_wbl2 sc1` per segment.
**Effort:** ~3–5 weeks (was 4–8 before the primitive was found).

### Phase 6 — Cooperative tiling (the actual Fleet result)
Only now is the L2 optimization expressible.

- M-major windowed traversal (paper Fig. 3) as a tiling attribute or transform.
- Weight partition bound to segment iteration variable.
- Broadcast degree (= inner segment cardinality) drives the inferred cache
  policy, per Phase 1.
- Non-temporal / streaming cache modifiers on weight loads.

**Gate:** measured L2 hit rate on a GEMM sweep vs a chiplet-unaware baseline.
This is the first phase whose gate is a *number*, and it should reproduce the
shape of the paper's Table 4.
**Effort:** ~3–4 weeks.

### Phase 7 — The LLM
- Python builder path for GPU (gap 6) — or hand-written MLIR if that stays out
  of scope.
- Port `fused_decode`'s wave/arm structure.

**Effort:** large. Do not scope it until Phase 6 has a number.

---

## Part 3 — Judgement calls

**Static beats dynamic here.** Fleet spends 8 CUs (3.1% of the device) plus two
spin loops and a descriptor fetch path rediscovering at runtime a schedule that
is fully known at compile time. Our disassembly puts numbers on it:
`scheduler_kernel` 4411 instructions, `worker_kernel` 1978, almost all dispatch
machinery. `fused_decode`'s `index_switch` arms fold to constants
(`_arm_of_wave` docstring). For a fixed model, the AIR form should **beat** Fleet
rather than match it — and that, not parity, is the result worth targeting.

**The strongest argument for doing this in a dialect** is gap 5 plus Fleet's
`volatile` bug. Fleet wrote `volatile` meaning "L2-local" and got system scope;
a compiler that carries scope as an attribute cannot make that mistake. That is
a concrete, demonstrable advantage of the MLIR approach over hand-written HIP,
and it is worth leading with when presenting this.

**Biggest risk to the schedule** is Phase 3 (persistent-kernel form), not
Phase 5. Phase 3 is where a codegen assumption baked into `AIRToROCDL` — one
`gpu::LaunchOp` per `air.launch` — has to be replaced, and it is the gate that
proves or kills the whole thesis. Everything after it is incremental.

---

## Caveats

- Effort estimates are judgement, not measurement; I have not built the GPU
  config or run anything on hardware.
- 本节 §1.5 的设计与 `docs/AIRComputeModel.md` §4.2 正面冲突(一层 segment vs 两层嵌套),
  §4.2 需要重写。这是 normative doc,本文不单方面改。
- 本文经历过多次自我更正:早期版本错误地把 form B 说成"跨 launch 持久化"、把
  `air.segment` 说成"就是 Chiplet-task"、并提出过一个已撤回的 `air.resident`
  attribute。这些都已在正文改掉,列在此处以免读者引用到旧结论。
- Phase 5's variance is genuinely wide — it depends entirely on the Phase 1
  decision.
- `buildingGPU.md` documents an `aircc` GPU driver that does not exist in the
  code. Worth reconciling before anyone relies on the doc.
