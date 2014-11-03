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

#Equilibration NVT
grompp -f nvt.mdp -c em.gro -p topol.top -o nvt.tpr

#MD run NVT
mdrun -deffnm nvt

#Analyze the temperature progression
g_energy -f nvt.edr -o temperature_GIIIA.xvg < 15

#Equilibration NPT
grompp -f npt.mdp -c nvt.gro -t nvt.cpt -p topol.top -o npt.tpr

#MD Run NPT
mdrun -deffnm npt

#Analyse Pressure progression
g_energy -f npt.edr -o pressure_GIIIA.xvg < 16

#Analyse Density progression
g_energy -f npt.edr -o density_GIIIA.xvg < 22

#Pre-precess for ProductionMD
grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o MD_GIIIA_10ns.tpr

#Production MD
mdrun -deffnm MD_GIIIA_10ns

exit;


