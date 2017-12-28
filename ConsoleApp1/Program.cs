using System;
using System.Runtime.InteropServices;
using Swigged.Cuda;
using System.IO;
using System.Reflection;

namespace ConsoleApp1
{
    class Program
    {
        public static string AssemblyDirectory
        {
            get
            {
                string codeBase = Assembly.GetExecutingAssembly().CodeBase;
                UriBuilder uri = new UriBuilder(codeBase);
                string path = Uri.UnescapeDataString(uri.Path);
                return Path.GetDirectoryName(path);
            }
        }

        static unsafe void Part1()
        {
            Cuda.cuInit(0);
            var res = Cuda.cuDeviceGet(out int device, 0);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuDeviceGetPCIBusId(out string pciBusId, 100, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuDeviceGetName(out string name, 100, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuCtxCreate_v2(out CUcontext cuContext, 0, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            string assembly_directory = AssemblyDirectory;
            StreamReader sr = new StreamReader(assembly_directory + @"/../../Project2/x64/Debug/stuff.ptx");
            string kernel = sr.ReadToEnd();
            IntPtr ptr = Marshal.StringToHGlobalAnsi(kernel);
            int[] option_values = new int[] { };
            GCHandle option_values_handle = GCHandle.Alloc(option_values, GCHandleType.Pinned);
            IntPtr options_values_ptr = option_values_handle.AddrOfPinnedObject();
            CUjit_option[] options = new CUjit_option[] { };
            res = Cuda.cuModuleLoadDataEx(out CUmodule cuModule, ptr, (uint)0, options, options_values_ptr);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuModuleGetFunction(out CUfunction helloWorld, cuModule, "_Z5helloPc");
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            byte[] v = { (byte)'G', (byte)'d', (byte)'k', (byte)'k', (byte)'n', 31, (byte)'v', (byte)'n', (byte)'q', (byte)'k', (byte)'c', 0 };
            GCHandle handle = GCHandle.Alloc(v, GCHandleType.Pinned);
            IntPtr pointer = IntPtr.Zero;
            pointer = handle.AddrOfPinnedObject();
            res = Cuda.cuMemAlloc_v2(out IntPtr dptr, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuMemcpyHtoD_v2(dptr, pointer, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            IntPtr[] x = new IntPtr[] { dptr };
            GCHandle handle2 = GCHandle.Alloc(x, GCHandleType.Pinned);
            IntPtr pointer2 = IntPtr.Zero;
            pointer2 = handle2.AddrOfPinnedObject();
            IntPtr[] kp = new IntPtr[] { pointer2 };
            fixed (IntPtr* kernelParams = kp)
            {
                res = Cuda.cuLaunchKernel(helloWorld,
                    1, 1, 1, // grid has one block.
                    11, 1, 1, // block has 11 threads.
                    0, // no shared memory
                    default(CUstream),
                    (IntPtr)kernelParams,
                    (IntPtr)IntPtr.Zero
                );
            }
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuMemcpyDtoH_v2(pointer, dptr, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            for (int i = 0; i < 11; ++i) System.Console.Write((char)v[i]);
            System.Console.WriteLine();
            Cuda.cuCtxDestroy_v2(cuContext);
        }

        static unsafe void Part2()
        {
            Cuda.cuInit(0);
            var res = Cuda.cuDeviceGet(out int device, 0);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuDeviceGetPCIBusId(out string pciBusId, 100, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuDeviceGetName(out string name, 100, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuCtxCreate_v2(out CUcontext cuContext, 0, device);
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            string assembly_directory = AssemblyDirectory;
            FileStream fs = new FileStream(assembly_directory + @"/../../Project2/x64/Debug/stuff.cu.obj", FileMode.Open);
            var len = fs.Length;
            var gpu_obj = new byte[len];
            fs.Read(gpu_obj, 0, (int)len);

            uint num_ops_link = 5;
            var op_link = new CUjit_option[num_ops_link];
            ulong[] op_values_link = new ulong[num_ops_link];

            int size = 1024 * 100;
            op_link[0] = CUjit_option.CU_JIT_INFO_LOG_BUFFER_SIZE_BYTES;
            op_values_link[0] = (ulong)size;

            op_link[1] = CUjit_option.CU_JIT_INFO_LOG_BUFFER;
            byte[] info_log_buffer = new byte[size];
            var info_log_buffer_handle = GCHandle.Alloc(info_log_buffer, GCHandleType.Pinned);
            var info_log_buffer_intptr = info_log_buffer_handle.AddrOfPinnedObject();
            op_values_link[1] = (ulong)info_log_buffer_intptr;

            op_link[2] = CUjit_option.CU_JIT_ERROR_LOG_BUFFER_SIZE_BYTES;
            op_values_link[2] = (ulong)size;

            op_link[3] = CUjit_option.CU_JIT_ERROR_LOG_BUFFER;
            byte[] error_log_buffer = new byte[size];
            var error_log_buffer_handle = GCHandle.Alloc(error_log_buffer, GCHandleType.Pinned);
            var error_log_buffer_intptr = error_log_buffer_handle.AddrOfPinnedObject();
            op_values_link[3] = (ulong)error_log_buffer_intptr;

            op_link[4] = CUjit_option.CU_JIT_LOG_VERBOSE;
            op_values_link[4] = (ulong)1;

            var op_values_link_handle = GCHandle.Alloc(op_values_link, GCHandleType.Pinned);
            var op_values_link_intptr = op_values_link_handle.AddrOfPinnedObject();

            res = Cuda.cuLinkCreate_v2(num_ops_link, op_link, op_values_link_intptr, out CUlinkState linkState);
            {
                string info = Marshal.PtrToStringAnsi(info_log_buffer_intptr);
                System.Console.WriteLine(info);
                string error = Marshal.PtrToStringAnsi(error_log_buffer_intptr);
                System.Console.WriteLine(error);
            }

            uint num_ops = 0;

            CUjit_option[] op = new CUjit_option[0];
            ulong[] op_values = new ulong[0];
            var op_values_handle = GCHandle.Alloc(op_values, GCHandleType.Pinned);
            var op_values_intptr = op_values_handle.AddrOfPinnedObject();

            var kernel_handle = GCHandle.Alloc(gpu_obj, GCHandleType.Pinned);
            IntPtr gpu_bcl_obj_intptr = kernel_handle.AddrOfPinnedObject();

            res = Cuda.cuLinkAddData_v2(linkState, CUjitInputType.CU_JIT_INPUT_OBJECT,
                gpu_bcl_obj_intptr, (uint)len,
                "", num_ops, op, op_values_intptr);
            {
                string info = Marshal.PtrToStringAnsi(info_log_buffer_intptr);
                System.Console.WriteLine(info);
                string error = Marshal.PtrToStringAnsi(error_log_buffer_intptr);
                System.Console.WriteLine(error);
            }

            IntPtr image;
            res = Cuda.cuLinkComplete(linkState, out image, out ulong sz);
            res = Cuda.cuModuleLoadDataEx(out CUmodule module, image, 0, op, op_values_link_intptr);

            res = Cuda.cuModuleGetFunction(out CUfunction helloWorld, module, "_Z5helloPc");
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            byte[] v = { (byte)'G', (byte)'d', (byte)'k', (byte)'k', (byte)'n', 31, (byte)'v', (byte)'n', (byte)'q', (byte)'k', (byte)'c', 0 };
            GCHandle handle = GCHandle.Alloc(v, GCHandleType.Pinned);
            IntPtr pointer = IntPtr.Zero;
            pointer = handle.AddrOfPinnedObject();
            res = Cuda.cuMemAlloc_v2(out IntPtr dptr, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuMemcpyHtoD_v2(dptr, pointer, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            IntPtr[] x = new IntPtr[] { dptr };
            GCHandle handle2 = GCHandle.Alloc(x, GCHandleType.Pinned);
            IntPtr pointer2 = IntPtr.Zero;
            pointer2 = handle2.AddrOfPinnedObject();
            IntPtr[] kp = new IntPtr[] { pointer2 };
            fixed (IntPtr* kernelParams = kp)
            {
                res = Cuda.cuLaunchKernel(helloWorld,
                    1, 1, 1, // grid has one block.
                    11, 1, 1, // block has 11 threads.
                    0, // no shared memory
                    default(CUstream),
                    (IntPtr)kernelParams,
                    (IntPtr)IntPtr.Zero
                );
            }
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            res = Cuda.cuMemcpyDtoH_v2(pointer, dptr, 11 * sizeof(byte));
            if (res != CUresult.CUDA_SUCCESS) throw new Exception();
            for (int i = 0; i < 11; ++i) System.Console.Write((char)v[i]);
            System.Console.WriteLine();
            Cuda.cuCtxDestroy_v2(cuContext);
        }

        static unsafe void Main(string[] args)
        {
            Part1();
            Part2();
        }
    }
}
