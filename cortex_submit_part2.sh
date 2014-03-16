#!/bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -pe smp 1
#$ -l virtual_free=90G

WORK_DIR=$TMPDIR

stampy.py -G gdel /home/groups/harrisonlab/apple_genomes/gd_ref/Malus_x_domestica.v1.0-primary.scaffolds.fa
stampy.py -g gdel -H gdel


#cp $TMPDIR/m9.k31.ctx m9.k31.ctx
#rm -R $WORK_DIR

