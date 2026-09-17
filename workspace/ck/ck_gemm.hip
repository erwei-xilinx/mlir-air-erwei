// Can a ck_tile GEMM pipeline be wrapped as a plain device function that an
// MLIR-generated kernel calls? Same shape as Fleet's
// gang_ksplit_linear_mi300.cuh:70-105, with two deliberate differences:
//
//   - static __shared__, not `extern __shared__`. CK wants dynamic LDS, which
//     is a launch parameter; air.launch does not set one. A fixed-size buffer
//     sidesteps that and is proven to work from a linked callee.
//   - B is [n][k] (ColumnMajor in CK's naming), which is the transpose of how
//     this repo stores weights today.
#include <hip/hip_runtime.h>
#include "ck_tile/core.hpp"
#include "ck_tile/ops/gemm.hpp"

using namespace ck_tile;

static constexpr index_t MPerBlock = 16;
static constexpr index_t NPerBlock = 64;
static constexpr index_t KPerBlock = 256;

using BlockTile   = sequence<MPerBlock, NPerBlock, KPerBlock>;
using BlockWarps  = sequence<1, 4>;
// The warp tile has to be a shape the MFMA dispatcher actually has:
// 16x16x32 is v_mfma_f32_16x16x32_bf16. Fleet passes KPerBlock here and
// supplies its own policy to cope; upstream wants the instruction shape.
using WarpTile    = sequence<16, 16, 32>;
using GemmShape   = TileGemmShape<BlockTile, BlockWarps, WarpTile>;
using GemmTraits  = TileGemmUniversalTraits<true, false, true, false,
                                            tensor_layout::gemm::RowMajor,
                                            tensor_layout::gemm::ColumnMajor,
                                            tensor_layout::gemm::RowMajor>;
using Problem        = GemmPipelineProblem<bf16_t, bf16_t, float, GemmShape, GemmTraits>;
// Fleet uses its own GemmPipelineSmallTilePolicy (linear_ck_mi300.cuh:134);
// the upstream default is enough to answer whether this links and runs.
using Pipeline       = GemmPipelineAGmemBGmemCRegV2<Problem>;

extern "C" __attribute__((used)) __device__ void
air_ck_gemm(void const* a_ptr, void const* b_ptr, float* c_ptr,
            int m_size, int k_size, int n_stride) {
  __shared__ char smem[16384];
  auto const* a = reinterpret_cast<bf16_t const*>(a_ptr);
  auto const* b = reinterpret_cast<bf16_t const*>(b_ptr);

  auto a_view = make_naive_tensor_view<address_space_enum::global>(
      a, make_tuple(m_size, k_size), make_tuple(k_size, 1),
      number<8>{}, number<1>{});
  auto b_view = make_naive_tensor_view<address_space_enum::global>(
      b, make_tuple(index_t(NPerBlock), k_size), make_tuple(k_size, 1),
      number<8>{}, number<1>{});

  auto a_win = make_tile_window(a_view, make_tuple(number<MPerBlock>{}, number<KPerBlock>{}), {0, 0});
  auto b_win = make_tile_window(b_view, make_tuple(number<NPerBlock>{}, number<KPerBlock>{}), {0, 0});

  Pipeline pipeline;
  auto c_tile = pipeline(a_win, b_win, k_size / KPerBlock, smem);
  block_sync_lds();

  // Write the tile out with CK's own store_tile rather than a hand-rolled
  // thread-to-element mapping. The c_tile is a distributed tensor whose layout
  // is a function of the policy; copying Fleet's mapping (which belongs to
  // Fleet's own policy) is what made the first attempt produce 192 and 128
  // where it should produce 256.
  auto c_view = make_naive_tensor_view<address_space_enum::global>(
      c_ptr, make_tuple(m_size, index_t(NPerBlock)),
      make_tuple(n_stride, 1), number<4>{}, number<1>{});
  auto c_win = make_tile_window(
      c_view, make_tuple(number<MPerBlock>{}, number<NPerBlock>{}), {0, 0});
  store_tile(c_win, c_tile);
}
