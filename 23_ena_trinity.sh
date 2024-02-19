#!/bin/bash

#SBATCH --job-name=23_ena_trinity
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=40

module load trinity/2.11.0

#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.3_rna_ena/trinity
#CPU per task
CPU=40
#Archivo 
FILE=0.3_trinity_file.txt

Trinity --seqType fq --max_memory 200G --samples_file ${FILE} --CPU ${CPU} --output ${OUT}