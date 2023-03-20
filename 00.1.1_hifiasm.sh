#!/bin/bash
 
#SBATCH --job-name=00.1.1_hifiasm
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load hifiasm/0.16.1

#Output prefix for the assembly
OUT=Enen_hifiasm
#Input directory
IN=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Number of CPUs
T=96

#Assembly
hifiasm -o ${OUT} -t ${T} ${IN} &&

#Convertir de gfa a fasta
gfa2fa.sh ${OUT}.bp.p_ctg.gfa