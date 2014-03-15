#!/bin/bash
SCRIPT_DIR=$(readlink -f ${0%/*})
LANE=$1
LIB=$2
INDEX=$3
LN=$4
TRIM=$5
HD=`pwd`
echo Processing FastQ files
mkdir $LANE"_"$TRIM
TRIM_DIR=$LANE"_"$TRIM
cd $LANE

for FWD in $( ls $LIB"_"$INDEX"_"$LN"_R1"* ); do
	cd $HD
#	pwd
#       echo $FWD
	REV=$(sed -e"s/R1/R2/g" <<< $FWD) 
#	echo $REV
	echo "Submitting $LANE jobs to cluster "
#	#qsub $SCRIPT_DIR/submit_process_fastq.sh $SCRIPT_DIR $FWD $REV
	qsub $SCRIPT_DIR/submit_process_fastq.sh $SCRIPT_DIR $FWD $REV $LANE $TRIM_DIR
#	$SCRIPT_DIR/submit_process_fastq.sh $SCRIPT_DIR $FWD $REV $LANE $TRIM_DIR
done 

