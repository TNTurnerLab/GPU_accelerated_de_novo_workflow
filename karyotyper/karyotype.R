#!/bin/Rscript
#Karyotype analysis for all samples in a directory
#Tychele N. Turner, Ph.D.
#Last update: April 12, 2021

chroms <- c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY")

reference <- read.delim("./chrom_sizes_without_gaps.txt")

files <- list.files(".", pattern="*read_counts.txt")
samples <- unique(sapply(files, function(x) strsplit(x, "_ch")[[1]][1]))

individual <- list()

for(i in 1:length(files)){
	individual[[i]] <- read.delim(files[i], header=F)
	individual[[i]]$sample <- sapply(files[i], function(x) strsplit(x, "_ch")[[1]][1])
	individual[[i]]$chr <- sapply(files[i], function(x) strsplit(strsplit(x, "_")[[1]][2], "_read")[[1]][1])
}

combined <- do.call("rbind", individual)

results <- list()
mref <- list()
for(i in 1:length(samples)){
	results[[i]] <- combined[which(combined$sample == samples[i]),]
	mref[[i]] <- merge(reference, results[[i]], by.x="chroms", by.y="chr")
	mref[[i]]$proportion <- mref[[i]]$V1/mref[[i]]$sizes
	mref[[i]]$cn <- round((mref[[i]]$proportion/mref[[i]][which(mref[[i]]$chr == "chr1"),]$proportion)*2, digits=0)
}

final <- do.call("rbind", mref)
finalX <- final[which(final$chroms == "chrX"),]
#finalX$cn <- finalX$cn/2
finalY <- final[which(final$chroms == "chrY"),]
finalY$cn <- finalY$cn/2
finalaut <- final[!(final$chroms %in% c("chrX", "chrY")),]
finalset <- rbind(finalaut, finalX, finalY)

sampletest <- list()
counts <- list()
X <- list()
Y <- list()
karyotype <- list()

for(i in 1:length(samples)){
	sampletest[[i]] <- finalset[which(finalset$sample == samples[i]),]
	counts[[i]] <- sum(sampletest[[i]]$cn)
	if(sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn > 0 & sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn > 0){
		X[[i]] <- paste(rep("X", sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn), collapse="")
		Y[[i]] <- paste(rep("Y", sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn), collapse="")
		karyotype[[i]] <- paste(counts[[i]], ",", X[[i]], Y[[i]], sep="")
	} 
	if(sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn == 0 & sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn == 0){
		karyotype[[i]] <- paste(counts[[i]])
	} 
	if(sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn > 0 & sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn == 0){
		X[[i]] <- paste(rep("X", sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn), collapse="")
		karyotype[[i]] <- paste(counts[[i]], ",", X[[i]], sep="")
	} 
	if(sampletest[[i]][which(sampletest[[i]]$chroms == "chrX"),]$cn == 0 & sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn > 0){
		Y[[i]] <- paste(rep("Y", sampletest[[i]][which(sampletest[[i]]$chroms == "chrY"),]$cn), collapse="")
		karyotype[[i]] <- paste(counts[[i]], ",", Y[[i]], sep="")
	}
}

sampleset <- do.call("rbind", sampletest)
write.table(sampleset, file="samples_counts.txt", sep="\t", quote=F, row.names=F)

karyotypes <- do.call("rbind", karyotype)
karyotypeset <- data.frame(samples, karyotypes)

write.table(karyotypeset, file="karyotypes.txt", sep="\t", quote=F, row.names=F)
