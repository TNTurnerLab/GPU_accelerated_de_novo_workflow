Jeffrey Ng 
Turner Lab, Washington University St. Louis

Here is a collection of bash scripts that were used to run the NA12878 comparison, which was also used to run on the full 602 trios from the 1000 genomes project.

### 1kg_deep.sh and 1kg_gatk.sh 
These are bash scripts that call Parabricks v3.0.0 DeepVariant and GATK Haplotypecaller, respectively.  The run_pipeline.py script is a wrapper that is needed to run Parabricks on our server system, but the general commands to run Parabricks are the same outside that.  The docker image is included within the script is specific for using Parabricks on our server system.  Your own Parabricks docker image will be necessary.

### submit_glnexus_dv.sh and submit_glnexus_hc.sh 
These are bash scripts that call GLnexus v1.2.6 to genotype the output from DeepVariant and GATK Haplotypecaller, respectively.  THe docker image is included within the script and is publically aviablable.  

### bcftovcf.sh 
Is a script that converts the .bcf output from the GLnexus run to a vcf file.  The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter

### makeindex.sh 
Is a script that creates a tabix index for the vcf file.  The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter

### speedseq_snake.snake 
Is a Snakemake workflow that realigns the downloaded NA12878 samples to our reference file using Speedseq v0.1.2 pulled from their [github](https://github.com/hall-lab/speedseq).  The Dockerfile that was used to run this command can be found in the docker/speedseq folder of this current repo.
Assosicated with this snake are these two files, config.json and cluster_config.json.  The config.json options are:

reference:  Path to reference file
data_dir:  Path to location of data to be realigned

The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:speedseq

### Tree creation

To create the tree, the python scripts in this order were used:

modify_combined_for_tree.py -> modify_combined_nt.py -> modify_IUPAC.py -> make_fasta.py

The tree itself was made within [MEGAX](https://www.megasoftware.net/)
