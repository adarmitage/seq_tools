#!/bin/bash
# Submit a single job to assembly_pipe.sh specifying a single
# forward and reverse read from the directory structure.

# Will collect Genome size and insert length value from the command line
# if no values are given then default values are used.

F_READ=$1
R_READ=$2
if [$3]; then GENOME_SZ=$3; else GENOME_SZ=35; fi
if [$4]; then INS_LGTH=$4; else INS_LGTH=700; fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"	

echo "submitting job for:"
echo "$F_READ"
echo "$R_READ"
echo "The estimated genome size you supplied is:"
echo "$GENOME_SZ"
echo "The insert length of your paired reads is:"
echo "$INS_LGTH"
	
cp $F_READ $F_READ.2.gz
cp $R_READ $R_READ.2.gz

gunzip $F_READ.2.gz
gunzip $R_READ.2.gz 
	
F_INFILE=$(echo $F_READ.2 | sed 's/.gz.2//')
R_INFILE=$(echo $R_READ.2 | sed 's/.gz.2//')
	
mv $F_READ.2 $F_INFILE
mv $R_READ.2 $R_INFILE
	
qsub $SCRIPT_DIR/assembly_pipe.sh $F_INFILE $R_INFILE $GENOME_SZ $INS_LGTH $SCRIPT_DIR


