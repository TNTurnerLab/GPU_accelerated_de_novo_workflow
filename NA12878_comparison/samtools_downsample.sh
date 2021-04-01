#/bin/bash
echo $1
echo $2
export REF_CACHE=/storage1/fs1/tychele/Active/testing/ris_testing/parabricks/NA12878_extras
/opt/conda/bin/samtools view -@ 5 -T /storage1/fs1/tychele/Active/testing/reference/GRCh38_full_analysis_set_plus_decoy_hla.fa -Cs 42.$2 $1 > $1.downsample.cram
