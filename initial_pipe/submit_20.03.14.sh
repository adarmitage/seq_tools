#!/bin/bash
# Simple script to automate submitting assembly jobs to SGE

cd $PWD

qsub /home/armita/scripts/assembly_pipe.sh cact404_app_F.fastq.gz cact404_app_R.fastq.gz

qsub /home/armita/scripts/assembly_pipe.sh cact411_app_F.fastq.gz cact411_app_R.fastq.gz

qsub /home/armita/scripts/assembly_pipe.sh cact414_app_F.fastq.gz cact414_app_R.fastq.gz

qsub /home/armita/scripts/assembly_pipe.sh ideai371_F.fastq.gz ideai371_R.fastq.gz
