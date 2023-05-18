#!/bin/bash

#SBATCH --job-name=01_GeMoMa_AnnotationFinalizer
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=main

#SBATCH --mem=20G

#SBATCH --cpus-per-task=10

#### Commands to run on the cluster (has to be prefixed by "srun")

module load gemoma/1.8

java -Xmx19G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI AnnotationFinalizer \
g=Enen_hifiasm_simply.masked.fasta \
a=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/04_GeMoMa_GAF/filtered_predictions.gff \
p=Enen \
u=YES i=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/introns.gff \
c=UNSTRANDED coverage_unstranded=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/coverage.bedgraph