#!/bin/bash

#SBATCH --job-name=00.1.1.1_busco5_odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/5.2.2_ve

#Loading requirement: perl/5.34.0 gmap/2021-12-17 blat/385 fasta/36.3.8h_04-May-2020 mariadb/10.4.10 samtools/1.15.1 pasa/2.4.1 augustus/3.4.0

#Input directory
IN=
#Linage
LIN=/cluster/software/busco/datasets/odb10/actinopterygii_odb10
#Output directory
OUT=00.1_busco4_odb10
#CPU per task
CPU=8
#Mode
M=genome

busco -i ${IN} -l ${LIN} -c ${CPU} -o ${OUT} -m ${M} --long --offline
