#include <hip/hip_runtime.h>
// CK tile GEMMs stage through LDS and barrier inside the callee. If a linked
// device function can own __shared__ and __syncthreads(), a CK pipeline can
// be dropped in the same way.
extern "C" __attribute__((used)) __device__ float air_lds_probe(float v, int tid) {
  __shared__ float s[64];
  s[tid] = v;
  __syncthreads();
  return s[63 - tid];
}
