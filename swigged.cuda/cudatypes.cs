using System;
using System.Runtime.InteropServices;

namespace Swigged.Cuda {

[StructLayout(LayoutKind.Sequential)]
public struct CUcontext
{
	public IntPtr Pointer;
}

public struct CUmodule
{
	public IntPtr Pointer;
}

public struct CUfunction
{
	public IntPtr Pointer;
}

public struct CUarray
{
	public IntPtr Pointer;
}

public struct CUmipmappedArray
{
	public IntPtr Pointer;
}

public struct CUtexref
{
	public IntPtr Pointer;
}

public struct CUsurfref
{
	public IntPtr Pointer;
}

public struct CUevent
{
	public IntPtr Pointer;
}

public struct CUstream
{
	public IntPtr Pointer;
}

public struct CUgraphicsResource
{
	public IntPtr Pointer;
}

public struct CUlinkState
{
	public IntPtr Pointer;
}

    [StructLayout(LayoutKind.Sequential)]
    public struct CUuuid
    {
        private byte b0;
        private byte b1;
        private byte b2;
        private byte b3;
        private byte b4;
        private byte b5;
        private byte b6;
        private byte b7;
        private byte b8;
        private byte b9;
        private byte b10;
        private byte b11;
        private byte b12;
        private byte b13;
        private byte b14;
        private byte b15;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUipcEventHandle
    {
        private byte
            b10, b11, b12, b13, b14, b15, b16, b17, b18, b19,
            b20, b21, b22, b23, b24, b25, b26, b27, b28, b29,
            b30, b31, b32, b33, b34, b35, b36, b37, b38, b39,
            b40, b41, b42, b43, b44, b45, b46, b47, b48, b49,
            b50, b51, b52, b53, b54, b55, b56, b57, b58, b59,
            b60, b61, b62, b63, b64, b65, b66, b67, b68, b69,
            b70, b71, b72, b73;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUipcMemHandle
    {
        private byte
            b10, b11, b12, b13, b14, b15, b16, b17, b18, b19,
            b20, b21, b22, b23, b24, b25, b26, b27, b28, b29,
            b30, b31, b32, b33, b34, b35, b36, b37, b38, b39,
            b40, b41, b42, b43, b44, b45, b46, b47, b48, b49,
            b50, b51, b52, b53, b54, b55, b56, b57, b58, b59,
            b60, b61, b62, b63, b64, b65, b66, b67, b68, b69,
            b70, b71, b72, b73;
    }
}
