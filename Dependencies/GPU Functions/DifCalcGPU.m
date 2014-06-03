function [dx1,dx2,dx3] = DifCalcGPU(xyz)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

dx3=xyz(:,2,:)-xyz(:,3,:);
dx2=xyz(:,1,:)-xyz(:,3,:);
dx1=xyz(:,1,:)-xyz(:,2,:);
end

