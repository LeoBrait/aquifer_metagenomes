#**************** 0 SETWD ******************************************************
#*******************************************************************************
#Description: Please, change the path of the setwd() function to the directory
#"aquifers_master" in your own computer.
#*******************************************************************************

setwd(
      )

#**************** 1.1 LOAD LIBRARIES *******************************************
#*******************************************************************************
#Description: Check on the script "libraries.r" if all libraries are properly
#installed with their dependencies, then run this script.
#*******************************************************************************

source(
      "pipelines//utilities//libraries.r"
      )

#**************** 1.2 FUNCTIONS, COLORS AND SETTINGS ***************************
#*******************************************************************************
#Description: Here we load necessary functions used in the pipepine, the color
#of all plots and some universal settings for inputs in our functions and
#graphics.
#*******************************************************************************

source(
      "pipelines//utilities//colors_fonts.r"
      )

#**************** 2 INPUT LOADING **********************************************
#*******************************************************************************
#Description: Here we Load all the necessary data for analysis. The annotated
#matrix for functions(lvl4), taxonomy(phyla, class, genera) and metadata of the
#aquifer samples.
#*******************************************************************************

source(
      "pipelines//data_wrangling//load_inputs.r"
      )

#**************** 2.1  DATA WRANGLING ******************************************
#*******************************************************************************
#Description: This script will handle the data, produce the strictly numeric
#dataframes and generate a list of samples names for latter plots.
#*******************************************************************************

source(
      "pipelines//data_wrangling//general_data_wrangling.r"
      )

#**************** 3 SIMPER ANALYSIS ********************************************
#*******************************************************************************
#Description: Here we are going to do 3 SIMPER analysis, for genera, phyla and
#functions. The final result with only the significant values go to the "result"
#path, and the partial (with all values) goes to "output_name" path.
#*******************************************************************************


###### Simper general ambient
groups <- genus0$category
par <- 6                   #Define how many cores you do want to use on SIMPER
per <- 4999                #Define the permutations for SIMPER


###### phyla SIMPER
input <- phyla_numeric
path <- "outputs//tables//simper_complete//taxonomic_phyla//"
output_name <- "simper_phyla_summary.csv"
to_filter <- "outputs//tables//simper_phyla_summary.csv"
result <- "outputs//tables//simper_phyla_summary(adjusted).csv"
source(
        "pipelines//simper//simper.r"
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

#**************** 3.2 RANKING SIMPER *******************************************
#*******************************************************************************
#Description: We are going to do a table ranking the OTU by the frequency of
#their best position on pair comparissons of SIMPER.
#The tables show porition/OTU/frequency/position on comparations.
#*******************************************************************************

source(
       "pipelines//simper//ranking_simper.r"
      )
View(ranking_phyla)
View(ranking_genus)
View(ranking_func)

#**************** 4 CCA and NMDS ***********************************************
#*******************************************************************************
#Description: Here we are going to do CCA Analysis to test the ambiental
#correlations with microbial compositions and MDS analysis to test the grouping
#of aquifer ecological landscapes.
#*******************************************************************************

source(
       "pipelines//cca//cca_master.r"
      )

#**************** 5 PERMANOVAS PERANOVAS ***************************************
#*******************************************************************************
#Description: Compare difference on compositions by Permanova and diferences on 
#richnnes and diversity by Peranovas. The First script is to generate the data
#The second is to generate graphics
#*******************************************************************************

source(
       "pipelines//abundances_diversity//perma_peranova.r"
      )
source(
       "pipelines//abundances_diversity//boxplots.r"
      )

#**************** 6 ABUNDANCES *************************************************
#*******************************************************************************
#Description: The most abundant units on our dataset. Then plot the data
#*******************************************************************************

source(
      "pipelines//abundances_diversity//abundances.r"
      )
View(abundant_proteo_ord)
View(abundant_phyla_ord)
View(rare_phyla_ord)



########################## STACKED BARS


###### Data for all them
source(
        "pipelines//stackedbars//data_stacked.r"
      )


###### Abundant Phyla (FIG.1)

source(
        "pipelines//stackedbars//stacked_abundant_phyla.r"
      )


####### SIMPER STACKED (FIG.2)
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


####### SIMPER STACKED WITHOUT NELSON (SUPP)
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
