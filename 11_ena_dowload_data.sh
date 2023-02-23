#!/bin/bash

#SBATCH --job-name=11_ena_dowload_data
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1
#SBATCH --array=1-10%10

FILE=$(cat 10_ena_dowload_data | sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE"