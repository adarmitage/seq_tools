#!/bin/bash

# Step 4 in the assembly pipeline. 

# Perform velvet assembly and summarise assemblies


#######  Step 4a ########
# 		Assemble		#
#########################

echo "ASSEMBLY_NAME    EXP_COV        HASH_LENGTH	N50	MAX_CONTIG	NO_CONITG	NO_BP" > "$ASSEMBLY_NAME"_stats.txt

cd $PWD
for HASH_LENGTH in $( seq 41 10 101 ); do
        /home/armita/scripts/assemble.sh $HASH_LENGTH $EXTENDED_READ_TRIM $F_REMAINDER_TRIM $R_REMAINDER_TRIM $ASSEMBLY_NAME $COVERAGE $MIN_COV
done


#######  Step 4b  ########
#       Cleanup         #
#########################

gzip *.fastq
