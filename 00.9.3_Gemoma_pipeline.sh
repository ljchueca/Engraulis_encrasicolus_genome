#!/bin/bash
  
#SBATCH --job-name=03_Gemoma_Pipeline
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=mem
#SBATCH --mem=700G
#SBATCH --cpus-per-task=48

module load gemoma/1.8

OUT=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/03_GeMoMa_Pipeline
CPU=96
IN=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.7_relationed_species

java -Xmx230G -jar /cluster/software/gemoma/GeMoMa-1.8/GeMoMa-1.8.jar CLI GeMoMaPipeline threads=${CPU} outdir=${OUT} tblastn=false \
r=EXTRACTED \
introns=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/02_GeMoMA_DenoiseIntrons/denoised_introns.gff \
coverage_unstranded=/cluster/home/lchueca/TBG_3759_Enen_assembly/00.8_annotation/00.8.4_GeMoMa/01_GeMoMa_RNA_Extraction/coverage.bedgraph \
DenoiseIntrons.m=50000 GeMoMa.m=50000 \
GeMoMa.Score=ReAlign AnnotationFinalizer.r=NO o=true p=false \
t=Enen_hifiasm_simply.masked.fasta \
s=own i=DenClu a=${IN}/GCF_900700375.1_fDenClu1.1_genomic.gff g=${IN}/GCF_900700375.1_fDenClu1.1_genomic.fna \
s=own i=CoiNa a=${IN}/knife.chr.final.gff g=${IN}/knife.chr.final.fa \
s=own i=ThaAma a=${IN}/GCF_902500255.1_fThaAma1.1_genomic.gff g=${IN}/GCF_902500255.1_fThaAma1.1_genomic.fna \
s=own i=CycLum a=${IN}/GCF_009769545.1_fCycLum1.pri_genomic.gff g=${IN}/GCF_009769545.1_fCycLum1.pri_genomic.fna \
s=own i=MiSalm a=${IN}/GCF_014851395.1_ASM1485139v1_genomic.gff g=${IN}/GCF_014851395.1_ASM1485139v1_genomic.fna \
s=own i=AloSap a=${IN}/GCF_018492685.1_fAloSap1.pri_genomic.gff g=${IN}/GCF_018492685.1_fAloSap1.pri_genomic.fna  \
s=own i=CluHar a=${IN}/GCF_900700415.2_Ch_v2.0.2_genomic.gff g=${IN}/GCF_900700415.2_Ch_v2.0.2_genomic.fna \
s=own i=CypCar a=${IN}/GCF_018340385.1_ASM1834038v1_genomic.gff g=${IN}/GCF_018340385.1_ASM1834038v1_genomic.fna \
s=own i=AAlo a=${IN}/GCF_017589495.1_AALO_Geno_1.1_genomic.gff g=${IN}/GCF_017589495.1_AALO_Geno_1.1_genomic.fna \
s=own i=CarAu a=${IN}/GCF_003368295.1_ASM336829v1_genomic.gff g=${IN}/GCF_003368295.1_ASM336829v1_genomic.fna \
s=own i=SerLa a=${IN}/GCF_002814215.2_Sedor1_genomic.gff g=${IN}/GCF_002814215.2_Sedor1_genomic.fna 


### First, we remove some gene ID's with the character "/" because we get some errors:
# for i in $( find -name "*.gff" | sed 's/\.\///'); do sed -i 's/gene-il17a\//gene-il17a-/g' "${i}"; done
# for i in $( find -name "*.gff" | sed 's/\.\///'); do sed -i 's/gene-\/b_0//gene-cdkn2a-b_0' "${i}"; done
# Sardine pilchardus was not recognized due to a incompatible format