#!/bin/bash

#SBATCH --job-name=03_Blast
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=mem
#SBATCH --mem=5G
#SBATCH --cpus-per-task=64

#### Commands to run on the cluster (has to be prefixed by "srun")

module load ncbi-blast/2.14.0

PRO=05_Enen_proteins.02.fasta

# blast vs swissprot for putative names:

makeblastdb -in uniprot_sprot.fasta -out uniprot_sprot.fasta -parse_seqids -dbtype prot &&

blastp -num_threads 64 -query ${PRO} -db uniprot_sprot.fasta -evalue 1e-6 -max_hsps 1 -max_target_seqs 1 -outfmt 6 -out Enen_proteins.fasta.blastp
