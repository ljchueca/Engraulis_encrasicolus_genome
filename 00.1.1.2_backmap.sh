#!/bin/bash

#SBATCH --job-name=00.1.2_backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=100G
#SBATCH --cpus-per-task=48

module load backmap/0.5

#Assembly
AS=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa
#Hifi reads
HI=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Output directory
OUT=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/backmap
#CPU per task
CPU=48

backmap.pl -a ${AS} -hifi ${HI} -t 48 -v -o ${OUT}