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
