# title: 'CCA Figure modified by Camilo'
# author: "Camilo M. Ferreira"
# output: svg figures

##ReadMe ------
# This script is not to run the Canonical Correlation Analysis, but only to plot
# the CCA in a publishing maner

# 1. Load the data frame with species to be selected in the ggrepel labels
labelsPlotSpecies <- read_csv("inputs/simper_ranking.csv")


#### 2. Ploting Phyla CCA using ggplot2 ----
# 2.1 Small data wrangling
# Create a vector with the Aquifers types
treatment <- ambiental_clustered$category

# Create a df with CCA result from stepwise selection
cca.res <- summary(fmodel_phyla)
cca.species <- data.frame(cca.res$species)
cca.species <- tibble::rownames_to_column(cca.species, "species")
ord_df <- data.frame(
    species = cca.species$species,
    CCA1 = cca.species$CCA1,
    CCA2 = cca.species$CCA2)


# Add species  as factor
ord_df$species <- factor(ord_df$species)

# No idea what this chunk does
exp <- cca.res$concont
exp <- data.frame(exp$importance)

# Select features (variables) and interaction strength
scrs <- scores(fmodel_phyla, display = "bp")
mul <- vegan:::ordiArrowMul(scrs)

cca.species <- data.frame(cca.res$species)
cca.species <- cca.species * (mul)

cca.amb <- data.frame(cca.res$biplot)
cca.amb <- cca.amb * mul
cca.amb <- data.frame(
    cca1 = cca.amb$CCA1,
    cca2 = cca.amb$CCA2,
    variables = rownames(cca.amb)
    )

cca.amb <- cca.amb %>%
    mutate(variables = recode(variables,
        "categoryPorous" = "Porous",
        "categoryP. Contaminated" = "P. Contaminated",
        "categoryS. Saline" = "S. Saline",
        "categoryGeyser" = "Geyser",
        "categoryMine" = "Mine",
        "LUH2_c3nfx" = "N fixing crop",
        "LUH2_range" = "Range land",
        "silt" = "Silt",
        "LUH2_c4per" = "C4 P. crops",
        "LUH2_c3per" = "C3 P. crop",
        "clust_dist" = "Distances",
        "wv0033" =  "Low Water retention",
        "ocs" = "Soil organic Carbon",
        "BIO12_Annual_Precipitation" = "A. Precipitation",
        "bdod" = "Bulk density",
        "wv1500" =  "High Water retention"
    ))




# 3.1.1 Change the names of the species to only show the first 20 phyla that from
# SIMPER on the ord_df data frame
ord_df <- ord_df %>%
    mutate(species = as.factor(species)) %>%
    mutate(species = factor(case_when(
        species %in% labelsPlotSpecies$phyla ~ species
    ))) %>%
    mutate(species = as.character(species))
ord_df[is.na(ord_df)] <- ""

# 3.1.2 reordering to better manipulation and changing names to better readability
ord_df <- ord_df  %>% arrange(desc(CCA2))
ord_df <- ord_df %>%
    mutate(
            species = recode(
                              species,
                              "Candidatus.Parcubacteria" = "Cand. Parcubacteria",
                              "Candidatus.Atribacteria" = "Cand. Atribacteria",
                              "Candidatus.Nealsonbacteria" = "Cand. Nealsonbacteria",
                              "Deinococcus.Thermus" = "Deinococcus Thermus",
                              "Candidatus.Saccharibacteria" = "Cand. Saccharibacteria",
                              "candidate.division.NC10" = "Cand. div. NC10",
                              "Candidatus.Cloacimonetes" = "Cand. Cloacimonetes",
                              "Candidatus.Dadabacteria" = "Cand. Dadabacteria",
                              "Candidatus.Desantisbacteria" = "Cand. Desantisbacteria",
                              "Candidatus.Roizmanbacteria" = "Cand. Roizmanbacteria",
                              "candidate.division.Zixibacteria" = "Cand. div. Zixibacteria",
                              "Candidatus.Riflebacteria" =  "Cand. Riflebacteria",
                              "Candidatus.Wolfebacteria" = "Cand. Wolfebacteria",
                              )
            )






#Specify data for plot
label_phyla <- ord_df$species
label <- label_phyla
max_overlaps <- 20
title <- "Phyla"
tag <- "A"
points_color <- tax_color
mult_line <- 2.8
mult_text <- 3
forcepull <- 0
pointpad <- 10      #more or less smoke
alpha <- 1
p_size <- 5
min_length <- 3
start_x <- c(
             1,
             1,
             1,
             1,
             1,

             0,
             0,
             0,
             0,
             0,

            2,
            2,
            2,
            2,
            2,

            2,
            2,
            2,
            2,
            2
            )
start_y <- c(
            -1,
            -1,
            -1,
            -1,
            -1,

            1,
            1,
            1,
            1,
            1,

            0,
            0,
            0,
            0,
            0,

            0,
            0,
            0,
            0,
            0
            )
force <- 1
direction <- "y"


teste <- ord_df[ ord_df$species == "", ]
