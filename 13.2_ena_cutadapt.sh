#!/bin/bash

#SBATCH --job-name=13.2_ena_cutadapt
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=40

module load cutadapt/2.8

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trimmomatic
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/cutadapt
#CPU per task
CPU=40


for i in $(find ${IN} -name "*.fq.gz" | sed "s|"$IN"\/||" | sed 's/.fq.gz//'); do cutadapt -u 15 -j ${CPU} -o ${OUT}/${i}_cutadapt.fq.gz  ${IN}/${i}.fq.gz ; done 



