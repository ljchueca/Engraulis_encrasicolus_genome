#!/bin/bash
  
#SBATCH --job-name=00.9.4_Gemoma_GAF
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=20G
#SBATCH --cpus-per-task=10

module load gemoma/1.8


IN=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/03_GeMoMa_Pipeline/unfiltered_predictions_from_species

java -Xmx19G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI GAF \
g=${IN}/_1.gff p=DenClu \
g=${IN}/_2.gff p=CoiNa \
g=${IN}/_3.gff p=ThaAma \
g=${IN}/_4.gff p=CycLum \
g=${IN}/_5.gff p=MiSalm \
g=${IN}/_6.gff p=AloSap \
g=${IN}/_7.gff p=CluHar \
g=${IN}/_8.gff p=CypCar \
g=${IN}/_9.gff p=AAlo \
g=${IN}/_10.gff p=CarAu \
g=${IN}/_11.gff p=SerLa 
