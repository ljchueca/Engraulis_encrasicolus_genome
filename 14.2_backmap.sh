#!/bin/bash

#SBATCH --job-name=14.2_backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=48

module load backmap/0.5

#Assembly
AS=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trinity/Trinity.fasta
#Left sequence
LF=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/cutadapt/
#Right sequence
RG=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/cutadapt/
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trinity/02_backmap
#CPU per task
CPU=48

backmap.pl -a ${AS} -p ${LF},${RG} -t 48 -v -o ${OUT}