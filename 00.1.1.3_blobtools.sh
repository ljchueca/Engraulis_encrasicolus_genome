#!/bin/bash

#SBATCH --job-name=00.1.1.3_blotools
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load blobtools/1.1.1 ncbi-blast/2.12.0 samtools/1.15.1 

#Input assembly
AS=Enen_hifiasm.bp.p_ctg.fa
#Input backmap
BA=Enen_hifiasm.bp.p_ctg.fa.hifi.sort.bam
#Blast database
DT=/cluster/software/blastdb/nt/nt
#Hits file
T=00.1_hifiasm.nt.hsp1
#Output prefix
OUT=Enen_blobplot

#0. index bam file 
samtools index ${BA} ${BA}.bai

#1.Reduce the size
blobtools map2cov -i ${AS} -b ${BA} &&

#2. make the hits file by using blastn
blastn -task megablast -query ${AS} -db ${DT} \
 -outfmt '6 qseqid staxids bitscore std' -max_target_seqs 1 -max_hsps 1 -num_threads 96 \
 -evalue 1e-25 -out ${T}.out >${T}.log 2>${T}.err &&

#3. Create a BlobDB
blobtools create -i ${AS} -c ${BA}.cov -t ${T}.out -o ${OUT} >${OUT}.log 2>${OUT}.err  && \

#4. Generate a tabular view
blobtools view -i ${OUT}.blobDB.json && \

#5. Generate a blobplot
blobtools plot -i ${OUT}.blobDB.json

