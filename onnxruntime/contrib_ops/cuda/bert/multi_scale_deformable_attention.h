// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

#include "core/common/common.h"
#include "core/providers/cuda/cuda_kernel.h"

using onnxruntime::cuda::CudaKernel;

namespace onnxruntime::contrib::cuda {
  class MultiScaleDeformableAttention final : public CudaKernel{
    public:
    MultiScaleDeformableAttention(const onnxruntime::OpKernelInfo& info): CudaKernel(info) {}
    ~MultiScaleDeformableAttention() = default;
    protected:
    Status ComputeInternal(OpKernelContext* context) const override;
  };
}   // namespace onnxruntime::contrib::cuda

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
  onnxruntime::Stream * device_stream);
