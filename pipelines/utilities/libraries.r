
#**************** INSTALL/LOAD PACKAGES ****************************************
#*******************************************************************************
#Description: This script checks your installed libs and install the necessary
#to run the pipelines.
#*******************************************************************************

# Enumarating the CRAN necessary libs
packages <- c("vegan", "ggplot2", "cowplot", "tidyverse", "rstatix", "dplyr",
             "reshape", "RColorBrewer", "plyr", "geosphere", "devtools",
             "gridExtra", "multcomp", "parallel", "scales", "evaluate",
             "raster", "psych", "corrplot", "ggplotify", "lmPerm"

             )

#Installing the necessary from CRAN
for (
     lib in seq_along(packages)
    ){
      if (
          packages[lib] %in% rownames(installed.packages()) == FALSE
         ) {
            install.packages(
                             packages[lib], dependencies = TRUE
                            )
           }
     }


#Loading CRAN Packages
library(vegan)
library(lmPerm)
library(ggplot2)
library(cowplot)
library(tidyverse)
library(ggpubr)
library(rstatix)
library(dplyr)
library(reshape)
library(RColorBrewer)
library(plyr)
library(stats)
library(geosphere)
library(devtools)
library(gridExtra)
library(multcomp)
library(parallel)
library(scales)
library(evaluate)
library(raster)
library(psych)
library(corrplot)
library(ggplotify)


#Checking non-CRAN packages and loading
 if (
     "EcolUtils" %in% rownames(installed.packages()) == FALSE
    ) {
        devtools::install_github("GuillemSalazar/EcolUtils")
      }

library(EcolUtils)

#Clean Memory
rm(packages)