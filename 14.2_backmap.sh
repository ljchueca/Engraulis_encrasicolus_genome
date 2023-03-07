#!/bin/bash

#SBATCH --job-name=14.2_backmap
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=150G
#SBATCH --cpus-per-task=48

module load backmap/0.5

#Assembly
AS=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trinity/Trinity.fasta
#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/cutadapt
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trinity/02_backmap
#CPU per task
CPU=48

#2. Crear variable i al resultado de: la búsqueda de archivos que terminen en .gz y tomar solo los nombre. Realizar backmap para cada uno.

for i in $(find "$IN" -name "*_paired_cutadapt.fq.gz" | sed "s|"$IN"\/||" | sed 's/_[^_]*$//'| sed 's/_[^_]*$//'| sort | uniq); \
 do backmap.pl -a ${AS} -p ${i}_paired_cutadapt.fq.gz,${i}_paired_cutadapt.fq.qz -t ${CPU} -v -o ${OUT} ; done 


for i in $(find "$IN" -name "*_paired_cutadapt.fq.gz" | sed "s|"$IN"\/||" | sed 's/_[0-9].*//'| sort | uniq); \
 do backmap.pl -a ${AS} -p ${i}_1_paired_cutadapt.fq.gz,${i}_2_paired_cutadapt.fq.qz -t ${CPU} -v -o ${OUT} ; done 

