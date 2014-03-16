#!/bin/bash
#part 3

~/prog/CORTEX_release_v1.0.5.21/scripts/calling/run_calls.pl --first_kmer 31 \
--last_kmer 61 \
--kmer_step 30 \
--fastaq_index ref.k31.ctx --auto_cleaning yes \
--bc yes --pd no \
--outdir m9_var \
--outvcf m9_var_vcf \
--ploidy 1 \
--stampy_hash gdel.stidx \
--stampy_bin stampy.py \
--list_ref_fasta FILELIST \
--refbindir ref/ \
--genome_size 2800000 \
--max_read_len 100 \
--qthresh 5 \
--mem_height 17 --mem_width 100 \
--vcftools_dir /path/vcftools_0.1.8a/ \
--do_union yes \
--ref CoordinatesAndInCalling \
--workflow independent \
--logfile logfile log.txt \
--apply_pop_classifier 
