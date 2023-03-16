!/bin/bash

#SBATCH --job-name=22.2_ena_cutadapt
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out

#SBATCH --partition=tbg
#SBATCH --mem=50G
#SBATCH --cpus-per-task=40

module load cutadapt/2.8 fastqc/0.11.9 multiqc/1.9

#Input directory
IN=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.3_rna_ena/trimmomatic
#Output directory
OUT=/cluster/home/s_lchueca/engraulis_encrasicolus_genome/00.3_rna_ena/cutadapt
#CPU per task
CPU=40


for i in $(find ${IN} -name "*.fq.gz" | sed "s|"$IN"\/||" | sed 's/.fq.gz//'); do cutadapt -u 10 -j ${CPU} -o ${OUT}/${i}_cutadapt.fq.gz  ${IN}/${i}.fq.gz ; done &&

#Fastqc de los resultados de cutadapt
fastqc -t ${CPU} ${OUT}/*.gz &&
#Resumir fastqc
multiqc ${OUT}


