#!/bin/bash

#SBATCH --job-name=01_Interproscan
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=96

#### Commands to run on the cluster (has to be prefixed by "srun")

module load interproscan/5.39.77

interproscan.sh -i 05_Enen_proteins.02.fasta -f tsv -iprlookup -b Enen -pa -goterms -exclappl SignalP_GRAM_NEGATIVE,SignalP_GRAM_POSITIVE -dp -cpu 96
