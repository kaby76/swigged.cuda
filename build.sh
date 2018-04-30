nvcc --compiler-options '-fpic' -c CUDA_wrap.cpp
g++ -o "libnew-swigged-cuda-native.so.1.0" -Wl,--verbose -Wl,--no-undefined -Wl,-L"/usr/local/cuda-9.1/lib64" -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -shared "CUDA_wrap.o" -lcuda

