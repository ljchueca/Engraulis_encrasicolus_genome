#!/bin/bash

#SBATCH --job-name=02_rename_gene_IDs
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

maker_map_ids --prefix Enen_ --abrv_gene G --abrv_tran T --justify 6 --iterate 1 ${AN} > Enen.all.id.map &&

map_gff_ids Enen.all.id.map ${AN} &&

map_fasta_ids Enen.all.id.map ${CDS} &&

map_fasta_ids Enen.all.id.map ${PRO} &&

# rename gene IDs in interpro output:

map_data_ids Enen.all.id.map Enen.tsv
