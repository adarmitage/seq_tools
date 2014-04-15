#!/bin/bash
# Submit jobs to assembly_pipe.sh for all paired reads in /raw_dna/paired

GENOME_SZ=35
INS_LGTH=700


for F_READ in raw_dna/paired/*/*/F/*;
	do  
		R_PATH=${F_READ%F/*}R/*
		R_READ=$(echo $R_PATH)
		echo "submitting job for:"
		echo "$F_READ"
		echo "$R_READ"
		qsub /home/armita/git_repos/seq_tools/initial_pipe/assembly_pipe.sh $F_READ $R_READ $GENOME_SZ $INS_LGTH
	done
