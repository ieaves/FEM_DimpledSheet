function [rows,cols] = Assemble3(tri)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

rows=reshape(repmat(reshape(tri',1,3*length(tri)),3,1),1,9*length(tri))';
cols=reshape(repmat(tri,1,3)',1,9*length(tri))';

end

