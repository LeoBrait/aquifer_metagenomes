############################# SETWD ##########
##############################################
#Description: Please, change the path of the
#setwd() function to the directory "aquifers_
#master" in your own computer.
##############################################

setwd(
      )

################ 1.0 LOAD LIBRARIES ##########
##############################################
#Description: Check on the script "libraries.r"
#if all libraries are properly installed with
#their dependencies, then run this script.
##############################################

source(
      "pipelines//utilities//libraries.r"
      )

############################### COLORS ########
###############################################
#Description: Here we load the color of all
#plots in a propper order. "Color plot" stands
#for the CCA and NMDS analysis. "Stacked_color"
#is for the stacked bars, and fun_color and
# tax_color stands for our boxplots. Font sizes
#for all plots.
###############################################

source(
      "pipelines//utilities//colors_fonts.r"
)

########################## FUNCTIONS ##########
###############################################
#Description: The functions hull() and norma-
#lize, necessary for extract hull data for the
#CCA plots and to normalize environmental va-
#riables, and the function get_only_legend()
#to get common legend for pannels.
##############################################

source(
      "pipelines//utilities//functions.r"
      )

##################### INPUT SETTINGS ##########
###############################################
#Description: Here we Load all the necessary
#data for analysis. The annotated matrix for
#functions, taxonomy and metadata of the aquifer
#samples
##############################################

source(
      "pipelines//data_wrangling//load_inputs.r"
      )

####################### DATA WRANGLING ########
###############################################
#Description: This script will handle the data,
#produce the only numeric dataframes and gene-
#rate a list of samples names for latter plots.
##############################################

source(
      "pipelines//data_wrangling//general_data_wrangling.r"
      )



###############################################
############################### SIMPER ########
#Description: Here we are going to do 3 SIMPER
#analysis. If you already have the simper summa
#ry tables, it is not necessary.The final result
#with only the significant values go to the "result"
#path, and the partial (withall values) goes to
#"output_name" path.
###############################################

###### SIMPER GENERAL AMBIENT
groups <- genus0$category
par <- 6                   #Define how many cores you do want to use on SIMPER
per <- 4999             #Define the permutations for SIMPER


###### EXECUTION OF PHYLA SIMPER
input <- phyla_numeric
path <- "outputs//tables//simper_complete//taxonomic_phyla//"
output_name <- "simper_phyla_summary.csv"
to_filter <- "outputs//tables//simper_phyla_summary.csv"
result <- "outputs//tables//simper_phyla_summary(adjusted).csv"
source(
        "pipelines////simper//simper.r"
      )


###### EXECUTION OF GENUS SIMPER
input <- genus_numeric
path <- "outputs//tables//simper_complete//taxonomic_gen//"
output_name <- "simper_genus_summary.csv"
to_filter <- "outputs//tables//simper_genus_summary.csv"
result <- "outputs//tables//simper_genus_summary(adjusted).csv"
source(
      "pipelines//simper//simper.r"
      )


###### EXECUTION OF FUNCTIONS SIMPER
input <- func_numeric
path <- "outputs//tables//simper_complete//func_lvl4//"
output_name <- "simper_funclvl4_summary.csv"
to_filter <- "outputs//tables//simper_funclvl4_summary.csv"
result <- "outputs//tables//simper_funclvl4_summary(adjusted).csv"
source(
      "pipelines//simper//simper.r"
      )


###############################################
####################### RANKING SIMPER ########
#Description: We are going to count the fre-
#quency each OTU or function appeared on the
#top positions of SIMPER comparissons, then
#we gonna rank these elements. The tables show
#porition/OTO/frequency/position on comparations.
###############################################

source(
       "pipelines//simper//ranking_simper.r"
      )
View(ranking_phyla)
View(ranking_genus)
View(ranking_func)


###### example of Dissimilar Genera Abundances
genus0 %>% group_by(category) %>% dplyr::summarise(mean(Sulfuricurvum))
###### example of Dissimilar Rare Phyla Abundances
phyla0 %>% group_by(category) %>% dplyr::summarise(mean(Candidatus.Wolfebacteria))
###### example of Dissimilar Functions Abundances
functions0 %>% group_by(category) %>% dplyr::summarise(mean(TRAP.type_C4.dicarboxylate_transport_system._large_permease_component.2))

###############################################
######################### CCA and NMDS ########
#Description: Here we are going to do 3 SIMPER
#analysis. If you already have the simper summa
#ry tables, it is not necessary.The final result
#with only the significant values go to the "result"
#path, and the partial (withall values) goes to
#"output_name" path.
###############################################

source(
       "pipelines//cca//cca_master.r"
      )
      
###############################################
################# PERMANOVAS PERANOVAS ########
#Description: Compare difference on compositions
#by Permanova and diferences on richnnes and
#diversity by Peranovas.
###############################################

source(
       "pipelines//abundances_diversity//perma_peranova.r"
      )
source(
       "pipelines//abundances_diversity//boxplots.r"
      )
rm(functions, phyla, genus, P1, P2, P3, P4, pairwise_fun_div, pairwise_genus_rich)  #free memory

###############################################
########################### ABUNDANCES ########
#Description: The most abundant units on our
#dataset.
###############################################
source(
      "pipelines//abundances_diversity//abundances.r"
      )
View(abundant_proteo_ord)
View(abundant_phyla_ord)
View(rare_phyla_ord)


###############################################
########################## STACKED BARs #######


###### Data for all them
source(
        "pipelines//stackedbars//data_stacked.r"
      )


###### Abundant Phyla (FIG.1)
titletext <- 25
axistext <- unit(15, "cm")
striptext <- unit(17, "cm")
legendtext <- unit(18, "cm")
barwidth <- 1.01
pannel_spacing <- 0.02
plotwidth <-  unit(25, "cm")
plotheight <- unit(10, "cm")
dpi <- 500
legend_space <- unit(1.7, "cm")
source(
        "pipelines//stackedbars//stacked_abundant_phyla.r"
      )


####### SIMPER STACKD (FIG.2)
titletext <- 25
axistext <- unit(15, "cm")
striptext <- unit(17, "cm")
legendtext <- unit(18, "cm")
barwidth <- 1.01
pannel_spacing <- 0.02
plotwidth <-  unit(25, "cm")
plotheight <- unit(23, "cm")
dpi <- 500
legend_space <- unit(1, "cm")
source(
        "pipelines//stackedbars//pannel_stacked_bars.r"
      )


####### SIMPER STACKED WITH NELSON (SUPP)
titletext <- 25
axistext <- unit(15, "cm")
striptext <- unit(17, "cm")
legendtext <- unit(18, "cm")
barwidth <- 1.01
pannel_spacing <- 0.02
plotwidth <-  unit(25, "cm")
plotheight <- unit(10, "cm")
dpi <- 500
legend_space <- unit(1, "cm")
source(
       "pipelines//stackedbars//nelson.r"
      )
