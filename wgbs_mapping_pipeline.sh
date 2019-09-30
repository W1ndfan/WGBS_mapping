#!/bin/bash
#PBS -M sfan@bcm.edu
#PBS -k oe
#PBS -l nodes=1:ppn=8
#PBS -l vmem=40gb
#PBS -l walltime=50:00:00
#PBS -N pipeline_771405

run_name="SRR771405"
root_dir="/project/waterland/VTRN_mapping/"

cur_dir=${root_dir}${run_name}
#make directory
mkdir ${cur_dir}

#download data and trim
cd ${cur_dir}
~/sra_tool/bin/fastq-dump --gzip --split-files -O ${cur_dir} ${run_name}

echo "download done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

new_dir=${cur_dir}"/trimmed_reads_paired"
mkdir ${new_dir}
cd ${cur_dir}

#need change every time!!!!!!!!!!
#!!!!!!!!!!!!
~/miniconda2/bin/trim_galore --paired -o ${new_dir} SRR771405_1.fastq.gz SRR771405_2.fastq.gz

echo "trim done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#mapping
#need change every time!!!!!!!
#!!!!!!!!!!!!!!!!!!!!!!
cd ${new_dir}
~/bismark/bismark -o ${cur_dir} --gzip --genome /project/waterland/VTRN_mapping/GRCh38_ref --path_to_bowtie2 ~/miniconda2/bin/ -1 SRR771405_1_val_1.fq.gz -2 SRR771405_2_val_2.fq.gz 

echo "mapping done"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#query name sort
cd ${cur_dir}
java -jar ~/picard.jar SortSam I=SRR771405_1_val_1_bismark_bt2_pe.bam O=queryname_sorted_SRR771405.sam SORT_ORDER=queryname TMP_DIR=/project/waterland/VTRN_mapping/tmp

echo "query name sorted"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#deduplication
cd ${cur_dir}
java -jar ~/picard.jar MarkDuplicates I=queryname_sorted_SRR771405.sam O=SRR771405_deduplicated.sam M=SRR771405_dup_metrics.txt REMOVE_DUPLICATES=true

echo "deduplicated"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

#sam coordinate sort
cd ${cur_dir}
~/miniconda2/bin/samtools sort -o SRR771405_coordinate_sorted.sam SRR771405_deduplicated.sam
echo "coordinate sorted"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

echo "all set"

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

