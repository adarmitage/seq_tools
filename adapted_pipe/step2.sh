#!/bin/bash

# Step 2 in the assembly pipeline. 

# flash extension of F and R paired-end reads

#######  Step 2	 ########
# 	Flash reads			#
#########################


flash $F_READ $R_READ -o $ASSEMBLY_NAME

