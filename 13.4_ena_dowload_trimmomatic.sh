#!/bin/bash

#SBATCH --job-name=13.2_ena_dowload_trimmomatic
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=28

module load trimmomatic/0.39

java -jar /cluster/software/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 28 \
 SRR4431644_1.fastq.gz SRR4431644_2.fastq.gz\
 SRR4431644_1_paired.fq.gz SRR4431644_1_unpaired.fq.gz \
 SRR4431644_2_paired.fq.gz SRR4431644_2_unpaired.fq.gz \
 ILLUMINACLIP:/cluster/software/Trimmomatic/Trimmomatic-0.39/adapters/adapter_all.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50