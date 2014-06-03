function [V] = MakePotentialGPU(Vo,area)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
V=repmat(gpuArray.zeros(9,1),1,length(area));
% Vo=repmat(gpuArray.zeros(3,1),1,length(area));
% 
% Vo(1,:)=arrayfun(@GeoPotentialTorusGPU,uv(2,1,:),a,b,c);
% Vo(2,:)=arrayfun(@GeoPotentialTorusGPU,uv(2,2,:),a,b,c);
% Vo(3,:)=arrayfun(@GeoPotentialTorusGPU,uv(2,3,:),a,b,c);


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

