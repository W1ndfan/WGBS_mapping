#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=4
#PBS -l vmem=40gb
#PBS -l walltime=24:00:00
#PBS -N coordinate_sort

cd /project/waterland/VTRN_mapping/771403_mapping
~/miniconda2/bin/samtools sort -o SRR771403_coordinate_sorted.sam SRR771403_deduplicated.sam

