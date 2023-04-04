#!/bin/bash
 
#SBATCH --job-name=00.5_hifiasm
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=236G
#SBATCH --cpus-per-task=96

module load hifiasm/0.16.1

#Output prefix for the assembly
OUT=ENA_HI-C_hifiasm
#Input directory
IN=/cluster/home/lchueca/TBG_3759_3/X204SC23011763-Z01-F001/01.RawData/ANTXOA_4_final
#Name of the reads
NA=ANTXOA_4_final_EKDL230000582-1A
#Number of CPUs
T=96


#Assembly
hifiasm -o ${OUT} -t ${T} ${IN} --h1 ${IN}/${NA}_HMTGCDSX5_L2_1.fq.gz, ${IN}/${NA}_HMTGCDSX5_L2_2.fq.gz \
    --h2 ${IN}/${NA}_HNH2MDSX5_L4_1.fq.gz, ${IN}/${NA}_HNH2MDSX5_L4_2.fq.gz &&

#Convertir de gfa a fasta
gfa2fa.sh ${OUT}.bp.p_ctg.gfa