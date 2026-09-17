// A ck_tile GEMM wrapped as a plain device function an MLIR-generated kernel
// can call.
//
// The tile configuration is CK's own reference one, not Fleet's: M_Tile 128,
// N_Tile 32, K_Tile 128/sizeof(bf16), 4x1x1 warps, 32x32x8 warp tile, paired
// with GemmPipelineAGmemBGmemCRegV1 -- example/ck_tile/03_gemm/gemm_utils.hpp
// :42-52 and gemm_basic_invoker.hpp:70. An earlier version of this file copied
// Fleet's 16/64/256 instead and drew the wrong conclusion from the failure.
//
// Two deliberate differences from CK's own example remain:
//   - static __shared__, not `extern __shared__`. CK wants dynamic LDS, which
//     is a launch parameter; air.launch sets none.
//   - the pipeline is called directly rather than through GemmKernel, which is
//     what Fleet does too.
#include <hip/hip_runtime.h>
#include "ck_tile/core.hpp"
#include "ck_tile/ops/gemm.hpp"

using namespace ck_tile;

static constexpr index_t MPerBlock = 128;
static constexpr index_t NPerBlock = 32;
static constexpr index_t KPerBlock = 64;   // 128 / sizeof(bf16)

using BlockTile   = sequence<MPerBlock, NPerBlock, KPerBlock>;
using BlockWarps  = sequence<4, 1, 1>;
using WarpTile    = sequence<32, 32, 8>;
using GemmShape   = TileGemmShape<BlockTile, BlockWarps, WarpTile>;
using GemmTraits  = TileGemmUniversalTraits<true, false, true, false,
                                            tensor_layout::gemm::RowMajor,
                                            tensor_layout::gemm::ColumnMajor,
                                            tensor_layout::gemm::RowMajor>;
using Problem  = GemmPipelineProblem<bf16_t, bf16_t, float, GemmShape, GemmTraits>;
using Pipeline = GemmPipelineAGmemBGmemCRegV1<Problem>;

extern "C" __attribute__((used)) __device__ void
air_ck_gemm(void const* a_ptr, void const* b_ptr, float* c_ptr,
            int m_size, int k_size, int n_stride) {
  __shared__ char smem[32768];
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

  auto c_view = make_naive_tensor_view<address_space_enum::global>(
      c_ptr, make_tuple(m_size, index_t(NPerBlock)),
      make_tuple(n_stride, 1), number<4>{}, number<1>{});
  auto c_win = make_tile_window(
      c_view, make_tuple(number<MPerBlock>{}, number<NPerBlock>{}), {0, 0});
  store_tile(c_win, c_tile);
}
