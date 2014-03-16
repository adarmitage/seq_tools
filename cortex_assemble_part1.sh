#!/bin/bash

#loop this over two kmer sizes
SCRIPT_DIR=$(readlink -f ${0%/*})
#cortex_var_31_c1 --kmer_size 31 --mem_height 25 --mem_width 100 --pe_list file_list_pe1.txt,file_list_pe2.txt \
#--max_read_len 101 --remove_pcr_duplicates --dump_binary ref.k31.ctx --sample_id M9

qsub $SCRIPT_DIR/submit_part1.sh 


