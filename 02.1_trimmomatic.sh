#!/bin/bash

#SBATCH --job-name=02.1_trimmomatic
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=23G
#SBATCH --cpus-per-task=28

module load trimmomatic/0.39

java -jar /cluster/software/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 28 \
 BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_1.fq.gz BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_2.fq.gz \
 BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_1_paired.fq.gz BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_1_unpaired.fq.gz \
 BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_2_paired.fq.gz BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4_2_unpaired.fq.gz \
 ILLUMINACLIP:/cluster/software/Trimmomatic/Trimmomatic-0.39/adapters/adapter_all.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50