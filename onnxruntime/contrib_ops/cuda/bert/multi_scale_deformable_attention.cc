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

    const int64_t B = value_input_shape[0]; // 1
    const int64_t S = value_input_shape[1];
    const int64_t M = value_input_shape[2];
    const int64_t D = value_input_shape[3];
    const int64_t L = value_spatial_shapes_input_shape[0];
    const int64_t P = attention_weights_input_shape[4];
    const int64_t Q = attention_weights_input_shape[2];

    auto* output = context->Output(0, { B, Q, M*D }); // Shape: [1, Q, M*D]
    float * output_ptr = output->MutableData<float>();
    // memset(output_ptr, 0, Q * M * D * sizeof(float));  // qiduan: cannot use memset on GPU memory
    ms_deformable_im2col_gpu_kernel_wrapper(
      value->Data<float>(),
      value_spatial_shapes->Data<int64_t>(),
      sampling_locations->Data<float>(),
      reference_points->Data<float>(),
      attention_weights->Data<float>(),
      B,
      S,
      M,
      D,
      L,
      Q,
      P,
      output_ptr);
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
      {DataTypeImpl::GetTensorType<int64_t>()})
    .InputMemoryType(OrtMemTypeCPUInput, 1),
    MultiScaleDeformableAttention);
}   // namespace onnxruntime::contrib::cuda
