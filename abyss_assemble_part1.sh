#!/bin/bash

SCRIPT_DIR=$(readlink -f ${0%/*})

R1=$1
R2=$2
NAME=$3
WORK_DIR=$4
echo "Assemble with Abyss $R1 $R2 $NAME"

#MPI WITH QSUB 

echo "R1 is $R1"
echo "R2 is $R2"
echo "NAME is $3"

qsub $SCRIPT_DIR/submit_abyss.sh $NAME $R1 $R2 $WORK_DIR


# ~/git_stuff/seq_tools/abyss_assemble_part1.sh /home/groups/harrisonlab/m9_assembly/filtered/filtered.test.1.fa\
# /home/groups/harrisonlab/m9_assembly/filtered/filtered.test.2.fa m9_test /home/groups/harrisonlab/m9_assembly/m9_test/
