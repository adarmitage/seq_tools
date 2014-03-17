#!/bin/bash

#Assemble contigs using abyss
#$ -S /bin/bash
#$ -cwd
#$ -l virtual_free=94G

NAME=$1
R1=$2
R2=$3
WORK_DIR=$TMPDIR
DEST=$4

echo  "Running abyss with the following \n abyss-pe np=16 k=45 name=$NAME in='$R1 $R2' $DEST "

cd $WORK_DIR
abyss-pe np=16 k=45 name=$NAME in="$R1 $R2" 
cp * $DEST/.
