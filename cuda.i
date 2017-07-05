%include "typemaps.i"

%module Cuda

%{
#include "cuda.h"
%}


// enums, ints, bools, longs, unsigned.

// CUaddress_mode = CUaddress_mode_enum, but SWIG seems to get
// confused because one is a typedef. Make sure it's mapped to
// same type.
%typemap(cstype) CUaddress_mode_enum * "out CUaddress_mode"
%typemap(imtype) CUaddress_mode_enum * "out CUaddress_mode"
%typemap(csin) CUaddress_mode_enum * "out $csinput"
%typemap(cstype) CUaddress_mode * "out CUaddress_mode"
%typemap(imtype) CUaddress_mode * "out CUaddress_mode"
%typemap(csin) CUaddress_mode * "out $csinput"

%typemap(cstype) CUdeviceptr * "out CUdeviceptr"
%typemap(imtype) CUdeviceptr * "out CUdeviceptr"
%typemap(csin) CUdeviceptr * "out $csinput"
%typemap(cstype) CUdeviceptr "CUdeviceptr"
%typemap(imtype) CUdeviceptr "CUdeviceptr"
%typemap(csin) CUdeviceptr "$csinput"
%typemap(ctype) CUdeviceptr "void *"


// Various parameters in functions. A pointer to an int is just an
// "out" parameter. Functions that use these are noted in a comment
// where it is used.
%typemap(cstype) int * active "out int"
%typemap(imtype) int * active "out int"
%typemap(csin) int * active "out $csinput"
%typemap(cstype) int * blockSize "out int"
%typemap(imtype) int * blockSize "out int"
%typemap(csin) int * blockSize "out $csinput"
%typemap(cstype) int * canAccessPeer "out int"
%typemap(imtype) int * canAccessPeer "out int"
%typemap(csin) int * canAccessPeer "out $csinput"
%typemap(cstype) int * count "out int"
%typemap(imtype) int * count "out int"
%typemap(csin) int * count "out $csinput"
%typemap(cstype) int * dev "out int"
%typemap(imtype) int * dev "out int"
%typemap(csin) int * dev "out $csinput"
%typemap(cstype) int * device "out int"
%typemap(imtype) int * device "out int"
%typemap(csin) int * device "out $csinput"
%typemap(cstype) int * driverVersion "out int"
%typemap(imtype) int * driverVersion "out int"
%typemap(csin) int * driverVersion "out $csinput"
%typemap(cstype) int * greatestPriority "out int"
%typemap(imtype) int * greatestPriority "out int"
%typemap(csin) int * greatestPriority "out $csinput"
%typemap(cstype) int * leastPriority "out int"
%typemap(imtype) int * leastPriority "out int"
%typemap(csin) int * leastPriority "out $csinput"
%typemap(cstype) int * major "out int"
%typemap(imtype) int * major "out int"
%typemap(csin) int * major "out $csinput"
%typemap(cstype) int * minor "out int"
%typemap(imtype) int * minor "out int"
%typemap(csin) int * minor "out $csinput"
%typemap(cstype) int * minGridSize "out int"
%typemap(imtype) int * minGridSize "out int"
%typemap(csin) int * minGridSize "out $csinput"
%typemap(cstype) int * numBlocks "out int"
%typemap(imtype) int * numBlocks "out int"
%typemap(csin) int * numBlocks "out $csinput"
%typemap(cstype) int * pi "out int"
%typemap(imtype) int * pi "out int"
%typemap(csin) int * pi "out $csinput"

%typemap(cstype) int * value "out int"
%typemap(imtype) int * value "out int"
%typemap(csin) int * value "out $csinput"
%typemap(cstype) float * "out float"
%typemap(imtype) float * "out float"
%typemap(csin) float * "out $csinput"
   


%typemap(cstype) char ** pStr "out System.IntPtr"
%typemap(imtype) char ** pStr "out System.IntPtr"
%typemap(csin) char ** pStr "out $csinput"


// The standard C type "size_t" is mapped to "SizeT" which gets mapped
// to a Int64 via a "using" directive at the beginning of the output
// files.
%typemap(cstype) size_t * bytes "out SizeT"
%typemap(imtype) size_t * bytes "out SizeT"
%typemap(csin) size_t * bytes "out $csinput"

%typemap(cstype) size_t * pvalue "out SizeT"
%typemap(imtype) size_t * pvalue "out SizeT"
%typemap(csin) size_t * pvalue "out $csinput"

%typemap(cstype) size_t * free "out SizeT"
%typemap(imtype) size_t * free "out SizeT"
%typemap(csin) size_t * free "out $csinput"

%typemap(cstype) size_t * pPitch "out SizeT"
%typemap(imtype) size_t * pPitch "out SizeT"
%typemap(csin) size_t * pPitch "out $csinput"

%typemap(cstype) size_t * psize "out SizeT"
%typemap(imtype) size_t * psize "out SizeT"
%typemap(csin) size_t * psize "out $csinput"

%typemap(cstype) size_t * dataSizes "out SizeT"
%typemap(imtype) size_t * dataSizes "out SizeT"
%typemap(csin) size_t * dataSizes "out $csinput"

%typemap(cstype) size_t * total "out SizeT"
%typemap(imtype) size_t * total "out SizeT"
%typemap(csin) size_t * total "out $csinput"

%typemap(cstype) unsigned int * "out uint"
%typemap(imtype) unsigned int * "out uint"
%typemap(csin) unsigned int * "out $csinput"

%typemap(cstype) void * "System.IntPtr"
%typemap(imtype) void * "System.IntPtr"
%typemap(csin) void * "$csinput"

   
%typemap(cstype) CUdeviceptr "System.IntPtr"
%typemap(imtype)  CUdeviceptr "System.IntPtr"
%typemap(csin)  CUdeviceptr "$csinput"

%typemap(cstype) void *srcHost "System.IntPtr"
%typemap(imtype)  void *srcHost "System.IntPtr"
%typemap(csin)  void *srcHost "$csinput"

%typemap(cstype) void ** data "out System.IntPtr"
%typemap(imtype)  void ** data "out System.IntPtr"
%typemap(csin)  void ** data "out $csinput"

%typemap(cstype) void ** kernelParams "System.IntPtr"
%typemap(imtype)  void ** kernelParams "System.IntPtr"
%typemap(csin)  void ** kernelParams "$csinput"

%typemap(cstype) void ** extra "System.IntPtr"
%typemap(imtype)  void ** extra "System.IntPtr"
%typemap(csin)  void ** extra "$csinput"

%typemap(cstype) void ** ppExportTable "out System.IntPtr"
%typemap(imtype)  void ** ppExportTable "out System.IntPtr"
%typemap(csin)  void ** ppExportTable "out $csinput"

%typemap(cstype) void *dstHost "System.IntPtr"
%typemap(imtype)  void *dstHost "System.IntPtr"
%typemap(csin)  void *dstHost "$csinput"

%typemap(cstype) void ** pp "out System.IntPtr"
%typemap(imtype)  void ** pp "out System.IntPtr"
%typemap(csin)  void ** pp "out $csinput"

%typemap(cstype) void * p "System.IntPtr"
%typemap(imtype)  void * p "System.IntPtr"
%typemap(csin)  void * p "$csinput"


%typemap(cstype)  CUcontext * pctx "out CUcontext"
%typemap(imtype)  CUcontext * pctx "out CUcontext"
%typemap(csin)  CUcontext * pctx "out $csinput"
%typemap(cstype)  CUcontext "CUcontext"
%typemap(imtype)  CUcontext "CUcontext"
%typemap(csin)  CUcontext "$csinput"

%typemap(cstype)  CUevent * "out CUcontext"
%typemap(imtype)  CUevent * "out CUcontext"
%typemap(csin)  CUevent * "out $csinput"
%typemap(cstype)  CUevent "CUevent"
%typemap(imtype)  CUevent "CUevent"
%typemap(csin)  CUevent "$csinput"
   
%typemap(cstype) CUfunction* "out CUfunction"
%typemap(imtype)  CUfunction* "out CUfunction"
%typemap(csin)  CUfunction* "out $csinput"
%typemap(cstype) CUfunction "CUfunction"
%typemap(imtype)  CUfunction "CUfunction"
%typemap(csin)  CUfunction "$csinput"

%typemap(cstype) CUmodule* "out CUmodule"
%typemap(imtype)  CUmodule* "out CUmodule"
%typemap(csin)  CUmodule* "out $csinput"
%typemap(cstype) CUmodule "CUmodule"
%typemap(imtype)  CUmodule "CUmodule"
%typemap(csin)  CUmodule "$csinput"

%typemap(cstype) CUfunc_cache *pconfig "out CUfunc_cache"
%typemap(imtype) CUfunc_cache *pconfig "out CUfunc_cache"
%typemap(csin) CUfunc_cache *pconfig "out $csinput"

%typemap(cstype) CUfilter_mode * "out CUfilter_mode"
%typemap(imtype) CUfilter_mode * "out CUfilter_mode"
%typemap(csin) CUfilter_mode * "out $csinput"
%typemap(cstype) CUfilter_mode "CUfilter_mode"
%typemap(imtype) CUfilter_mode "CUfilter_mode"
%typemap(csin) CUfilter_mode "$csinput"

%typemap(cstype) CUjit_option * "out CUjit_option"
%typemap(imtype) CUjit_option * "out CUjit_option"
%typemap(csin) CUjit_option * "out $csinput"
%typemap(cstype) CUjit_option "CUjit_option"
%typemap(imtype) CUjit_option "CUjit_option"
%typemap(csin) CUjit_option "$csinput"

%typemap(cstype) CUlinkState * "out CUlinkState"
%typemap(imtype) CUlinkState * "out CUlinkState"
%typemap(csin) CUlinkState * "out $csinput"
%typemap(cstype) CUlinkState "CUlinkState"
%typemap(imtype) CUlinkState "CUlinkState"
%typemap(csin) CUlinkState "$csinput"

%typemap(cstype) CUmem_range_attribute * "out CUmem_range_attribute"
%typemap(imtype) CUmem_range_attribute * "out CUmem_range_attribute"
%typemap(csin) CUmem_range_attribute * "out $csinput"
%typemap(cstype) CUmem_range_attribute "CUmem_range_attribute"
%typemap(imtype) CUmem_range_attribute "CUmem_range_attribute"
%typemap(csin) CUmem_range_attribute "$csinput"

%typemap(cstype) CUpointer_attribute * "out CUpointer_attribute"
%typemap(imtype) CUpointer_attribute * "out CUpointer_attribute"
%typemap(csin) CUpointer_attribute * "out $csinput"
%typemap(cstype) CUpointer_attribute "CUpointer_attribute"
%typemap(imtype) CUpointer_attribute "CUpointer_attribute"
%typemap(csin) CUpointer_attribute "$csinput"

%typemap(cstype) CUsharedconfig * "out CUsharedconfig"
%typemap(imtype) CUsharedconfig * "out CUsharedconfig"
%typemap(csin) CUsharedconfig * "out $csinput"
%typemap(cstype) CUsharedconfig "CUsharedconfig"
%typemap(imtype) CUsharedconfig "CUsharedconfig"
%typemap(csin) CUsharedconfig "$csinput"

%typemap(cstype) CUstream * "out CUstream"
%typemap(imtype) CUstream * "out CUstream"
%typemap(csin) CUstream * "out $csinput"
%typemap(cstype) CUstream "CUstream"
%typemap(imtype) CUstream "CUstream"
%typemap(csin) CUstream "$csinput"





%typemap(cstype) const CUuuid * "ref CUuuid"
%typemap(imtype) const CUuuid * "ref CUuuid"
%typemap(csin) const CUuuid * "ref $csinput"
%typemap(cstype) CUuuid "CUuuid"
%typemap(imtype) CUuuid "CUuuid"
%typemap(csin) CUuuid "$csinput"

%typemap(cstype) CUdevprop * "ref CUdevprop"
%typemap(imtype) CUdevprop * "ref CUdevprop"
%typemap(csin) CUdevprop * "ref $csinput"
%typemap(cstype) CUdevprop "CUdevprop"
%typemap(imtype) CUdevprop "CUuuid"
%typemap(csin) CUdevprop "$csinput"


// Ignored types. If a type (a struct, e.g.) is ignored, we don't want
// SWIG to output a class corresponding to the type. In that case, we
// aren't implementing functions in the API that use the type, or we
// offer a hand-drafted version of the class.  
%ignore CUuuid;
%ignore CUuuid_st;
%ignore cuArray3DCreate;
%ignore cuArray3DCreate_v2;
%ignore cuArray3DGetDescriptor_v2;
%ignore cuArrayCreate;
%ignore cuArrayCreate_v2;
%ignore cuArrayDestroy;
%ignore cuArrayGetDescriptor;
%ignore cuArrayGetDescriptor_v2;
%ignore CUDA_ARRAY3D_DESCRIPTOR;
%ignore CUDA_ARRAY3D_DESCRIPTOR_st;
%ignore CUDA_ARRAY_DESCRIPTOR;
%ignore CUDA_ARRAY_DESCRIPTOR_st;
%ignore CUDA_MEMCPY2D;
%ignore CUDA_MEMCPY2D_st;
%ignore CUDA_MEMCPY3D;
%ignore CUDA_MEMCPY3D_PEER;
%ignore CUDA_MEMCPY3D_PEER_st;
%ignore CUDA_MEMCPY3D_st;
%ignore CUDA_POINTER_ATTRIBUTE_P2P_TOKENS;
%ignore CUDA_POINTER_ATTRIBUTE_P2P_TOKENS_st;
%ignore CUDA_RESOURCE_DESC;
%ignore CUDA_RESOURCE_DESC_st;
%ignore CUDA_RESOURCE_VIEW_DESC;
%ignore CUDA_RESOURCE_VIEW_DESC_st;
%ignore CUDA_TEXTURE_DESC;
%ignore CUDA_TEXTURE_DESC_st;
//%ignore cuDeviceGetProperties;
%ignore CUdevprop;
%ignore CUdevprop_st;
//%ignore cuEventCreate;
//%ignore cuEventDestroy_v2;
//%ignore cuEventElapsedTime;
//%ignore cuEventQuery;
//%ignore cuEventRecord;
//%ignore cuEventSynchronize;
%ignore cuGraphicsMapResources;
%ignore cuGraphicsMapResources;
%ignore CUgraphicsResource;
%ignore cuGraphicsResourceGetMappedMipmappedArray;
%ignore cuGraphicsResourceGetMappedPointer;
%ignore cuGraphicsResourceGetMappedPointer_v2;
%ignore cuGraphicsResourceSetMapFlags;
%ignore cuGraphicsResourceSetMapFlags_v2;
%ignore cuGraphicsSubResourceGetMappedArray;
%ignore cuGraphicsSubResourceGetMappedArray;
%ignore cuGraphicsUnmapResources;
%ignore cuGraphicsUnmapResources;
%ignore cuGraphicsUnregisterResource;
%ignore CUipcEventHandle;
%ignore CUipcEventHandle_st;
//%ignore cuIpcGetEventHandle;
//%ignore cuIpcGetMemHandle;
%ignore CUipcMemHandle;
%ignore CUipcMemHandle_st;
//%ignore cuIpcOpenEventHandle;
//%ignore cuIpcOpenMemHandle;
//%ignore cuLaunchGridAsync;
%ignore cuLinkAddData_v2;
%ignore cuLinkAddFile_v2;
%ignore cuLinkComplete;
%ignore cuLinkCreate_v2;
%ignore cuMemcpy2D;
%ignore cuMemcpy2D_v2;
%ignore cuMemcpy2DAsync;
%ignore cuMemcpy2DAsync;
%ignore cuMemcpy2DAsync_v2;
%ignore cuMemcpy2DUnaligned;
%ignore cuMemcpy2DUnaligned_v2;
%ignore cuMemcpy3D;
%ignore cuMemcpy3D_v2;
%ignore cuMemcpy3DAsync;
%ignore cuMemcpy3DAsync;
%ignore cuMemcpy3DAsync_v2;
%ignore cuMemcpy3DPeer;
%ignore cuMemcpy3DPeerAsync;
%ignore cuMemcpy3DPeerAsync;
//%ignore cuMemcpyAsync;
//%ignore cuMemcpyAtoA_v2;
//%ignore cuMemcpyAtoD_v2;
//%ignore cuMemcpyAtoH_v2;
//%ignore cuMemcpyAtoHAsync_v2;
//%ignore cuMemcpyDtoA_v2;
//%ignore cuMemcpyDtoDAsync;
//%ignore cuMemcpyDtoDAsync_v2;
//%ignore cuMemcpyDtoHAsync;
//%ignore cuMemcpyDtoHAsync_v2;
%ignore cuMemcpyHtoA_v2;
%ignore cuMemcpyHtoAAsync;
%ignore cuMemcpyHtoAAsync_v2;
%ignore cuMemcpyHtoDAsync;
%ignore cuMemcpyHtoDAsync_v2;
%ignore cuMemcpyPeerAsync;
%ignore cuMemPrefetchAsync;
%ignore cuMemsetD16Async;
%ignore cuMemsetD2D16Async;
%ignore cuMemsetD2D32Async;
%ignore cuMemsetD2D8Async;
%ignore cuMemsetD32Async;
%ignore cuMemsetD8Async;
%ignore cuMipmappedArrayCreate;
%ignore cuMipmappedArrayDestroy;
%ignore cuMipmappedArrayGetLevel;
%ignore cuModuleGetSurfRef;
%ignore cuModuleGetTexRef;
%ignore cuModuleLoadDataEx;
%ignore cuOccupancyMaxPotentialBlockSize;
%ignore cuOccupancyMaxPotentialBlockSizeWithFlags;
%ignore cuParamSetTexRef;
%ignore CUstream;
%ignore CUstream_st;
%ignore cuStreamAddCallback;
%ignore cuStreamAttachMemAsync;
%ignore cuStreamBatchMemOp;
%ignore cuStreamBatchMemOp;
%ignore CUstreamBatchMemOpParams;
%ignore CUstreamBatchMemOpParams_union;
%ignore cuStreamCreate;
%ignore cuStreamCreateWithPriority;
%ignore cuStreamDestroy;
%ignore cuStreamDestroy_v2;
%ignore cuStreamGetFlags;
%ignore cuStreamGetPriority;
%ignore cuStreamQuery;
%ignore cuStreamSynchronize;
%ignore cuStreamWaitEvent;
%ignore cuStreamWaitValue32;
%ignore cuStreamWriteValue32;
%ignore cuSurfObjectCreate;
%ignore cuSurfObjectGetResourceDesc;
%ignore cuSurfRefGetArray;
%ignore cuSurfRefSetArray;
%ignore cuTexObjectCreate;
%ignore cuTexObjectCreate;
%ignore cuTexObjectCreate;
%ignore cuTexObjectGetResourceDesc;
%ignore cuTexObjectGetResourceViewDesc;
%ignore cuTexObjectGetTextureDesc;   
%ignore cuTexRefCreate;
%ignore cuTexRefDestroy;
%ignore cuTexRefGetAddress_v2;
%ignore cuTexRefGetAddressMode;
%ignore cuTexRefGetArray;
%ignore cuTexRefGetBorderColor;
%ignore cuTexRefGetFilterMode;
%ignore cuTexRefGetFlags;
%ignore cuTexRefGetFormat;
%ignore cuTexRefGetMaxAnisotropy;
%ignore cuTexRefGetMipmapFilterMode;
%ignore cuTexRefGetMipmapLevelBias;
%ignore cuTexRefGetMipmapLevelClamp;
%ignore cuTexRefGetMipmappedArray;
%ignore cuTexRefSetAddress2D;
%ignore cuTexRefSetAddress2D_v2;
%ignore cuTexRefSetAddress2D_v3;
%ignore cuTexRefSetAddress_v2;
%ignore cuTexRefSetAddressMode;
%ignore cuTexRefSetArray;
%ignore cuTexRefSetBorderColor;
%ignore cuTexRefSetFilterMode;
%ignore cuTexRefSetFlags;
%ignore cuTexRefSetFormat;
%ignore cuTexRefSetMaxAnisotropy;
%ignore cuTexRefSetMipmapFilterMode;
%ignore cuTexRefSetMipmapLevelBias;
%ignore cuTexRefSetMipmapLevelClamp;
%ignore cuTexRefSetMipmappedArray;
%ignore cuArray3DGetDescriptor;






//%typemap(ctype) (char *name, int len, CUdevice dev) "char * jarg1, int jarg2, CUdevice jarg3"
//%typemap(imtype) (char *name, int len, CUdevice dev) "(asdf2, sdfg2)"
//%typemap(cstype) (char *name, int len, CUdevice dev) "(asdf3, sdfg3)"
//%typemap(csin) (char *name, int len, CUdevice dev) "(asdf4, sdfg4)"

// CUresult CUDAAPI cuModuleLoad(CUmodule *module, const char *fname);
// CUresult CUDAAPI cuModuleGetFunction(CUfunction *hfunc, CUmodule hmod, const char *name);
// CUresult CUDAAPI cuModuleGetGlobal(CUdeviceptr *dptr, size_t *bytes, CUmodule hmod, const char *name);
// CUresult CUDAAPI cuModuleGetTexRef(CUtexref *pTexRef, CUmodule hmod, const char *name);
// CUresult CUDAAPI cuModuleGetSurfRef(CUsurfref *pSurfRef, CUmodule hmod, const char *name);
// cuLinkAddData(CUlinkState state, CUjitInputType type, void *data, size_t size, const char *name,
//	      unsigned int numOptions, CUjit_option *options, void **optionValues);
// cuLinkAddFile(CUlinkState state, CUjitInputType type, const char *path,
//	      unsigned int numOptions, CUjit_option *options, void **optionValues);
// CUresult CUDAAPI cuDeviceGetByPCIBusId(CUdevice *dev, const char *pciBusId);
// CUresult CUDAAPI cuModuleGetGlobal(CUdeviceptr *dptr, unsigned int *bytes, CUmodule hmod, const char *name);

%typemap(ctype) const char * "char *"
%typemap(imtype) const char * "string"
%typemap(cstype) const char * "string"
%typemap(ctype) char * pciBusId "char *"
%typemap(imtype) char * pciBusId "string"
%typemap(cstype) char * pciBusId "string"

// This conversion from
// http://swig.10945.n7.nabble.com/Turning-output-arg-char-to-StringBuilder-in-C-td4208.html
// 
// CUresult CUDAAPI cuDeviceGetName(char *name, int len, CUdevice dev);
%typemap(ctype) char * "char *"
%typemap(imtype) char * "System.Text.StringBuilder"
%typemap(cstype) char * "System.Text.StringBuilder"
%csmethodmodifiers cuDeviceGetName "private";
%rename(cuDeviceGetName_private) cuDeviceGetName; 
%pragma(csharp) modulecode=%{ 
 public static CUresult cuDeviceGetName(out string name, int len, int dev) {
    System.Text.StringBuilder temp = new System.Text.StringBuilder();
    CUresult res = cuDeviceGetName_private(temp, len, dev);
    name = temp.ToString();
    return res;
   }
%}
%inline %{ 
	CUresult CUDAAPI cuDeviceGetName(char *name, int len, CUdevice dev);
	%}

%csmethodmodifiers cuDeviceGetPCIBusId "private";
%rename(cuDeviceGetPCIBusId_private) cuDeviceGetPCIBusId; 
%pragma(csharp) modulecode=%{ 
	public static CUresult cuDeviceGetPCIBusId(out string name, int len, int dev) {
		System.Text.StringBuilder temp = new System.Text.StringBuilder();
		CUresult res = cuDeviceGetPCIBusId_private(temp, len, dev);
		name = temp.ToString();
		return res;
	}
%}
%inline %{ 
	CUresult CUDAAPI cuDeviceGetPCIBusId(char *name, int len, CUdevice dev);
%} 



%typemap(cstype) CUipcEventHandle * "out CUipcEventHandle"
%typemap(imtype) CUipcEventHandle * "out CUipcEventHandle"
%typemap(csin) CUipcEventHandle * "out $csinput"
%typemap(cstype) CUipcEventHandle "CUipcEventHandle"
%typemap(imtype) CUipcEventHandle "CUipcEventHandle"
%typemap(csin) CUipcEventHandle "$csinput"

%typemap(cstype) CUipcMemHandle * "out CUipcMemHandle"
%typemap(imtype) CUipcMemHandle * "out CUipcMemHandle"
%typemap(csin) CUipcMemHandle * "out $csinput"
%typemap(cstype) CUipcMemHandle "CUipcMemHandle"
%typemap(imtype) CUipcMemHandle "CUipcMemHandle"
%typemap(csin) CUipcMemHandle "$csinput"


// int cuIpcGetEventHandle(out CUipcEventHandle jarg1, CUevent jarg2); OK
// int cuIpcOpenEventHandle(out CUcontext jarg1, CUipcEventHandle
// jarg2); OK
// int cuIpcGetMemHandle(out CUipcMemHandle jarg1, System.IntPtr
// jarg2); Note: Pointer to user allocated CUipcMemHandle to return the handle in.
// int cuIpcOpenMemHandle(out CUdeviceptr jarg1, CUipcMemHandle jarg2,
// uint jarg3); OK


%typemap(cstype) CUarray * "out CUarray"
%typemap(imtype)  CUarray * "out CUarray"
%typemap(csin)  CUarray * "out $csinput"
%typemap(cstype) CUarray "CUfunction"
%typemap(imtype)  CUarray "CUfunction"
%typemap(csin)  CUarray "$csinput"

   
   
%include <stdint.i>
%include "cuda.h"
