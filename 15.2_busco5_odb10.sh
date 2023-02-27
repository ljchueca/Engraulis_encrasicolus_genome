#!/bin/bash

#SBATCH --job-name=15.2_busco5_odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/4.1.4

IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/14_trinity/ena_2_transcriptome.fa
LIN=/cluster/software/busco/datasets/odb10_2021_09_02/actinopterygii_odb10
OUT=Ena_2_dowload_busco5_odb10
M=transcriptome

busco -i ${IN} -l ${LIN} -c 8 -o ${OUT} -m ${M} --long --offline
