#!/bin/bash
SCRIPT_DIR=$(readlink -f ${0%/*})

for FWD in $( ls -d ./lane1/LIB2429_NoIndex_L008_R1* ); do
        #echo $FWD
	REV=$(sed -e"s/R1/R2/g" <<< $FWD) 
	#echo $REV
	echo "Submitting Lane 1 jobs to cluster"
	qsub $SCRIPT_DIR/submit_process_fastq.sh $SCRIPT_DIR $FWD $REV
	#$SCRIPT_DIR/submit_process_fastq.sh $FWD $REV
done 

