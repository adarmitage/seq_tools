#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 1
#$ -l virtual_free=90G

WORK_DIR=$TMPDIR
#SCRIPT_DIR=$3
FWD=$1
REV=$2
SCRIPT_DIR=$3

#echo $FWD $REV
bowtie2-build $SCRIPT_DIR/phix.fa phix_174
bowtie2 -x phix_174 -p 8 -1 $FWD -2 $REV -S ./phix/phix.sam --un-conc filtered 

mv filtered.* ./filtered/.
