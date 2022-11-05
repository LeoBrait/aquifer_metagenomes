
#Loading data
data <- phyla0
category <- as.factor(data$category)


#MDS
ord_phyla <- metaMDS(phyla_numeric, distance = "bray", trymax = 4999)

#Combining with other columns
nmds_phyla <- cbind(phyla0$samples, category, data.frame(ord_phyla$points))
colnames(nmds_phyla) <- c("samples", "category", "MDS1", "MDS2")

#Running anosim
danosim_phyla <- anosim(phyla_numeric, data$category, permutations = 4999)
