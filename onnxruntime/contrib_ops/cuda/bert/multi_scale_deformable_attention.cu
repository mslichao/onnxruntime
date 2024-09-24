#include <cuda_runtime.h>
#include <assert.h>

#include <stdexcept>

#include "core/framework/stream_handles.h"

#define CUDA_KERNEL_LOOP(i, n)                          \
  for (int i = blockIdx.x * blockDim.x + threadIdx.x;   \
      i < (n);                                          \
      i += blockDim.x * gridDim.x)

__device__ float ms_deform_attn_im2col_bilinear(const float* &bottom_data,
                                                   const int &height, const int &width, const int &nheads, const int &channels,
                                                   const float &h, const float &w, const int &m, const int &c)
{
  const int h_low = floor(h);
  const int w_low = floor(w);
  const int h_high = h_low + 1;
  const int w_high = w_low + 1;

  const float lh = h - h_low;
  const float lw = w - w_low;
  const float hh = 1 - lh, hw = 1 - lw;

  const int w_stride = nheads * channels;
  const int h_stride = width * w_stride;
  const int h_low_ptr_offset = h_low * h_stride;
  const int h_high_ptr_offset = h_low_ptr_offset + h_stride;
  const int w_low_ptr_offset = w_low * w_stride;
  const int w_high_ptr_offset = w_low_ptr_offset + w_stride;
  const int base_ptr = m * channels + c;

  float v1 = 0;
  if (h_low >= 0 && w_low >= 0)
  {
    const int ptr1 = h_low_ptr_offset + w_low_ptr_offset + base_ptr;
    v1 = bottom_data[ptr1];
  }
  float v2 = 0;
  if (h_low >= 0 && w_high <= width - 1)
  {
    const int ptr2 = h_low_ptr_offset + w_high_ptr_offset + base_ptr;
    v2 = bottom_data[ptr2];
  }
  float v3 = 0;
  if (h_high <= height - 1 && w_low >= 0)
  {
    const int ptr3 = h_high_ptr_offset + w_low_ptr_offset + base_ptr;
    v3 = bottom_data[ptr3];
  }
  float v4 = 0;
  if (h_high <= height - 1 && w_high <= width - 1)
  {
    const int ptr4 = h_high_ptr_offset + w_high_ptr_offset + base_ptr;
    v4 = bottom_data[ptr4];
  }

  const float w1 = hh * hw, w2 = hh * lw, w3 = lh * hw, w4 = lh * lw;

  const float val = (w1 * v1 + w2 * v2 + w3 * v3 + w4 * v4);
  return val;
}

__global__ void ms_deformable_im2col_gpu_kernel(const int n,
                                                const float *data_value,
                                                const int64_t *data_spatial_shapes,
                                                const float *data_sampling_loc,
                                                const float *data_reference_points,
                                                const float *data_attn_weight,
                                                const int B,
                                                const int S,
                                                const int M,
                                                const int C,
                                                const int L,
                                                const int Q,
                                                const int P,
                                                float *data_col)
{
  assert(n == B * Q * M * C);
  CUDA_KERNEL_LOOP(index, n)
  {
    int _temp = index;
    const int c = _temp % C;
    _temp /= C;
    const int m = _temp % M;
    _temp /= M;
    const int q = _temp % Q;
    _temp /= Q;
    const int b = _temp;
    assert(b == 0);
    assert(B == 1);
    assert(L == 4);

    float *data_col_ptr = data_col + index;
    // data_attn_weight shape: [B, L, Q, M, P]
    int data_weight_ptr = 0;
    // data_sampling_loc shape: [B, L, Q, M, P, 2]
    int data_loc_w_ptr = 0;
    int data_reference_ptr = (b * L * Q + 0 * Q + q) << 1;
    float res = 0;

    int level_start_id = 0;
    for (int l = 0; l < L; ++l)
    {
      data_weight_ptr = ((b * L + l) * Q + q) * M + m * P;  // at p=0
      data_loc_w_ptr = data_weight_ptr << 1;
      const int spatial_h = data_spatial_shapes[l * 2];
      const int spatial_w = data_spatial_shapes[l * 2 + 1];
      const float *data_value_ptr = data_value + (b * S + level_start_id) * M * C;
      for (int p = 0; p < P; ++p)
      {
        const float loc_w = data_sampling_loc[data_loc_w_ptr] + data_reference_points[data_reference_ptr];
        const float loc_h = data_sampling_loc[data_loc_w_ptr + 1] + data_reference_points[data_reference_ptr + 1];
        const float weight = data_attn_weight[data_weight_ptr];

        // Note(qiduan): scaling is removed
        const float h_im = loc_h - 0.5;
        const float w_im = loc_w - 0.5;

        if (h_im > -1 && w_im > -1 && h_im < spatial_h && w_im < spatial_w)
        {
          res += ms_deform_attn_im2col_bilinear(data_value_ptr, spatial_h, spatial_w, M, C, h_im, w_im, m, c) * weight;
        }

        data_weight_ptr += 1;
        data_loc_w_ptr += 2;
      }
      level_start_id += spatial_h * spatial_w;
      data_reference_ptr += Q << 1;
    }
    *data_col_ptr = res;
  }
}

void ms_deformable_im2col_gpu_kernel_wrapper(
  const float *data_value,
  const int64_t *data_spatial_shapes,
  const float *data_sampling_loc,
  const float *data_reference_points,
  const float *data_attn_weight,
  const int batch_size,
  const int spatial_size,
  const int num_heads,
  const int channels,
  const int num_levels,
  const int num_query,
  const int num_point,
  float *output,
  onnxruntime::Stream *device_stream)
{
  cudaError_t err;
  int gpuCount = 0;
  if((err = cudaGetDeviceCount(&gpuCount)) != cudaSuccess){
    throw std::runtime_error(cudaGetErrorString(err));
  }

  if(gpuCount <= 0){
    throw std::runtime_error("No CUDA compatible GPU available");
  }

  const int deviceID = 0;
  // Run on device 0
  if((err = cudaSetDevice(deviceID)) != cudaSuccess){
    throw std::runtime_error(cudaGetErrorString(err));
  }

  cudaDeviceProp property;
  if((err = cudaGetDeviceProperties(&property, deviceID)) != cudaSuccess){
    throw std::runtime_error(cudaGetErrorString(err));
  }

  int num_output = batch_size * num_query * num_heads * channels;
  int num_threads = std::min(1024, property.maxThreadsPerBlock);
  int blocks = (num_output + num_threads - 1) / num_threads;

  cudaStream_t stream = (device_stream == nullptr) ? static_cast<cudaStream_t>(device_stream->GetHandle()) : nullptr;

  ms_deformable_im2col_gpu_kernel<<<blocks, num_threads, num_threads*3*sizeof(float), stream>>>(
    num_output,
    data_value,
    data_spatial_shapes,
    data_sampling_loc,
    data_reference_points,
    data_attn_weight,
    batch_size,
    spatial_size,
    num_heads,
    channels,
    num_levels,
    num_query,
    num_point,
    output
  );

  if((err = cudaStreamSynchronize(stream)) != cudaSuccess){
    throw std::runtime_error(cudaGetErrorString(err));
  }
}
