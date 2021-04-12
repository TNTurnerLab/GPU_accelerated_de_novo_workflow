1. Get pedigree file
```
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/20130606_g1k_3202_samples_ped_population.txt
```

2. Make de novo bed file from each de novo vcf file
```
for i in *.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf; do echo "$i"; awk '{print $1"\t"$2-1"\t"$2"\t"FILENAME"\t""POINT"}' "$i" | grep -v '#' | sed 's/.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf//g' > "$i".denovo.bed; done
```

3. Get children names
```
ls *.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.denovo.bed | sed 's/.glnexus.family.combined_intersection_filtered_gq_20_depth_10_position.vcf.denovo.bed//g' > children_names.txt
```

4. Get trio sample names
```
grep -f children_names.txt 20130606_g1k_3202_samples_ped_population.txt  | cut -f2 -d " " > child
grep -f children_names.txt 20130606_g1k_3202_samples_ped_population.txt  | cut -f3 -d " " > dad
grep -f children_names.txt 20130606_g1k_3202_samples_ped_population.txt  | cut -f4 -d " " > mom
cat child dad mom > all_trio_samples.txt
```

5. Make a new pedigree file
```
grep -f all_trio_samples.txt 20130606_g1k_3202_samples_ped_population.txt  | cut -f1,2,3,4,5 -d" " | wc -l
```

6. Make pedigree for unfazed
```
grep -f all_trio_samples.txt 20130606_g1k_3202_samples_ped_population.txt  | cut -f1,2,3,4,5 -d" " > pedigree_for_unfazed.txt
```

7. Make a line file for iterating through file
```
grep -v -w '0' pedigree_for_unfazed.txt > linefile
```

8. Run the analysis
```
sh master_submitter.sh
```
