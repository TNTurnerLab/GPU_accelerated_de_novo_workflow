#!/bin/bash



export LSF_DOCKER_VOLUMES="/storage1/fs1/tychele/Active/1000_genomes/:/storage1/fs1/tychele/Active/1000_genomes/ /storage1/fs1/tychele/Active/testing/:/storage1/fs1/tychele/Active/testing/"

for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_bcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME

bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=16GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view $f | /opt/conda/bin/bgzip -c > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_vcf/$NAME.trio_test_NA12878.glnexus.dv.vcf.gz"

done

for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_bcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME


bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=16GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view $f | /opt/conda/bin/bgzip -c > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_vcf/$NAME.trio_test_NA12878.glnexus.hc.vcf.gz"

done
