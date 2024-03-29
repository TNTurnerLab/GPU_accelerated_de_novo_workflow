Jeffrey Ng 
Turner Lab, Washington University St. Louis

Here is a collection of bash scripts that were used to run the NA12878 comparison, which was also used to run on the full 602 trios from the 1000 genomes project.

## cram file processing for *de novo* workflow input

### 1kg_deep.sh and 1kg_gatk.sh 
These are bash scripts that call Parabricks v3.0.0 DeepVariant and GATK Haplotypecaller, respectively.  The run_pipeline.py script is a wrapper that is needed to run Parabricks on our server system, but the general commands to run Parabricks are the same outside that.  The docker image is included within the script is specific for using Parabricks on our server system.  Your own Parabricks docker image will be necessary.

### submit_glnexus_dv.sh and submit_glnexus_hc.sh 
These are example bash scripts that call GLnexus v1.2.6 to genotype the output from DeepVariant and GATK Haplotypecaller, respectively. The docker image is included within the script and is publicly available by the authors of [GLnexus](https://github.com/dnanexus-rnd/GLnexus).  

### bcftovcf.sh 
Is a script that converts the .bcf output from the GLnexus run to a vcf file.  The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter

### makeindex.sh 
Is a script that creates a tabix index for the vcf file.  The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter

At this point, you can run the *de novo* workflow.


## Realignment and downsampling

### speedseq_snake.snake 
Is a Snakemake workflow that realigns the downloaded NA12878 samples to our reference file using Speedseq v0.1.2 pulled from their [github](https://github.com/hall-lab/speedseq).  
Associated with this snake are these two files, config.json and cluster_config.json.  

The config.json options are:

* reference:  Path to reference file
* data_dir:  Path to location of data to be realigned

cluster_config.json holds server node requirements

The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:speedseq

### samtools_downsample.sh and submit_downsample.sh

These two bash scripts were used to conduct the downsampling.  The same root, 42, was used for all samples.  The amount downsampled changed to get the sample to around 30x coverage.

submit_downsample holds the bsub command for our server to send the jobs out, using the docker image below.  samtools_downsamples.sh has the SAMtools downsample command.

The docker image used for this file can be found at tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter

## Tree creation
The input for the following python scripts was created using GATK 3.5 Combine Variants to combine the variants from the output of the *de novo* workflow.

```
java -Xmx15G -jar /GenomeAnalysisTK.jar -T CombineVariants -R /storage1/fs1/tychele/Active/testing/reference/GRCh38_full_analysis_set_plus_decoy_hla.fa -V:NA12878_2020 /storage1/fs1/tychele/Active/testing/ris_testing/parabricks/glnexus_trios_only_redo/workflow/out/NA12878/NA12878.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf -V:NA12878_2012 Old_NA12878.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.gz -V:SRR952827 SRR952827_1_downsample.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.gz -V:MGI_2018_H_IJ-NA12878 H_IJ-NA12878.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.gz -V:gerald_HFKWMDSXX_combo gerald_HFKWMDSXX_combo_downsample.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.gz -genotypeMergeOptions PRIORITIZE -priority NA12878_2020,gerald_HFKWMDSXX_combo,MGI_2018_H_IJ-NA12878,SRR952827,NA12878_2012

```
This command was run within the tnturnerlab/gpu_accelerated_denovo_workflow:glnexus_filter docker image

To create the tree, the python scripts in this order were used:

modify_combined_for_tree.py -> modify_combined_nt.py -> modify_IUPAC.py -> make_fasta.py

The tree itself was made within [MEGAX](https://www.megasoftware.net/) from the fasta file made from make_fasta.py.  We used a ClustalW alignment and Maximum Likelihood Tree options.
