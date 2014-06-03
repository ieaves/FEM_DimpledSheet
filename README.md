FEM_DimpledSheet
================

Everything is plug and play from DimpledSheet.m with descriptions of the modifiable variables. There are two primary differences between this and test_torus_tesselate

1) This solves for the wavefunction of a particle sitting on a dimpled sheet (like Graphene) rather than on a torus; if you have a hard time visualizing that imagine something along the lines of: http://valuestockphoto.com/stockimages/Abstract/Industrial/dimpled_metalsheet04110097.jpg.html

2) This utilizes CUDA to generate the Hamiltonian rather than straight linear processing. On my system this allows me to solve for a 62,500 nodes surface (default settings) in about the same time as a 10,000 node surface on the CPU. At this point generating the Hamiltonian is inconsequentially easy but the subsequent eigenvalue problem becomes a bottleneck as it can't be parallelized. 
