#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=8
#PBS -l vmem=40gb
#PBS -l walltime=30:00:00
#PBS -N queryname_sort_with_tmp

cd /project/waterland/VTRN_mapping/771403_mapping
java -jar ~/picard.jar SortSam I=SRR771403_1_val_1_bismark_bt2_pe.sam.gz O=queryname_sorted_SRR771403.sam SORT_ORDER=queryname TMP_DIR=/project/waterland/VTRN_mapping/tmp
