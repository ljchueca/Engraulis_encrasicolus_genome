#!/bin/bash

#SBATCH --job-name=00.2.2_backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load backmap/0.5

#Assembly
AS=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.2_flye/assembly.fasta
#Hifi reads
HI=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Output directory
OUT=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.2_flye/backmap
#CPU per task
CPU=48

backmap.pl -a ${AS} -hifi ${HI} -t 48 -v -o ${OUT}