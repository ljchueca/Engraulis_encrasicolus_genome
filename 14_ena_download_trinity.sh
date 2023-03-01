#!/bin/bash

#SBATCH --job-name=14_ena_download_trinity
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=40

module load trinity/2.11.0

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trinity
#CPU per task
CPU=40
#Archivo 
FILE=trinity_file.txt

Trinity --seqType fq --max_memory 200G --samples_file ${FILE} --CPU ${CPU} --output ${IN}
