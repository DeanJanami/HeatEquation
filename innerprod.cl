#pragma OPENCL EXTENSION cl_khr_fp64 : enable
//////////////////////////////////////////////
// MCEN90031 Applied High Perfomance Computing
//
// Dean Pakravan: 757389
// Qijie Li:      927249
//
// Kernel for inner product operation
//
//////////////////////////////////////////////

__kernel void innerprod(__global double* X,
                         __global double* xxInner,
                         __local  double* scratch)
{

   size_t globalID      = get_global_id(0);
   size_t localID       = get_local_id(0);
   size_t workGroupID   = get_group_id(0);
   size_t workGroupSize = get_local_size(0);
   size_t numWorkGroups = get_num_groups(0);

   scratch[localID] = X[globalID] * X[globalID];
   barrier(CLK_LOCAL_MEM_FENCE);

   for(size_t i=workGroupSize>>1; i>0; i>>=1)
   {
      if(localID<i)
      {
         scratch[localID] += scratch[localID + i];
      }
      barrier(CLK_LOCAL_MEM_FENCE);
   }

   if(localID==0)
   {
      xxInner[workGroupID] = scratch[0];
   }
   barrier(CLK_GLOBAL_MEM_FENCE);
   if(globalID==0)
   {
       for(size_t i=1; i<numWorkGroups; i++)
       {
           xxInner[0] += xxInner[i];
       }
   }

}
