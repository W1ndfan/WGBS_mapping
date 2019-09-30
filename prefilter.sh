#!/bin/bash
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=8
#PBS -l vmem=30GB
#PBS -N prefilter

cd /project/waterland/VTRN_mapping/SRR771401
sed -i "/0\s+0/d" SRR771401_1_val_1_bismark_bt2_pe.CpG_report.txt>SRR771401_1_val_1_bismark_bt2_pe_pre.CpG_report.txt

