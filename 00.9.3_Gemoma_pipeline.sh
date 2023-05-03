#!/bin/bash
  
#SBATCH --job-name=00.9.3_Gemoma_Pipeline
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=mem
#SBATCH --mem=250G
#SBATCH --cpus-per-task=64

module load gemoma/1.8

OUT=
CPU=
IN=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.7_relationed_species

java  -Xmx230G -jar GeMoMa-1.8.jar CLI GeMoMaPipeline threads=${CPU} outdir=${OUT} tblastn=false \
r=EXTRACTED \
i=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/ \
coverage_unstranded=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/
DenoiseIntrons.m=50000 GeMoMa.m=50000 \
GeMoMa.Score=ReAlign AnnotationFinalizer.r=NO o=true p=false
t= \
s=own i=SalPil a=${IN}/Louro_et_al_2019-Sardine-coding_genes.gff g=${IN}/Louro_et_al_2019-Sardine-GCA_900499035.1_SP_G_genomic.fna \
s=own i=DenClu a=${IN}/GCF_900700375.1_fDenClu1.1_genomic.gff g=${IN}/GCF_900700375.1_fDenClu1.1_genomic. \
s=own i=CoiNa a=${IN}/knife.chr.final.gff g=${IN}/knife.chr.final.fa \
s=own i=ThaAma a=${IN}/GCF_902500255.1_fThaAma1.1_genomic.gff g=${IN}/GCF_902500255.1_fThaAma1.1_genomic.fna \
s=own i=CycLum a=${IN}/GCF_009769545.1_fCycLum1.pri_genomic.gff g=${IN}/GCF_009769545.1_fCycLum1.pri_genomic.fna \
s=own i=MiSalm a=${IN}/GCF_014851395.1_ASM1485139v1_genomic.gff g=${IN}/GCF_014851395.1_ASM1485139v1_genomic.fna \
s=own i=AloSap a=${IN}/GCF_018492685.1_fAloSap1.pri_genomic.fna g=${IN}/GCF_018492685.1_fAloSap1.pri_genomic.gff \
s=own i=CluHar a=${IN}/GCF_900700415.2_Ch_v2.0.2_genomic.gff g=${IN}/GCF_900700415.2_Ch_v2.0.2_genomic.fna \
s=own i=CypCar a=${IN}/GCF_018340385.1_ASM1834038v1_genomic.gff g=${IN}/GCF_018340385.1_ASM1834038v1_genomic.fna \
s=own i=AAlo a=${IN}/GCF_017589495.1_AALO_Geno_1.1_genomic.gff g=${IN}/GCF_017589495.1_AALO_Geno_1.1_genomic.fna \
s=own i=CarAu a=${IN}/GCF_002814215.2_Sedor1_genomic.gff g=${IN}/GCF_003368295.1_ASM336829v1_genomic.fna \
s=own i=SerLa a=${IN}/GCF_002814215.2_Sedor1_genomic.gff g=${IN}/GCF_002814215.2_Sedor1_genomic.fna 


