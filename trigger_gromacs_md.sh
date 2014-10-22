#Shell script to set source and call the Python Wrapper
#!/bin/sh
#chmod u+x trigger_gromacs_md.sh
#Setting Source for GROMACS
#location = /home/ajay/Ajay/code/git/WrapGroMdSim

source /usr/local/gromacs/bin/GMXRC

#Executing the Python Wrapper
python /home/ajay/Ajay/code/git/WrapGroMdSim/gromacs_md_wrapper.py


exit;
