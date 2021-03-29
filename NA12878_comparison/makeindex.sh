#/bin/bash

export LSF_DOCKER_VOLUMES="/storage1/fs1/tychele/Active/1000_genomes/:/storage1/fs1/tychele/Active/1000_genomes/ /storage1/fs1/tychele/Active/testing/:/storage1/fs1/tychele/Active/testing/"
#declare -a StringArray=('13' '4' '5' '6' '7' '8' '9' '10' '11' '18' '19' '20' '21')

#declare -a StringArray=('X' 'Y')
#for f in "${StringArray[@]}"
#do
for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_vcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME
if [[ $NAME != "SRR622457_NA12878" ]] && [[ $NAME != "SRR952827_NA12878" ]]
then 
bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=64GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:glnexus_filter)' "/opt/conda/bin/tabix /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/dv_vcf/$NAME.trio_test_NA12878.glnexus.dv.vcf.gz"
fi
done



for f in /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_vcf/*
do
NAME=${f##*/}
NAME=${NAME%%.*}
echo $NAME
if [[ $NAME != "SRR622457_NA12878" ]] && [[ $NAME != "SRR952827_NA12878" ]]
then
bsub -q general -g /jeffrey.ng/200test -R 'affinity[core(1)] span[ptile=4] rusage[mem=64GB]'  -G compute-tychele   -a 'docker(jng2/testrepo2_actual:glnexus_filter)' "/opt/conda/bin/tabix /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_vcf/$NAME.trio_test_NA12878.glnexus.hc.vcf.gz"
fi
done