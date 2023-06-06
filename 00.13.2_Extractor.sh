#!/bin/bash
  
#SBATCH --job-name=02_proteins_extractor
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=10

module load gemoma/1.8


java  -Xmx9G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI Extractor \
a=Enen.all.fun.3.nodup.gff3 \
g=Enen_hifiasm_simply.masked.fasta \
p=true \
c=true