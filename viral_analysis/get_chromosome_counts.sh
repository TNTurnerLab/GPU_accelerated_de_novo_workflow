#!/bin/bash

grep 'EBV' *txt | cut -f1,2,3 | sed 's/.idxstats.txt:chrEBV//g' | tr ' ' '\t' > viral_mapped_counts.txt

grep -w 'chr1' *txt | cut -f1,2,3 | sed 's/.idxstats.txt:chr1//g' | tr ' ' '\t' > chr1_mapped_counts.txt

