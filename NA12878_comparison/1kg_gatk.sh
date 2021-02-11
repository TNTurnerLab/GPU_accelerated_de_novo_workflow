#!/bin/bash
#use the scratch file system for temp space
export SCRATCH1=/scratch1/fs1/tychele

#use your Active storage for input and output data
export STORAGE1=/storage1/fs1/tychele/Active/testing



# use host level communications for the GPUs
export LSF_DOCKER_NETWORK=host

# use the debug flag when trying to figure out why your job failed to launch on the cluster
#export LSF_DOCKER_RUN_LOGLEVEL=DEBUG

# use the entry point because the parabricks container has other entrypoints but our cluster requires /bin/sh
export LSF_DOCKER_ENTRYPOINT=/bin/sh

# create tmp dir
export TMP_DIR=${STORAGE1}"/parabricks-tmp"
[ ! -d $TMP_DIR ] && mkdir -p $TMP_DIR

# you may need to adjust your cores (-n) and memory (-M and mem) depending on your data set
# 1 GPU server should have 64GB CPU RAM, at least 16 CPU threads
# 2 GPU server should have 100GB CPU RAM, at least 24 CPU threads
# 4 GPU server should have 196GB CPU RAM, at least 32 CPU threads
# you can run this interactive (-Is) or in batch mode in the general or general-interactive queues
# sets GPUs to 4 for LSF and parabricks and probably want to keep this unless your data set is smaller than 5GB test data set
# there is diminishing returns on using more GPUs on small data sets
# the parabricks container and the /parabricks/run_pipeline.py is required
# the last is where you put in any of the pubrun commands like fq2bam, bqsr, applybqsr, haplotypecaller
# see the parabricks docs here: https://www.nvidia.com/en-us/docs/parabricks/
#FILES=/storage1/fs1/tychele/Active/testing/ssc/

kg_files=/storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/MGI_NA12878/mgi_test.txt

export LSF_DOCKER_VOLUMES="/scratch1/fs1/ris/application/parabricks:/INSTALL  $SCRATCH1:$SCRATCH1 $STORAGE1:$STORAGE1 $HOME:$HOME /storage1/fs1/tychele/Active/testing:/tychele /storage1/fs1/tychele/Active/testing/ris_testing/parabricks:/parabricks-experiment"
while IFS= read -r line
do

name=${line%%.*}
echo "$name"
bsub -G compute-tychele -g /jeffrey.ng/parabrick_test -n 32 -M 196GB -R 'rusage[mem=196GB] span[hosts=1]' \
   	-q general -gpu "num=4:gmodel=TeslaV100_SXM2_32GB:j_exclusive=yes"  \
        -a 'docker(registry.gsc.wustl.edu/cpohl/parabricks:v3.0.0)' /parabricks/run_pipeline.py \
        haplotypecaller \
        --ref /tychele/reference/GRCh38_full_analysis_set_plus_decoy_hla.fa  \
        --in-bam /parabricks-experiment/NA12878_extras/MGI_NA12878/$name.b38.cram \
        --out-variants /parabricks-experiment/NA12878_extras/$name.hc.g.vcf.gz \
        --num-gpus 4 --tmp-dir $TMP_DIR \
        --gvcf \
        --haplotypecaller-options="-standard-min-confidence-threshold-for-calling 30"


done < "$kg_files"
