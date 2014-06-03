function [a] = GPUTestFunc(n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
f=[1,2,3;4,5,6;7,8,9];

f2=repmat(f,[1 1 n]);

tic
for i=1:n
    a=eig(f);
end
toc

tic 
f2=gpuArray(f2);
for i=1:n
   a=eig(f2(:,:,1)); 
end
toc
end

