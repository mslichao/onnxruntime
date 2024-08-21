// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

#include "core/framework/op_kernel.h"

namespace onnxruntime {
namespace contrib {

class MultiScaleDeformableAttentionBase : public OpKernel {
  public:
  MultiScaleDeformableAttentionBase(const OpKernelInfo& info): OpKernel(info), route(ImplementationRoute::Generic) {}
  virtual ~MultiScaleDeformableAttentionBase() = default;
  [[nodiscard]] Status Compute(_Inout_ OpKernelContext* context) const override;
  protected:
  enum class ImplementationRoute {
    AVX512,
    Generic,
    CUDA
  };

  ImplementationRoute route;

  virtual void ComputeAVX512(
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
    AllocatorPtr alloc) const;

  virtual void ComputeGeneric(
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
    AllocatorPtr alloc) const;

  virtual void ComputeCUDA(
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
    AllocatorPtr alloc) const;
};

}   // namespace contrib
}   // namespace onnxruntime
