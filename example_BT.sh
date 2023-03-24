#!/bin/bash

#SBATCH --job-name=02.4_Flye_BT.02
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

### Run the script in the partition test
#SBATCH --partition=test

#### Request 200G of memory
#SBATCH --mem=200G

#### Request 90 CPU threads
#SBATCH --cpus-per-task=90

#### Commands to run on the cluster (has to be prefixed by "srun")

module load blobtools ncbi-blast samtools/1.9

# Index bam file
#samtools index 02.4_Flye.fasta.pb.sort.bam 02.4_Flye.fasta.pb.sort.bam.bai

#1 we have to reduce the size of the bam file using map2cov (including in BlobTools).
#blobtools map2cov -i 02.4_Flye.fasta -b 02.4_Flye.fasta.pb.sort.bam &&
#2 make the hits file by using blastn
#blastn -task megablast -query 02.4_Flye.fasta -db /cluster/software/blastdb/nt/nt -outfmt '6 qseqid staxids bitscore std' -max_target_seqs 1 -max_hsps 1 -num_threads 48 -evalue 1e-25 -out 02.4_Flye.nt.hsp1.out >02.4_Flye.nt.hsp1.log 2>02.4_Flye.nt.hsp1.err &&
#3 Create a BlobDB
#blobtools create -i 02.4_Flye.fasta -c 02.4_Flye.fasta.pb.sort.bam.cov -t 02.4_Flye.nt.hsp1.out -o Can_uni.blobplot >Nypro.blobplot.log 2>Nypro.blobplot.err &&

# I made a mistake wiht the output name from step #3 (it was copied from a Candidula script). I modify the file name and continue with the steps #5 and #6.

mv Can_uni.blobplot.blobDB.json Nypro.blobplot.blobDB.json

#4 Generate a tubular view
blobtools view -i Nypro.blobplot.blobDB.json &&
#5 Generate a blobpot
blobtools plot -i Nypro.blobplot.blobDB.json