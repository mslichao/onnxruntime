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


@REM cuda and trt
@REM .\build.bat --config Debug --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --skip_tests --build_wheel

.\build.bat --update --config Debug --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --use_tensorrt_builtin_parser --skip_tests --build_wheel

start build\Windows\Debug\onnxruntime.sln

.\build.bat --build --config Debug --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --use_tensorrt_builtin_parser --skip_tests --build_wheel

copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_c_api.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_c_api.h"
copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_cxx_api.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_cxx_api.h"
copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_cxx_inline.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_cxx_inline.h"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_tensorrt.dll"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\Debug\Debug\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_tensorrt.pdb"



@REM cuda and trt RelWithDebInfo
@REM .\build.bat --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --skip_tests --build_wheel

.\build.bat --update --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --use_tensorrt_builtin_parser --skip_tests --build_wheel

start build\Windows\RelWithDebInfo\onnxruntime.sln

.\build.bat --build --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --use_tensorrt_builtin_parser --skip_tests --build_wheel

copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_c_api.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_c_api.h"
copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_cxx_api.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_cxx_api.h"
copy /Y "C:\Users\chao\source\onnxruntime\include\onnxruntime\core\session\onnxruntime_cxx_inline.h" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\include\onnxruntime\onnxruntime_cxx_inline.h"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_tensorrt.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20\onnxruntime_providers_tensorrt.pdb"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_shared.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_cuda.dll"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.dll" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_tensorrt.dll"

copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_shared.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_shared.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_cuda.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_cuda.pdb"
copy /Y "C:\Users\chao\source\onnxruntime\build\Windows\RelWithDebInfo\RelWithDebInfo\onnxruntime_providers_tensorrt.pdb" "C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug\onnxruntime_providers_tensorrt.pdb"





@REM C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\bin
@REM C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime
@REM C:\Users\chao\source\API-OCR-Engine\packages\oneocr_exported_x64-windows-static-md-release\installed\x64-windows-static-md-release\share\onnxruntime-1-20
@REM C:\Users\chao\source\API-OCR-Engine\CoreEngine\build\bin\Debug

@REM .\build.bat --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --skip_tests --build_wheel
@REM .\build.bat --update --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --skip_tests --build_wheel
@REM .\build.bat --build --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --use_tensorrt --tensorrt_home "C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT\v10.4" --skip_tests --build_wheel

@REM bash build.sh \
@REM   --use_tensorrt --tensorrt_home /usr/src/tensorrt --use_tensorrt_oss_parser \
@REM   --cmake_extra_defines "onnxruntime_BUILD_UNIT_TESTS=OFF onnxruntime_CUDA_HOME=/usr/local/cuda-12.6 onnxruntime_CUDNN_HOME=/usr/local/cuda-12.6 onnxruntime_USE_CUDA_NHWC_OPS=ON CMAKE_CUDA_ARCHITECTURES=60 61 70 75 80 CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-12.6 CMAKE_C_FLAGS= -g CMAKE_CXX_FLAGS= -g"



@REM cuda

.\build.bat --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel


.\build.bat --update --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel

.\build.bat --build --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel

.\build.bat --test --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel


.\build.bat --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel

.\build.bat --update --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel

.\build.bat --build --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel

.\build.bat --test --enable_memory_profile --config RelWithDebInfo --build_shared_lib --parallel --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --build_wheel


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

build.bat --use_cuda --cuda_version 12.6 --cuda_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" --cudnn_home "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6"

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
