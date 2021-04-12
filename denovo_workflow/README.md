Turner Lab
Washington Univserity in St. Louis
Jeffrey Ng

## *de novo* worflow

The de novo workflow main input is the vcf output from GLnexus for both GATK Haplotypecaller and DeepVariant.  Things needed are two text files that have the family information, one that is text delimited and one that is comma delimited.  The order of the samples should be this:  Father, Mother, Child.  RepeatMaster files for hg38 centromeres, LCR regions, and recent repeat regions (< 10% diverged from the consenus in RepeatMasker) were used to filter by position, CpG sites locations were also used to determine percent % CpG for our *de novo* variants.


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


###Reference Files

#### Centromeres
```
https://de.cyverse.org/dl/d/B42A0F3D-C402-4D5F-BBD5-F0E61BE2F4AC/hg38_centromeres_09252018.bed.gz
https://de.cyverse.org/dl/d/37B13DB5-0478-4C4B-B18D-33AFB742E782/hg38_centromeres_09252018.bed.gz.tbi
```

#### LCR plus 5 bp buffer
```
https://de.cyverse.org/dl/d/870755FF-CD04-4010-A1EC-658D7E1151EF/LCR-hs38-5bp-buffer.bed.gz
https://de.cyverse.org/dl/d/01D038EA-51CC-4750-9814-0BB3784E808E/LCR-hs38-5bp-buffer.bed.gz.tbi
```

#### Recent repeats + 5 bp buffer
```
https://de.cyverse.org/dl/d/185DA9BC-E13D-429B-94EA-632BDAB4F8ED/recent_repeat_b38-5bp-buffer.bed.gz
https://de.cyverse.org/dl/d/4A6AF6EF-D3F0-4339-9B8E-3E9E83638F00/recent_repeat_b38-5bp-buffer.bed.gz.tbi
```

#### CpG Locations
```
https://de.cyverse.org/dl/d/786D1640-3A26-4A1C-B96F-425065FBC6B7/CpG_sites_sorted_b38.bed.gz
https://de.cyverse.org/dl/d/713F020E-246B-4C47-BBC3-D4BB86BFB6E9/CpG_sites_sorted_b38.bed.gz.tbi
```

