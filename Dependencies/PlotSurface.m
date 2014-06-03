function [] = PlotSurface(tri,x,y,z,varargin)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
nargin=length(varargin);
%cmap=[0,255,255;0,204,204;0,153,153;0,76,153;0,0,255;0,0,0;51,0,102;127,0,255;204,0,204;255,0,127;255,0,0]/255;
%colormap(cmap);

if nargin==0
    trisurf(tri,x,y,z);
elseif isnumeric(varargin{1}) 
    trisurf(tri,x,y,z,varargin{1});
else
    trisurf(tri,x,y,z);
end


if ~isempty(find(strcmp('interp', varargin),1)); 
    shading interp 
end
if ~isempty(find(strcmp('axis equal', varargin),1)); 
    axis equal
end
if ~isempty(find(strcmp('colorbar', varargin),1)); 
    colorbar
end

end

