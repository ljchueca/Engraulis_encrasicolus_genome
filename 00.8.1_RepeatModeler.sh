#!/bin/bash
  
#SBATCH --job-name=00.8.1_RepeatModeler
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=mem
#SBATCH --mem=900G
#SBATCH --cpus-per-task=64

module load repeatmodeler/2.0

#Hifiasm assembly
AS=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa

# First, create a database for RepeatModeler

BuildDatabase -name Enen ${AS}

# Run RepeatModeler

RepeatModeler -pa 16 -LTRStruct -database Enen
