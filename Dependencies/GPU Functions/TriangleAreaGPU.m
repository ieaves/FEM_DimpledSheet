function [area] = TriangleAreaGPU(dx1,dx2,dx3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%dx1->dx12, dx2->dx13, dx3->dx23
%dx23=xi(2,:)-xi(3,:);
%dx13=xi(1,:)-xi(3,:);
%dx12=xi(1,:)-xi(2,:);

%not 100% confident seems to be some discrepancy but works for now.

a=arrayfun(@GPUdot,dx1,dx1);
a=arrayfun(@GPUSum,a(1,:),a(2,:),a(3,:));
a=a.^(.5);

b=arrayfun(@GPUdot,dx2,dx2);
b=arrayfun(@GPUSum,b(1,:),b(2,:),b(3,:));
b=b.^(.5);

c=arrayfun(@GPUdot,dx3,dx3);
c=arrayfun(@GPUSum,c(1,:),c(2,:),c(3,:));
c=c.^(.5);

s=.5*(a+b+c);

area=2.*(s.*(s-a).*(s-b).*(s-c)).^(.5);

end
