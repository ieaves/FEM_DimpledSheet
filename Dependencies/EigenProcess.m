function [E_val,E_Vec,E_Vec2,nargout] = EigenProcess(H,OV,num)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

opts.issym=1;
[E_Vec,E_val]=eigs(H,OV,num,'sm',opts);

E_val=diag(E_val);
[E_val,b]=sort(E_val,'ascend');
E_Vec=E_Vec(:,b);

E_Vec2=PsiPsi(OV,E_Vec); %square of the wavefunction
nargout=b;
end

