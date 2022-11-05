
#Loading data
data <- functions0
category <- as.factor(data$category)


#MDS
ord_func <- metaMDS(func_numeric, distance = "bray", trymax = 4999)

#Combining with other columns
nmds_func <- cbind(functions0$samples, category, data.frame(ord_func$points))
colnames(nmds_func) <- c("samples", "category", "MDS1", "MDS2")


#Running anosim
danosim_func <- anosim(func_numeric, data$category, permutations = 4999)