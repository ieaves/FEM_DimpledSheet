function [H,OV] = MakeMatricesGPU(tri,values_H,values_O)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[rows,columns]=Assemble3(tri);

values_H=reshape(values_H',length(rows),1); 
values_O=reshape(values_O',length(rows),1);

Nv=max(max(tri));

values_H=gather(values_H);
values_O=gather(values_O);

H=sparse(rows,columns,values_H,Nv,Nv);
OV=sparse(rows,columns,values_O,Nv,Nv);

end

