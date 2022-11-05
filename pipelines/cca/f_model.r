 F-model
fmodel_genus <- ordiR2step(
                          mod1_genus, scope = formula(mod2_genus),
                          perm.max = 4999, R2scope = FALSE, parallel = 3
                          )
fmodel_phyla <- ordiR2step(
                           mod1_phyla, scope = formula(mod2_phyla),
                           perm.max = 4999, R2scope = FALSE, parallel = 3
                          )
fmodel_fun <- ordiR2step(
                          mod1_fun, scope = formula(mod2_fun),
                          perm.max = 4999, R2scope = FALSE, parallel = 3
                        )





R2_fmodel_genus <- RsquareAdj(fmodel_genus)
R2_fmodel_phyla <- RsquareAdj(fmodel_phyla)
R2_fmodel_fun <- RsquareAdj(fmodel_fun)

# Saving
saveRDS(fmodel_genus, "outputs//other//fmodel_genus.rds")
saveRDS(fmodel_phyla, "outputs//other//fmodel_phyla.rds")
saveRDS(fmodel_fun, "outputs//other//fmodel_fun.rds")

fmodel_genus <- readRDS("outputs//other//fmodel_genus.rds")
fmodel_phyla <- readRDS("outputs//other//fmodel_phyla.rds")
fmodel_fun <- readRDS("outputs//other//fmodel_fun.rds")

s_genus <- summary(fmodel_genus)
capture.output(s_genus, file = "outputs//other//fmodel_genus.txt")
s_phyla <- summary(fmodel_phyla)
capture.output(s_phyla, file = "outputs//other//fmodel_phyla.txt")
s_fun <- summary(fmodel_fun)
capture.output(s_fun, file = "outputs//other//fmodel_fun.txt")
