#!/bin/bash
#kg_files=/storage1/fs1/tychele/Active/testing/ris_testing/parabricks/trio_list_with_paths_hc.txt
#kg_files=trio_list_with_paths_dv2.txt
#while IFS= read -r line
#do
#NAME=${line##*/}
#NAME=${NAME%%.*}
#echo $NAME
ulimit -Sn 65536
bsub -q tychele -g /jeffrey.ng/glnexustest -R 'span[hosts=1] rusage[mem=300G]' -n 32 -M 300G  -G compute-tychele -g /jeffrey.ng/glnexus_trio -a 'docker(quay.io/mlin/glnexus:v1.2.6)' "glnexus_cli --config gatk --mem-gbytes 300  --dir SRR622457 /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/1000_genomes_largeset_hc/NA12891.hc.g.vcf.gz	/storage1/fs1/tychele/Active/testing/ris_testing/parabricks/1000_genomes_largeset_hc/NA12892.hc.g.vcf.gz /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/SRR622457_1.hc.g.vcf.gz  > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_bcf/SRR622457_NA12878.trio.glnexus.hc.bcf "
sleep 5
bsub -q tychele -g /jeffrey.ng/glnexustest -R 'span[hosts=1] rusage[mem=300G]' -n 32 -M 300G  -G compute-tychele -g /jeffrey.ng/glnexus_trio -a 'docker(quay.io/mlin/glnexus:v1.2.6)' "glnexus_cli --config gatk --mem-gbytes 300  --dir SRR952827 /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/1000_genomes_largeset_hc/NA12891.hc.g.vcf.gz       /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/1000_genomes_largeset_hc/NA12892.hc.g.vcf.gz /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/SRR952827.hc.g.vcf.gz  > /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras/hc_bcf/SRR952827_NA12878.trio.glnexus.hc.bcf "
#done < "$kg_files"
#/path/data.gvcf.gz /path/data2....
