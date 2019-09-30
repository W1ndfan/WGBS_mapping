#!/bin/bash
#PBS -k oe
#PBS -l nodes=4:ppn=4
#PBS -l vmem=40gb
#PBS -l walltime=24:00:00
#PBS -N mapping

cd /project/waterland/VTRN_mapping/trimmed_reads_paired
~/bismark/bismark --gzip -o /project/waterland/VTRN_mapping/771403_mapping --genome /project/waterland/VTRN_mapping/GRCh38_ref --path_to_bowtie2 ~/miniconda2/bin/ -1 SRR771403_1_val_1.fq.gz -2 SRR771403_2_val_2.fq.gz

