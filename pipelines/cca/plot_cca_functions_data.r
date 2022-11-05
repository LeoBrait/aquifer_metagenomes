# title: 'CCA Figure modified by Camilo'
# author: "Camilo M. Ferreira"
# output: svg figures



##ReadMe ------
# This script is not to run the Canonical Correlation Analysis, but only to plot
# the CCA in a publishing maner

# 1. Load the data frame with species to be selected in the ggrepel labels

labelsPlotSpecies <- read_csv("inputs//simper_ranking.csv")

#### 2. Ploting Phyla CCA using ggplot2 ----
# 2.1 Small data wrangling
# Create a vector with the Aquifers types

# Create a df with CCA result from stepwise selection
cca.res <- summary(fmodel_fun)
cca.functions <- data.frame(cca.res$species)
cca.functions <- tibble::rownames_to_column(cca.functions, "functions")

# Create the ordination data frame
ord_df <- data.frame(
    functions = cca.functions$functions,
    CCA1 = cca.functions$CCA1,
    CCA2 = cca.functions$CCA2)

# No idea what this chunk does
exp <- cca.res$concont
exp <- data.frame(exp$importance)

# Select features (variables) and interaction strength
scrs <- scores(fmodel_fun, display = "bp")
mul <- vegan:::ordiArrowMul(scrs)

cca.functions <- data.frame(cca.res$species)
cca.functions <- cca.functions * (mul)


cca.amb <- data.frame(cca.res$biplot)
cca.amb <- cca.amb * mul
cca.amb <- data.frame(
    cca1 = cca.amb$CCA1,
    cca2 = cca.amb$CCA2,
    variables = rownames(cca.amb)
    )

# Check the variable names


# Fix variable names
cca.amb <- cca.amb %>%
    mutate(variables = recode(variables,
        "categoryPorous" = "Porous",
        "categoryP. Contaminated" = "P. Contaminated",
        "categoryS. Saline" = "S. Saline",
        "categoryGeyser" = "Geyser",
        "categoryMine" = "Mine",
        "LUH2_range" = "Range land",
        "clust_dist" = "Distances",
        "LUH2_c4ann" = "C4 A. crops",
        "LUH2_primn" = "Non-forest P. land",
        "LUH2_primf" = "Forest P. land",
        "LUH2_c3ann" = "C3 A. crops",
        "ocs" = "Soil organic Carbon",
        "silt" = "Silt"
    ))

    # Clean the functions that will be shown in the plot

# 3.1.1 Change the names of the functions to only show the first 20 functions
# from SIMPER on the ord_df data frame
ord_df <- ord_df %>%
    mutate(functions = as.factor(functions)) %>%
    mutate(functions = factor(case_when(
        functions %in% labelsPlotSpecies$functions ~ functions
    ))) %>%
    mutate(functions = as.character(functions))

ord_df[is.na(ord_df)] <- ""
colnames(ord_df) <- c("species", "CCA1", "CCA2")

#change names
ord_df$species <- gsub("TonB.dependent_receptor", "TnBdr", ord_df$species)
ord_df$species <- gsub("Outer_membrane_protein_A_precursor.3", "OmpAp", ord_df$species)
ord_df$species <- gsub("Phage_major_capsid_protein_.Fam0055", "Phmcp", ord_df$species)
ord_df$species <- gsub("X3.oxoacyl..acyl.carrier.protein._synthase._KASIII_.EC_2.3.1.180.", "3oxas", ord_df$species)
ord_df$species <- gsub("TRAP.type_C4.dicarboxylate_transport_system._large_permease_component.2", "TRAdt", ord_df$species)
ord_df$species <- gsub("Cobalt.zinc.cadmium_resistance_protein_CzcA._Cation_efflux_system_protein_CusA.1", "Cbzcr", ord_df$species)
ord_df$species <- gsub("Alpha.1.2.mannosidase", "Alphm", ord_df$species)
ord_df$species <- gsub("Type_III_restriction.modification_system_methylation_subunit_.EC_2.1.1.72.", "TIrmsms", ord_df$species)
ord_df$species <- gsub("DNA.directed_RNA_polymerase_beta._subunit_.EC_2.7.7.6..1", "DdRpbs", ord_df$species)
ord_df$species <- gsub("Putative_DNA.binding_protein_in_cluster_with_Type_I_restriction.modification_system", "PDNbp", ord_df$species)
ord_df$species <- gsub("NADH_dehydrogenase_subunit_5", "NAds5", ord_df$species)
ord_df$species <- gsub("Beta.galactosidase_.EC_3.2.1.23..2", "Btglc", ord_df$species)
ord_df$species <- gsub("Excinuclease_ABC_subunit_A", "EABsA", ord_df$species)
ord_df$species <- gsub("Lead._cadmium._zinc_and_mercury_transporting_ATPase_.EC_3.6.3.3._.EC_3.6.3.5.._Copper.translocating_P.type_ATPase_.EC_3.6.3.4.", "LczamtA", ord_df$species)


# abreviação livre
ord_df$species <- gsub("Long.chain.fatty.acid..CoA_ligase_.EC_6.2.1.3..1", "LcfacoA", ord_df$species)
ord_df$species <- gsub("Malonyl_CoA.acyl_carrier_protein_transacylase_.EC_2.3.1.39..3", "MlCoAt3", ord_df$species)
ord_df$species <- gsub("Myo.inositol_2.dehydrogenase_.EC_1.1.1.18.", "Myo2d", ord_df$species)
ord_df$species <- gsub("Beta.galactosidase_.EC_3.2.1.23..1", "Bgase", ord_df$species)
ord_df$species <- gsub("Excinuclease_ABC_subunit_B.1", "ExcABCB", ord_df$species)
ord_df$species <- gsub("Orotidine_5..phosphate_decarboxylase_.EC_4.1.1.23.", "O5PDE", ord_df$species)



ord_df <- ord_df  %>% arrange(desc(CCA1))








#Specify data for plot
label_func <- ord_df$species
label <- label_func
max_overlaps <- Inf
title <- "Functions"
tag <- "B"
points_color <- func_color
mult_line <- 2.8
mult_text <- 3


pointpad <- 10      #more or less smoke
alpha <- 1
p_size <- 0.4
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

            -1,
            -1,
            -1,
            -1,
            -1,

            -1,
            -1,
            -1,
            -1,
            -1
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
direction <- "both"
