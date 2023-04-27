#!/bin/bash

#SBATCH --job-name=00.7.2.02_relationed_download
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1
#SBATCH --array=1-13%10

FILE2=$(cat 00.7.1.02_relationed_download | sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE2"