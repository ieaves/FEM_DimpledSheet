function [H,OV,rows,columns] = ArrayProcessGPU(H,OV,rows,columns,Nv)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s=size(rows);
rows=reshape(rows,s(1)*s(2),1);
columns=reshape(columns,s(1)*s(2),1);  
H=reshape(H,s(1)*s(2),1); 
OV=reshape(OV,s(1)*s(2),1);

H=gather(H);
OV=gather(OV);

H=sparse(rows,columns,H,Nv,Nv);
OV=sparse(rows,columns,OV,Nv,Nv);

end

