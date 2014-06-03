function [V] =MakeHarmonic3DGPU(xyz,kx,ky,kz,area)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

V=repmat(gpuArray.zeros(9,1),1,length(area));
Vo=repmat(gpuArray.zeros(3,1),1,length(area));

Vo(1,:)=arrayfun(@HarmonicPotentialGPU,xyz(1,1,:),xyz(2,1,:),xyz(3,1,:),...
    kx,ky,kz);
Vo(2,:)=arrayfun(@HarmonicPotentialGPU,xyz(1,2,:),xyz(2,2,:),xyz(3,2,:),...
    kx,ky,kz);
Vo(3,:)=arrayfun(@HarmonicPotentialGPU,xyz(1,3,:),xyz(2,3,:),xyz(3,3,:),...
    kx,ky,kz);


t=arrayfun(@GPUdot,gpuArray([6;2;2]),Vo);
V(1,:)=t(1,:)+t(2,:)+t(3,:);
t=arrayfun(@GPUdot,gpuArray([2;6;2]),Vo);
V(5,:)=t(1,:)+t(2,:)+t(3,:);
t=arrayfun(@GPUdot,gpuArray([2;2;6]),Vo);
V(9,:)=t(1,:)+t(2,:)+t(3,:);

t=arrayfun(@GPUdot,gpuArray([2;2;1]),Vo);
V(2,:)=t(1,:)+t(2,:)+t(3,:);
V(4,:)=V(2,:);

t=arrayfun(@GPUdot,gpuArray([2;1;2]),Vo);
V(3,:)=t(1,:)+t(2,:)+t(3,:);
V(7,:)=V(3,:);

t=arrayfun(@GPUdot,gpuArray([1;2;2]),Vo);
V(6,:)=t(1,:)+t(2,:)+t(3,:);
V(8,:)=V(6,:);

area=repmat(area,9,1)/120;

V=V.*area;
end

