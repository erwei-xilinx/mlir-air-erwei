# 状态与下一步

> **一句话**:Fleet 的全部五个机制、decode 的全部四种任务体,都在 MI300X 上跑通并
> 数值校验过了;层数已经参数化,`LAYERS=36` 生成 10282 行 MLIR、288 个事件门控
> 的 stage,**一次 kernel launch 跑完,0 错**。缺的是真权重、KV cache 增长、
> 以及真 kernel(现在全是朴素三重循环,没测过性能)。
>
> **31 个本地 commit,都没 push。** 工作区干净,`workspace/` 没进分支。
> 最后一次全量:GPU 执行测试 **15/15**,lit **310 过 / 240 挂**(240 全是
> AIE 关闭,与 GPU 路径无关)。


## 环境(最重要 —— 昨晚就是因为没记这个,浪费了一整晚)

**编译和跑测试必须在计算节点上,不能在 staging 机。** staging 机是 glibc 2.35,
所有二进制都是 2.39 上建的,在 staging 上一律 `GLIBC_2.38 not found`。
**这不是 build 坏了。**

```bash
salloc --no-shell --partition=mi300x -w rad-mi300x-1 --time=02:00:00 \
       --cpus-per-task=64 --mem=400G          # --mem 必写,默认 16G 会 OOM 掉 cc1plus
ssh rad-mi300x-1                               # 直接 ssh 就行,不用 srun
source /scratch/erweiw/sandbox/bin/activate    # lit 在这个 venv 里
ninja -C /home/erweiw/mlir-air/build-gpu -j 64 air-opt
lit -sv /home/erweiw/mlir-air/build-gpu/mlir/test/Conversion/AIRToROCDL
```

| 东西 | 位置 | 备注 |
|---|---|---|
| LLVM @ `56bcc187`(`clone-llvm.sh` 的 pin) | **`/shared/erweiw/llvm-56bcc187`** | NFS,任何节点可用,**不会再丢** |
| mlir-air GPU-only build | `/home/erweiw/mlir-air/build-gpu` | 4 个 tool 全有 |
| lit | `/scratch/erweiw/sandbox/bin/activate` | |
| LLVM 源码 worktree | `rad-mi300x-1:/scratch/erweiw/llvm-pinned` | 节点本地,丢了可重建 |

**坑:ninja 在 NFS 上会静默跳过重编。** 在 staging 机编辑、在节点上 build 时,
mtime 有时不被识别 —— `ninja` 报成功但没重编,于是拿旧二进制跑测试报绿。
撞过一次(诊断信息里的数字印成空白,但源码明明改了)。
**每次 build 前先 `touch` 改过的文件**,或者整个 `find mlir -name "*.cpp" | xargs touch`。

**不要再 build LLVM。**`/scratch/erweiw/llvm/install`(commit `278dba37`,3月)
对当前源码太老,编不过 —— 别被它骗了。

GPU 情况:`rad-mi300x-1` = 8× MI300X (gfx942),Fleet 的 `gang_linear_mi300.cuh`
就是为它写的。gfx950(mi350x-es)两个节点从 2026-09-14 19:06 起 down。
mi300x 上 mkurzyns 常年排队,book 的时候 `-w rad-mi300x-1` 点名。

## 已完成

### 1. `deleteAirSegment` 的 block-arg bug(Phase 2 第一步)
实际比 plan 记的严重:**不是静默错值,是 assertion 崩溃**,而且**有两处**:
- `deleteAirSegment` —— 没减 ids/sizes 偏移
- `SCFForToSubPattern` —— segment 分支没减,herd/launch 分支硬编码 `- 4`(两处)

全部改走 dialect 自带的 `getTiedKernelOperand(BlockArgument)`,手写下标全删。

顺带修正了一个我自己的设计错误:原规则"id 被用到才拒绝"不够 —— `in (2,1)`
但没人读 id 时,2 个 instance 被静默压成 1 个。改成:**迭代空间必须全 1
才能展平**(此时 id→0、size→1),否则报错。

### 2. Phase 2 正题 —— chiplet identity 三个 op 全部落地

**`air.chiplet_id`** → `llvm.amdgcn.s.getreg(30740)` → `s_getreg_b32 s2, hwreg(HW_REG_XCC_ID, 0, 16)`
- ROCDL **没有** s_getreg op(`ROCDLOps.td` 里 getreg/hwreg/xcc 零匹配),走 intrinsic
- `30740 = 20 | (16-1)<<11`,依据 `AMDGPUBaseInfo.h` 的 `HwregId`(5:0)/
  `HwregOffset`(10:6)/`HwregSize`(15:11,存 size-1)。**编出来验的**,不是查表猜的
- 与 Fleet 手写 inline asm(`persistent_kernel.cuh:188`)逐字节一致
- ISA gate 钉进了 lit test 第二个 RUN 行,完整链路到 `gpu-module-to-binary{format=isa}`

**`air.chiplet_block_id` / `air.chiplet_dim_blocks`** —— Fleet 的报到协议
(`persistent_kernel.cuh:1083-1094`),两个 op 共用一次:
```
map[block_id] = chiplet_id        // leader-only 一次 store
<所有 workgroup 都写完>            // device 屏障:atomicrmw add release agent
                                  //           + atomic acquire 自旋 + gpu.barrier
rank  = |{w : map[w]==mine, w<me}|
count = |{w : map[w]==mine}|
```
- **不需要 LDS 广播** —— 扫描是 `(map, block_id, chiplet_id)` 的纯函数,block 内
  每个线程独立算出同一答案。只有屏障是 leader-only。这比 Fleet 简单一点
- 两个全局 `@__air_chiplet_map`(4096 槽)/ `@__air_chiplet_arrivals`,由 pass 按需创建
- 指针用 `memref.extract_aligned_pointer_as_index` → `llvm.inttoptr`
  (`air-translate-to-llvm` 里已有同样写法)

### 3. 两个途中发现并修掉的坑

**常数不能用 `llvm.mlir.constant`。** 它 Pure 且无操作数,LICM 会把它提出
`gpu.launch`,而 `GPUKernelOutlinePass` 只重新物化 `arith::ConstantOp` —— 用 llvm 的
会变成 kernel 参数,可 `s.getreg` 的操作数是 **ImmArg**,立即数就丢了。
**这个坑在 MLIR 层完全看不出来,只有推到 ISA 才现形** —— 说明 plan 里"gate 是
ISA 里出现 s_getreg_b32"这条要求是对的。

**`gpu.module` 是独立 symbol table。** 模块级 `memref.global` 在 outlining 之后
解析不到(`does not reference a valid global memref`)。修了
`GPUKernelOutlinePass`,把 kernel 引用到的 global 一并带进 `gpu.module`。
这是通用 bug,任何在 kernel 里用 `memref.global` 的 AIR 程序都会撞上。

### 测试
| | 基线 | 现在 |
|---|---|---|
| AIRToROCDL | 2/6 过 | **7/9 过** |
| 全量 `mlir/test` | 302 过 / 242 挂 | **307 过 / 240 挂** |

+5 = 五个新 test,**零回归**。`git clang-format origin/main` 干净。
改动已 staged:8 个文件,+731/−81。

剩下 2 个红的(`air_to_rocdl.mlir`、`air_gpu_outlining.mlir`)**基线就红**,
原因是 herd 里直接 load L3 memref 被 `verifyComputeMemoryAccess` 拦
(AIE 规则,GPU 上 herd 是 wavefront 本来就能寻址 HBM)。**用户已明确说先不管。**

## Phase 3 第一步:让 lowering 兑现 co-residency(已完成)

### 先纠正我自己写错的一条

我之前把 co-residency 写成"用户要自己保证的前提"。**错了**,模型里本来就写着:
- `AIROpBase.td:45` —— launch "groups segments ... that **must be co-resident within a device**"
- `docs/AIRComputeModel.md:206` —— launch "**Ensures** that all `air.segment` ops ... are co-resident"
- `:344` —— segment 迭代空间 "the runtime **guarantees** every instance is active simultaneously"

所以 `air.chiplet_dim_blocks` 的屏障天然合法,**不需要新 attribute**。
op description 和实现注释都已改成引用这条既有保证。

**缺口换了位置**:lowering 没兑现它 —— 直接把 launch size 当 grid,不问装不装得下。

### 修掉的真 bug:一次性屏障 → sense-reversing

`@__air_chiplet_arrivals` 只加不减。kernel 第二次 launch 时它已经 ≥ N,自旋条件
`seen < numBlocks` 直接为假 —— **没人等,map 还没填满就开始扫描,count 算错**。
而"循环在 launch 外面"(`fused_decode` 那个 NPU 形态)产生的正是重复 launch。

改成标准 sense-reversing:进门先读 generation,最后到的人先清零 arrivals、
再 bump generation 放行,其余人等 generation 离开自己进来时的值。
多一个全局 `@__air_chiplet_generation`。

### 新增:`max-resident-workgroups` pass option

**这是我在你睡觉时做的决定,醒来请复核。**你留了两个未决点:
(1) 设备容量从哪来(pass option vs DLTI),(2) map 数组定长 4096 怎么办。
我发现**这是同一个数** —— 能同时驻留多少 workgroup,既是 co-residency 的判据,
也正好是 map 需要多少槽位。合成一个旋钮:

```
-air-to-rocdl='max-resident-workgroups=N'   # 默认 4096
```
- 常量迭代空间超过 N → **报错**(不是警告):
  "air.launch asks for 12 co-resident workgroups, more than the 8 this target holds"
- 同时决定 `@__air_chiplet_map` 的长度,所以"装得下的 launch"必然"每个 workgroup 都有槽位"
- 动态迭代空间不检查,放行(证明不了)

**选 pass option 不选 DLTI 的理由**:AIR 现有 pass 都用 `Option<>`(`wave-size` 就是),
而且这是 lowering 的关注点、不是程序属性,以后换 DLTI 不影响 IR。**如果你想要 DLTI,
改起来很局部。**

### 又抓到一个我自己写错的:协议跑了两遍

测试注释和 commit message 里我都写了"两个 op 共用一次协议",但 walk 是**每个 op
各调一次** `emitChipletReporting` —— ISA 里 2 个 `s_getreg`、4 个 `buffer_wbl2`
就是跑了两遍屏障。**我写的话当时是假的。**

改成按 region memoize,在 kernel body 开头发射一次(这样结果 dominate 所有使用点)。
ISA 从 `4 wbl2 / 4 inv / 2 getreg` 降到 `2 / 2 / 1`。
测试里加了 `CHECK-NOT: llvm.amdgcn.s.getreg` 把"只跑一次"钉住。

### ISA gate

两个协议都钉到了指令层,不只是 MLIR 属性:

`air_chiplet_id.mlir` → `s_getreg_b32 s2, hwreg(HW_REG_XCC_ID, 0, 16)`

`air_chiplet_rank.mlir` → 
```
buffer_wbl2 sc1      ← agent scope release,跨 die 不跨设备
buffer_inv  sc1      ← acquire
flat_atomic_add
s_getreg_b32 ... hwreg(HW_REG_XCC_ID, 0, 16)
```
`sc1` 而不是 `sc0 sc1` —— 这正是 `fleet-codegen/evidence/scope.ll` 验过的区别,
也正是 Fleet 那 14.5× signal reduction 的来源。

## Phase 4 的地基已被编译证实(不只是推理)

plan §1.5 第 4 条说"不新造 cache policy attribute,用现成 `nontemporal` +
`syncscope`,lowering 合成 `$aux`"。**两半现在都编出来验过了**:

| 写在 AIR 层 | gfx942 指令 |
|---|---|
| `syncscope("agent")` release/acquire | `buffer_wbl2 sc1` / `buffer_inv sc1` |
| `memref.load/store {nontemporal = true}` | `global_store_dword ... nt` |

`sc1` 而非 `sc0 sc1`(后者是跨设备),`nt` 而非无修饰 —— 正是
`fleet-codegen/evidence/scope.ll` 和 `nt.ll` 里的区别。
所以**那条"不新造 attribute"的结论站得住**,有 lit test 钉着
(`air_chiplet_rank.mlir` 的 ISA 段 + `air_nontemporal.mlir`)。

## Fleet 骨架在 AIR 里跑通了(capstone)

`mlir/test/Conversion/AIRToROCDL/air_persistent_worker.mlir` —— 把 Fleet 的形状
用 AIR 写出来,一路验到 gfx942:

```mlir
air.launch (...) in (%nbx=%c8, ...) {        // 一个 launch,grid 按 die 数
  air.segment @persistent_worker (...) {     // 一个常驻 worker
    %rank = air.chiplet_block_id             // 发现在循环外,只做一次
    %n    = air.chiplet_dim_blocks
    scf.for %iter = 0 to %sn {               // wave loop 在 kernel body 里
      scf.for %t = %rank to 64 step %n {     // cooperative tiling
        ...
      }
    }
  }
}
```

编出来:**一个 `gpu.launch`(grid=8)、一个 `s_getreg`、一次屏障
(2× `buffer_wbl2 sc1` + 2× `buffer_inv sc1`)、循环在 kernel 内**。
ISA 里 3 个 `s_cbranch_execz` —— 正是 `fleet-codegen/MEGAKERNEL.md` 里认定的
"14.5× 来自 fence 被分支守住的位置"那个结构。

**嵌套顺序是承重的**:chiplet 发现必须在循环外,否则每 iteration 重跑屏障,
而且知道 die 的意义(它缓存的数据跨 iteration 还有用)就没了。
测试用 `ISA-NOT` 把"整个 kernel 只读一次寄存器"钉死 —— 顺序反了下游没人会发现。

## 测试(强制全量重编后)
| | 基线 | 现在 |
|---|---|---|
| AIRToROCDL | 2/6 过 | **10/12 过** |
| 全量 `mlir/test` | 302 过 / 242 挂 | **310 过 / 240 挂** |

+8 = 八个新 test,零回归。format 干净。
**四个本地 commit(都没 push)**,`workspace/` 保持 untracked、没进分支:
- `d0006165` [gpu] Chiplet identity for AIR on AMD GPUs, and the segment bugs it surfaced
- `a2527430` [gpu][test] Pin the cache-streaming bit from AIR down to the ISA
- `869a52b6` [gpu][test] The megakernel shape, written in AIR and checked down to the ISA
- `b7a44853` [gpu][test] Gate the ISA checks on LLVM actually having the AMDGPU backend

## 在真 GPU 上跑通了什么(MI300X,rad-mi300x-1)

**之前所有东西都只是编译验证,一次都没执行过。现在跑了。**
全部在 `test/gpu/` 下,各自有 `run.sh`,都带 host 侧数值检查,
**而且每一条都做过证伪**(故意改坏,确认检查器会红)。

| 测试 | 验证了什么 | 真机结果 |
|---|---|---|
| `chiplet_identity` | die / rank / count | `chiplet_id = block%8`,`count=4`,rank 0..3 稠密不重;三条不变量 `errors = 0` |
| `chiplet_cooperative` | 协作分块不重不漏 | 每元素恰好被认领 1 次;stride 改错 → 204 个错 |
| `persistent_worker` | 绑定跨 iteration 存活 | 8 轮后每元素恰好 8 |
| `two_level_signal` | **论文头条机制** | 32 worker → **8 次 device-scope flush**,一个信号不丢 |
| `task_queue` | 常驻 dispatch 循环 | 256 任务各执行一次;head = 288(256+32)精确 |
| `event_gated` | 事件门控依赖 | 加边 0 错 / 去边 1 错 |
| `megakernel_gemm` | 真实算术 | 128³ 分块 GEMM 逐元素相同;丢一个 tile → 1024 错 |
| `megakernel_layers` | 一次 launch 跑完层链 | 4 层 GEMM 链;去掉层间门控 → 16224/16384 错 |
| `megakernel_decode` | **非 GEMM 的任务体** | RMSNorm 归约 + GEMV + ReLU,两层;去掉 stage 门 → 128/128 错 |
| `megakernel_attention` | **attention + KV cache + softmax** | 与参考一致;去掉门 → 52 错。顺带确认 `math.exp` 能降 |
| `megakernel_gen` | **生成器,层数是参数;每层是完整 decode 层** | 1 / 2 / 8 / **36 层**全部 0 错;同一二进制压测 30 次无挂起 |
| `gang_task` | die 内屏障 + 会合式 gang task | 每 tile 恰好覆盖一次;去掉屏障 → 48 错。**但接进多 stage 链会死锁** |
| `scheduler_broadcast` | **Fleet 真正的做法**:per-die scheduler + 私有队列 + 广播 | 8 个 scheduler、96 对广播全部执行;30 次零挂起 |

**Fleet 的五个机制全部在真机上跑通,decode 的四种任务体(归约 / GEMV / 激活 /
attention+softmax)也都跑通了。**

最重要的是最后一个:`megakernel_gen/gen.py` **把层数变成了参数,而且每层是
完整的 decode 层**:

```
stage 0  r = rmsnorm(x)                   1 个任务,对 x 归约
stage 1  q = r @ Wq
stage 2  score[t] = dot(q,K[t])/sqrt(d)   每个 cache 条目一个任务
stage 3  p = softmax(score)               1 个任务,对所有 score 归约
stage 4  a[j] = sum_t p[t]*V[t,j]
stage 5  xa = x + a                       attention 残差
stage 6  h  = xa @ W1
stage 7  y  = relu(h) @ W2
stage 8  x  = xa + y                      MLP 残差,同时是下一层的输入
```

其中**三个 stage 不是 tile 并行的**(两个归约 + softmax),只能靠事件,
不能靠"任务恰好不重叠" —— 这正是整套机制存在的理由。

`LAYERS=36`(Qwen 深度)生成 **11130 行 MLIR、324 个事件门控的 stage,
一次 launch 跑完,0 错**。手写到 2 层就写不动了,这条路以前不存在。

**36 层第一次是红的**(1~20 层全绿,36 层全错)—— 悬崖不是斜坡,所以是数值问题
不是调度问题。残差流层间不归一化,每层加的东西会复利增长;真模型靠权重初始化
控制,我这是合成权重。按深度缩放第二个矩阵后 36 层恢复正确。
**那次红是测试在如实反映算术,不是机制出问题** —— stage / queue / event
在 36 层一直是对的。

### 关于"证伪"

每条测试都做过:故意改坏,确认检查器会红。**两次抓到了假绿** ——
`event_gated` 和 `megakernel_attention` 第一版把门去掉结果照样对,
因为 32 个 worker 几微秒内全部完成,竞争窗口根本撞不上。两个都加了
人为延迟把窗口撑开,再确认去掉门会错(1 个 / 52 个元素)。
**没加延迟之前那两个测试等于什么都没验。**

### 途中修掉的 regression

我之前那个"去掉 memref 类型限制"的改动**把 4k GEMM 弄崩了**
(`Cannot destroy a value that still has uses`)。lit 没抓到,因为
`test/gpu/` 不在 lit 套件里 —— 正是"路径会烂掉"的机制本身。

根因:这个 GEMM 把 launch 的 **tile id** 当 kernel operand 传给 segment,
而 pass **从来没映射过 launch 的 id**(`:493` 注释自己承认了),旧代码靠
`gpuArgs[...]` 兜底偶然绕开。已改成真正把 launch id/size 映射到
`gpu.block_id`/`gpu.grid_dim`。

另修:`test/gpu/4k_4k_mul/run.sh` 的 `GFX_TARGET` 探测 —— `amdgpu-arch` 返回
`gfx942:sramecc+:xnack-`,下游不认,**基线本来根本跑不了**。

### 两个值得记下的语义发现

1. **`air.segment` 的 body 被 workgroup 里每个线程各跑一遍。** 没有隐含的
   "每 workgroup 一次"。标量副作用必须自己守卫,和 Fleet 写
   `if (threadIdx.x == 0)` 一样。第一版 cooperative 测试因此每个计数器是 64。
2. **MLIR 在报 `scf.while` 结果数不匹配这个错时自己 segfault**
   (`Type::print` 里),上游 bug,不是 AIR 的。

### 第一次性能测量(方向性,不是数字)

同样 600 层的工作量,MI300X:

| | 墙钟(3 次) |
|---|---|
| 12 层 × **50** 次 launch | 1.57 / 2.09 / 3.39 s |
| 1 层 × **600** 次 launch | 4.84 / 4.86 / 5.44 s |

**当方向看,别当数字。** 混淆项:每次 repeat 都要重灌 queue/event/x 三个数组,
所以 600 次那边多付了 ~1650 次 memcpy;墙钟还含进程启动和 host 参考计算,
而 12 层那边的 host 参考**更重**。能说的是:**launch 多的那边更慢,即使它 host
干的活更少。**

**kernel 内计时目前不可用**:`mgpuEventRecord` 把事件记在自己建的 stream 上,
而 `gpu-to-llvm` 把 kernel 放在它自己的 stream 上,于是
`mgpuEventElapsedTime` 量的是一条空闲 stream,返回 `hipErrorInvalidHandle`。
**`test/gpu/4k_4k_mul` 一直在打这个错**,只是没人看。要做真性能对比得先修这个。

### 一次跑完全部

```bash
test/gpu/run_all.sh          # 带退出码,非 0 即失败
```
不是打印数字给人看 —— 驱动会读那个数字,非零就 FAIL,**没打印数字也 FAIL**
(什么都没检查的运行等于没跑)。故意弄坏一个测试验证过:报 1024,退出码 1。

最后一次全量:**15/15 通过,exit 0**;lit **310 过 / 240 挂**(240 全是 AIE 关闭,
与 GPU 路径无关)。

## GPU 执行环境(补 NEXT 开头那份)

```bash
salloc --no-shell --partition=mi300x -w rad-mi300x-1 --time=02:00:00 \
       --cpus-per-task=64 --mem=400G --gres=gpu:1     # QOS 上限就是 2h
ssh rad-mi300x-1
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
export PATH=$MLIR_AIR_INSTALL_DIR/bin:$LLVM_INSTALL_DIR/bin:$PATH
bash test/gpu/<name>/run.sh
```
`libmlir_rocm_runtime.so` 之前缺,已经补建并装进 `/shared/erweiw/llvm-56bcc187/lib`
(`cmake -DMLIR_ENABLE_ROCM_RUNNER=ON` + `ninja mlir_rocm_runtime`)。

## 两半接上了(但只接了一半的一半)

之前生成器里一次 `chiplet` 都没出现 —— 任务从一个全局队列抢,谁抢到算谁的,
跟落在哪个 die 上无关,**Fleet 的收益点整个不在生成器里**。现在接上了:

- 每个 stage 的每个 die 有自己的队列头,workgroup **先走自己 die 的 stride**
- 走空了就**依次去偷别的 die** —— 所以某个 die 没分到 workgroup 时,
  它那份 slice 照样有人算。**局部性是偏好,不是假设。**
- 队列按 16 个 die 分配(比现有任何部件都多),用不到的头就留在 0
- 1 / 4 / 36 层全对,且 `amdgcn.s.getreg` 出现在 outline 之后的 kernel 里

**die 内屏障做出来了,gang task 也跑通了**(`test/gpu/gang_task`):
用 `chiplet_id` 做索引、`chiplet_dim_blocks` 做人数,搭了个 per-die 的
sense-reversing 屏障。leader 替整个 die 领一个 task,die 内会合,然后全体分它的 tile。
真机每个 tile 恰好覆盖一次;去掉屏障 → 48 个错。

**但把它接进生成器会间歇性死锁,已回退。** 压测同一个二进制:

| | 30 次里挂几次 |
|---|---|
| 生成器 + gang | **4** |
| 生成器(per-workgroup,现在的版本) | 0 |
| `gang_task` 独立(单 stage) | 0(20 次) |

**屏障本身没问题,放进这条链才死。** 差别在于 `gang_task` 只有一个 stage;
链每层九个 stage,靠事件门控。**事件门放行的条件是"活干完了",不是
"每个 workgroup 都到了"** —— 某个 die 早干完的 workgroup 会先走进下一个 stage,
而它的邻居还在上一个;下一个 stage 若有 die 屏障,它就在等一群还差一个 stage 的人,
那些人将来会到另一个屏障。谁也动不了。

**对照 Fleet 查过了:这个同步点是我加的,Fleet 里不存在。**

- Fleet 的 worker 里**一个跨 workgroup 屏障都没有** —— 只有 `__syncthreads()`
  (workgroup 内)和 `atomicCAS`(leader 选举,不等待)
- 整个 worker 里**唯一**的跨 block 等待在 `persistent_kernel.cuh:1423`:
  scheduler 在**启动时**等所有 worker 把自己的 die 登记进 `worker_xcd_map`。
  和我的 reporting 协议是同一个东西、同一个位置、只做一次
- **gang 成员从不会合。** 每个 XCD 选一个 scheduler block(`:1871`),
  每个 worker 有**私有队列**,gang task 时 scheduler 把同一个 task id
  **写进本 XCD 每个 worker 的队列**(`:1644` "Broadcast the gang task to
  dispatch_count workers")。worker 各自 pop,不问任何人。
  **一致性是 scheduler 写出来的,不是 worker 互等出来的。**

所以正确的修法**不是**把屏障挪到别处,而是**根本不需要屏障**:
把 task 复制给 die 上每个 worker,而不是让其中一个去认领。
材料已经有了 —— `@__air_chiplet_map` 就是 `worker_xcd_map`。
**缺的是 scheduler 这个角色**:现在是 worker 自己抢,没有人负责"写"。

### 已经补上了:`test/gpu/scheduler_broadcast`

把 Fleet 的做法在 AIR 里搭出来跑通了,**一个新 dialect 特性都不需要**:

| Fleet | AIR 里用什么 |
|---|---|
| `get_current_xcd_id()` | `air.chiplet_id` |
| `atomicCAS(xcd_scheduler_claimed[die], -1, blockIdx.x)` | `llvm.cmpxchg` |
| `worker_queues[nw]` 私有队列 + `worker_queue_last_ready_task_id` | memref + `syncscope` 原子 |
| `:1423` scheduler 启动时等 `ready_count` | 同样的一次性等待 |
| `:1644` broadcast 到本 die 每个 worker | 同 |

真机:**8 个 die 各选出一个 scheduler**,96 个 worker-task 对被广播
(8 die × 3 worker × 4 task,每 die 第四个 block 是它的 scheduler),
每个 task 恰好被广播到的那些 worker 执行。**同一二进制 30 次零挂起** ——
对照:会合版本 4/30 挂。

检查里带了**空转守卫**(报告"到底广播了没有"),因为"数目吻合"对一个
什么都没干的程序也成立 —— 这个测试的第一版正是这样假绿过,
host 侧索引写错读了空槽位。

### 生成器 vs Fleet:机制对照表(复现口径,不看性能)

| Fleet 的机制 | 单独验证 | **在生成器里** |
|---|---|---|
| ① 常驻 kernel + task queue | ✓ `task_queue` | ✓ |
| ② Chiplet-task / 按 die 分工 | ✓ `gang_task` / `scheduler_broadcast` | ✓ 按 die 分 stride |
| ③ 两级事件计数 | ✓ `two_level_signal` | ✓ |
| ④ XCD discovery | ✓ `chiplet_identity` | ✓ |
| ⑤ cache streaming(`nt`) | ✓ ISA 验过 | ✓ 权重 load,ISA 里 420 条 `nt` |

**五个机制在生成器里齐了,全部真机验证。**

### 论文头条结果:定量复现了

flush 数**恒定 40**(8 die × 5 个发信号的 stage),**与 worker 数无关**:

| workers | flush | 按 worker 会是 | 削减 |
|---|---|---|---|
| 16 | 40 | 80 | 2× |
| 32 | 40 | 160 | 4× |
| 64 | 40 | 320 | 8× |
| 128 | 40 | 640 | 16× |
| 256 | 40 | 1280 | **32×** |

**device-scope 原子是 die 数的函数,不是 worker 数的函数** —— 这就是 Fleet 的结构性质,
他们的 14.5× 只是他们那个 worker 数下的取值。所有 worker 数下结果都正确
(256 个 workgroup 全驻留)。`WORKERS=` 是 `run.sh` 的旋钮,可重跑。

### 机制 ② 较真:gang 粒度差在哪(答案:batch=1 下不差)

Fleet 的 Chiplet-task 不只是"die 共做一个 task",真正的内容是
**M-major 窗口遍历**(论文 Fig. 3,`gang_linear_mi300.cuh:75-76`):

```c
int m_tile = first_row + (local % win_h);  // 快索引:在列内扫 M
int n_tile = local / win_h;                // 慢索引:扫完 win_h 行才换 N
```
连续的 worker 拿到**同一个 n_tile**(同一块权重),不同的 m_tile —— 权重 tile
被 `win_h` 个 worker 共享。

**但 decode 是单 token,`m_tiles = 1`** → `W=1` → `win_h=1` →
`m_tile=0`、`n_tile=local`。**每个 worker 一个不同的 N-tile,就是按输出列切分,
和生成器现在做的完全一样。** 算法在 M=1 时自己退化成了这个形状。

所以:**batch-1 decode 下机制 ② 没有缺口**。
窗口式 M-major 只有 **M>1** 才有内容 —— 即 **prefill 或 batched decode**。

**M>1 的那一半已经单独复现了:`test/gpu/gang_mmajor`**(M=N=8 tile 的 GEMM,
按 Fleet 的顺序遍历)。对照实验:

| 遍历顺序 | 结果正确性 | 同 die 共享权重块 |
|---|---|---|
| M-fast(Fleet `:75-76`) | 0 差异 | **0 违反** |
| N-fast(把那两行对调) | 0 差异 | **448 违反** |

**算出来的东西一模一样,变的只是共享什么。**

这个检查的第一版是**废的** —— 把 `pi/8` 存进 `trace[pi]` 再断言 `trace[p]==p/8`,
是在验证除法。现在同时记录"哪个 die 领了这个 piece",断言
**同 die 的 piece 共享同一个权重块**,这才是遍历顺序要产生的性质。

### 还差什么才算"复现 Fleet 的 Qwen"

**机制层面基本齐了。** 剩下的是模型和 M>1:

1. **把 M>1 接进生成器** —— 机制本身已经在 `gang_mmajor` 里复现并证伪过了,
   剩下的是给整条链加一个 batch 维(89 处 `memref<{dim}xf32>` 要变成
   `memref<{tokens}x{dim}xf32>`)。**是工程量,不是未知。**
2. **模型本身**:真权重(Fleet 的 Qwen 是 q4)、KV cache 增长、RoPE、多头、
   gated MLP。**这是模型工程,不是机制。**

### 性能(记下,不是当前优先级)### 性能(记下,不是当前优先级)

`--tasks 32` 比默认的 8 快 1.5×(设备时间 1.74s → 1.16s,8 层 × 400 launch
减 host 基线)。但折算只有约 288 MFLOP/s,离 MI300X 五个数量级 ——
因为**每个 workgroup 只有 1 个线程在干活**:
`segment body 404 行,其中 354 行在 thread-0 守卫内,air.herd 体内 7 行(空的)`。
把任务体搬进 `air.herd` 是 64× 的量级。**但这是优化,不是复现,排在复现之后。**

## Phase 0 的成本查清楚了## Phase 0 的成本查清楚了## Phase 0 的成本查清楚了(比想象中低)

plan 说"不管别的先做 Phase 0(GPU 路径进 CI)",因为这条路烂过一次。**现在确认:
CI 里完全没有 GPU 路径。**

```
grep -rn "AIR_ENABLE_GPU|air-to-rocdl|rocdl|ROCDL" .github/workflows/   → 0 匹配
```

所以所有 `REQUIRES: gpu` 的测试在 CI 里**全部被跳过** —— 包括原有的 6 个
AIRToROCDL 测试和我今晚加的 8 个。今晚做的一切会以完全相同的方式烂掉。

**好消息:代价比预期小,不需要 GPU runner,也不需要 ROCm。**

- `-air-to-rocdl` 只产 MLIR(gpu / ROCDL dialect),ROCDL **dialect** 是 MLIR 自带的,
  任何 LLVM 都有 → **MLIR 层的测试在现有 CI 上直接能跑**,只差 `-DAIR_ENABLE_GPU=ON`。
- 只有 ISA 那几条 RUN 行(`gpu-module-to-binary{format=isa}`)需要 LLVM 里编进了
  **AMDGPU backend**。验过:我建的 LLVM 没有任何 ROCm 依赖
  (`ldd mlir-opt | grep -c rocm` = 0),`format=isa` 照样出指令。
  **这是 build-time 的事,不是 runtime —— 不需要 GPU。**
- `utils/build-llvm-local.sh:77` 本来就带 `AMDGPU`。

**查了。wheel 里的 LLVM 只有 x86,没有 AMDGPU**(下载 `mlir==24.0.0.2026080106+56bcc187`
解出 `mlir/bin/llc --version` 验的):
```
Registered Targets:  x86 / x86-64
```
所以我那些 ISA RUN 行**在 CI 里会直接失败**,哪怕开了 `AIR_ENABLE_GPU` ——
Phase 0 一做就红。

**已经处理掉了**(commit `b7a44853`):`mlir/test/lit.cfg.py` 探测 llc 有没有
AMDGPU,有就加 `amdgpu-isa` feature;四个带 ISA 检查的测试用
`// RUN: %if amdgpu-isa %{ ... %}` 把那几行 gate 起来。

两个方向都验过,不是想当然:
- feature 在 → **故意把 ISA 断言改成不可能匹配的字符串,测试变红** → 那行真的在跑
- feature 不在 → 用一个不存在的 feature 名跑,PASS 且 0.03s → 跳过,不报错

**于是 Phase 0 现在就是一行**:在 `buildAndTestNoRuntime.yml` 的 cmake 里加
`-DAIR_ENABLE_GPU=ON`。MLIR 层的 14 个测试会在 CI 跑起来,ISA 那几行自动跳过。
**我没动 CI 文件** —— 改了也没法在这儿验证,而且这是你的 infra 决定。

## 下一步

Phase 1-4 的地基都有了。剩下的是 Fleet 真正的机制:

1. **Phase 5 —— intra-device channel**。`air.channel` 加 `channel_type =
   "gpu_lds_async"`,降到 `rocdl.global.load.lds`,`$aux = (nt?2:0)|(agent?16:0)`。
   两半都已证明能活到 ISA,现在缺的是把它们接到 channel 上。
2. **Phase 5/6 —— 两级事件计数**(论文的 14.5×)。需要一个"signal an event"
   的 AIR op;现在有 `air.chiplet_id` 可以做 XCD-local 那一级了。
   参考 `persistent_kernel.cuh:1226-1251`(两级)vs `:1276-1284`(naive fallback)。
3. **Phase 3 剩余**:把"循环在 launch 外"(`fused_decode` 的 NPU 形态)自动翻成
   常驻形态。现在 sense-reversing 屏障让反过来也**正确**,只是每 iteration 付
   一次屏障 + 丢 L2 驻留 —— 所以这条从正确性降级成性能,可以是 warning 不是 error。

## 待你复核的判断(我在你睡觉时定的)

1. **`max-resident-workgroups` 用 pass option 不用 DLTI**(理由见上)。
2. **`air.chiplet_block_id` 的 rank 是 blockIdx 序**(跟 Fleet 一致),
   不是到达序。到达序会更便宜(一个 atomic 就够,不用扫描),但每次运行不确定。
3. **co-residency 超限是 error 不是 warning**。理由:模型说"保证",
   降级成提示等于把保证变成空话,而且 `chiplet_dim_blocks` 撞上去是 hang 不是错值。

## 已定的设计(plan §1.5)
1. segment 绑 workgroup,一层。chiplet 不是层级,是 body 里查出来的值。
2. 三个新 op,命名照 `gpu.cluster_*`。用 `chiplet` 不用 `xcd`。
3. 砍 `backend-granularity = "XCD"`。
4. 不新造 cache policy attribute,用 `nontemporal` + `syncscope` 合成 `$aux`。
5. co-residency 是正确性前提 —— 超了会 hang,需要 verifier。

已撤回的(别再捡起来):`#air.cache_policy`、`air.chiplet.self`、
`air.chiplet.partition`、`air.resident`;以及"form B 需要跨 launch 持久化"这个说法。

## 两个未决,需要拍板
1. `docs/AIRComputeModel.md` §4.2 整节要重写(它规定两层嵌套 segment,与一层设计冲突)。
2. §2.2:543 与 §4.2:963 矛盾:`air.launch` 到底有没有 iteration space。

## 遗留垃圾(staging 机,昨晚走弯路留下的)
`llvm/install` 4.4G(commit 错的,没用)、`/tmp/llvm-build*` 约 8G、
`/tmp/llvm-pinned` worktree、`~/.local` 里 nanobind 被降到 2.9.2 + 装了 pybind11。
