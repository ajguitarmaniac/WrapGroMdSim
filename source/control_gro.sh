#Shell script to set source and call the Python Wrapper
#!/bin/sh
#chmod u+x control_gro.sh
#Setting Source for GROMACS
#location = /home/ajay/Ajay/code/git/WrapGroMdSim


#GIIIANative
cd ../GIIIA/Native/
chmod u+x gro_GIIIA_Native.sh
./gro_GIIIA_Native.sh
echo 'GIIIA_NATIVE DONE!' > /home/ajay/Ajay/code/files/Simulations/source/GIIIA_NATIVE

#GIIIA416
cd ../4-16/
chmod u+x gro_GIIIA_416.sh
./gro_GIIIA_416.sh
echo 'GIIIA_416 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/GIIIA_416

#GIIIA416521
cd ../4-16-5-21/
chmod u+x gro_GIIIA_416521.sh
./gro_GIIIA_416521.sh
echo 'GIIIA_416521 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/GIIIA_416521


#################################

#PIIIANative
cd ../../PIIIA/Native/
chmod u+x gro_PIIIA_Native.sh
./gro_PIIIA_Native.sh
echo 'PIIIA_NATIVE DONE!' > /home/ajay/Ajay/code/files/Simulations/source/PIIIA_NATIVE

#PIIIA416
cd ../4-16/
chmod u+x gro_PIIIA_416.sh
./gro_PIIIA_416.sh
echo 'PIIIA_416 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/PIIIA_416

#PIIIA416521
cd ../4-16-5-21/
chmod u+x gro_PIIIA_416521.sh
./gro_PIIIA_416521.sh
echo 'PIIIA_416521 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/PIIIA_416521

##################################

#SIIIANative
cd ../../SIIIA/Native/
chmod u+x gro_SIIIA_Native.sh
./gro_SIIIA_Native.sh
echo 'SIIIA_NATIVE DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SIIIA_NATIVE

#SIIIA416
cd ../4-16/
chmod u+x gro_SIIIA_416.sh
./gro_SIIIA_416.sh
echo 'SIIIA_416 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SIIIA_416

#SIIIA416521
cd ../4-16-5-21/
chmod u+x gro_SIIIA_416521.sh
./gro_SIIIA_416521.sh
echo 'SIIIA_416521 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SIIIA_416521

###########################################

#KIIIANative
cd ../../KIIIA/Native/
chmod u+x gro_KIIIA_Native.sh
./gro_KIIIA_Native.sh
echo 'KIIIA_NATIVE DONE!' > /home/ajay/Ajay/code/files/Simulations/source/KIIIA_NATIVE

#KIIIA416
cd ../4-16/
chmod u+x gro_KIIIA_416.sh
./gro_KIIIA_416.sh
echo 'KIIIA_416 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/KIIIA_416

#KIIIA416521
cd ../4-16-5-21/
chmod u+x gro_KIIIA_416521.sh
./gro_KIIIA_416521.sh
echo 'KIIIA_416521 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/KIIIA_416521

###########################################

#SmIIIANative
cd ../../SmIIIA/Native/
chmod u+x gro_SmIIIA_Native.sh
./gro_SmIIIA_Native.sh
echo 'SmIIIA_NATIVE DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SmIIIA_NATIVE

#SmIIIA416
cd ../4-16/
chmod u+x gro_SmIIIA_416.sh
./gro_SmIIIA_416.sh
echo 'SmIIIA_416 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SmIIIA_416

#SmIIIA416521
cd ../4-16-5-21/
chmod u+x gro_SmIIIA_416521.sh
./gro_SmIIIA_416521.sh
echo 'SmIIIA_416521 DONE!' > /home/ajay/Ajay/code/files/Simulations/source/SmIIIA_416521

###########################################
exit;


