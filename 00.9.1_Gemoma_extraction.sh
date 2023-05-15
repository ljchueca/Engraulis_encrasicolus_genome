#!/bin/bash
  
#SBATCH --job-name=01_Gemoma_extraction
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=30G
#SBATCH --cpus-per-task=64

module load gemoma/1.8

#Mapped reads file
MAP=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.3_RNA_hisat2/Enen_input.bam

java -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI ERE m=${MAP} c=true

