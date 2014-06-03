function [tri] = PeriodicTesselationFix(tri,cnodes,BMnodes)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

for i=1:length(cnodes)
   tri(tri==cnodes(i,2))=cnodes(i,1);
   tri(tri==BMnodes(i))=i;
end

for i=length(cnodes)+1:length(BMnodes)
    tri(tri==BMnodes(i))=i;
end

end

