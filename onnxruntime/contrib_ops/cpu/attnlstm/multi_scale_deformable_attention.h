// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

#include "core/framework/op_kernel.h"
#include "contrib_ops/cpu/attnlstm/multi_scale_deformable_attention_base.h"

namespace onnxruntime {
namespace contrib {

class MultiScaleDeformableAttention final : public MultiScaleDeformableAttentionBase {
  public:
  MultiScaleDeformableAttention(const OpKernelInfo& info);
  ~MultiScaleDeformableAttention() = default;
  protected:
  void ComputeAVX512(
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
    concurrency::ThreadPool* thread_pool,
    AllocatorPtr alloc) const override;

  void ComputeGeneric(
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
    concurrency::ThreadPool* thread_pool,
    AllocatorPtr alloc) const override;
};

}   // namespace contrib
}   // namespace onnxruntime
