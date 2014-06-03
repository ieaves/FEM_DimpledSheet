function [H,OV,varargout] = Make_Hamiltonian(tri,xyz,cnodes,type,varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

xyz2=gpuArray(GetElementCoords(xyz,tri));

[dx1,dx2,dx3]=DifCalcGPU(xyz2);

area=TriangleAreaGPU(dx1,dx2,dx3);

OV=MakeOverlapGPU(area);

H=MakeKinetic3DGPU(dx1,dx2,dx3,area);


if strcmp(type,'gradient')
    V=MakeGeoPotential(xyz(:,1),xyz(:,2),xyz(:,3),type,varargin{1},varargin{2},varargin{3});
else
    V=MakeGeoPotential(xyz(:,1),xyz(:,2),xyz(:,3),type,varargin{1},varargin{2});
end

H=H+MakePotentialGPU(gpuArray(V(tri')),area);

[rows,columns]=Assemble3(tri);
[H,OV,~,~]=ArrayProcessGPU(H,OV,rows,columns,max(tri(:)));

if ~isempty(cnodes)
    OV=PeriodicBCs(OV,cnodes);
    H=PeriodicBCs(H,cnodes);
    BMnodes=setdiff(linspace(1,length(xyz),length(xyz)),cnodes(:,2));
end

if nargout == 3
    varargout{1}=BMnodes;
elseif nargout == 4
    varargout{1}=[xyz(BMnodes,1),xyz(BMnodes,2),xyz(BMnodes,3)];
    %PeriodicTesselationFix is CRAZY slow.
    varargout{2}=PeriodicTesselationFix(tri,cnodes,BMnodes);
end
end

