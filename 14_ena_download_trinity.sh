#!/bin/bash

#SBATCH --job-name=14_ena_download_trinity
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=200G
#SBATCH --cpus-per-task=40
#SBATCH --array=1-5%5

module load trinity/2.11.0

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trimmomatic
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/14_trinity


#1.Buscar archivos en los resultados de trimmomatic y tomar solo los nombres y guardar en el archivo enen_trimm_ind
find "$IN" -name "*gz" | sed "s|"$IN"\/||" |sed 's/_[^_]*$//' | sort | uniq > ${OUT}/enen_trimm_ind &&

#2. Crear variable i para lo que haya en enen_trimm_ind y ejecutar trimmmomatic para cada uno
for i in $(cat enen_trimm_ind); do echo "Trinity --seqType fq --max_memory 200G --left ${IN}/${i}_1_paired.fq.gz --right ${IN}/${i}_1_paired.fq.gz --CPU 40 --output ${OUT}" ; done > ${OUT}/trinity_commands &&

FILE=$(cat trinity_commands| sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE"

