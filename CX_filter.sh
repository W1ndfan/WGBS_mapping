#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=8
#PBS -l vmem=40gb
#PBS -l walltime=30:00:00
#PBS -N CpG_binning_771403

SRA_num="SRR771403"
input_dir="/project/waterland/VTRN_mapping/"$SRA_num

cd $input_dir

python /home/sfan/github_download/CX-Bin/CX_filtering.py -b 200 -c CG -wx SRR771403_1_val_1_bismark_bt2_pe_19_pre.sam.CpG_report.txt.gz
