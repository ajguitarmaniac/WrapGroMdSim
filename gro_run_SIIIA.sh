#Shell script to set source and call the Python Wrapper
#!/bin/sh
#chmod u+x gro_run_SIIIA.sh
#Setting Source for GROMACS
#location = /home/ajay/Ajay/code/git/WrapGroMdSim

source /usr/local/gromacs/bin/GMXRC
#pdb2gmx
pdb2gmx -f SIIIA_Cor.pdb -o SIIIA_processed.gro -ff amber99sb-ildn -water tip3p

#editconf - define the box 
editconf -f SIIIA_processed.gro -o SIIIA_newbox.gro -c -d 1.0 -bt dodecahedron

#genbox - Solvation 
genbox -cp SIIIA_newbox.gro -cs spc216.gro -o SIIIA_solv.gro -p topol.top

#grompp - generate .tpr file for adding ions
grompp -f ions.mdp -c SIIIA_solv.gro -p topol.top -o ions.tpr

#genion
genion -s ions.tpr -o SIIIA_solv_ions.gro -p topol.top -pname NA -nname CL -nn 4 < genion_param

#grompp em
grompp -f minim.mdp -c SIIIA_solv_ions.gro -p topol.top -o SIIIA_em.tpr

#EM MD run
mdrun -v -deffnm SIIIA_em

#Potential energy XVG
g_energy -f SIIIA_em.edr -o potential_SIIIA.xvg < pe_param

#Equilibration NVT
grompp -f nvt.mdp -c SIIIA_em.gro -p topol.top -o SIIIA_nvt.tpr

#MD run NVT
mdrun -deffnm SIIIA_nvt

#Analyze the temperature progression
g_energy -f SIIIA_nvt.edr -o temperature_SIIIA.xvg < temp_param

#Equilibration NPT
grompp -f npt.mdp -c SIIIA_nvt.gro -t SIIIA_nvt.cpt -p topol.top -o SIIIA_npt.tpr

#MD Run NPT
mdrun -deffnm SIIIA_npt

#Analyse Pressure progression
g_energy -f SIIIA_npt.edr -o pressure_SIIIA.xvg < pressure_param

#Analyse Density progression
g_energy -f SIIIA_npt.edr -o density_SIIIA.xvg < density_param

#Pre-process for ProductionMD
grompp -f md.mdp -c SIIIA_npt.gro -t SIIIA_npt.cpt -p topol.top -o MD_SIIIA_10ns.tpr

#Production MD
mdrun -deffnm MD_SIIIA_10ns

#Analysis - Trajconv
trjconv -s MD_SIIIA_10ns.tpr -f MD_SIIIA_10ns.xtc -o MD_SIIIA_10ns_noPBC.xtc -pbc mol -ur compact < trajconv_param

#RMSD Structural Stability
g_rms -s MD_SIIIA_10ns.tpr -f MD_SIIIA_10ns_noPBC.xtc -o SIIIA_rmsd.xvg -tu ns < rmsd_param

#RMSD relative to the crystal structure
g_rms -s SIIIA_em.tpr -f MD_SIIIA_10ns_noPBC.xtc -o SIIIA_rmsd_xtal.xvg -tu ns < rmsd_param

#Measure of protein compactness - radius of gyration
g_gyrate -s MD_SIIIA_10ns.tpr -f MD_SIIIA_10ns_noPBC.xtc -o SIIIA_gyrate.xvg < rg_param


exit;


