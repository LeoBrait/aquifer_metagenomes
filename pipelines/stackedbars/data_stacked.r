# Here we gonna transform the Datasets of Phyla, Genera and Functions,
# generating inputs for the stacked bars.

# To do this properly, we have to Re-Run the abundances calculations.
source("pipelines//abundances.r")




###############################################
####################### ABUNTANT PHYLA ########

# Treating Data to more Friendly names
ord_columns <- colnames(abundant_phyla)
ord_columns <-                     c("Proteobacteria",            "Others",                      "Bacteroidetes",
                                   "Actinobacteria",           "Euryarchaeota",                 "Firmicutes",
                                   "Planctomycetes",           "Cand. Division WWE3",          "Chloroflexi",
                                   "Cand. Woesebacteria",      "Spirochaetes",                  "Elusimicrobia",
                                   "Cand. Omnitrophica",       "Candidatus Moranbacteria",      "Nitrospirae")
colnames(abundant_phyla) <- ord_columns


# Swaping the order of others and proteobacteria columns and adding PubNames and samples to the data.frame
abundant_phyla <- abundant_phyla[c("Others",                   "Proteobacteria",                "Bacteroidetes",
                                   "Actinobacteria",           "Euryarchaeota",                 "Firmicutes",
                                   "Planctomycetes",           "Cand. Division WWE3",          "Chloroflexi",
                                   "Cand. Woesebacteria",      "Spirochaetes",                  "Elusimicrobia",
                                   "Cand. Omnitrophica",       "Candidatus Moranbacteria",      "Nitrospirae")]




abundant_phyla$category <- phyla0$category
abundant_phyla$samples <- metadata0$PubName

# Melting the data frame
df <- melt(abundant_phyla)

# Reordering group factor levels and passing the dummy variable to the final variable
df$category <- factor(df$category,
                                     levels = c("Karst P.", "Porous", "P. Contaminated", "S. Saline", "Geyser", "Mine"))
stacked_phyla <- df


########################### RARE PHYLA ########

rare_phyla_data <-    data.frame(phyla0$category,                            phyla0$samples, Others <- c(rep(NA, 109)),
                                 phyla0$Candidatus.Parcubacteria,            phyla0$Deinococcus.Thermus,          
                                                              

                                 phyla0$Candidatus.Saccharibacteria,         phyla0$candidate.division.NC10,
                                 phyla0$Candidatus.Cloacimonetes,            phyla0$Candidatus.Dadabacteria,
                                 phyla0$Candidatus.Desantisbacteria,         phyla0$Cyanobacteria,

                                 phyla0$Candidatus.Roizmanbacteria,          phyla0$candidate.division.Zixibacteria,
                                 phyla0$Candidatus.Riflebacteria,            phyla0$Thaumarchaeota,
                                 phyla0$Fusobacteria,                        phyla0$Balneolaeota)

# Treating Data to more Friendly names
colnames(rare_phyla_data)[1:17] <- c("category",                        "samples", "Others",
                                 "Cand. Parcubacteria",                 "Deinococcus Thermus",

                                 "Cand. Saccharibacteria",             "Cand. div. NC10",
                                 "Cand. Cloacimonetes",                "Cand. Dadabacteria",
                                 "Cand. Desantisbacteria",             "Cyanobacteria",

                                 "Cand. Roizmanbacteria",              "Cand. div. Zixibacteria",
                                 "Cand. Riflebacteria",                 "Thaumarchaeota",
                                 "Fusobacteria",                         "Balneolaeota"
                                 )

# Forging number of Others
total_relevant <- rowSums(rare_phyla_data[, 4:17])
total_relevant
Others <-  0.10 - total_relevant
Others
total_relevant
rare_phyla_data$Others <- Others
rare_phyla_data

# Associating PubNames as sample names and melting data
rare_phyla_data$samples <- metadata0$PubName
df_phyla_rare <- melt(rare_phyla_data)

#reordering the factor levels
df_phyla_rare$category <- factor(df_phyla_rare$category,      # Reordering group factor levels
                         levels = c("Karst P.", "Porous", "P. Contaminated", "S. Saline", "Geyser", "Mine"))


###############################################
############################### GENERA ########

# Geting the most relevant genera pointed by SIMPER analysis

genus_relevant <- data.frame(    genus0$category,                                      genus0$samples, Others <- c(rep(NA, 109)),
                                 genus0$Sulfuricurvum,                                 genus0$Candidatus.Altiarchaeum,
                                 genus0$Candidatus.Desulforudis,                       genus0$Cupriavidus,

                                 genus0$Smithella,                                     genus0$Caulobacter,
                                 genus0$Stenotrophomonas,                              genus0$Unclassified.genus.in.Helicobacteraceae,
                                 genus0$Desulfosporosinus,                             genus0$Pseudomonas,
 
                                 genus0$Roseovarius,                                   genus0$Ralstonia,
                                 genus0$Staphylococcus,                                genus0$Pseudodesulfovibrio)

# Treating Data to more Friendly names
colnames(genus_relevant)[1:17] <- c( "category",                                         "samples", "Others",
                                     "Sulfuricurvum",                                    "Cand. Altiarchaeum",
                                     "Cand. Desulforudis",                               "Cupriaviduss",

                                     "Smithella",                                        "Caulobacter",
                                     "Stenotrophomonas",                                 "Unc. Helicobacteraceae",
                                     "Desulfosporosinus",                                "Pseudomonas",

                                     "Roseovarius",                                      "Ralstonia",
                                     "Staphylococcus",                                   "Pseudodesulfovibrio")

# Forging number of Others
TotalRelevant <- rowSums(genus_relevant[, 4:17])
TotalRelevant
Others <- 1 - TotalRelevant
Others
TotalRelevant
genus_relevant$Others <- Others

# Associating PubNames as sample names and melting data
genus_relevant$samples <- metadata0$PubName
df_genus <- melt(genus_relevant)

#reordering the factor levels
df_genus$category <- factor(df_genus$category,      # Reordering group factor levels
                         levels = c("Karst P.", "Porous", "P. Contaminated", "S. Saline", "Geyser", "Mine"))

###############################################
############################ FUNCTIONS ########

# Geting the most relevant functions pointed by SIMPER analysis
functions_relevant <- data.frame(functions0$category,                                                                          metadata0$samples, Others <- c(rep(NA, 109)),
                                 functions0$TonB.dependent_receptor,                                                           functions0$Outer_membrane_protein_A_precursor.3,
                                 functions0$Phage_major_capsid_protein_.Fam0055,                                               functions0$TRAP.type_C4.dicarboxylate_transport_system._large_permease_component.2,

                                 functions0$X3.oxoacyl..acyl.carrier.protein._synthase._KASIII_.EC_2.3.1.180.,                 functions0$Cobalt.zinc.cadmium_resistance_protein_CzcA._Cation_efflux_system_protein_CusA.1,
                                 functions0$Alpha.1.2.mannosidase,                                                             functions0$Type_III_restriction.modification_system_methylation_subunit_.EC_2.1.1.72.,
                                 functions0$DNA.directed_RNA_polymerase_beta._subunit_.EC_2.7.7.6..1,                          functions0$Putative_DNA.binding_protein_in_cluster_with_Type_I_restriction.modification_system,

                                 functions0$NADH_dehydrogenase_subunit_5,                                                      functions0$Beta.galactosidase_.EC_3.2.1.23..2,
                                 functions0$Excinuclease_ABC_subunit_A,                                                        functions0$Lead._cadmium._zinc_and_mercury_transporting_ATPase_.EC_3.6.3.3._.EC_3.6.3.5.._Copper.translocating_P.type_ATPase_.EC_3.6.3.4.)


# changing col names, forging Other abundances
colnames(functions_relevant)[1:3] <- c("category", "samples", "Others")


total_relevant <- rowSums(functions_relevant[,4:17])
total_relevant
Others <- 0.101 - total_relevant
functions_relevant$Others <- Others

columns <- colnames(functions_relevant)
columns <- str_replace(columns, "functions0.", "")
columns
colnames(functions_relevant) <- columns



                    

# Abreviating function names
x <- c(       "TonB dependent receptor",                           "OmpA precursor",
              "Phage major capsid protein",                        "TRAP dicarboxylate transport",
               "3 oxoacyl acyl synthase",                          "Cobalt zinc cadimun resis",

               "Alpha mannosidase",                                "Type III restriction modification system methylation subunit",
               "DNA directed RNA polymerase beta subunit",          "Putative DNA binding protein",
               "NADH dehydrogenase subunit 5",                      "Beta galactosidase",
               "Excinuclease ABC subunit A",                        "Lead cadmium zinc and mercury transporting ATPase")




x <- abbreviate(x, minlength = 5, strict = FALSE, method = "both.sides")
x <- as.data.frame(x)
x[,1]

colnames(functions_relevant)[4:17] <- x[, 1]

functions_relevant$samples <- metadata0$PubName
colnames(functions_relevant)[1] <- "category"

df_func <- melt(functions_relevant)

df_func$category <- factor(df_func$category,      # Reordering group factor levels
                         levels = c("Karst P.", "Porous", "P. Contaminated", "S. Saline", "Geyser", "Mine"))


