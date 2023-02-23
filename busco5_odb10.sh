#!/bin/bash

#SBATCH --job-name=busco5_odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/4.1.4

IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.1_rna/03_trinity/engrtranscriptome.fa
LIN=/cluster/software/busco/datasets/odb10_2021_09_02/actinopterygii_odb10
OUT=Enen_busco5_odb10
M=transcriptome

busco -i ${IN} -l ${LIN} -c 8 -o ${OUT} -m ${M} --long --offline
