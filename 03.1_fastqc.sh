#!/bin/bash

#SBATCH --job-name=03_fastqc
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=23G
#SBATCH --cpus-per-task=6

module load fastqc/0.11.9 multiqc/1.10

OUT=/cluster/home/lchueca/TBG_3759_3/X204SC23011763-Z01-F001/03_fastqc
IN=/cluster/home/lchueca/TBG_3759_3/X204SC23011763-Z01-F001/01.RawData/ANTXOA_4_final


fastqc -o ${OUT} -t 6 ${IN}/*.gz &&

multiqc ${OUT}