#!/bin/bash
  
#SBATCH --job-name=00.8.3.1_samtools
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load samtools/1.15.1 

#Convert sam file to bam file
 samtools view -S -b Enen_input.sam > Enen_input.bam