#!/bin/bash
  
#SBATCH --job-name=01_keep_longest_isoform
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=1

module load agat/0.7.0

agat_sp_keep_longest_isoform.pl -f Enen.all.fun.gff -o Enen.all.fun.2.gff3