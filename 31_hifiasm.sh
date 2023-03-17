#!/bin/bash

#SBATCH --job-name=31_hifiasm.sh
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load hifiasm/0.16.1

hifiasm -o ${OUT} -t ${T} <in_1.fq> <in_2.fq> <...>


hifiasm [options] <in_1.fq> <in_2.fq> <...>
