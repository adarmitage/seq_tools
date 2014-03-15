seq_tools
=========

Sequencing tools for QC and assembly

process_fastq.sh 
[~/git_stuff/seq_tools/process_fastq.sh lane1 LIB2429 NoIndex L008 trim]]
requires info about lane diretory library name index number and directory for output

will take a pair of PE reads and do a fastq trim with the following settings:
-C 10000000 -u -k 20 -t 0.01 -p 20

farmed out to the cluster

Filter out PhiX with:

~/git_stuff/seq_tools/filter.sh R1.fastq R2.fastq
which uses bowtie on the high mem node to filter out phix reads 
