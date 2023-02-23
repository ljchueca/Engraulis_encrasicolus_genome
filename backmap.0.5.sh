#!/bin/bash

#SBATCH --job-name=backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=48

module load backmap/0.5

AS=engrtranscriptome.fa
LF=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/02_trimmomatic/BIOMAN2202_EKRO220002521-1A_H25LYDSX5_L4_1_paired.fq.gz
RG=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/02_trimmomatic/BIOMAN2202_EKRO220002521-1A_H25LYDSX5_L4_2_paired.fq.gz
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/03_trinity/backmap

backmap.pl -a ${AS} -p ${LF},${RG} -t 48 -v -o ${OUT}
