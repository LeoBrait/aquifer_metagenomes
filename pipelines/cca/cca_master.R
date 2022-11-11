

#**************** AMBIENTAL DATA WRANGLING *************************************
#*******************************************************************************
#Description: A new data wrangling is needed to concatenate the environmental
#tables with the annotated tables. It will drop the soil organic content column,
#as it has a lot of NA's, then drop samples with NA on bulk density, and store
#these data on the data-frames: func_ambiental, phyla_ambiental and
#genus_ambiental.
#*******************************************************************************

source("pipelines//data_wrangling//ambiental_data_whangling.r")


#**************** AMBIENTAL CORRELATIONS ***************************************
#*******************************************************************************
#Description: Plot correlations of environmental data.
#*******************************************************************************

source("pipelines//cca//ambiental_correlations.r")


#**************** RUNNING CCA ANALYSIS *****************************************
#*******************************************************************************
#Description: We firts normalize our ambiental data, run the CCA, and than we do
#Anova analysis to refute the null hipothesis.
#*******************************************************************************

#Running the Analysis and saving the outputs
source("pipelines//cca//cca_analysis.r")

#**************** RUNNING F MODEL **********************************************
#*******************************************************************************
#Description: Now we wanna know what factorstruly influence the behavior of our
#microbiomes.
#*******************************************************************************

source(
  "pipelines//cca//f_model.r"
)


#######Multiconstrained

source(
  "pipelines//cca//multiconstrained.r"
)


#**************** RUNNING nNMDS ************************************************
#*******************************************************************************
#Description: Analysis to verify the grouping of our microbial composition among
#Aquifer Ecological Landscapes.
#*******************************************************************************

source(
      "pipelines//nmds//nmds_master.r"
      )

#**************** PLOTTING DATA ************************************************
#*******************************************************************************
#Description: All data in a pannel.
#*******************************************************************************

## ploting the  CCA and NMDS data
#(Phyla)
source("pipelines//cca//plot_cca_phyla_data.r")
source("pipelines//cca//plot_cca_aes.r")
p_cca_phyla <- cca_plot

#Functions
source("pipelines//cca//plot_cca_functions_data.r")
source("pipelines//cca//plot_cca_aes.r")
p_cca_func <- cca_plot

#genus
source("pipelines//cca//plot_cca_genus_data.r")
source("pipelines//cca//plot_cca_aes.r")
p_cca_genus <- cca_plot

label <- label_phyla
p1 <- as.grob(p_cca_phyla)
label <- label_func
p2 <- as.grob(p_cca_func)
p3 <- as.grob(phyla_nmds)
p4 <- as.grob(func_nmds)


#pannel
Painel <- plot_grid(p1, p2, p3, p4, align = TRUE)
Painel_2 <- Painel <- grid.arrange(Painel, legend, nrow = 2, heights = c(1, .1))

#save
ggsave(
  plot = Painel_2,
  filename = paste(
          "outputs//Figures//p_cca_pannel.png",
           sep = ""
                  ),
  width = unit(19, "cm"),
  height = unit(19, "cm"),
  limitsize = FALSE
      )