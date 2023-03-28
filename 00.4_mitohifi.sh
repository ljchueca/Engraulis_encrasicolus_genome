#!/bin/bash

#SBATCH --job-name=00.4_mitohifi
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load mitohifi/2.2 
#Previamente se han convertido los reads del formato fastq a fasta mediante seqtk seq -a m64037e_230114_104235.deepconsensus.fastq > m64037e_230114_104235.deepconsensus.fasta
#Reads in fasta
RE=m64037e_230114_104235.deepconsensus.fasta
#Close-related Mitogenome is fasta 
F=mitochondrial_sequence.fa
#Close-related Mitogenome is genbak format
GBK=mitochondrial_sequence.gbk
#CPU per task
CPU=96

MitoHiFi -r ${RE} -f ${F} -g ${GBK} -t ${CPU} -a {animal}



