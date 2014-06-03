function [A] = MakeAreaGPU(x1,x2,x3)%x1,y1,z1,x2,y2,z2,x3,y3,z3)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

a=sum((x1-x2).^2)^.5;
b=sum((x1-x3).^2)^.5;
c=sum((x2-x3).^2)^.5;

t=sort([a,b,c]);

s=.5*(a+b+c);

A=(s*(s-t(3))*(s-t(2))*(s-t(1)))^(.5);

end

