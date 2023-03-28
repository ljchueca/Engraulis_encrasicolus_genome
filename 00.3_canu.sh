#!/bin/bash

#SBATCH --job-name=00.3_canu
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load canu/2.2

# Loading requirement: perl/5.30.0 java/1.8.0_221 gnuplot/5.2.8

#Input directory
IN=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Assembly directory
D=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.3_canu
#Prefijo del assembly
P=00.3_canu

canu -d ${D} -p ${P} genomeSize=1.74g minInputCoverage=4 -pacbio-hifi ${IN}
