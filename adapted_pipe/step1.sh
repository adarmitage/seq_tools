#!/bin/bash

# Step 1 in the assembly pipeline. 

# Will initiate the pipe and decompress files
# If the data is mate-paired then will generate the reverse compliment of reads.

#######  Step 1	 ########
# 	unzip reads			#
#########################


cp $F_IN $F_READ_ZIP
cp $R_IN $R_READ_ZIP

gunzip $F_READ_ZIP
gunzip $R_READ_ZIP
