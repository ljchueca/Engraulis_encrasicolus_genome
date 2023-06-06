#!/bin/bash
  
#SBATCH --job-name=01_remove_duplicates
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu

#SBATCH --mem=10G

#SBATCH --cpus-per-task=1

module load agat/0.7.0

agat_convert_sp_gxf2gxf.pl -g Enen.all.fun.2.gff3 -o Enen.all.fun.3.gff3 &&

agat_sp_fix_features_locations_duplicated.pl -f Enen.all.fun.3.gff3 -o Enen.all.fun.3.nodup.gff3
