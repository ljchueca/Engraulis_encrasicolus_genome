#!/bin/bash
  
#SBATCH --job-name=00.8.2_RepeatMasker
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load repeatmasker/4.1.4

#Zebrafish repbase: cluster/software/repbase/RepBase27.03.fasta/zebrep.ref

#Combine Zebrafish repbase wiht repeat families obtatined with RepeatModeler
cat zebrep.ref Enen-families.fa > zebrep_Enen-fam.ref

#Genome assembly
GE=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.1_simple_names_files/Enen_hifiasm_simply.fasta

#Number of sequence batch jobs to run in parallel
PA=16

RepeatMasker -s -pa ${PA} -no_is -xsmall -lib zebrep_Enen-fam.ref -dir . ${GE}


