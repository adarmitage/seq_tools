#!/bin/bash

# Step 3 in the assembly pipeline. 

# Quality trimming of reads
# Removal of any phiX contamination from reads
# Preceeded and followed by quality checking
# Estimate coverages before and after trimming

#######  Step 3a ########
# 	Quality trim		#
#########################

fastq-mcf $ILLUMINA_ADAPTERS $EXTENDED_READ -o $EXTENDED_READ_TRIM -C 1000000 -u -k 20 -t 0.01 -q 30 -p 5

fastq-mcf $ILLUMINA_ADAPTERS $F_REMAINDER $R_REMAINDER -o $F_REMAINDER_TRIM -o $R_REMAINDER_TRIM -C 1000000 -u -k 20 -t 0.01 -q 30 -p 5

#######  Step 3b ########
# 	Estimate coverage	#
#########################

EST_COV_EXT=$(count_nucl.pl -i $EXTENDED_READ_TRIM -g 65 | tail -n1 | cut -d ' ' -f10)

EST_COV_REMAINDER=$(count_nucl.pl -i $F_REMAINDER_TRIM -i $R_REMAINDER_TRIM -g 65 | tail -n1 | cut -d ' ' -f10)

COVERAGE=$(perl -e '$sum=$ARGV[0]+$ARGV[1]; print "$sum\n";exit;' $EST_COV_EXT $EST_COV_REMAINDER)
MIN_COV=$(perl -e '$sum=$ARGV[0]/3; print "$sum\n";exit;' $COVERAGE)
echo ""
echo "the estimated coverage of the extended sequences is: $EST_COV_EXT"
echo "the estimated coverage of the forward and reverse reads is: $EST_COV_REMAINDER"

echo "the estimated combined coverage is: $COVERAGE"


#######  Step 3c ########
# 	Cleanup		#
#########################

rm $F_READ
rm $R_READ

rm $ASSEMBLY_NAME.*
