
# Eliminating Soil organic carbon content(soc) due to the number of missing data
drop <- c("soc")
ambiental_clustered <- ambiental_clustered[, !(names(
                                            ambiental_clustered
                                                    ) %in% drop
                                               )
                                           ]

### Binding bdod data and annotated data to drop some NA rows
genus_ambiental <- cbind(genus_numeric, bdod = ambiental_clustered$bdod)
func_ambiental <- cbind(func_numeric, bdod = ambiental_clustered$bdod)
phyla_ambiental <- cbind(phyla_numeric, bdod = ambiental_clustered$bdod)


### Eliminating samples with NA on bulk density(amb).
ambiental_clustered <- ambiental_clustered[!is.na(ambiental_clustered$bdod), ]
func_ambiental <- func_ambiental[!is.na(func_ambiental$bdod), ]
phyla_ambiental <- phyla_ambiental[!is.na(phyla_ambiental$bdod), ]
genus_ambiental <- genus_ambiental[!is.na(genus_ambiental$bdod), ]

### Cleaning the auxiliar variable (bdod)
func_ambiental$bdod <- NULL
phyla_ambiental$bdod <- NULL
genus_ambiental$bdod <- NULL


### making an array of clusters
clust_array <- ambiental_clustered$clust_dist