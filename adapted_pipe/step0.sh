#!/bin/bash

# Step 0 in the assembly pipeline. 

# Builds an assembly metafile containing the stored variables used throughout the pipeline
# Controls running of the pipe. Including which sections of the pipe are run.
# The presence of the metafile means that the pipe can be stopped at a certain section and
# continued from the same point at a later point in time.


#######  Step 0	 ########
# 		Pipe control	#
#########################



#######  Step A  ########
# 		Collect data	#
#	from .txt file		#
#########################

# Collect from standard input the path to a forward and reverse read.
# Establish the path to the project folder from this input
# establish if a metafile already present located in a directory ('scripts')
# within the established project directory. If it does exist then load the 
# stored variables contained there. If it does not exist then make the file 
# at this location.

# collection of data from the inputs
# Derivation of paths to the project folder and to the metafile from input

PATH_TO_PROJ=$(echo $1| sed 's/raw_dna.*$//')
echo "$PATH_TO_PROJ"
PATH_TO_META=$(echo "$PATH_TO_PROJ.scripts" | sed 's/.scripts/scripts/g')
echo "$PATH_TO_META"

#########################

# Establish whether a metafile exists.
# If a metafile exists then read in variables from the file

if [ -a $PATH_TO_META/assembly_metafile.txt ]
	then 
		PATH_F_GZ=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_F_GZ | cut -d '=' -f2)
		PATH_R_GZ=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_R_GZ | cut -d '=' -f2)
		PATH_RAW_F=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_RAW_F | cut -d '=' -f2)
		PATH_RAW_R=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_RAW_R | cut -d '=' -f2)
		MP_PRESENT=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep MP_PRESENT | cut -d '=' -f2)
		MP_REVCOMP_F=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep MP_REVCOMP_F | cut -d '=' -f2)
		MP_REVCOMP_R=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep MP_REVCOMP_R | cut -d '=' -f2)
		PATH_EXT_READS=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_EXT_READS | cut -d '=' -f2)
		PATH_REMAINDER_F=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_REMAINDER_F | cut -d '=' -f2)
		PATH_REMAINDER_R=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep PATH_REMAINDER_R | cut -d '=' -f2)
		EST_SIZE=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep EST_SIZE | cut -d '=' -f2)
		HASH_LENGTH=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep HASH_LENGTH | cut -d '=' -f2)
		EST_COV=$(grep -v '#' $PATH_TO_META/assembly_metafile.txt | grep EST_COV | cut -d '=' -f2)
		
		echo "The following variables have been read from the metafile:"
		echo "$PATH_F_GZ"
		echo "$PATH_R_GZ"
		echo "$PATH_RAW_F"
		echo "$PATH_RAW_R"
		echo "$MP_PRESENT"
		echo "$MP_REVCOMP_F"
		echo "$MP_REVCOMP_R"
		echo "$PATH_EXT_READS"
		echo "$PATH_REMAINDER_F"
		echo "$PATH_REMAINDER_R"
		echo "$EST_SIZE"
		echo "$HASH_LENGTH"
		echo "$EST_COV"

# Establish whether a metafile exists.
# If a metafile does not exist then create one.
		
	else
		printf "#	PATH_F_GZ		PATH TO COMPRESSED FORWARD READ\n#	PATH_R_GZ		PATH TO COMPRESSED REVERSE READ\n#\n#	PATH_RAW_F			PATH TO DECOMPRESSED FORWARD READ\n#	PATH_RAW_R			PATH TO DECOMPRESSED REVERSE READ\n#\n#	MP_PRESENT			PRESENCE OF MATE PAIR LIBRARY\n#	MP_REVCOMP_F		PATH TO DECOMPRESSED REVERSE COMPLIMENT MATE-PAIR FORWARD READ\n#	MP_REVCOMP_R		PATH TO DECOMPRESSED REVERSE COMPLIMENT MATE-PAIR REVERSE READ\n#\n#	PATH_EXT_READS		PATH TO EXTENDED READS\n# 	PATH_REMAINDER_F	PATH TO UNEXTENDED FORWARDS READS\n#	PATH_REMAINDER_R	PATH TO UNEXTENDED REVERSE READS\n#\n#	EST_SIZE			ESTIMATED GENOME SIZE\n#	HASH_LENGTH		HASH LENGTH\n#	EST_COV			ESTIMATED COVERAGE\nPATH_F_GZ=\nPATH_R_GZ=\nPATH_RAW_F=\nPATH_RAW_R=\nMP_PRESENT=\nMP_REVCOMP_F=\nMP_REVCOMP_R=\nPATH_EXT_READS=\nPATH_REMAINDER_F=\nPATH_REMAINDER_R=\nEST_SIZE=\nHASH_LENGTH=\nEST_COV=\n" > $PATH_TO_META/assembly_metafile.txt
		if  [ -a $PATH_TO_META/assembly_metafile.txt ]
			then
				echo "Metafile created: assembly_metafile.txt in $PATH_TO_META"
		fi
fi


#########################

# set inputs as variables in metafile
# set path to forwards reads
# set path to reverse reads

PATH_F_GZ=$1
PATH_R_GZ=$2

#########################

# modify metafile with inputs

cp $PATH_TO_META/assembly_metafile.txt $PATH_TO_META/assembly_metafile.tmp
cat $PATH_TO_META/assembly_metafile.tmp | sed "s#PATH_F_GZ=.*#PATH_F_GZ=	$PATH_F_GZ#g" > $PATH_TO_META/assembly_metafile.txt
rm $PATH_TO_META/assembly_metafile.tmp

cp $PATH_TO_META/assembly_metafile.txt $PATH_TO_META/assembly_metafile.tmp
cat $PATH_TO_META/assembly_metafile.tmp | sed "s#PATH_R_GZ=.*#PATH_R_GZ=	$PATH_R_GZ#g" > $PATH_TO_META/assembly_metafile.txt
rm $PATH_TO_META/assembly_metafile.tmp

exit