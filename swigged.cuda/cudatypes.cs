
namespace Swigged.Cuda
{
    using System;
    using System.Runtime.InteropServices;
    using CUdeviceptr = System.IntPtr;
    using SizeT = System.UInt64;

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
            b10,
            b11,
            b12,
            b13,
            b14,
            b15,
            b16,
            b17,
            b18,
            b19,
            b20,
            b21,
            b22,
            b23,
            b24,
            b25,
            b26,
            b27,
            b28,
            b29,
            b30,
            b31,
            b32,
            b33,
            b34,
            b35,
            b36,
            b37,
            b38,
            b39,
            b40,
            b41,
            b42,
            b43,
            b44,
            b45,
            b46,
            b47,
            b48,
            b49,
            b50,
            b51,
            b52,
            b53,
            b54,
            b55,
            b56,
            b57,
            b58,
            b59,
            b60,
            b61,
            b62,
            b63,
            b64,
            b65,
            b66,
            b67,
            b68,
            b69,
            b70,
            b71,
            b72,
            b73;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUipcMemHandle
    {
        private byte
            b10,
            b11,
            b12,
            b13,
            b14,
            b15,
            b16,
            b17,
            b18,
            b19,
            b20,
            b21,
            b22,
            b23,
            b24,
            b25,
            b26,
            b27,
            b28,
            b29,
            b30,
            b31,
            b32,
            b33,
            b34,
            b35,
            b36,
            b37,
            b38,
            b39,
            b40,
            b41,
            b42,
            b43,
            b44,
            b45,
            b46,
            b47,
            b48,
            b49,
            b50,
            b51,
            b52,
            b53,
            b54,
            b55,
            b56,
            b57,
            b58,
            b59,
            b60,
            b61,
            b62,
            b63,
            b64,
            b65,
            b66,
            b67,
            b68,
            b69,
            b70,
            b71,
            b72,
            b73;
    }


    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_ARRAY_DESCRIPTOR
    {
        uint Width; /**< Width of array */
        uint Height; /**< Height of array */

        CUarray_format Format; /**< Array format */
        uint NumChannels; /**< Channels per array element */
    };

    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_ARRAY3D_DESCRIPTOR
    {
        uint Width; /**< Width of 3D array */
        uint Height; /**< Height of 3D array */
        uint Depth; /**< Depth of 3D array */

        CUarray_format Format; /**< Array format */
        uint NumChannels; /**< Channels per array element */
        uint Flags; /**< Flags */
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_RESOURCE_DESC
    {
        private byte
            b10,
            b11,
            b12,
            b13,
            b14,
            b15,
            b16,
            b17,
            b18,
            b19,
            b20,
            b21,
            b22,
            b23,
            b24,
            b25,
            b26,
            b27,
            b28,
            b29,
            b30,
            b31,
            b32,
            b33,
            b34,
            b35,
            b36,
            b37,
            b38,
            b39,
            b40,
            b41,
            b42,
            b43,
            b44,
            b45,
            b46,
            b47,
            b48,
            b49,
            b50,
            b51,
            b52,
            b53,
            b54,
            b55,
            b56,
            b57,
            b58,
            b59,
            b60,
            b61,
            b62,
            b63,
            b64,
            b65,
            b66,
            b67,
            b68,
            b69,
            b70,
            b71,
            b72,
            b73;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_MEMCPY2D
    {
        uint srcXInBytes; /**< Source X in bytes */
        uint srcY; /**< Source Y */
        CUmemorytype srcMemoryType; /**< Source memory type (host, device, array) */
        System.IntPtr srcHost; /**< Source host pointer */
        CUdeviceptr srcDevice; /**< Source device pointer */
        CUarray srcArray; /**< Source array reference */
        uint srcPitch; /**< Source pitch (ignored when src is array) */

        uint dstXInBytes; /**< Destination X in bytes */
        uint dstY; /**< Destination Y */
        CUmemorytype dstMemoryType; /**< Destination memory type (host, device, array) */
        System.IntPtr dstHost; /**< Destination host pointer */
        CUdeviceptr dstDevice; /**< Destination device pointer */
        CUarray dstArray; /**< Destination array reference */
        uint dstPitch; /**< Destination pitch (ignored when dst is array) */

        uint WidthInBytes; /**< Width of 2D memory copy in bytes */
        uint Height; /**< Height of 2D memory copy */
    }


    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_MEMCPY3D
    {
        uint srcXInBytes; /**< Source X in bytes */
        uint srcY; /**< Source Y */
        uint srcZ; /**< Source Z */
        uint srcLOD; /**< Source LOD */
        CUmemorytype srcMemoryType; /**< Source memory type (host, device, array) */
        System.IntPtr srcHost; /**< Source host pointer */
        CUdeviceptr srcDevice; /**< Source device pointer */
        CUarray srcArray; /**< Source array reference */
        System.IntPtr reserved0; /**< Must be NULL */
        uint srcPitch; /**< Source pitch (ignored when src is array) */
        uint srcHeight; /**< Source height (ignored when src is array; may be 0 if Depth==1) */

        uint dstXInBytes; /**< Destination X in bytes */
        uint dstY; /**< Destination Y */
        uint dstZ; /**< Destination Z */
        uint dstLOD; /**< Destination LOD */
        CUmemorytype dstMemoryType; /**< Destination memory type (host, device, array) */
        System.IntPtr dstHost; /**< Destination host pointer */
        CUdeviceptr dstDevice; /**< Destination device pointer */
        CUarray dstArray; /**< Destination array reference */
        System.IntPtr reserved1; /**< Must be NULL */
        uint dstPitch; /**< Destination pitch (ignored when dst is array) */
        uint dstHeight; /**< Destination height (ignored when dst is array; may be 0 if Depth==1) */

        uint WidthInBytes; /**< Width of 3D memory copy in bytes */
        uint Height; /**< Height of 3D memory copy */
        uint Depth; /**< Depth of 3D memory copy */
    }

    
    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_MEMCPY3D_PEER
    {
        private System.IntPtr stuff;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CUDA_RESOURCE_VIEW_DESC
    {
	    CUresourceViewFormat format;   /**< Resource view format */
        SizeT width;                  /**< Width of the resource view */
	    SizeT height;                 /**< Height of the resource view */
	    SizeT depth;                  /**< Depth of the resource view */
	    uint firstMipmapLevel; /**< First defined mipmap level */
	    uint lastMipmapLevel;  /**< Last defined mipmap level */
	    uint firstLayer;       /**< First layer index */
	    uint lastLayer;        /**< Last layer index */
        uint reserved1;
        uint reserved2;
        uint reserved3;
        uint reserved4;
        uint reserved5;
        uint reserved6;
        uint reserved7;
        uint reserved8;
        uint reserved9;
        uint reserved10;
        uint reserved11;
        uint reserved12;
        uint reserved13;
        uint reserved14;
        uint reserved15;
        uint reserved16;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct  CUDA_TEXTURE_DESC
    {
        CUaddress_mode addressMode1;  /**< Address modes */
        CUaddress_mode addressMode2;  /**< Address modes */
        CUaddress_mode addressMode3;  /**< Address modes */
        CUfilter_mode filterMode;       /**< Filter mode */
        uint flags;             /**< Flags */
        uint maxAnisotropy;     /**< Maximum anisotropy ratio */
        CUfilter_mode mipmapFilterMode; /**< Mipmap filter mode */
        float mipmapLevelBias;          /**< Mipmap level bias */
        float minMipmapLevelClamp;      /**< Mipmap minimum level clamp */
        float maxMipmapLevelClamp;      /**< Mipmap maximum level clamp */
        float borderColor1;           /**< Border Color */
        float borderColor2;           /**< Border Color */
        float borderColor3;           /**< Border Color */
        float borderColor4;           /**< Border Color */
        int reserved1;
        int reserved2;
        int reserved3;
        int reserved4;
        int reserved5;
        int reserved6;
        int reserved7;
        int reserved8;
        int reserved9;
        int reserved10;
        int reserved11;
        int reserved12;
    }


}
