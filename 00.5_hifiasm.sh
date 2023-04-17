#!/bin/bash
 
#SBATCH --job-name=00.5_hifiasm
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load hifiasm/0.16.1

#Output prefix for the assembly
OUT=Enen_hic_hifiasm
#Input pacbio reads
IN1=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235.deepconsensus.fastq
#Input Hi-C reads
IN2=/cluster/home/lchueca/TBG_3759_3/X204SC23011763-Z01-F001/01.RawData/ANTXOA_final_combine/ANTXOA_4_final_EKDL230000582-1A_HMTGCDSX5_C
#Number of CPUs
CPU=96

#Assembly
hifiasm -o ${OUT} -t ${CPU} --h1 ${IN2}_1.fq.gz --h2 ${IN2}_2.fq.gz ${IN1}