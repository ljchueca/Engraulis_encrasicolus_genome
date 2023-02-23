#!/bin/bash

#SBATCH --job-name=01_FastQC
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load fastqc/0.11.9

fastqc -t 6 *.gz