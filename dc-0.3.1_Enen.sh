#!/bin/bash

#usage dc-0.3.1.sh <subreads.bam> <name>

inFile=/cluster/home/lchueca/TBG_3759/m64037e_230114_104235/m64037e_230114_104235.subreads.bam
outDir=/cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/1000_chunks
outFilePrefix=m64037e_230114_104235
partition=cpu
NAME=run_1
#time=23:59:59

CHUNKS=1000
### threads per ccs job
THREAD=16
### CCS log level  TRACE, DEBUG, INFO, WARN, FATAL
LOGLEVEL=INFO
### limit concurrent number of jobs that run on a partition at the same time
### if you don't want any limitation set it to CHUNKS
#CONCURRENT_JOBS=${CHUNKS}
CONCURRENT_JOBS=500
### MEM per job
mem=100G

#1. CCS

cmd1="module load pbccs/6.4.0 && /cluster/software/pbccs/pbccs-6.4.0/bin/ccs ${inFile} ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.bam --chunk \$((SLURM_ARRAY_TASK_ID+1))/${CHUNKS} -j ${THREAD} --min-rq=0.88 --log-level ${LOGLEVEL} --log-file ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.log --report-file ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.report.txt"

#2. ACTC
cmd2="module load actc/0.2.0 && /cluster/software/actc/actc-0.2.0/actc -j ${THREAD} ${inFile} ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.bam ${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.bam"

#3. DC
cmd3="module load samtools/1.10 && samtools faidx ${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.fasta"
cmd4="module load deepconsensus/0.3.1 && /cluster/software/deepconsensus/deepconsensus-0.3.1_singularity/deepconsensus run --checkpoint=/cluster/software/deepconsensus/deepconsensus-0.3.1_singularity/dc_model_0.3/checkpoint --ccs_bam=${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.bam --subreads_to_ccs=${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.bam --output=${outDir}/${outFilePrefix%.ccs}.deepconsensus.\${SLURM_ARRAY_TASK_ID}.fastq --cpus ${THREAD}"
cmd5="rm ${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.fasta ${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.fasta.fai ${outDir}/${outFilePrefix%.ccs}.subreads_to_ccs.\${SLURM_ARRAY_TASK_ID}.bam ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.log ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.report.txt ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.bam ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.bam.pbi ${outDir}/${outFilePrefix}.\${SLURM_ARRAY_TASK_ID}.zmw_metrics.json.gz ${outDir}/${outFilePrefix%.ccs}.deepconsensus.\${SLURM_ARRAY_TASK_ID}.fastq.runtime.csv"

array_end=$((CHUNKS-1))
job=$(sbatch --export=NONE --array=0-${array_end} -c ${THREAD} -n 1 -p ${partition} --mem=${mem} -e ${outDir}/"${outFilePrefix%.ccs}.dc".%A.%a.err -o "${outDir}"/"${outFilePrefix%.ccs}.dc".%A.%a.out -J ${NAME}_dc-0.3.1 --wrap="echo \"${cmd1} && ${cmd2} && ${cmd3} && ${cmd4} && ${cmd5}\" && ${cmd1} && ${cmd2} && ${cmd3} && ${cmd4} && ${cmd5}")
echo "submit dc jobs: ${job##* }"

# To check if all chunks finished successfully you can do something like this:
# s_jobs | awk '$1~/<JOBID>/&& $2=="batch" && $7!="COMPLETED"'

cat ${outDir}/*.fastq >> /cluster/home/lchueca/TBG_3759/01.hifi_deepconsensus/${outFilePrefix}.deepconsensus.fastq