#!/bin/bash

#export PATH=/opt/conda/bin:$PATH

export LSF_DOCKER_VOLUMES="/storage1/fs1/tychele/Active/1000_genomes/:/storage1/fs1/tychele/Active/1000_genomes/ /storage1/fs1/tychele/Active/testing/:/storage1/fs1/tychele/Active/testing/"
#declare -a StringArray=('3' '11' '13' '14' '15' '16' '17' '18' '20' '21' 'Y')
# 4 5 8 9
#for f in "${StringArray[@]}"
#do
#bsub -q general -g /jeffrey.ng/200test -R 'span[hosts=1] rusage[mem=16GB]' -n 4 -M 16G -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/hc_chr_extract/glnexus_rerun_9/1kg.pullchr9_3202.hc.test.glnexus.bcf  | /opt/conda/bin/bgzip -c > hc_chr_extract/1kg.hc.chr9.3202_test_glnexus.vcf.gz"
for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_bcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME
#if [[ $NAME == "SRR2052424_NA12878" ]] 
if [[ $NAME != "SRR622457_NA12878" ]] && [[ $NAME != "SRR952827_NA12878" ]]
then 
bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=16GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view $f | /opt/conda/bin/bgzip -c > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_vcf/$NAME.trio_test_NA12878.glnexus.dv.vcf.gz"
fi
done
#done
#bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=16GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/glnexus_3202_chr22test/chr$f/1kg.3202.dv.test_chr$f.glnexus.bcf | /opt/conda/bin/bgzip -c > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/glnexus_3202_chr22test/chr$f/1kg.3202.dv.test_chr$f.glnexus.vcf.gz"

for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_bcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME
#if [[ $NAME == "SRR2052424_NA12878" ]]
if [[ $NAME != "SRR622457_NA12878" ]] && [[ $NAME != "SRR952827_NA12878" ]]
then
bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=16GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:bcftools)' "/opt/conda/bin/bcftools view $f | /opt/conda/bin/bgzip -c > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_vcf/$NAME.trio_test_NA12878.glnexus.hc.vcf.gz"
fi
done
