function [V] = MakeGeoPotential(x,y,z,type,varargin)
%UNTITLED Summary of this function goes here
%   Calculates the potential in one of three ways: 
%       'gradient': a direct gradient computation
%               INPUT: n_x, n_y, [sym_x,sym_y]
%                   sym_(x,y)= 1 or 0 for symmetric or not across that axis
%       'lin fit': first order Taylor expansion to find a plane perpendicular
%           to the surface at each point and then calculate the potential
%               INPUT: tri, [cnodes]
%       'quad fit': second order taylor expanansion
%               INPUT: tri, [cnodes]


if strcmp(type,'gradient')
    nx=varargin{1};
    ny=varargin{2};
    if nargin==4
        x2=reshape(x,nx,ny);
        y2=reshape(y,nx,ny);
        z2=reshape(z,nx,ny);
        [~,~,Pmax,Pmin]=surfature(x2,y2,z2);
    else
        t=varargin{3};
        
        tmp=padarray(reshape(x,nx,ny),3*t,'circular');
        
        if t(1)==0 
            xindex=1:size(tmp,1);
            xind2=xindex;
        elseif t(1)==1
            xindex=[1,2,4:size(tmp,1)-3,size(tmp,1)-1,size(tmp,1)];
            xind2=3:size(tmp,1)-4;
        end
        if t(2)==0 
            yindex=1:size(tmp,2);
            yind2=yindex;
        elseif t(2)==1
            yindex=[1,2,4:size(tmp,2)-3,size(tmp,2)-1,size(tmp,2)];
            yind2=3:size(tmp,2)-4;
        end
        
        x2=tmp(xindex,yindex);

        tmp=padarray(reshape(y,nx,ny),3*t,'circular');
        y2=tmp(xindex,yindex);

        tmp=padarray(reshape(z,nx,ny),3*t,'circular');
        z2=tmp(xindex,yindex);

        [~,~,Pmax,Pmin]=surfature(x2,y2,z2);

        Pmax=Pmax(xind2,yind2); 
        Pmin=Pmin(xind2,yind2);
    end
    V=reshape((Pmax-Pmin).^2/-8,numel(Pmax),1);
    
elseif strcmp(type,'lin fit')
    tri=varargin{1};
    cnodes=varargin{2};
    t=TesselationNeighbors(tri,cnodes);
    V=zeros(length(x),1);
    for i=1:max(max(tri))
        V(i)=MakeGeo_linfit(x,y,z,i,t{i});
    end
elseif strcmp(type,'quad fit')
    tri=varargin{1};
    cnodes=varargin{2};
    t=TesselationNeighbors(tri,cnodes);
    t2=NextNeighbors(t);
    V=zeros(length(x),1);
    for i=1:max(max(tri))
        V(i)=MakeGeo_quadfit(x,y,z,i,t2{i});
    end
end
end

