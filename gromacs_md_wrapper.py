#################################################################################
#Python Wrapper function for calling GROMACS programs to run MD simulations
#################################################################################
#!/usr/bin/python
#Import Modules and Clear the windows command prompt screen
import sys
import time
import Bio
start = time.time()
import datetime
import os
import profile
import subprocess
os.system('cls' if os.name == 'nt' else 'clear')
scriptname=os.path.basename(__file__)

########################################################################
#OPEN LOG FILE
#Log file name format -GROMACS_MD_WRAPPER_LOG_datetimestamp
#code format ref : datetime.datetime.now().strftime('%Y-%m-%d--%H:%M:%S')
########################################################################
logfile_name = 'GROMACS_MD_WRAPPER_'+datetime.datetime.now().strftime('%Y-%m-%d--%H:%M:%S')+'_LOG.txt'
logfile_dir = '/home/ajay/Ajay/code/logs'
logfile = (os.path.join(logfile_dir,logfile_name))
LOGFILE=open(logfile,"w")
print '*'*80
print "LOGFILE >"+logfile_name +"<<<<< BEGIN <<<<<<<<<<\n"
print '*'*80
LOGFILE.write('*'*80+"\n")
LOGFILE.write("LOGFILE >"+logfile_name +"<<<<< BEGIN <<<<<<<<<<\n" )
LOGFILE.write('*'*80+"\n")
###########################################################################
print '*'*80
LOGFILE.write('*'*80+"\n")
LOGFILE.write(scriptname+"Python Wrapper for MD simulations using GROMACS 4.6.6\n")
print scriptname,"Python Wrapper for MD simulations using GROMACS 4.6.6"
print '*'*80
LOGFILE.write('*'*80+"\n")
###########################################################################


"""
#Function to compute Histogram of characters in a given string

def histogram(s):
	d = dict()
	for c in s:
		if c not in d:
			d[c] = 1
		else:
			d[c] += 1
	return d

#Function to print sorted keys and values 
def print_hist(h):
	s_hist=sorted(h)
	for i in range(len(s_hist)):
		print s_hist[i],":",h.get(s_hist[i],0)

#File location 
#file_location = '/home/ajay/Ajay/Files/Fasta'
#print "Current Directory : ",file_location

#Get file name from user
#filename_from_user=raw_input("Enter a file name from this directory : ")
#filename_from_user=sys.argv[1]
#print "\nFile : ",filename_from_user

#Function to compute Histogram of Nucleotides in the file
def fasta_frequency(filename):
	
	#Open file in Read mode
	fo=open(os.path.join(file_location,filename),'r')
	
	#Dictionary of nucleotide symbols and names
	nucleotide_dictionary={'A':'Adeinine','G':'Gaunine','T':'Thiamine','C':'Cytosine'}
	
	#Dictionary of Amino Acid symbols and names. Source http://www.ncbi.nlm.nih.gov/Class/MLACourse/Modules/MolBioReview/iupac_aa_abbreviations.html
	
	amino_acid_dictionary={'G':'Glycine','A':'Alanine','R':'Arginine','N':'Asparagine','D':'Aspartic acid','C':'Cysteine',
						'Q':'Glutamine','E':'Glutamic acid','H':'Histidine','I':'Isoleucine','L':'Leucine','K':'Lysine',
						'M':'Methionine','F':'Phenylalanine','P':'Proline','S':'Serine','T':'Threonine','W':'Tryptophan',
						'Y':'Tyrosine','V':'Valine','B':'Aspartic acid or Asparagine','Z':'Glutamine or Glutamic acid',
						'X':'Any Amino Acid'}
	content_list=[]
	for line in fo:
		line=line.rstrip()
		if line[0]=='>':
			print "\nFile Header :",line[1:],"\n"
		else:
			content_list.append(line)
	string_from_list=''.join(content_list)
	print "\nSequence Length :",len(string_from_list),"\n"
	hist=histogram(string_from_list)
	
	
	#print_hist(hist)
	for k in amino_acid_dictionary:
		print "Frequency of Amino Acid ",amino_acid_dictionary[k]," =",hist.get(k,0)
	
	#Close File
	fo.close()
#fasta_frequency(filename_from_user)
"""

#############################################################################
# STARTING GROMACS
#run the 'mdrun -version' to check if see if GROMACS is set up fine
#Exit on error
############################################################################

#WRAPPER HOME dir
WORK_HOME_DIR = os.getcwd()
#GROMACS BIN directory definition
GROMACS_BIN = '/usr/local/gromacs/bin'
print os.getcwd()
#subprocess.call('mdrun -version',shell=True)
output = subprocess.call(["mdrun","-version"])
#########
"""
#os.chdir(GROMACS_BIN)
print os.getcwd()
print os.system("source /usr/local/gromacs/bin/GMXRC")
t=subprocess.call([WORK_HOME_DIR, "./mdrun", "-version"])
print t
print os.getcwd()
#os.chdir(WORK_HOME_DIR)
print os.getcwd()
"""
#################################################################################################
#
# pdb2gmx
# For Creating GROMACS topology file from a PDB inout file
# This program reads a coordinate file, typically a PDB file, reads some database files, 
# adds hydrogens to the molecules and generates coordinates in .gro format (by default) and a 
# topology in .top #format. These files can subsequently be processed by grompp to generate a run 
# input file, tpr.
##################################################################################################
print '*'*80
print 'Total Runtime of the script >>>>',scriptname,"<<<< is ",time.time()-start," sec(s) "
print "LOGFILE >"+logfile_name +"<<<<< END <<<<<<<<<<\n"
print '*'*80
LOGFILE.write("Total Runtime of the script >>> "+scriptname+" <<< is "+str(time.time()-start)+"sec(s)\n")
LOGFILE.write('*'*80+"\n")
LOGFILE.write("LOGFILE >"+logfile_name +"<<<<< END <<<<<<<<<<\n" )
LOGFILE.write('*'*80)
LOGFILE.close()
##########################
