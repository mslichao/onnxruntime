// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#include "contrib_ops/cpu/attnlstm/multi_scale_deformable_attention_base.h"

#include <cstdint>

namespace onnxruntime {
namespace contrib {
Status MultiScaleDeformableAttentionBase::Compute(_Inout_ OpKernelContext* context) const {
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

  concurrency::ThreadPool* thread_pool = context->GetOperatorThreadPool();
  AllocatorPtr alloc;
  ORT_RETURN_IF_ERROR(context->GetTempSpaceAllocator(&alloc));

  bool useGeneric;
  {
    char * env;
    #ifdef _WIN32
    _dupenv_s(&env, nullptr, "ORT_USE_GENERIC");
    #else
    env = std::getenv("ORT_USE_GENERIC");
    #endif
    if(env == nullptr || std::atoi(env) == 0){
      useGeneric = false;
    }
    else{
      useGeneric = true;
    }
    #ifdef _WIN32
    free(env);
    #endif
  }

  if(route == ImplementationRoute::CUDA) {
    // CUDA implementation
    ComputeCUDA(
      value->Data<float>(),
      value_spatial_shapes->Data<int64_t>(),
      reference_points->Data<float>(),
      sampling_locations->Data<float>(),
      attention_weights->Data<float>(),
      output_ptr,
      M,
      L,
      P,
      D,
      Q,
      thread_pool,
      alloc);
  }
  else if(route == ImplementationRoute::AVX512 && D == 16 && M == 8 && P == 4 && !useGeneric) {
    // AVX512 implementation
    ComputeAVX512(
      value->Data<float>(),
      value_spatial_shapes->Data<int64_t>(),
      reference_points->Data<float>(),
      sampling_locations->Data<float>(),
      attention_weights->Data<float>(),
      output_ptr,
      M,
      L,
      P,
      D,
      Q,
      thread_pool,
      alloc);
  } else {
    // Generic implementation
    ComputeGeneric(
      value->Data<float>(),
      value_spatial_shapes->Data<int64_t>(),
      reference_points->Data<float>(),
      sampling_locations->Data<float>(),
      attention_weights->Data<float>(),
      output_ptr,
      M,
      L,
      P,
      D,
      Q,
      thread_pool,
      alloc);
  }

  return Status::OK();
}

void MultiScaleDeformableAttentionBase::ComputeGeneric(
  [[maybe_unused]] const float* value,
  [[maybe_unused]] const int64_t* value_spatial_shapes,
  [[maybe_unused]] const float* reference_points,
  [[maybe_unused]] const float* sampling_locations,
  [[maybe_unused]] const float* attention_weights,
  [[maybe_unused]] float* output,
  [[maybe_unused]] int64_t M,
  [[maybe_unused]] int64_t L,
  [[maybe_unused]] int64_t P,
  [[maybe_unused]] int64_t D,
  [[maybe_unused]] int64_t Q,
  [[maybe_unused]] concurrency::ThreadPool* thread_pool,
  [[maybe_unused]] AllocatorPtr alloc) const {
  ORT_NOT_IMPLEMENTED("Not implemented for this kernel.");
}

void MultiScaleDeformableAttentionBase::ComputeAVX512(
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
  AllocatorPtr alloc) const {
  ORT_NOT_IMPLEMENTED("Not implemented for this kernel.");
}

void MultiScaleDeformableAttentionBase::ComputeCUDA(
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
  AllocatorPtr alloc) const {
  ORT_NOT_IMPLEMENTED("Not implemented for this kernel.");
}
}  // namespace contrib
}  // namespace onnxruntime
