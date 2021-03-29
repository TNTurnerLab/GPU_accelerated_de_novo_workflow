Jeffrey Ng 
Turner Lab, Washington University St. Louis

Here is a collection of bash scripts that were used to run the NA12878 comparison.

1kg_deep.sh and 1kg_gatk.sh are bash scripts that call Parabricks v3.0.0 DeepVariant and GATK Haplotypecaller, respectively.  The run_pipeline.py script is a wrapper that is needed to run Parabricks on our server system, but the general commands to run Parabricks are the same outside that.

submit_glnexus_dv.sh and submit_glnexus_hc.sh are bash scripts that call GLnexus v1.2.6 to genotype the output from DeepVariant and GATK Haplotypecaller, respectively.  

bcftovcf.sh is a script that converts the .bcf output from the GLnexus run to a vcf file.

makeindex.sh is a script that creates a tabix index for the vcf file.

The speedseq_snake.snake is a Snakemake workflow that realigns the downloaded NA12878 samples to our reference file using Speedseq v0.1.2 pulled from their [github](https://github.com/hall-lab/speedseq).  The Dockerfile that was used to run this command can be found in the docker/speedseq folder of this current repo.

