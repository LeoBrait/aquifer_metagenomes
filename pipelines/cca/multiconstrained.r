genus_multiconstrained <- multiconstrained(method = "cca", genus_ambiental ~ category, data = ambiental_clustered,
                                           distance = "bray", add = TRUE, contrast = 0, permutations = 4999, by = "margin")


phyla_multiconstrained <- multiconstrained(method = "cca", phyla_ambiental ~ category, data = ambiental_clustered,
                                           distance = "bray", add = TRUE, contrast = 0, permutations = 4999, by = "margin")

fun_multiconstrained <- multiconstrained(method = "cca", func_ambiental ~ category, data = ambiental_clustered,
                                           distance = "bray", add = TRUE, contrast = 0, permutations = 4999, by = "margin")


saveRDS(genus_multiconstrained, "outputs//other//pairwise_genus.rds")
saveRDS(phyla_multiconstrained, "outputs//other//pairwise_phyla.rds")
saveRDS(fun_multiconstrained, "outputs//other//pairwise_fun.rds")

capture.output(genus_multiconstrained, file = "outputs//other//pairwise_genus.txt")
capture.output(phyla_multiconstrained, file = "outputs//other//pairwise_phyla.txt")
capture.output(fun_multiconstrained, file = "outputs//other//pairwise_fun.txt")



#running anova
anova(mod1_genus, fmodel_genus)
anova(mod1_phyla, fmodel_phyla)
anova(mod1_fun, fmodel_fun)

anova_fmodel_genus <- anova(fmodel_genus, by = "margin", permutations = 4999)
anova_fmodel_phyla <- anova(fmodel_phyla, by = "margin", permutations = 4999)
anova_fmodel_fun <- anova(fmodel_fun, by = "margin", permutations = 4999)


saveRDS(anova_fmodel_genus, "outputs//other//anova_fmodel_genus.rds")
saveRDS(anova_fmodel_phyla, "outputs//other//anova_fmodel_phyla.rds")
saveRDS(anova_fmodel_fun, "outputs//other//anova_fmodel_fun.rds")

anova_fmodel_genus <- readRDS("outputs//other//anova_fmodel_genus.rds")
anova_fmodel_phyla <- readRDS("outputs//other//anova_fmodel_phyla.rds")
anova_fmodel_fun <- readRDS("outputs//other//anova_fmodel_fun.rds")

capture.output(anova_fmodel_genus, file = "outputs//other//anova_fmodel_genus.txt")
capture.output(anova_fmodel_phyla, file = "outputs//other//anova_fmodel_phyla.txt")
capture.output(anova_fmodel_fun, file = "outputs//other//anova_fmodel_fun.txt")


