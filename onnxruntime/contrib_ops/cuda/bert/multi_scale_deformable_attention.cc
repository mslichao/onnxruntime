// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#include "contrib_ops/cuda/bert/multi_scale_deformable_attention.h"

#include "core/framework/op_kernel.h"

namespace onnxruntime::contrib::cuda{
  Status MultiScaleDeformableAttention::ComputeInternal(OpKernelContext* context) const {
    const auto* value = context->Input<Tensor>(0);  // Shape: [1, S, M, D]
    const auto* value_spatial_shapes = context->Input<Tensor>(1); // Shape: [L, 2]
    const auto* reference_points = context->Input<Tensor>(2); // Shape: [1, L, Q, 2]
    const auto* sampling_locations = context->Input<Tensor>(3); // Shape: [1, L, Q, M, P, 2]
    const auto* attention_weights = context->Input<Tensor>(4);  // Shape: [1, L, Q, M, P]

    const auto& value_input_shape = value->Shape();
    const auto& value_spatial_shapes_input_shape = value_spatial_shapes->Shape();
    const auto& attention_weights_input_shape = attention_weights->Shape();

    const int64_t M = value_input_shape[2];
    const int64_t D = value_input_shape[3];
    const int64_t L = value_spatial_shapes_input_shape[0];
    const int64_t P = attention_weights_input_shape[4];
    const int64_t Q = attention_weights_input_shape[2];

    auto* output = context->Output(0, { 1, Q, M*D }); // Shape: [1, Q, M*D]
    float * output_ptr = output->MutableData<float>();
    // memset(output_ptr, 0, Q * M * D * sizeof(float));  // qiduan: cannot use memset on GPU memory
    return Status::OK();
  }

  ONNX_OPERATOR_KERNEL_EX(
    MultiScaleDeformableAttention,
    kMSDomain,
    1,
    kCudaExecutionProvider,
    (*KernelDefBuilder::Create())
    .TypeConstraint(
      "T1",
      {DataTypeImpl::GetTensorType<float>()})
    .TypeConstraint(
      "T2",
      {DataTypeImpl::GetTensorType<int64_t>()}),
    MultiScaleDeformableAttention);
}   // namespace onnxruntime::contrib::cuda
