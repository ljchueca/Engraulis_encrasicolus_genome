#!/bin/bash
  
#SBATCH --job-name=00.9.1_Gemoma_extractio
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load gemoma/1.8

#Mapped reads file
MAP=

java -jar GeMoMa-1.8.jar CLI ERE m=${MA} c=true

