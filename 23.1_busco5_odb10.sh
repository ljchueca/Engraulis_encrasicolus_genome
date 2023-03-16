#!/bin/bash

#SBATCH --job-name=23.1_busco5_odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/4.1.4

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.3_rna_ena/trinity/Trinity.fasta
#Linage
LIN=/cluster/software/busco/datasets/odb10_2021_09_02/actinopterygii_odb10
#Output directory
OUT=Enen_03_busco5_odb10
#CPU per task
CPU=8
#Mode
M=transcriptome

busco -i ${IN} -l ${LIN} -c ${CPU} -o ${OUT} -m ${M} --long --offline
