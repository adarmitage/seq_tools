#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 4
#$ -l virtual_free=4G

WORK_DIR=$TMPDIR
SCRIPT_DIR=$1
FORWARD_READ=$2
REVERSE_READ=$3
LANE=$4
TRIM=$5

#FASTQ MCF COMMAND
#fastq-mcf $SCRIPT_DIR/illumina_full_adapters.fa $FORWARD_READ $REVERSE_READ -o $WORK_DIR/$FORWARD_READ.trim -o $WORK_DIR/$REVERSE_READ.trim -C 10000000 -u -k 20 -t 0.01 -p 20
fastq-mcf $SCRIPT_DIR/illumina_full_adapters.fa "./"$LANE"/"$FORWARD_READ "./"$LANE"/"$REVERSE_READ -o "./"$TRIM"/"$FORWARD_READ.trim -o "./"$TRIM"/"$REVERSE_READ.trim -C 10000000 -u -k 20 -t 0.01 -p 20
#echo $SCRIPT_DIR/illumina_full_adapters.fa "./"$LANE"/"$FORWARD_READ "./"$LANE"/"$REVERSE_READ -o "./"$TRIM"/"$FORWARD_READ.trim -o "./"$TRIM"/"$REVERSE_READ.trim -C 10000000 -u -k 20 -t $


#rm -R $WORK_DIR
