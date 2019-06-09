#pragma OPENCL EXTENSION cl_khr_fp64 : enable
//////////////////////////////////////////////
// MCEN90031 Applied High Perfomance Computing
//
// Dean Pakravan: 757389
// Qijie Li:      927249
//
// Kernel for daxpy operation
//
//////////////////////////////////////////////

__kernel void daxpy(__global double* Y,
                         __global double* X,
                           const double  A,
                           const int N)
{

   int i     = get_global_id(0);

   if (i<N) {
       Y[i] += A*X[i];// + y_prev[i];
   }

   return;

}
