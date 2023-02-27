#!/bin/bash

#SBATCH --job-name=16.2_backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=48

module load backmap/0.5

AS=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/14_trinity/ena_2_transcriptome.fa
LF=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/13_trimmomatic/SRR4431651_1_paired.fq.gz
RG=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/13_trimmomatic/SRR4431651_2_paired.fq.gz
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/14_trinity/02_backmap

backmap.pl -a ${AS} -p ${LF},${RG} -t 48 -v -o ${OUT}