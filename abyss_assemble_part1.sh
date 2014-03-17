#!/bin/bash

SCRIPT_DIR=$(readlink -f ${0%/*})

R1=$1
R2=$2
NAME=$3
echo "Assemble with Abyss $R1 $R2 $NAME"

#MPI WITH QSUB 

echo "R1 is $R1"
echo "R2 is $R2"
echo "NAME is $3"

qsub $SCRIPT_DIR/submit_abyss.sh $NAME $R1 $R2

#CLEAN UP 
