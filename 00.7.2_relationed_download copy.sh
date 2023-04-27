#!/bin/bash

#SBATCH --job-name=00.7.2_relationed_download
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1
#SBATCH --array=1-10%10

FILE=$(cat 00.7.1_relationed_download | sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE"