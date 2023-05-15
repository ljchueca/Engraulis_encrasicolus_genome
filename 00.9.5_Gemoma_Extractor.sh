#!/bin/bash
  
#SBATCH --job-name=00.9.5_Gemoma_Extractor
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=10

module load gemoma/1.8


java  -Xmx9G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI Extractor \
a= \
g=Enen_hifiasm_simply.masked.fasta \
p=true \
c=true