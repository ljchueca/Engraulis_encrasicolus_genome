#!/bin/bash

#SBATCH --job-name=simplify.headers
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=10G
#SBATCH --cpus-per-task=6

module load augustus/3.4.0

SE=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa

simplifyFastaHeaders.pl ${SE} Enen ./Enen_hifiasm_simply.fasta Enen_header.map