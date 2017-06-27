using System;
using System.Runtime.InteropServices;

namespace Swigged.cuda {

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


}
