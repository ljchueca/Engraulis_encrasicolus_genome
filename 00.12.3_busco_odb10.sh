#!/bin/bash

#SBATCH --job-name=01_busco5_odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/5.2.2_ve

#Para correr busco/5.2.2_ve utilizar la datasets odb10_2021_09_02
#Loading requirement: perl/5.34.0 gmap/2021-12-17 blat/385 fasta/36.3.8h_04-May-2020 mariadb/10.4.10 samtools/1.15.1 pasa/2.4.1 augustus/3.4.0

#Input directory
IN=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/07.remove.duplicates/proteins.fasta
#Linage
LIN=/cluster/software/busco/datasets/odb10_2021_09_02/actinopterygii_odb10
#Output directory
OUT=busco5_odb10
#CPU per task
CPU=8
#Mode
MO=proteins

busco -i ${IN} -l ${LIN} -c ${CPU} -o ${OUT} -m ${MO} --long --offline
