#!/bin/bash

#SBATCH --job-name=00.2_lima.pbmarkdup
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=100G
#SBATCH --cpus-per-task=80

module load lima/2.2.0 pbmarkdup/1.0.2-0

# PacBio raw reads
PB=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/m64037e_230114_104235
# PacBio barcodes file
ADP=/cluster/home/lchueca/pacbio_pcr_adapter.fa
# Number of threads
CORES=80

lima --num-threads ${CORES} --ccs --min-score 80 --min-end-score 50 --min-ref-span 0.75 ${PB}.deepconsensus.fastq \
 ${ADP} ${PB}.deepconsensus.lima.fastq

pbmarkdup --num-threads ${CORES} --log-level INFO --log-file \
 ${PB}.pbmarkdup.log --cross-library --rmdup \
 ${PB}.deepconsensus.lima.fastq \
 ${PB}.deepconsensus.lima.pbmarkdup.fastq