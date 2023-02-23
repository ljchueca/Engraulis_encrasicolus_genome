#!/bin/bash

#SBATCH --job-name=03_trinity
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=200G
#SBATCH --cpus-per-task=40

module load trinity/2.11.0

LF=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/02_trimmomatic/BIOMAN2202_EKRO220002521-1A_H25LYDSX5_L4_1_paired.fq.gz
RG=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/02_trimmomatic/BIOMAN2202_EKRO220002521-1A_H25LYDSX5_L4_2_paired.fq.gz
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/03_trinity

Trinity --seqType fq --max_memory 200G --left ${LF} --right ${RG} --CPU 40 --output ${OUT}