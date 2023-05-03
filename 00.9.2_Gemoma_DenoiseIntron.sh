#!/bin/bash
  
#SBATCH --job-name=00.9.2_Gemoma_DenoiseIntrons
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=30G
#SBATCH --cpus-per-task=64

module load gemoma/1.8

java  -Xmx140G -jar GeMoMa-1.8.jar CLI DenoiseIntrons \
i=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/ \
coverage_unstranded=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction

