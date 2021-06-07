### Viral Analysis

1. For each cram file calculate the idxstats
```
samtools idxstats sample.cram > sample.idxstats.txt
```

2. Run the get chromosome count for EBV and chromosome 1
```
sh get_chromosome_counts.sh
```

3. Calculate EBV copy number across the whole dataset
```
Rscript calculate_ebv_copy_number.R
```


