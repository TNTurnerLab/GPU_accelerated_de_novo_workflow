#!/bin/Rscript

ebv <- read.delim("viral_mapped_counts.txt", header=F)
ebv$fold <- (ebv$V3*150)/ebv$V2
chr1 <- read.delim("chr1_mapped_counts.txt", header=F)
chr1$fold <- (chr1$V3*150)/chr1$V2

m1 <- merge(ebv, chr1, by="V1")
m1$copy_number <- m1$fold.x/m1$fold.y

colnames(m1) <- c("sample", "chrEBV_length", "chrEBV_mapped_reads", "chrEBV_fold_coverage", "chr1_length", "chr1_mapped_reads", "chr1_fold_coverage", "EBV_copy_number")

write.table(m1, file="viral_estimation.txt", sep="\t", quote=F, row.names=F)
