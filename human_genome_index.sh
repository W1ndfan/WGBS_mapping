#!/bin/bash
#PBS -M sfan@bcm.edu
#PBS -k oe
#PBS -l nodes=4:ppn=4
#PBS -l vmem=60gb
#PBS -l walltime=24:00:00
#PBS -N genome_indexing

cd bismark
./bismark_genome_preparation --path_to_aligner /home/sfan/miniconda2/bin --verbose ~/GRCh38_ref
