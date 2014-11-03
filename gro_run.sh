#Shell script to set source and call the Python Wrapper
#!/bin/sh
#chmod u+x gro_run.sh
#Setting Source for GROMACS
#location = /home/ajay/Ajay/code/git/WrapGroMdSim

source /usr/local/gromacs/bin/GMXRC
#pdb2gmx
pdb2gmx -f GIIIA_Corrected.pdb -o GIIIA_processed.gro -ff amber99sb-ildn -water tip3p

#editconf - define the box 
editconf -f GIIIA_processed.gro -o GIIIA_newbox.gro -c -d 1.0 -bt dodecahedron

#genbox - Solvation 
genbox -cp GIIIA_newbox.gro -cs spc216.gro -o GIIIA_solv.gro -p topol.top

#grompp - generate .tpr file for adding ions
grompp -f ions.mdp -c GIIIA_solv.gro -p topol.top -o ions.tpr

#genion
genion -s ions.tpr -o GIIIA_solv_ions.gro -p topol.top -pname NA -nname CL -nn 6 < 13

#grompp EM
grompp -f minim.mdp -c GIIIA_solv_ions.gro -p topol.top -o em.tpr

#EM MD run
mdrun -v -deffnm em

#Potential energy XVG
g_energy -f em.edr -o potential_GIIIA.xvg < 10

exit;


