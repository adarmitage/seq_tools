#!/bin/bash
# Submit jobs to assembly_pipe.sh for all paired reads in /raw_dna/paired

GENOME_SZ=35
INS_LGTH=700


for F_READ in raw_dna/paired/*/*/F/*; do 

	echo "submitting job for:"
	echo "$F_READ"
	
#	R_PATH=${F_READ%F/*}R/*
	R_TMP=$(echo $F_READ | sed 's/F.*//')
	R_READ=$(ls "$R_TMP"R/* | cat)	


	echo "$R_READ"
	
	cp $F_READ $F_READ.2.gz
	cp $R_READ $R_READ.2.gz

	gunzip $F_READ.2.gz
	gunzip $R_READ.2.gz 
	
	F_INFILE=$(echo $F_READ.2 | sed 's/.gz.2//')
	R_INFILE=$(echo $R_READ.2 | sed 's/.gz.2//')
	
	mv $F_READ.2 $F_INFILE
	mv $R_READ.2 $R_INFILE
	
	qsub /home/armita/git_repos/seq_tools/initial_pipe/assembly_pipe.sh $F_INFILE $R_INFILE $GENOME_SZ $INS_LGTH

done
