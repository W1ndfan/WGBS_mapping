#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=24
#PBS -l vmem=40gb
#PBS -l walltime=48:00:00
#PBS -N meth_extract_test 

working_dir="/project/waterland/VTRN_mapping/"
no="SRR771401"

cur_dir=$working_dir$no
cd $cur_dir

filename=$no"_1_val_1_bismark_bt2_pe.bam"

~/bismark/bismark_methylation_extractor --comprehensive --report --multicore 8 -o $cur_dir $filename --mbias_only --split_by_chromosome
