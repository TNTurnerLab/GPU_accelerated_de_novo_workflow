#!/bin/bash

while read family child father mother sex
do
sh submitting_unfazed.sh "$child".glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.denovo.bed /path/to/genomewide/deepvariantVCF/"$child".trio.glnexus.dv.vcf.gz pedigree_for_unfazed.txt "$child" "$father" "$mother" /path/to/GRCh38_full_analysis_set_plus_decoy_hla.fa 
done < linefile
