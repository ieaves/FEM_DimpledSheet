%{
TITLE: Test_trefoilknot_tesselate

AUTHOR: Ian Eaves

DESCRIPTION: Overarching FEM code for toroidal systems. New potentials can
be added by calling the associated potential function for a 3x3 matrix and
then adding each term into the hamiltonian. This code can be extended to
alternative goemetries by defining a new Make<Shape> function equivalent to
MakeTorus2 and modifying the geometric potential for that shape as well.
%}
clear all

num=10;
GaussParams=[.01,2,2,.02,.02];
xi=[0,5,10];
yi=[0,5,10];

[x,y,z,tri,nl,nt]=MakeDimpledSheet(xi,yi,GaussParams,5);

[H,OV]=Make_Hamiltonian(tri,[x,y,z],[],'gradient',nl,nt,[0,1]);

intNodes=setdiff(1:length(x),ConnectedNodes(nl,nt));
H=Dirichlet(H,intNodes);
OV=Dirichlet(OV,intNodes);

[E_Val,psi,psi2]=EigenProcess(H,OV,num);
E_Val(1:10)

psi=DirichletPsiFix(psi,intNodes,numel(x));
psi2=DirichletPsiFix(psi2,intNodes,numel(x));

PlotSurface(tri,x,y,psi(:,1),'interp','colorbar');
