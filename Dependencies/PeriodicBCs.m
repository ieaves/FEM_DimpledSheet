function [H] = PeriodicBCs(H,nodes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%Can't add multiple rows and columns to one other column at the same time
%so the loop does this separately.

rep=find(diff(nodes(:,1))==0);
norep=setdiff(1:length(nodes),rep);

for i=1:length(rep)
    H(:,nodes(rep(i),1))=H(:,nodes(rep(i),1))+H(:,nodes(rep(i),2));
    H(nodes(rep(i),1),:)=H(nodes(rep(i),1),:)+H(nodes(rep(i),2),:);
end

H(:,nodes(norep,1))=H(:,nodes(norep,1))+H(:,nodes(norep,2));
H(nodes(norep,1),:)=H(nodes(norep,1),:)+H(nodes(norep,2),:);

t=setdiff(1:length(H),nodes(:,2));
H=H(t,t);

end

