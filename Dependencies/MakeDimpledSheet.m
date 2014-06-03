function [x,y,z,tri,nu,nv] = MakeDimpledSheet(xi,yi,GPs,d)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Gps=[Amp,xo,yo,sigma_x,sigma_y]

%Assume 5 std deviations spacing on either side of gauss peak.

%xi(3),yi(3)= number of points in the tesselation of each box

Nx=floor((xi(2)-xi(1))/(2*d*GPs(4))); 
Ny=floor((yi(2)-yi(1))/(2*d*GPs(5)));

[x,y]=MakeGrid(linspace(xi(1),xi(2),xi(3)*Nx),linspace(yi(1),yi(2),yi(3)*Ny));
tri=delaunay(x,y);

CDx=abs(xi(2)-xi(1))/Nx;
CDy=abs(yi(2)-yi(1))/Ny;

[x1,y1]=meshgrid(linspace(xi(1),xi(1)+CDx,xi(3)),linspace(yi(1),yi(1)+CDy,yi(3)));
z1=MakeDimple(x1,y1,[GPs(1),xi(1)+.5*CDx,yi(1)+.5*CDy,GPs(4),GPs(5)]);

z=reshape(repmat(z1,[Ny Nx]),numel(x),1);

nu=Nx*xi(3);nv=Ny*yi(3);
function [z] = MakeDimple(x,y,GPs)
    z=GPs(1)*exp(-((x-GPs(2)).^2/(2*GPs(4)^2)+(y-GPs(3)).^2/(2*GPs(5)^2)));
end
end

