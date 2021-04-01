#/bin/bash

#bsub -q general -g /jeffrey.ng/ristest -n 5 -R 'span[hosts=1] rusage[mem=15GB]' -M 16G -G compute-tychele  -a 'docker(jng2/testrepo2_actual:glnexus_qc)' " bash samtools_downsample.sh gerald_HFKWMDSXX_combo.b38.cram 79 "
#bsub -q general -g /jeffrey.ng/ristest -n 5 -R 'span[hosts=1] rusage[mem=15GB]' -M 16G -G compute-tychele  -a 'docker(jng2/testrepo2_actual:glnexus_qc)' " bash samtools_downsample.sh H_IJ-NA12878.b38.cram 38 "
#bsub -q general -g /jeffrey.ng/ristest -n 5 -R 'span[hosts=1] rusage[mem=15GB]' -M 16G -G compute-tychele  -a 'docker(jng2/testrepo2_actual:glnexus_qc)' " bash samtools_downsample.sh ../SRR952827_1.fastq_reheader.bam 66" 
bsub -q general -g /jeffrey.ng/ristest -n 5 -R 'span[hosts=1] rusage[mem=15GB]' -M 16G -G compute-tychele  -a 'docker(jng2/testrepo2_actual:glnexus_qc)' " bash samtools_downsample.sh ../../old_trio/NA12878_sorted.b38.cram 47"
