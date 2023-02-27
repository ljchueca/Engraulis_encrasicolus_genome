#!/bin/bash

#SBATCH --job-name=14.1_ena_dowload_trinity
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=200G
#SBATCH --cpus-per-task=40

module load trinity/2.11.0

LF=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/13_trimmomatic/SRR4431659_1_paired.fq.gz
RG=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/13_trimmomatic/SRR4431659_1_paired.fq.gz
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/14_trinity

Trinity --seqType fq --max_memory 200G --left ${LF} --right ${RG} --CPU 40 --output ${OUT}