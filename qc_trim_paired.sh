#!/bin/bash
#PBS -k oe
#PBS -l nodes=4:ppn=4
#PBS -l vmem=40gb
#PBS -l walltime=24:00:00
#PBS -N qc_trimming_paired

cd miniconda2
cd bin
./trim_galore --paired -o /project/waterland/VTRN_mapping/trimmed_reads_paired /project/waterland/VTRN_mapping/SRR771403/SRR771403_1.fastq.gz /project/waterland/VTRN_mapping/SRR771403/SRR771403_2.fastq.gz

