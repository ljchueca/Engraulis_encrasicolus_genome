#!/bin/bash

#SBATCH --job-name=01.1_hifiasm
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=230G
#SBATCH --cpus-per-task=96

module load hifiasm/0.16.1

# TBG_3759
IN1=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq

PREF=Enen.asm
CPU=96

hifiasm -o ${PREF} -t ${CPU} ${IN1} &&

gfa2fa.sh ${PREF}.bp.p_ctg.gfa