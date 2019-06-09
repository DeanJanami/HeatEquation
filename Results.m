%% Applied High Performance Computing
%
% Dean Pakravan: 757389
% Qijie Li: 927249
%
% Results from OpenCL parallelisation

N = [10000, 100000, 1000000, 10000000, 100000000];
host = [0.095999,0.85678,8.63163,88.5393, 1010.65];
Xeon = [0.130565,0.202741,1.31976,16.109, 180.721];
GPU = [0.897162,1.18788,2.41553,13.5628, 164.765];

values = [host(1) Xeon(1) GPU(1); host(2) Xeon(2) GPU(2); host(3) Xeon(3) GPU(3); host(4) Xeon(4) GPU(4); host(5) Xeon(5) GPU(5)];
bar(values);
set(gca, 'YScale', 'log'); %Uncomment for log plot
xticklabels(N);
title("OpenCL results");
xlabel("Array sizes");
ylabel("Time (seconds)");