Turner Lab
Washington Univserity in St. Louis
Jeffrey Ng

## *de novo* worflow

The de novo workflow main input is the vcf output from GLnexus for both GATK Haplotypecaller and DeepVariant.  Things needed are two text files that have the family information, one that is text delimited and one that is comma delimited.  The order of the samples should be this:  Father, Mother, Child.  RepeatMaster files for hg38 centromeres, LCR regions, and recently discovered repeat regions were used to filter by position, CpG sites locations were also used to determine percent % CpG for our *de novo* variants.


### Config.json options:

* Reference:  Reference file
* family_file:  Trio family file, tab delimited
* family_file_c:  Trio family file, comma delimited
* glnexus_file_dv:  Pathway to where the vcf output from GLnexus run on DeepVariant is.  
* glnexus_file_hc:  Pathway to where the vcf output from GLnexus run on GATK Haploytpecaller is.  
* regions:  Folder to where RepeatMaster files are for region based filtering.
* gq_value:  gq value filter.
* depth_value: Depth value filter.
* out_dir:  Output directory.  

The input is a folder that hold vcfs from DeepVariant and Haplotypecaller.  Make sure that each caller is in a separate folder.  The snake will run all trios listed within the family file, so please ensure that the trios intended to be run matches the input within the folders.

The output are multiple vcf files.  
The main de novo calls are found in vcf files with the suffix:  _position.vcf
vcf file with the suffix _position_all.vcf is the region based filtered vcf file.  This marks how many de novo variants are found within CpG regions.
