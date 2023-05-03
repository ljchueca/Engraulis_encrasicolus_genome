#!/bin/bash
  
#SBATCH --job-name=00.9.1_Gemoma_extraction
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=30G
#SBATCH --cpus-per-task=64

module load gemoma/1.8

#Mapped reads file
MAP=.bam

java -jar GeMoMa-1.8.jar CLI ERE m=${MA} c=true

