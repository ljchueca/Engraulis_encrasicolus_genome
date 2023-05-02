#!/bin/bash
  
#SBATCH --job-name=00.8.3_RNA_hitsat2
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --cpus-per-task=64

module load hisat/2.2.1

#Hifiasm assembly
AS=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.1_hifiasm/Enen_hifiasm.bp.p_ctg.fa
#Input directory prefix
IN1=BIOMAN2202_EKRO220002521-1A_H25LYDSX5_L4
IN2=BIOMAN2202_EKRO220002521-1A_H22FLDSX5_L4
IN3=SRR4431643
IN4=SRR4431644
IN5=SRR4431659
IN6=SRR4431651
IN7=SRR4431648

hisat2-build ${AS} Enen_hisat2 &&

hisat2 -k 3 --pen-noncansplice 12 -x Enen_hisat2 \
    -1 ${IN1}_1_paired.fq.gz,${IN2}_1_paired.fq.gz,${IN3}_1_paired.fq.gz,${IN4}_1_paired.fq.gz,${IN5}_1_paired.fq.gz,${IN6}_1_paired.fq.gz,${IN7}_1_paired.fq.gz \
    -2 ${IN1}_2_paired.fq.gz,${IN2}_2_paired.fq.gz,${IN3}_2_paired.fq.gz,${IN4}_2_paired.fq.gz,${IN5}_2_paired.fq.gz,${IN6}_2_paired.fq.gz,${IN7}_2_paired.fq.gz\
    -U ${IN1}_1_unpaired.fq.gz,${IN1}_2_unpaired.fq.gz,${IN2}_1_unpaired.fq.gz,${IN2}_2_unpaired.fq.gz,${IN3}_1_unpaired.fq.gz,${IN3}_2_unpaired.fq.gz,${IN4}_1_unpaired.fq.gz,${IN4}_2_unpaired.fq.gz,${IN5}_1_unpaired.fq.gz,${IN5}_2_unpaired.fq.gz,${IN6}_1_unpaired.fq.gz,${IN6}_2_unpaired.fq.gz,${IN7}_1_unpaired.fq.gz,${IN7}_2_unpaired.fq.gz \
    -S Enen_input.sam
