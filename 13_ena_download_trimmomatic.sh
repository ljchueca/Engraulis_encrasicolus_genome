#!/bin/bash

#SBATCH --job-name=13_ena_download_trimmomatic
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=32
#SBATCH --array=1-5%5

module load trimmomatic/0.39

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/raw_data/ena_data
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.2_rna_ena/trimmomatic
#CPUs per task
CPU=32

#1.Buscar archivos y tomar solo los nombres y guardar en un archivo
find "$IN" -name "*gz" | sed "s|"$IN"\/||" |sed 's/_[^_]*$//' | sort | uniq > ${OUT}/enen_ind &&

#2. Crear variable i para lo que haya en enen_ind y ejecutar trimmmomatic para cada uno
for i in $(cat enen_ind); do echo "java -jar /cluster/software/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads ${CPU} ${IN}/${i}_1.fastq.gz ${IN}/${i}_2.fastq.gz ${OUT}/${i}_1_paired.fq.gz ${OUT}/${i}_1_unpaired.fq.gz ${OUT}/${i}_2_paired.fq.gz ${OUT}/${i}_2_unpaired.fq.gz ILLUMINACLIP:/cluster/software/Trimmomatic/Trimmomatic-0.39/adapters/adapter_all.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50"; done > ${OUT}/trimm_commands &&

FILE=$(cat trimm_commands| sed -n ${SLURM_ARRAY_TASK_ID}p) &&
bash -c "$FILE"