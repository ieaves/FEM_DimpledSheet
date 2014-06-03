function [xyz] = GetElementCoords(xyz,tri)
%xyz(<1=x,2=y,3=z>,<1=(x1,y1,z1),...>,<1=first tesselation,...>)

%xyz=[x,y,z];
xyz=xyz(tri',:);
xyz=reshape(xyz',length(xyz(1,:)),3,length(tri));

end