function [K] = MakeKinetic3DGPU(dx1,dx2,dx3,area)
%{
TITLE: MakeKinetic

AUTHOR: Ian Eaves

DESCRIPTION: Returns the 3x3 kinetic matrix of an individual
triangle in the tesselation with triagular coordinates x,y,z, and the area
of the triangle.
%}

%dx1->dx12, dx2->dx13, dx3->dx23
%dx23=xi(2,:)-xi(3,:);
%dx13=xi(1,:)-xi(3,:);
%dx12=xi(1,:)-xi(2,:);

K=repmat(gpuArray.zeros(9,1),1,length(area));

dx1=gpuArray(dx1);
dx2=gpuArray(dx2);
dx3=gpuArray(dx3);

t=arrayfun(@GPUdot,dx3,dx3);
K(1,:)=t(1,:)+t(2,:)+t(3,:);
t=arrayfun(@GPUdot,dx2,dx2);
K(5,:)=t(1,:)+t(2,:)+t(3,:);
t=arrayfun(@GPUdot,dx1,dx1);
K(9,:)=t(1,:)+t(2,:)+t(3,:);

t=arrayfun(@GPUdot,dx3,dx2);
K(2,:)=-(t(1,:)+t(2,:)+t(3,:));
K(4,:)=K(2,:);

t=arrayfun(@GPUdot,dx1,dx3);
K(3,:)=t(1,:)+t(2,:)+t(3,:);
K(7,:)=K(3,:);

t=arrayfun(@GPUdot,dx1,dx2);
K(6,:)=-(t(1,:)+t(2,:)+t(3,:));
K(8,:)=K(6,:);

area=repmat(area,9,1)*4;
K=arrayfun(@DivideGPU,K,area);

end

