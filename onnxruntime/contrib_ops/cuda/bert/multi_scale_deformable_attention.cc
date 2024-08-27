// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#include "contrib_ops/cuda/bert/multi_scale_deformable_attention.h"

#include "core/framework/op_kernel.h"

namespace onnxruntime::contrib::cuda{
  void MultiScaleDeformableAttention::ComputeCUDA(
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
    onnxruntime::AllocatorPtr alloc) const {
    memset(output, 0, Q * M * D * sizeof(float));
    return;
  }

  ONNX_OPERATOR_KERNEL_EX(
    MultiScaleDeformableAttention,
    kMSDomain,
    1,
    kCudaExecutionProvider,
    KernelDefBuilder()
    .TypeConstraint(
      "T1",
      {DataTypeImpl::GetTensorType<float>()})
    .TypeConstraint(
      "T2",
      {DataTypeImpl::GetTensorType<int64_t>()}),
    MultiScaleDeformableAttention)
}   // namespace onnxruntime::contrib::cuda
