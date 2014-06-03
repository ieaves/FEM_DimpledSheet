FEM_DimpledSheet
================

Everything is plug and play from DimpledSheet.m with descriptions of the modifiable variables. There are a few differences between this and test_torus_tesselate

1) This solves for the wavefunction of a particle sitting on a dimpled sheet (like Graphene) rather than on a torus; if you have a hard time visualizing that imagine something along the lines of: http://valuestockphoto.com/stockimages/Abstract/Industrial/dimpled_metalsheet04110097.jpg.html

2) This utilizes CUDA to generate the Hamiltonian rather than straight linear processing. On my system this allows me to solve for a 62,500 nodes surface (default settings) in about the same time as a 10,000 node surface on the CPU. At this point generating the Hamiltonian is inconsequentially easy but the subsequent eigenvalue problem becomes a bottleneck as it can't be parallelized. 

NOTE: There is no analytic solution to the geometric potential on such a surface as this (thus no analytic solver) instead I used a wonderful program called surfature written by Daniel Claxton (found here http://www.mathworks.com/matlabcentral/fileexchange/11168-surface-curvature/content/surfature.m) to calculate the gaussian and mean curvature which I then use to generate the potential. The first order Taylor expansion used in test_torus_tesselate works just as well for this specific problem, though it's slower. I'm still in the process of debugging my second order expansion as it sometimes fails to adequeately resolve the null space vector needed and therefore generates anomalous values of the gradient.
