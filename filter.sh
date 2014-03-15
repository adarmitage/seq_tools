#!/bin/bash

SCRIPT_DIR=$(readlink -f ${0%/*})
FWD=$1
REV=$2

echo "Concatonate files"

cat ./lane1_trim/LIB2429_NoIndex_L008_R1* ./lane2_trim/LIB2429_NoIndex_L005_R1* >R1.fastq
cat ./lane1_trim/LIB2429_NoIndex_L008_R2* ./lane2_trim/LIB2429_NoIndex_L005_R2* >R2.fastq

mkdir filtered
mkdir phix

#send the reads to bowtie to get the phi X removed 
qsub $SCRIPT_DIR/submit_filter.sh $FWD $REV $SCRIPT_DIR


