#!/bin/bash

SCRIPT_DIR=$(readlink -f ${0%/*})

R1=$1
R2=$2
NAME=$3
echo "Assemble with Abyss"

#MPI WITH QSUB DOESN'T WORK
#qsub $SCRIPT_DIR/submit_abyss.sh $R1 $R2 $NAME

#SINGLE COMMAND

abyss-pe np=8 k=45 name=m9_abyss \
    in='/home/groups/harrisonlab/m9_assembly/filtered/filtered.test.1 /home/groups/harrisonlab/m9_assembly/filtered/filtered.test.2'
