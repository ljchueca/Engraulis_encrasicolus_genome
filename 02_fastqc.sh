#!/bin/bash

#SBATCH --job-name=02_fastqc
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load fastqc/0.11.9 multiqc/1.9 
# fastqc muestras RNA (huevo) BIOMAN2201
# && para que lo ejecute despues de este, pero cuando ha funcionado bien
fastqc -t 6 *.gz &&
#resumir datos de Fast qc
multiqc /cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/01_fastqc/BIOMAN2202