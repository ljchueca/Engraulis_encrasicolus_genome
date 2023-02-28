#!/bin/bash

#SBATCH --job-name=13.3_ena_cutadapt_fastqc
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load fastqc/0.11.9 multiqc/1.9

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/cutadapt
#CPUs pert task
CPU=6

#Fastqc de los resultados de cutadapt
fastqc -t ${CPU} ${IN}/*.gz &&
#Resumir fastqc
multiqc ${IN}


