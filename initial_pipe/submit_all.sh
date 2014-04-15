#!/bin/bash
# Submit jobs to assembly_pipe.sh for all paired reads in /raw_dna/paired


for F_READ in raw_dna/paired/*/*/F/*;
	do  
		R_PATH=${F_READ%F/*}R/*
		R_READ=$(echo $R_PATH)
		echo "submitting job for:"
		echo "$F_READ"
		echo "$R_READ"
		qsub /home/armita/scripts/assembly_pipe.sh $F_READ $R_READ
	
	done
