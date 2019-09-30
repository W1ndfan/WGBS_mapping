#!/bin/bash
#PBS -M sfan@bcm.edu
#PBS -k oe
#PBS -l nodes=1:ppn=8
#PBS -l vmem=40gb
#PBS -l walltime=50:00:00
#PBS -N pipeline_771402

#make directory
#mkdir /project/waterland/VTRN_mapping/SRR771402

#download data and trim
#cd /project/waterland/VTRN_mapping/SRR771402
#~/sra_tool/bin/fastq-dump --gzip --split-files -O /project/waterland/VTRN_mapping/SRR771402  SRR771402

#echo "download done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#mkdir /project/waterland/VTRN_mapping/SRR771402/trimmed_reads_paired

#~/miniconda2/bin/trim_galore --paired -o /project/waterland/VTRN_mapping/SRR771402/trimmed_reads_paired /project/waterland/VTRN_mapping/SRR771402/SRR771402_1.fastq.gz /project/waterland/VTRN_mapping/SRR771402/SRR771402_2.fastq.gz

#echo "trim done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#mapping
#cd /project/waterland/VTRN_mapping/SRR771402/trimmed_reads_paired
#~/bismark/bismark -o /project/waterland/VTRN_mapping/SRR771402 --gzip --genome /project/waterland/VTRN_mapping/GRCh38_ref --path_to_bowtie2 ~/miniconda2/bin/ -1 SRR771402_1_val_1.fq.gz -2 SRR771402_2_val_2.fq.gz 

echo "mapping done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#query name sort
cd /project/waterland/VTRN_mapping/SRR771402
java -jar ~/picard.jar SortSam I=SRR771402_1_val_1_bismark_bt2_pe.bam O=queryname_sorted_SRR771402.sam SORT_ORDER=queryname TMP_DIR=/project/waterland/VTRN_mapping/tmp

echo "query name sorted"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#deduplication
cd /project/waterland/VTRN_mapping/SRR771402
java -jar ~/picard.jar MarkDuplicates I=queryname_sorted_SRR771402.sam O=SRR771402_deduplicated.sam M=SRR771402_dup_metrics.txt REMOVE_DUPLICATES=true

echo "deduplicated"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#sam coordinate sort
cd /project/waterland/VTRN_mapping/SRR771402
~/miniconda2/bin/samtools sort -o SRR771402_coordinate_sorted.sam SRR771402_deduplicated.sam
echo "coordinate sorted"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

echo "all set"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

