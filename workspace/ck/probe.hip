// Smallest possible question: can a kernel that MLIR generated call a device
// function that hipcc compiled? If it can, the same door takes a CK tile GEMM.
//
// __attribute__((used)) and -fgpu-rdc keep the symbol: without them a device
// function with no caller in its own translation unit is simply deleted.
extern "C" __attribute__((used)) __device__ float air_ck_probe(float a, float b) {
  return a * b + 17.0f;
}
