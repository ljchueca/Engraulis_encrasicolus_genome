#!/bin/bash

#SBATCH --job-name=12_ena_dowload_fastqc
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load fastqc/0.11.9 multiqc/1.9

OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/raw_data/fastqc
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/raw_data/ena_data

fastqc -o ${OUT} -t 6 ${IN}/*.gz &&

multiqc ${OUT}