
#Normalizing ambiental data
ambiental_clustered[3:ncol(ambiental_clustered)] <- apply(ambiental_clustered[3:ncol(ambiental_clustered)], 2, normalize)
#Cheking the normalization
print(paste("The mean of ambiental normalization is:", round(mean(ambiental_clustered$clay), 2)), sep = " ")
print(paste("The sd of ambiental normalization is:", sd(ambiental_clustered$clay)), sep = " ")

### Running cca with forward model selection (intercept then full model)

#Genus
mod1_genus <- cca(genus_ambiental ~ 1, na.action = "na.exclude", data = ambiental_clustered)
mod2_genus <- cca(genus_ambiental ~ ., na.action = "na.exclude", data = ambiental_clustered)
anova_full_genus <- anova(mod1_genus, mod2_genus)

#Phyla
mod1_phyla <- cca(phyla_ambiental ~ 1, na.action = "na.exclude", data = ambiental_clustered)
mod2_phyla <- cca(phyla_ambiental ~ ., na.action = "na.exclude", data = ambiental_clustered)
anova_full_phyla <- anova(mod2_phyla, mod1_phyla)

#Functions
mod1_fun <- cca(func_ambiental ~ 1, na.action = "na.exclude", data = ambiental_clustered)
mod2_fun <- cca(func_ambiental ~ ., na.action = "na.exclude", data = ambiental_clustered)
anova_full_fun <- anova(mod2_fun, mod1_fun)

#Saving
saveRDS(mod2_genus, "outputs//other//full_genus.rds")
saveRDS(mod2_phyla, "outputs//other//full_phyla.rds")
saveRDS(mod2_fun, "outputs//other//full_fun.rds")

capture.output(anova_full_genus, file = "outputs//other//anova_full_genus.txt")
capture.output(anova_full_phyla, file = "outputs//other//anova_full_phyla.txt")
capture.output(anova_full_fun, file = "outputs//other//anova_full_fun.txt")

saveRDS(anova_full_genus, "outputs//other//anova_full_genus.rds")
saveRDS(anova_full_phyla, "outputs//other//anova_full_phyla.rds")
saveRDS(anova_full_fun, "outputs//other//anova_full_fun.rds")
