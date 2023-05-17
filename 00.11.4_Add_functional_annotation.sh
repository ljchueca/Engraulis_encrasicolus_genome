#!/bin/bash

#SBATCH --job-name=04_Add_functional_annotation
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=30G
#SBATCH --cpus-per-task=54

#### Commands to run on the cluster (has to be prefixed by "srun")

module load maker/2.31.10-mpi

PRO=03_Enen_proteins.02.fasta
CDS=03_Enen_cds.fasta
AN=03_Enen_filtered_predictions.gff

ipr_update_gff ${AN} Enen.tsv > Enen.all.ipr.gff &&

maker_functional_gff uniprot_sprot.fasta Enen_proteins.fasta.blastp Enen.all.ipr.gff > Enen.all.fun.gff &&

maker_functional_fasta uniprot_sprot.fasta Enen_proteins.fasta.blastp ${CDS} > Enen_CDS.fun.fasta &&

maker_functional_fasta uniprot_sprot.fasta Enen_proteins.fasta.blastp ${PRO} > Enen_proteins.fun.fasta