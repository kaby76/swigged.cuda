#include <stdio.h>
#include <cuda.h>

const int N = 11;
const int blocksize = 11;

__global__
void hello(char * ar)
{
	int i = threadIdx.x;
	ar[i] = ar[i] + 1;
}

int main()
{
	char a[] = { 'G', 'd', 'k', 'k', 'n', (char)31, 'v', 'n', 'q', 'k', 'c', 0 };
	char *ad;
	const int csize = N * sizeof(char);

	printf("%s\n", a);

	int res = cudaMalloc((void**)&ad, csize);
	res = cudaMemcpy(ad, a, csize, cudaMemcpyHostToDevice);
	dim3 dimBlock(blocksize, 1);
	dim3 dimGrid(1, 1);
	hello<<<dimGrid, dimBlock>>>(ad);
	res = cudaMemcpy(a, ad, csize, cudaMemcpyDeviceToHost);
	res = cudaFree(ad);

	printf("%s\n", a);
	return 0;
}