#include <stdio.h>

__global__
void kern(int * ar)
{
	int i = threadIdx.x;
	if (i < 11)
		ar[i] = ar[i] + 1;
}


