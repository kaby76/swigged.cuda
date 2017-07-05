# swigged.cuda.8.0
A C# SWIG-generated wrapper API for the CUDA Driver API version 8.0 that targets Net Standard 1.1.
This project is generated using [SWIG](http://swig.org). The wrap layer for the Driver API is very basic.
For example, arrays must be marshaled into data structures manually, and then converted into a System.IntPtr data type.
The purpose of this wrapper API is to expose the latest CUDA Driver API to a GP-GPU extension to C# that I am
writing.

While there are other libraries for the CUDA Driver API available, this library is written in Net Standard 1.1
in order to be compatible with Net Framework, Net Standard,
and Net Core.

## Alternative CUDA Driver APIs for C#

##### ManagedCuda 8.0 https://www.nuget.org/packages/ManagedCuda-80/  http://kunzmi.github.io/managedCuda/


"ManagedCuda aims an easy integration of NVidia's CUDA in .net applications written in C#, Visual Basic or any other .net language."
Although it is very good, it just isn't compatible with Net Standard and Net Core apps and libraries.

##### CSCuda https://www.nuget.org/packages/CSCuda/  https://github.com/DNRY/CSCuda

I haven't tried this, but it looks like a fine wrapper library, albeit it does not seem to expose
the CUDA Driver API, rather the CUDA Runtime API, NPP, and CUBLAS.

##### Other APIs

ILGPU does contains a wrapper library for the CUDA Driver API, but it is
not a stand-alone API, and it is only a small subset sufficient for compilation
of C# into PTX.
