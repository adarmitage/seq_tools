#!/bin/bash
# Submit jobs to assembly_pipe.sh for all paired reads in /raw_dna/paired

# Will collect Genome size and insert length value from the command line
# if no values are given then default values are used.

GENOME_SZ=$(if [$1] ; then; echo "$1"; else ; echo "35" ; fi)
INS_LGTH=$(if [$2] ; then; echo "$2"; else ; echo "700" ; fi)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"	

for F_READ in raw_dna/paired/*/*/F/*; do 

	R_TMP=$(echo $F_READ | sed 's/F.*//')
	R_READ=$(ls "$R_TMP"R/* | cat)

	echo "submitting job for:"
	echo "$F_READ"
	echo "$R_READ"
	echo "The estimated genome size you supplied is:"
	echo "$GENOME_SZ"
	echo "The insert length of your paired reads is:"
	echo "$INS_LGTH"
	
	
	cp $F_READ $F_READ.2.gz
	cp $R_READ $R_READ.2.gz

	gunzip $F_READ.2.gz
	gunzip $R_READ.2.gz 
	
	F_INFILE=$(echo $F_READ.2 | sed 's/.gz.2//')
	R_INFILE=$(echo $R_READ.2 | sed 's/.gz.2//')
	
	mv $F_READ.2 $F_INFILE
	mv $R_READ.2 $R_INFILE
	
	qsub $SCRIPT_DIR/assembly_pipe.sh $F_INFILE $R_INFILE $GENOME_SZ $INS_LGTH $SCRIPT_DIR


done
