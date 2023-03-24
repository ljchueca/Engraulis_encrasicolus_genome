#!/bin/bash

#SBATCH --job-name=00.1.1.3_blobtools
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load blobtools/1.1.1 ncbi-blast/2.12.0 samtools/1.15.1

#Input assembly
AS=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa
#Input backmap
BA=
#Blast database
DT=/cluster/software/ncbi-blast/ncbi-blast-2.12.0+
#Output prefix
OUT=Enen_blobtools

#1. Index bam file
blobtools map2cov -i ${AS} -b ${BA} &&

#2 make the hits file by using blastn
blastn -task megablast -query ${AS} -db ${DT} -outfmt '6 qseqid staxids bitscore std' -max_target_seqs 1 -max_hsps 1 -num_threads 48 -evalue 1e-25 -out 00.1_hifiasm.nt.hsp1.out >00.1_hifiasm.nt.hsp1.log 2>00.1_hifiasm.nt.hsp1.err &&

#1. Create a BlobDB
./blobtools create -i ${IN} -b ${BA}.cov -o ${OUT} && \

#2. Generate a tabular view
./blobtools view -i ${OUT}.blobDB.json && \

#3. Generate a blobplot
./blobtools plot -i ${OUT}.blobDB.json

