#!/bin/bash

# Step 0 in the assembly pipeline. 

# Builds an assembly metafile containing the stored variables used throughout the pipeline
# Controls running of the pipe. Including which sections of the pipe are run.
# The presence of the metafile means that the pipe can be stopped at a certain section and
# continued from the same point at a later point in time.


#######  Step 0	 ########
# 		Pipe control	#
#########################

if [ -a assembly_metafile.txt ]
	then 
		PATH_F_GZ=$(grep -v '#' assembly_metafile.txt | grep PATH_F_GZ | cut -d '	' -f2)
		PATH_R_GZ=$(grep -v '#' assembly_metafile.txt | grep PATH_R_GZ | cut -d '	' -f2)
		PATH_RAW_F=
		PATH_RAW_R=
		MP_PRESENT=
		MP_REVCOMP_F=
		MP_REVCOMP_R=
		PATH_EXT_READS=
		PATH_REMAINDER_F=
		PATH_REMAINDER_R=
		EST_SIZE=
		HASH_LENGTH=
		EST_COV=
		
		echo "The following variables have been set:"
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
		
	else
		printf "#	PATH_F_GZ		PATH TO COMPRESSED FORWARD READ\n#	PATH_R_GZ		PATH TO COMPRESSED REVERSE READ\n#\n#	PATH_RAW_F			PATH TO DECOMPRESSED FORWARD READ\n#	PATH_RAW_R			PATH TO DECOMPRESSED REVERSE READ\n#\n#	MP_PRESENT			PRESENCE OF MATE PAIR LIBRARY\n#	MP_REVCOMP_F		PATH TO DECOMPRESSED REVERSE COMPLIMENT MATE-PAIR FORWARD READ\n#	MP_REVCOMP_R		PATH TO DECOMPRESSED REVERSE COMPLIMENT MATE-PAIR REVERSE READ\n#\n#	PATH_EXT_READS		PATH TO EXTENDED READS\n# 	PATH_REMAINDER_F	PATH TO UNEXTENDED FORWARDS READS\n#	PATH_REMAINDER_R	PATH TO UNEXTENDED REVERSE READS\n#\n#	EST_SIZE			ESTIMATED GENOME SIZE\n#	HASH_LENGTH		HASH LENGTH\n#	EST_COV			ESTIMATED COVERAGE\nPATH_F_GZ=	sweet\nPATH_R_GZ=	dude\nPATH_RAW_F=\nPATH_RAW_R=\nMP_PRESENT=\nMP_REVCOMP_F=\nMP_REVCOMP_R=\nPATH_EXT_READS=\nPATH_REMAINDER_F=\nPATH_REMAINDER_R=\nEST_SIZE=\nHASH_LENGTH=\nEST_COV=\n" > assembly_metafile.txt
		echo "Created: assembly_metafile.txt in $PWD"
fi

exit