#!/bin/bash
  
#SBATCH --job-name=06_Gemoma_Extractor
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=10

module load gemoma/1.8


java  -Xmx9G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI Extractor \
a=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/04_GeMoMa_GAF/05_annotation_finalizer/final_annotation.gff \
g=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/04_GeMoMa_GAF/Enen_hifiasm_simply.masked.fasta \
p=true \
c=true