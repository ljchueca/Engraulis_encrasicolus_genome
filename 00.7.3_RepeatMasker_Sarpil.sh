#!/bin/bash
  
#SBATCH --job-name=00.7.3_RepeatMasker
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load repeatmasker/4.1.4

GE=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.7_relationed_species/Louro_et_al_2019-Sardine-GCA_900499035.1_SP_G_genomic.fna

RepeatMasker -engine wublast -species 'Sardina pilchardus' -s -no_is -cutoff 255 -frag 20000 ${GE}
