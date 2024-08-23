// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

#include "contrib_ops/cpu/attnlstm/multi_scale_deformable_attention.h"

namespace onnxruntime::contrib::cuda {
  class MultiScaleDeformableAttention final : public onnxruntime::contrib::MultiScaleDeformableAttentionBase {
    public:
    MultiScaleDeformableAttention(const onnxruntime::OpKernelInfo& info): onnxruntime::contrib::MultiScaleDeformableAttentionBase(info) {
      route = ImplementationRoute::CUDA;
    }
    ~MultiScaleDeformableAttention() = default;
    protected:
    void ComputeCUDA(
      const float* value,
      const int64_t* value_spatial_shapes,
      const float* reference_points,
      const float* sampling_locations,
      const float* attention_weights,
      float* output,
      int64_t M,
      int64_t L,
      int64_t P,
      int64_t D,
      int64_t Q,
      onnxruntime::concurrency::ThreadPool* thread_pool,
      onnxruntime::AllocatorPtr alloc) const override;
  };
}   // namespace onnxruntime::contrib::cuda
