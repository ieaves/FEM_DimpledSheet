function [OVg] = MakeOverlapGPU(area)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

g=gpuArray([2,1,1,1,2,1,1,1,2]');
g=repmat(g,1,length(area));

area=repmat(area,9,1);

OVg=arrayfun(@TriOverlapGPU,g,area);

end

