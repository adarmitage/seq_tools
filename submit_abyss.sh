#!/bin/bash

#Assemble contigs using velvet and generate summary statistics using process_contigs.pl
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 1
#$ -l virtual_free=94G

NAME=$1
R1=$2
R2=$3

abyss-pe np=8 k=45 name=$NAME \
    in='$R1 R2'

