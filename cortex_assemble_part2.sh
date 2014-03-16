#!/bin/bash

#this is the next job

SCRIPT_DIR=$(readlink -f ${0%/*})
qsub $SCRIPT_DIR/submit_part2.sh 


