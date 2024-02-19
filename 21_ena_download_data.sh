#!/bin/bash

#SBATCH --job-name=21_ena_download_data
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1
#SBATCH --array=1-4%4

FILE=$(cat 20_ena_download_data.txt | sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE"