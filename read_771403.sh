#!/bin/bash
#PBS -M sfan@bcm.edu
#PBS -k oe
#PBS -l nodes=4:ppn=4
#PBS -l vmem=40gb
#PBS -l walltime=24:00:00
#PBS -N read_771403

cd sra_tool
cd bin
./fastq-dump --gzip --split-files -O /home/sfan SRR771403
