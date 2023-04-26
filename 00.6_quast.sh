#!/bin/bash

#SBATCH --job-name=00.6.quast
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=38

module load quast/5.0.2

#Output directory
OUT=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.6_quast
#Genome 1
GEM1=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa
#Genome 2
GEM2=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.5_hifiasm_HiC/Enen_hic_hifiasm.hic.p_ctg.fa
#CPU per task
CPU=38

quast.py -o ${OUT} -m 500 -t ${CPU} \
 ${GEM1} \
 ${GEM2}