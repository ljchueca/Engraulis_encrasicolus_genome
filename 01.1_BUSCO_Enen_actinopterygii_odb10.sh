#!/bin/bash

#SBATCH --job-name=01.1_BUSCO_Enen_actinopterygii.odb10
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8

module load busco/5.2.2_ve

#Reference genome
IN=/cluster/home/lchueca/TBG_3759_Enen_assembly/01.1_hifiasm/Enen.asm.bp.p_ctg.fa
#Database
DB=/cluster/software/busco/datasets/odb10_2021_09_02/actinopterygii_odb10
#Output
OUT=01.1_BUSCO_Enen_actinopterygii

busco -i ${IN} \
 -c 8 -l ${DB} \
 -o ${OUT} \
 -m geno --offline