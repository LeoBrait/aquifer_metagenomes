functions <- functions0
genus <- genus0
phyla <- phyla0

#FUNCTIONAL PERMANOVA
func_dist_matrix <- vegdist(func_numeric, method = "manhattan")
func_perm_model <- adonis2(func_numeric ~ functions0$category, permutations = 4999)
summary(func_perm_model)
perma_func_pairwise <- adonis.pair(func_dist_matrix, functions0$category, nper = 4999, corr.method = "fdr") #pairwise
write.csv(perma_func_pairwise, file = paste("outputs//tables//permanova_functional-pairwise.csv"))
rm(func_dist_matrix, func_perm_model, perma_func_pairwise)

#GENERA PERMANOVA
genera_dist_matrix <- vegdist(genus_numeric, method = "manhattan")
genera_perm_model <- adonis2(genus_numeric ~ genus0$category, permutations = 4999)
summary(genera_perm_model)
perma_genera_pairwise <- adonis.pair(genera_dist_matrix, genus$category, nper = 4999, corr.method = "fdr")
write.csv(perma_genera_pairwise, file = paste("outputs//tables//permanova_genera-pairwise.csv"))
rm(genera_dist_matrix, genera_perm_model, perma_genera_pairwise)

#PHYLA PERMANOVA
phyla_dist_matrix <- vegdist(phyla_numeric, method = "manhattan")
phyla_perm_model <- adonis2(phyla_numeric ~ phyla0$category, permutations = 4999)
summary(phyla_perm_model)
perma_phyla_pairwise <- adonis.pair(phyla_dist_matrix, phyla0$category, nper = 4999, corr.method = "fdr")
write.csv(perma_phyla_pairwise, file = paste("outputs//tables//permanova_phyla-pairwise.csv"))
rm(phyla_dist_matrix, phyla_perm_model, perma_phyla_pairwise)

#Richness
genus$richness <- rowSums(genus_numeric > 0) #Array of Genera Richness
functions$richness <- rowSums(func_numeric > 0)  #Array of Functions Richness

#Shannon diversity
genus$diversity <- exp(diversity(genus_numeric)) #Getting genera diversity and transforming by exp
functions$diversity <- exp(diversity(func_numeric)) #Same here


# 1. FUNCTIONAL RICHNESS PERANOVA
func_rich <- adonis2(functions$richness ~ category, method = "euclidian", permutations = 4999, data = functions) #peranova testing richness variation between aquifer types
func_rich #check results
pera_func_rich <- adonis.pair(vegdist(functions$richness, method = "euclidian"), functions$category, nper = 4999, corr.method = "fdr") # teste a posteriori da media, differences pair-pair of richness
write.csv(pera_func_rich, file = paste("outputs//tables//Peranova_functional_richness.csv"))

# 1.1 Hacking grouping with letters (Functional Richness Peranova)
func_rich_AOV <- aovp(richness ~ category, perm = "", data = functions)
summary(func_rich_AOV)
pairwise_rich <- glht(func_rich_AOV, linfct = mcp(category = "Tukey"))
tuk.cld <- cld(pairwise_rich)
x <- tuk.cld$mcletters$Letters
func_rich_pair_letters <- data.frame(groups = c(x["Porous"], x["Mine"], x["Karst P."], x["S. Saline"], x["P. Contaminated"], x["Geyser"]),
                                     type = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser"),
                                      y = c(27000, 27000, 27000, 27000, 27000, 27000)
                                                                                                                                     )

# 2. FUNCTIONAL DIVERSITY PERANOVA
fun_div <- adonis2(functions$diversity ~ category, method = "euclidian", nperm = 4999, data = functions) #peranova testing functional diversity variation between aquifer types
fun_div #check results
pairwise_fun_div <- adonis.pair(vegdist(functions$diversity, method = "euclidian"), functions$category, nper = 4999, corr.method = "fdr") # teste a posteriori da media, differences pair-pair of richness
write.csv(pairwise_fun_div, file = paste("outputs//tables//Peranova_functional_Diversity.csv"))

# 2.1 Hacking grouping with letters (Functional Diversity Peranova)
func_div_AOV <- aovp(diversity ~ category, perm = "", data = functions)
summary(func_div_AOV)
func_pairwise_div <- glht(func_div_AOV, linfct = mcp(category = "Tukey"))
tuk.cld <- cld(func_pairwise_div)
x <- tuk.cld$mcletters$Letters
func_div_pair_letters <- data.frame(groups = c(x["Porous"], x["Mine"], x["Karst P."], x["S. Saline"], x["P. Contaminated"], x["Geyser"]),
                                    type = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser"),
                                    y = c(4300, 4300, 4300, 4300, 4300, 4300)
                                                                                                                                     )

# 3. GENUS RICHNESS PERANOVA
genus_rich <- adonis2(genus$richness ~ category, method = "euclidian", nperm = 4999, data = genus) #peranova testing genus richness variation between aquifer types
genus_rich #check results
pairwise_genus_rich <- adonis.pair(vegdist(genus$richness, method = "euclidian"), genus$category, nper = 4999, corr.method = "fdr") # teste a posteriori da media, differences pair-pair of richness
write.csv(pairwise_genus_rich, file = paste("outputs//tables//PeranovaPairwise_genera_richness.csv"))

# 3.1 Hacking grouping with letters (Genus Richness Peranova)
genus_rich_AOV <- aovp(richness ~ category, perm = "", data = genus)
summary(genus_rich_AOV)
genus_pairwise_rich <- glht(genus_rich_AOV, linfct = mcp(category = "Tukey"))
tuk.cld <- cld(genus_pairwise_rich)
x <- tuk.cld$mcletters$Letters
genus_rich_pair_letters <- data.frame(groups = c(x["Porous"], x["Mine"], x["Karst P."], x["S. Saline"], x["P. Contaminated"], x["Geyser"]),
                                    type = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser"),
                                    y = c(1860, 1860, 1860, 1860, 1860, 1860)
                                                                                                                                     )

# 4 GENUS DIVERTY PERANOVA
genus_div <- adonis2(genus$diversity ~ category, method = "euclidian", nperm = 4999, data = genus) #peranova testing richness variation between aquifer types
genus_div #check results
pairwise_genus_div <- adonis.pair(vegdist(genus$diversity, method = "euclidian"), genus$category, nper = 4999, corr.method = "fdr") # teste a posteriori da media, differences pair-pair of richness
write.csv(pairwise_genus_div, file = paste("outputs//tables//PeranovaPairwise_genera_diversity.csv"))

# 4.1 Hacking grouping with letters (Genus Richness Peranova)
genus_div_AOV <- aovp(diversity ~ category, perm = "", data = genus)
summary(genus_div_AOV)
genus_pairwise_div <- glht(genus_div_AOV, linfct = mcp(category = "Tukey"))
tuk.cld <- cld(genus_pairwise_div)
x <- tuk.cld$mcletters$Letters
genus_div_pair_letters <- data.frame(groups = c(x["Porous"], x["Mine"], x["Karst P."], x["S. Saline"], x["P. Contaminated"], x["Geyser"]),
                                    type = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser"),
                                    y = c(630, 630, 630, 630, 630, 630)
                                                                                                                                     )
