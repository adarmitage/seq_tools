#!/bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -pe smp 1
#$ -l virtual_free=90G

WORK_DIR=$TMPDIR

cortex_var_31_c1 --kmer_size 31 --mem_height 25 --mem_width 100 --pe_list file_list_pe1.txt,file_list_pe2.txt \
--max_read_len 101 --remove_pcr_duplicates --dump_binary $TMPDIR/m9.k31.ctx --sample_id M9 

cp $TMPDIR/m9.k31.ctx m9.k31.ctx
rm -R $WORK_DIR

