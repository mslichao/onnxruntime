.\build.bat --config RelWithDebInfo --build_shared_lib --parallel --build_wheel


.\build.bat --update --config RelWithDebInfo --build_shared_lib --parallel --build_wheel

.\build.bat --build --config RelWithDebInfo --build_shared_lib --parallel --build_wheel

.\build.bat --test --config RelWithDebInfo --build_shared_lib --parallel --build_wheel


.\build.bat --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --build_wheel

.\build.bat --update --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --build_wheel

.\build.bat --build --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --build_wheel

.\build.bat --test --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --build_wheel


cd onnxruntime\test

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=BFCArenaTest.*

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=SessionStateTest.*

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe

start build\Windows\RelWithDebInfo\onnxruntime.sln

pip uninstall onnxruntime
pip install -U build\Windows\RelWithDebInfo\RelWithDebInfo\dist\onnxruntime-1.20.0-cp310-cp310-win_amd64.whl

@REM cuda

.\build.bat --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel


.\build.bat --update --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel

.\build.bat --build --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel

.\build.bat --test --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel


.\build.bat --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel

.\build.bat --update --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel

.\build.bat --build --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel

.\build.bat --test --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --build_wheel


pip uninstall onnxruntime-gpu
pip install -U build\Windows\RelWithDebInfo\RelWithDebInfo\dist\onnxruntime_gpu-1.20.0-cp310-cp310-win_amd64.whl


cd onnxruntime\test

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=BFCArenaTest.*

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=SessionStateTest.*

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_perf_test.exe -e cuda -m times -r 1 -I C:\Users\chao\source\onnxruntime\onnxruntime\test\testdata\mul_1.onnx
C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_perf_test.exe -e cuda -m times -r 100000 -I C:\Users\chao\source\onnxruntime\onnxruntime\test\testdata\mul_1.onnx
C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_perf_test.exe -e cpu -m times -r 100000 -I C:\Users\chao\source\onnxruntime\onnxruntime\test\testdata\mul_1.onnx

C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_perf_test.exe -e cuda -m times -r 1 -I C:\Users\chao\source\onnxruntime-inference-examples\c_cxx\MNIST\mnist.onnx


start build\Windows\RelWithDebInfo\onnxruntime.sln







############################################################################################################

build.bat --use_cuda --cuda_version 12.4 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4"

build.bat --use_cuda --cuda_version 12.6 --cuda_home "%CUDA_PATH%" --cudnn_home "%CUDA_PATH%"


build.bat --use_cuda --cuda_version 12.6 --cuda_home "%CUDA_PATH%" --cudnn_home "%CUDA_PATH%" --config RelWithDebInfo --build_shared_lib --parallel


build.bat --update --enable_memory_profile --use_cuda --cuda_version 12.6 --cuda_home "%CUDA_PATH%" --cudnn_home "%CUDA_PATH%" --config RelWithDebInfo --build_shared_lib --parallel

build.bat --build --enable_memory_profile --use_cuda --cuda_version 12.6 --cuda_home "%CUDA_PATH%" --cudnn_home "%CUDA_PATH%" --config RelWithDebInfo --build_shared_lib --parallel


cmake --build .\build\Windows\RelWithDebInfo --target onnxruntime_test_all --config RelWithDebInfo

cmake --install .\build\Windows\RelWithDebInfo --config RelWithDebInfo

cd build\Windows\RelWithDebInfo

ctest -C RelWithDebInfo

 -R onnx

C:\Users\chao\src\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=SessionStateTest.TestInitializerMemoryAllocatedUsingNonArenaMemory

C:\Users\chao\src\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=SessionStateTest.*
C:\Users\chao\src\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=SessionStateTestS*

C:\Users\chao\src\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_test_all.exe --gtest_filter=BFCArenaTest.*

BFCArenaTest
