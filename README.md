seq_tools
=========

Sequencing tools for QC and assembly

###FILTER BAD READS AND CYCLES####
process_fastq.sh 
[~/git_stuff/seq_tools/process_fastq.sh lane1 LIB2429 NoIndex L008 trim]]
requires info about lane diretory library name index number and directory for output

will take a pair of PE reads and do a fastq trim with the following settings:
-C 10000000 -u -k 20 -t 0.01 -p 20

farmed out to the cluster

#######Filter out PhiX with#####:

~/git_stuff/seq_tools/filter.sh R1.fastq R2.fastq
which uses bowtie on the high mem node to filter out phix reads 


####CORTEX ASSEMBLY#######


#CURRRETLY FOR REFERENCE GUIDED ASSEMBLY
#PART 1 DOES THE CORTEX HASH TABLES
cortex_assemble_part1.sh
#PART 2 CREATES A REFERENCE HASH TABLE FROM STAMPY
cortex_assemble_part2.sh
#CALLS VARIANTS
cortex_assemble_part3.sh


####aBYSS

~/git_stuff/seq_tools/abyss_assemble_part1.sh ./filtered/filtered.test.1 ./filtered/filtered.test.2 m9_test

