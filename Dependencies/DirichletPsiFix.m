function [psi2] = DirichletPsiFix(psi,intNodes,Nv)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

psi2=zeros(Nv,size(psi,2));
psi2(intNodes,:)=psi;

end

