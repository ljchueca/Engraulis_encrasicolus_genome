#!/bin/bash
  
#SBATCH --job-name=00.8.2_RepeatMasker
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load repeatmasker/4.1.4

#Zebrafish repbase
LIB=/cluster/software/repbase/RepBase27.03.fasta/zebrep.ref
#Number of sequence batch jobs to run in parallel
PA=16

RepeatMasker -s -pa ${PA} -no_is -xsmall -lib ${LIB} 


