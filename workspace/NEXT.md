# 状态与下一步

> **Fleet 的五个机制已在 MLIR-AIR 里全部复现,并在 MI300X 上真机数值验证。**
> 论文头条结果(信号削减)定量复现:device-scope 原子数 = die 数 × stage 数,
> **与 worker 数无关**,所以削减比 = 每 die 的 worker 数(实测 2× / 4× / 8× / 16× / 32×)。
>
> **36 个本地 commit,都没 push**(分支 `erwei/fix-gpu-conversion-passes`)。
> 工作区干净,`workspace/` 保持 untracked、没进分支。
> 最后一次全量:**GPU 执行测试 17/17 exit 0**,lit **310 过 / 240 挂**
> (240 全是 AIE 关闭所致,与 GPU 路径无关)。
>
> **真实 Qwen3-0.6B 权重已在 MI300X 上跑通**,28 层,产出的 token 与独立 numpy 实现
> 逐个相同(`"The capital of France is"` → `" Paris"`)。见 §2.8。
>
> 历史过程记录在 `workspace/NEXT.history.md`(本文件的旧版,按时间叠加)。

---

## 1. 环境 —— 先读这一节

**编译和跑测试必须在计算节点上,不能在 staging 机。** staging 是 glibc 2.35,
二进制都是 2.39 上建的,在 staging 上一律 `GLIBC_2.38 not found`。**不是 build 坏了。**

```bash
# QOS 上限 2 小时,到期自己续。不指定 -w 也行,任何 gfx942 节点都可以
salloc --no-shell --partition=mi300x --time=02:00:00 \
       --cpus-per-task=32 --mem=200G --gres=gpu:1
#                          ^^^^^^^^^^ --mem 必写!默认 16G 会 OOM 掉 cc1plus
ssh rad-mi300x-2                      # salloc 给哪台就 ssh 哪台

export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
export PATH=$MLIR_AIR_INSTALL_DIR/bin:$LLVM_INSTALL_DIR/bin:$PATH
export PATH=/shared/erweiw/venv/bin:$PATH        # lit 在这个 venv 里(NFS)

cd /home/erweiw/mlir-air
ninja -C build-gpu -j 32 air-opt                # 改了 C++ 之后
lit -s build-gpu/mlir/test                      # IR 层测试
test/gpu/run_all.sh                             # GPU 执行测试,带退出码
```

| 东西 | 位置 | 备注 |
|---|---|---|
| LLVM @ `56bcc187`(`clone-llvm.sh` 的 pin) | **`/shared/erweiw/llvm-56bcc187`** | NFS,**任何节点可用**,不会丢 |
| mlir-air GPU-only build | `/home/erweiw/mlir-air/build-gpu` | NFS |
| lit | **`/shared/erweiw/venv/bin`** | NFS,任何节点可用。`/scratch/erweiw/sandbox` 那份是 **mi300x-1 本地的**,换节点就没了 |
| LLVM 源码 worktree | `rad-mi300x-1:/scratch/erweiw/llvm-pinned` | 节点本地,丢了可重建 |

**两个坑,都撞过:**
- **不要再 build LLVM。**`/scratch/erweiw/llvm/install`(commit `278dba37`,3月)
  对当前源码太老编不过 —— 别被它骗了。要用的是 `/shared` 那份。
- **ninja 在 NFS 上会静默跳过重编**(staging 改、节点建,mtime 不认)。
  报 BUILD OK 但拿旧二进制跑绿。**build 前先 `touch` 改过的文件。**

---

## 2. 做完了什么

### 2.1 Fleet 五个机制 × 复现状态

| Fleet 机制 | 单独验证(`test/gpu/`) | **在生成器里** |
|---|---|---|
| ① 常驻 kernel + task queue | `task_queue` | ✓ |
| ② Chiplet-task / 按 die 分工 | `gang_task`、`scheduler_broadcast`、`gang_mmajor` | ✓ 按 die 分 stride |
| ③ 两级事件计数 | `two_level_signal` | ✓ |
| ④ XCD discovery | `chiplet_identity` | ✓ |
| ⑤ cache streaming(`nt`) | ISA gate(lit) | ✓ 权重 load,ISA 里 420 条 `nt` |

### 2.2 17 个 GPU 执行测试,各自证明什么

全部有 host 侧数值检查,**每一条都做过证伪**(故意改坏,确认会红)。

| 测试 | 证明 | 证伪时的表现 |
|---|---|---|
| `4k_4k_mul` | AIR 原有 GPU 路径可用(基线) | — |
| `chiplet_identity` | die/rank/count 正确 | — |
| `chiplet_cooperative` | 协作分块不重不漏 | stride 改错 → 204 错 |
| `persistent_worker` | 绑定跨 iteration 存活 | — |
| `two_level_signal` | **论文头条机制** | — |
| `task_queue` | 常驻 dispatch 循环 | — |
| `event_gated` | 事件门控依赖 | 去掉边 → 1 错 |
| `megakernel_gemm` | 真实算术 | 丢一个 tile → 1024 错 |
| `megakernel_layers` | 一次 launch 跑完层链 | 去掉层间门 → 16224/16384 错 |
| `megakernel_decode` | 非 GEMM 的任务体(归约/激活) | 去掉 stage 门 → 128/128 错 |
| `megakernel_attention` | attention + KV cache + softmax | 去掉门 → 52 错 |
| `megakernel_gen` | **生成器**,层数是参数 | — |
| `gang_task` | die 内屏障 + 会合式 gang | 去掉屏障 → 48 错 |
| `scheduler_broadcast` | **Fleet 真正的 gang 做法** | 空转守卫 |
| `gang_mmajor` | **M-major 遍历**(M>1 才有的那半) | 翻成 N-fast → 448 违反 |
| `megakernel_gen_prefill` | 同一生成器跑 **M=4** | token 索引清零 → 384 错 |
| `megakernel_gen_decode` | 同一生成器跑 **3 个 decode step** | 队列头不按迭代分 → **挂死** |

### 2.3 生成器 `test/gpu/megakernel_gen/gen.py`

把层数变成参数(手写到 2 层就写不动了)。**每个 decode step 是"1 + 9×层数 + 4"个 stage,
形状对齐 Fleet 给 Qwen3 建的那个模型**(`python/mirage/mpk/models/qwen3/builder.py`):

```
E  x    = Emb[token]                  embed_layer(:755)
   ... 每层九个 stage(下表)...
N  xf   = rmsnorm(x) * nf             模型末尾的 norm
H  lg   = xf @ Wlm                    lm head
P  局部 argmax(每片词表一个)          argmax_partial_layer(:805)
R  规约 argmax → 下一步的 token        argmax_reduce_layer(:811)
```

每层的九个 stage:

```
0 r    = rmsnorm(x) * n1              1 任务,归约;norm 带学习权重
1 qkv  = r @ Wqkv                     q/k/v 融合成一个投影,和 Fleet 一样
2 q,k  = rope(per_head_rmsnorm(q,k))  每个 (token, head) 一个任务
         k,v 写进 KV cache 自己那一槽
3 a    = softmax(q·K/√hd) @ V         每个 (token, head) 一个任务
4 ao   = a @ Wo                       输出投影
5 xa   = rmsnorm(x + ao) * n2         1 任务,归约
6 gu   = xa @ Wgu                     gate/up 融合,和 Fleet 一样
7 act  = silu(gu_g) * gu_u            SwiGLU
8 x    = xa + act @ Wd                残差折进矩阵乘,和 Fleet 一样
```

- **GQA**:`heads` 个 q 头共享 `kv-heads` 个 kv 头,头 h 读 kv 头 `h/group`。
- **q_norm / k_norm**:每个 head 内部的 RMSNorm,在 RoPE 之前。**Qwen3 有、Qwen2 没有**
  (`kv_cache_update_mi300.cuh:130`)。
- **RoPE** 是 Fleet 的 rotate-half(`tasks/ampere/norm.cuh:101-118`)。
- **窗口因果**:token m 看前缀 + 窗口里到自己为止的条目。所以 **stage 2 是真正的
  跨 token 依赖** —— token 3 的 score 读 token 0 写进去的东西,2→3 之间那个事件
  是有负载的,不是摆设。
- stage 3 把 score/softmax/加权和放在**一个** task 里,因为 Fleet 就是这么打包的
  (`paged_attention_layer` 每 (request, kv_head) 一个 task),中间没有事件。

`LAYERS=36` **一次 launch,M=1 和 M=4 都 0 错**。
旋钮:`LAYERS` / `DIM` / `INTER` / `HEADS` / `KV_HEADS` / `VOCAB` / `TASKS` /
`WORKERS` / `TOKENS` / `CACHE` / `STEPS` / `REPEAT`。

**三个检查,一起打印,最后一行是三者之和**(`run_all.sh` 读最后一行):
hidden state(相对容差)、**logits(相对容差)**、**token id(精确相等)**。

**还是替身的部分**:权重是 hash 出来的不是 q4;两端没有 tokenizer。

### 2.4 论文头条结果(可重跑)

```bash
for W in 16 32 64 128 256; do WORKERS=$W LAYERS=1 TASKS=32 test/gpu/megakernel_gen/run.sh; done
```

| workers | 16 | 32 | 64 | 128 | 256 |
|---|---|---|---|---|---|
| device-scope flush | 56 | 56 | 56 | 56 | 56 |
| 按 worker 会是 | 112 | 224 | 448 | 896 | 1792 |
| 削减 | 2× | 4× | 8× | 16× | **32×** |

**flush 数与 token 数也无关**:`tokens` ∈ {1,4} × `workers` ∈ {16…256} 共 10 组,
flush 恒为 **56 = 8 die × 7 strided stage × 1 层**,全部 0 错。

> 数字变过两次:`379ef018` 让 layer 从 9 个 stage(5 个 strided)变成 10 个
> (7 个 strided),`b130a930` 又合并回 9 个(仍是 7 个 strided)。L=1 的 flush
> 从 40 变成 56 就是这么来的。**结论本身没变**:
> flush = die 数 × strided stage 数 × 层数,与 worker 数和 token 数都无关。

### 2.5 M>1(commit `c232ab72`)

`--tokens M` 给整条链加了 batch 维。激活加 token 维,**权重和 KV cache 不加** ——
这个不对称就是 M-major 的理由:一个权重块值得读一次用 M 次。

die 领第 k 个 piece 时的分解(Fleet `gang_linear_mi300.cuh:75`,全 M-major):

```
m = k % tokens          n = die + (k / tokens) * maxdies
```

套在 **die 自己的 claim 计数器**上(不是全局 tile id),因为那个计数器才是一个 die
的 workgroup 共享的东西。**M=1 时退化成 `m=0, n=k`,正是原来的式子** ——
所以 decode 路径一个数都没变,可以当回归基线用。

**接之前先修了两个让原有检查形同虚设的问题**(都不是 M>1 特有的):

1. **权重没居中**。`x % 5` ∈ [0,5) 全非负,矩阵乘变成 128 个正数相加而不是随机游走,
   每层增益约 700。残差流 2 层到 1e4、36 层到 **1e71**。而 host 比对是**相对**容差
   —— 那个量级下绝对误差几百都算"对"。居中,尺度改 0.0625。
2. **残差流没有任何归一化**。stage 0 的 rmsnorm 只喂 q 投影,MLP 读的是未归一化的 `xa`。
   stage 5 改成 `rmsnorm(x + a)`(真实 decoder layer 本来就有这个 norm)。
   **不需要新 stage 或新事件,stage 结构和 flush 数完全不变。**36 层 `|out|` 从 1e71 变成 ~20。

**证伪矩阵**(2 层 M=4,共 512 个输出元素):

| 改坏什么 | 错误数 |
|---|---|
| MLP 读 token 0 的 xa | 381 |
| score 写进 token 0 的行 | **241**(修之前是 0) |
| 残差加 token 0 的 attention 输出 | **108**(修之前是 0) |
| 去掉新加的 pre-MLP norm | 465 |
| 换成 N-fast 顺序 | 0(纯重排,与 `gang_mmajor` 一致) |

用 numpy 复刻同一套算术能**精确预测**这些数字(包括 108)。这个模型很有用,
改数据前先拿它筛,比 GPU 往返快两个数量级。

**仍然没验的:遍历的顺序本身。** piece 构成精确划分是验了的(漏一个会卡在事件计数上、
重复一个会算错),但 **M-fast 和 N-fast 按构造就算出同样的数,任何数值检查都分不开**。
公式本身在 `test/gpu/gang_mmajor` 里有真机验证。

### 2.6 多步解码(commit `7611b719`)

`--steps S` 在**一次 launch 里**跑 S 个 decode step。第 s 步把自己的窗口写进
`cache + s*tokens`,注意到包括自己在内的全部历史 —— 所以 **attention 的长度是运行时量,
不是常量**。host 不在步之间重启 kernel,Fleet 也不:它的 `prepare_next_batch`
在**设备上**推进 `config.step[request_id]`(`persistent_kernel.cuh:392`)。

同一张静态 task graph 跨步复用,需要第 s+1 步的事件和队列头跟第 s 步已经满足的那些区分开。
**Fleet 的做法不是重置计数器,而是给 task 身份加版本号:**

```c
TaskId = (iteration_num << 32) | position_index      // :263
```

这里就是把事件、队列头、两级计数器都按 `(step, layer, stage)` 索引。
**步之间什么都不用重置**,每一步直接寻址自己的槽位。
这是 chiplet barrier 里那个 generation 计数在**序列层面**的对应物。

两半都是有负载的,而且**失败形态不同**:

| 改坏什么 | 结果 |
|---|---|
| 事件和计数器不按迭代版本化 | 256/256 全错 |
| 队列头跨步共享 | **挂死**(120s 被 kill,退出码 124) |

挂死是诚实的失败:队列头共享后第 1 步从第 0 步停下的地方继续领,每次领取都越界、
什么都不做,事件永远到不了总数。`run_all.sh` 本来就把"没打印计数"判 FAIL,
所以它不会悄悄变绿。

八个证伪变体全部与 numpy 模型**精确吻合**(3 步 × 2 token × 2 层,256 个输出元素):
attention 长度固定 205、每步都写 `cache+0` 238、input norm 242、q head norm 214、
去掉 RoPE 211、去掉掩码 17、所有 head 读 kv0 244、silu 分母 1 255。
前两条是新机制:没有增长的长度,一步就看不见更早的步追加的东西;
没有移动的槽位,每步都覆盖同一批 cache 条目。

### 2.7 词表两端(commit `c4b0320d`)

链原来是 hidden state 进、hidden state 出。现在补上了 Fleet builder 里的两端:
前面 `embed_layer`,后面 `rmsnorm` + lm head + **两段式 argmax**
(`argmax_partial_layer` / `argmax_reduce_layer`,对应 `argmax_part_value` /
`argmax_part_index` 那两个 buffer)。

接上之后 `--steps` 才是真正的解码循环:**第 s 步 embed 第 s-1 步产出的 token**,
所以任何地方的 bug —— 包括最后一个 stage —— 都会扰动下一步的输入,进而在
hidden state 里显形。

**这一改动最有价值的产出是发现 token 比对原本是虚的。** 每一步都产出 token 135,
于是 embedding 错、位置错、反馈链断掉,比对全都相等。根因还是权重模式:
`f(a·i + b·v) mod m` 让 lm head 的每一列都是同一模式的平移 —— 列以 m 为周期重复、
成对互为相反数、还有几列完全相同。**实测 256 列里只有 254 个不同的,秩 127,
top1-top2 的 logit 间距恰好为 0** —— argmax 是按下标定的,和 hidden state 无关。
embedding 同构,只携带 log2(11) 比特。两者都改成整数 hash:256 列全不同,
最大非对角相关 0.34,没有并列。

**但这还不够,诚实的说法是:token 在这里是个很钝的工具。** 这条链是收缩的
(每层两个 rmsnorm),hidden state 步间只变几十个百分点,而 argmax 在一个词表上
要动需要更多 —— **token 可以相等而它底下的 logits 是错的**。所以又加了
**logits 逐元素比对**,词表尾部真正是在那里被检验的;token 比对负责它上面的两个
argmax stage。

六个证伪,三个检查全红(hidden / logits / tokens,满分 256 / 512 / 6):

| 改坏什么 | hidden | logits | tokens |
|---|---|---|---|
| embed 忽略 token id | 240 | 473 | 6 |
| 反馈永远用第 0 步的 token | 220 | 405 | 3 |
| 末尾 norm 权重→1 | 200 | 478 | 5 |
| lm head 权重→1 | 238 | 512 | 6 |
| 局部 argmax 存错下标 | 164 | 299 | 2 |
| argmax 规约取最小值 | 238 | 472 | 6 |

后四条能影响到 hidden state,正是反馈循环在起作用:它们改了 token,
token 改了下一步的 embedding。

### 2.8 真实 Qwen3-0.6B 权重(commit `be6a8457`)

**先纠正一处我之前写错的:Fleet 的 Qwen3 是 bfloat16,不是 q4。**
`demo/qwen3/demo.py` 默认 `Qwen/Qwen3-8B`,`python/mirage/mpk/` 里
`int4|quant|gptq|awq` 零匹配。

```
weights.py        自己解 safetensors(8 字节头长 + JSON 头 + 裸数据,
                  BF16 左移 16 位变 F32),写一个扁平 f32 blob + manifest。
                  不依赖 torch 和 safetensors 包 —— 节点上两个都没有。
weights_loader.c  一个 extern,收裸指针和 float 偏移。短读直接退出,
                  不留半满的 buffer去冒充舍入差异。
gen.py --weights  除 --layers 外所有尺寸都取自 checkpoint config。
qwen3_ref.py      numpy 版 Qwen3,**直接读 HF 文件**而不是转出来的 blob,
                  所以连转换器一起验。
run_qwen.sh       串起来并比 token。
```

**三处形状必须改**:`head_dim` 是 config 里单独给的、**不等于 hidden/heads**
(0.6B 是 1024/16 头/head_dim 128,所以 q 投影比残差流宽,靠 `o_proj` 收回来);
`rope_theta` 是 1e6 不是 1e4;lm head 与 embedding 绑定。

**独立参考当场就赚回了成本。** 链和它的 host 参考一致地给出了模型并不会预测的 token。
根因:stage 5 算的是 `xa = rmsnorm(x + ao) * n2`,stage 8 把 MLP 输出加回 `xa` ——
**decoder layer 是归一化 MLP 读的那份、残差流本身不动**,残差应该闭合到未归一化的
`x + ao` 上。归一化后的那份现在写进 `%sr`(stage 1 之后就没人读了)。
**这个错误对文件里所有检查都是隐形的,因为比对的两边都带着它。**

修完之后设备和 host 的 hidden state 差异从 33/4096 变成 **0** ——
多归一化一次正是让 28 层 f32 累积分道扬镳的原因。

完整 28 层,MI300X:

| | |
|---|---|
| prompt | `785,6722,315,9625,374` = `"The capital of France is"` |
| 链 | `15846,315,279,374,12095` |
| numpy | `15846,315,279,374,12095` |
| token 12095 | `" Paris"` |

编译 18s、运行 14s,三跑逐位相同(所以剩下的是确定性而非竞争)。

`run_qwen.sh` **不在 `run_all.sh` 里** —— 它需要几 GB 的 checkpoint,仓库里没有。
`QWEN_DIR` 没设时它大声失败,不是静默跳过。

**怎么跑:**
```bash
QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
  test/gpu/megakernel_gen/run_qwen.sh
# checkpoint 在 /shared/erweiw/qwen3-0.6b(config.json + model.safetensors + vocab.json)
# 转换后的 blob 在 .../air/(3.01 GB),第一次跑会自动生成
# numpy 在 /shared/erweiw/venv(lit 也在那儿)
```

---

## 3. 方法论 —— 这条别丢

**每个测试都要证伪。** 抓到过**三次假绿**:

1. `event_gated` / `megakernel_attention`:**把依赖边删掉结果照样对**,因为 32 个
   worker 几微秒内全完成,竞争窗口撞不上。加人为延迟撑开窗口才有意义。
2. `gang_mmajor` 的遍历检查:把 `pi/8` 存进 `trace[pi]` 再断言 `trace[p]==p/8` ——
   **在验证除法**。改成"同 die 的 piece 是否共享同一权重块"才有内容。
3. `scheduler_broadcast`:host 侧索引写错读了空槽位,于是 count 和 expect 都是 0、
   "差异为 0"。**加了空转守卫**(报告到底广播了没有)才发现。

推论:**统计量(flush 数、count 吻合)只反映机制,只有参考值比对知道算术还在不在。**
有一次替换 stage 4 时把旁边的 softmax stage 一起删了,flush 数照样"正确",
是参考值当场抓到的(125/128 错)。

**第六次,也是最贵的一次:两边一起错。** 参考值和设备都由我写、都在同一个文件里,
所以**共有的架构错误对所有检查都是隐形的**。残差接错(§2.8)在合成权重下跑了四个
commit 都没被发现 —— 直到拿真权重去和一个**独立写的** numpy Qwen3 比 token 才暴露。
推论:**自洽不等于正确。只要有外部 ground truth 可拿,就必须拿。**

**第五次:参考值本身也需要第三方。** 设备只和**同一个文件里的 host 参考**比,
两边一起错就一起绿。现在每次改算术都先写一个 **numpy 模型**独立算一遍,
用它**事先预测**每个证伪变体该错多少个,再上 GPU 对。
GQA 那一轮(`b130a930`)十一个变体里 **八个精确吻合**:

| 改坏什么 | 预测 | 实测 |
|---|---|---|
| input norm 权重→1 | 512 | **512** |
| post-attn norm 权重→1 | 433 | **433** |
| q head norm 权重→1 | 222 | **222** |
| k head norm 权重→1 | 151 | **151** |
| 去掉 RoPE | 443 | **443** |
| 去掉因果掩码 | 125 | **125** |
| 所有 head 读 kv head 0 | 490 | **490** |
| silu 分母→1 | 509 | **509** |
| 所有 token 在同一位置 rope | 216* | 248 |
| 所有 head 读 query head 0 | 489* | 460 |
| k/v 全写进同一个 cache 槽 | — | 308 |

带 * 的两条对不上是因为 **sed 改的和模型里破坏的不是同一处**(sed 把 q 和 k 的
rope 位置都改了、模型只改 q;sed 共享 query、模型共享输出),不是算术有分歧。

这个模型还有个附带好处:比 GPU 往返快两个数量级,数据设计阶段全在 numpy 里筛。
另外**证伪脚本自己要有守卫** —— sed 没匹配上要报 `SED DID NOT MATCH`,
我写出过恒等替换,靠这个守卫才没把"改了个寂寞"当成一次证伪。

**第四次(M>1 时抓到的,最隐蔽):参考值比对本身可以是虚的。**
生成器的容差是**相对**的(分母 `max(|want|,1)`)。残差流炸到 1e4 之后,
绝对误差几百都在容差内 —— 比对还在跑、还在报 0,但它什么都拦不住。
表现是:删掉整个 attention 会红(改变量级够大),而 attention **内部**任何错误都不红。

推论:**绿之前先看输出的量级。** 合成数据里**四个**东西会悄悄毁掉相对容差:

1. **权重不居中** —— 矩阵乘从随机游走变成正数求和,增益 ~dim 而不是 ~√dim。
2. **残差流缺归一化** —— 指数发散或塌缩。
2b. **权重尺度没跟归约长度挂钩** —— 归约 `red` 项会把输入放大 √red 倍。固定尺度下
   门控 pre-activation 是 ~4 而不是 ~1,`silu(g)` 退化成 `g`,每层涨两个数量级。
   **用 `gain/√fan_in`**(真实初始化就是这么做的),顺带让生成器对 `--dim`/`--inter` 免疫。
3. **共振** —— 权重 `W[i,j]=f(i-j)` 是卷积,若激活和它同周期则相干叠加。
   实测:周期-5 激活配周期-5 权重,增益是随机游走的 **2.84 倍**,换别的周期只有 0.2 倍。
   **每个权重矩阵用不同模数,输入再用一个互质的。**
4. **列和不为零** —— 减常数不够!列和归零要求归约长度是模数的整数倍,而 `dim=128`
   不是。残留的 DC 项会被激活均值和归约长度双重放大 —— 这就是 `|a@Wo|=11.5` 而
   `|out|=1.2` 的由来:**attention 在取代残差而不是扰动它**,整条链退化成不动点迭代,
   任何扰动一层之内就被洗掉。修法:**沿归约轴精确减去列均值**,一遍循环。

另外注意**哪些居中没用**:给 K 居中是**无效的**,因为常数只给 score 加了个
与 t 无关的偏移,而 softmax 对此平移不变。我先改了 K,数字一点没动才发现。
同理 `K[t,i]=f(t+i)` 时所有 K 行只是同一模式的循环移位 → softmax 近似均匀 →
attention 输出与 query 无关。改成 `f(t²+3i)` 才有内容。

---

## 4. 下一步(按优先级)

**机制层面到头了**:M>1(§2.5)、Qwen layer 形状、GQA 多头 + RoPE + qk-norm +
KV 写回 + 窗口因果(§2.3)、**一次 launch 跑完多步解码 + cache 增长 + 迭代版本化**
(§2.6)都接完并真机验证。剩下的按优先级:

1. **真权重下的多步解码**。现在真权重只跑 prefill(一步走完 prompt)。
   多步要让窗口在第一步之后缩成 1 个 token —— `tokens` 目前是每步固定的。
   **这是"真的在解码"缺的最后一块。**
2. **tokenizer**。现在 prompt 和输出都是 token id,要靠 `vocab.json` 手工查。
   BPE 编码没做。
3. **张量并行 / allreduce**(Fleet 的 `allreduce_layer`)。单卡下没意义,
   多卡才有;`docs/MultiGPUAbstractionNotes.md` 里有记录。
4. **分页 KV cache**。现在 cache 是一整块定长数组(前缀 + `steps*tokens`),
   Fleet 是分页的(`max_num_pages` × `page_size`)。页表是另一层间接,
   机制上不难但要改所有 cache 访问。
5. **两个单任务 stage(0 和 5)在 M>1 下是一个 workgroup 串行跑完 M 个 token。**
   负载不均,但这是**性能不是正确性**,按"不要过早优化"没动。真要接就是把它们
   也变成 strided stage(piece 数 = tokens),`strided_stage` 能直接用。
   注意那会把 flush 数从 die×7×层 变成 die×9×层,§2.4 的表要重测。

**不要做的(想清楚了才没做):**
- **scheduler 角色接进生成器** —— Fleet 的 scheduler 服务于动态 task graph,
  生成器的 stage 是静态的,它没东西可决定。做法已在 `scheduler_broadcast` 验过,
  等 task graph 真动态了再接。
- ~~gang task 接进生成器~~ —— 原因是 batch-1 下 Fleet 算法自己退化。
  **M>1 之后这条不再成立,已经接了**(§2.5)。

---

## 5. 性能:记下,**不是当前优先级**(用户明确说过)

- `--tasks 32` 比默认 8 快 1.5×(设备时间 1.74s → 1.16s,8 层 × 400 launch 减 host 基线)
- 但折算只有约 **288 MFLOP/s**,离 MI300X 五个数量级。原因不在调度:
  **每个 workgroup 只有 1 个线程在干活** ——
  `segment body 404 行,354 行在 thread-0 守卫内,air.herd 体内 7 行(空的)`。
  blockDim=64,**把任务体搬进 `air.herd` 是 64× 的量级**。
- **kernel 内计时目前不可用**:`mgpuEventRecord` 把事件记在自己建的 stream 上,
  而 `gpu-to-llvm` 把 kernel 放它自己的 stream 上 → `mgpuEventElapsedTime` 返回
  `hipErrorInvalidHandle`。**`test/gpu/4k_4k_mul` 一直在打这个错**,没人看。
  要做真性能对比得先修这个。

---

## 6. 关键结论 —— 别再重新推导

### 6.1 那个死锁是我的,Fleet 没有(查过代码)

我曾在生成器里加过 die 内屏障,4/30 概率死锁,已 revert。对照 Fleet:

- worker 里**一个跨 workgroup 屏障都没有**,只有 `__syncthreads()` 和不等待的 `atomicCAS`
- 整个 worker 唯一的跨 block 等待在 `persistent_kernel.cuh:1423` —— scheduler
  **启动时**等所有 worker 登记 `worker_xcd_map`,只一次
- **gang 成员从不会合**:每 XCD 一个 scheduler block(`:1871`),每 worker 私有队列,
  scheduler 把同一 task id **写进本 XCD 每个 worker 的队列**(`:1644`)。
  **一致性是写出来的,不是等出来的。**

根因分析:**我复刻了能看见的机制(worker 侧 rank 计算),自己发明了它的前提
(大家手上同一个 task)**,而前提在 scheduler 侧,我没读。更早一步的错是为了
"演示 dispatch 循环"选了最简单的全局队列,之后六个 commit 都继承了它。

### 6.2 Fleet 的 `nt` 用在哪(推翻过我的猜想)

| 位置 | 用法 |
|---|---|
| `gang_ksplit_linear_mi300.cuh:88`、`gang_moe_linear_mi300.cuh:156` | 权重 load → `coherence_enum(18)` = `nt\|sc1` |
| `rmsnorm_mi300.cuh:25`、`silu_mul_mi300.cuh:25` | 激活输出 `__builtin_nontemporal_store` |
| 队列/flag 通信 | **agent-scope 原子,不是 nt**(`mpk_atoms.cuh` 的 nt 版是备选) |

### 6.3 两个 AIR 语义发现

1. **`air.segment` 的 body 被 workgroup 里每个线程各跑一遍。** 没有隐含的
   "每 workgroup 一次",标量副作用必须自己守卫(Fleet 写 `if (threadIdx.x == 0)`)。
   后果:**"这个 workgroup 领一个 task"在 AIR 里没法干净表达** —— 领取要手工守卫,
   领到的值要给 herd 又要手工 LDS 广播。
2. **MLIR 在报 `scf.while` 结果数不匹配这个错时自己 segfault**(`Type::print` 里),
   上游 bug,不是 AIR 的。

### 6.4 Phase 0(GPU 路径进 CI)的成本

- CI 里 `AIR_ENABLE_GPU` / `air-to-rocdl` / `ROCDL` **零匹配** —— GPU 路径完全没 CI,
  所有 `REQUIRES: gpu` 测试**全被跳过**。这就是它烂过一次的机制。
- CI 用的 mlir-aie distro wheel 里的 **LLVM 只有 x86,没有 AMDGPU**(下载解包验过)。
- **已处理**:`mlir/test/lit.cfg.py` 探测 llc 有没有 AMDGPU → `amdgpu-isa` feature;
  四个带 ISA 检查的测试用 `%if amdgpu-isa %{ ... %}` gate 起来,两个方向都验过。
- **所以 Phase 0 现在就是一行**:`buildAndTestNoRuntime.yml` 的 cmake 加
  `-DAIR_ENABLE_GPU=ON`。MLIR 层测试会跑起来,ISA 那几行自动跳过。**我没动 CI 文件。**

---

## 7. 待复核的判断(我自己定的)

1. `max-resident-workgroups` 用 **pass option 不用 DLTI**(AIR 现有 pass 都用 `Option<>`)
2. `air.chiplet_block_id` 的 rank 是 **blockIdx 序**(跟 Fleet 一致),不是到达序
3. co-residency 超限**报 error 不报 warning**(模型说的是"保证")
4. `@__air_chiplet_map` 定长(由 `max-resident-workgroups` 决定),超了是 UB 无运行时检查

## 8. 两个仍未决,需要你拍板

1. `docs/AIRComputeModel.md` §4.2 整节要重写(它规定两层嵌套 segment,与一层设计冲突)
2. §2.2:543 与 §4.2:963 矛盾:`air.launch` 到底有没有 iteration space

## 9. push 前必须做

`black --check test/gpu/megakernel_gen/gen.py` **是红的,而且在我这次改之前就已经红了**
(`git stash` 验过)。没顺手全文件重排是因为那会把这次的 diff 埋掉。
**push 前单独开一个 formatting commit 跑 black**,否则 CI 格式检查会挂。
C++ 这次没动,`git clang-format origin/main` 无事可做。

## 10. 遗留垃圾(staging 机)

`llvm/install` 4.4G(commit 错的,没用)、`/tmp/llvm-build*`、`/tmp/llvm-pinned` worktree、
`~/.local` 里 nanobind 被降到 2.9.2 + 装了 pybind11。要清随时说。
