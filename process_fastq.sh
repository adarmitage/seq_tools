#!/bin/bash
SCRIPT_DIR=$(readlink -f ${0%/*})
FORWARD_READ=$1
REVERSE_READ=$2

echo $SCRIPT_DIR
echo "Trimming FastQ files"
$SCRIPT_DIR/fastq-mcf illumina_full_adapters.fa $FORWARD_READ $REVERSE_READ -o  -o $FORWARD_READ.trim $REVERSE_READ.trim -C 10000000 -u -k 20 -t 0.01 -p 20

