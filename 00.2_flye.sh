#!/bin/bash

#SBATCH --job-name=00.2_flye
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load flye/2.9

#Input
IN=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Ourput directory
OUT=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.2_flye
#Number of CPUs
T=96

flye --pacbio-hifi ${IN} -g 1.74g -o ${OUT} -t 96