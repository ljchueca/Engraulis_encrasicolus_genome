#!/bin/bash

#SBATCH --job-name=01_multiqc
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load multiqc/1.9 

multiqc /cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/01_fastqc/BIOMAN2201