#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=8
#PBS -l vmem=40gb
#PBS -l walltime=48:00:00
#PBS -N deduplication

cd /project/waterland/VTRN_mapping/771403_mapping
java -jar ~/picard.jar MarkDuplicates I=queryname_sorted_SRR771403.sam O=SRR771403_deduplicated.sam M=SRR771403_dup_metrics.txt REMOVE_DUPLICATES=true 
