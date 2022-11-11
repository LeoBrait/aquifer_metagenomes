###### RANKING OF MAIN CONTRIBUTORS PHYLA

#input of data frame from SIMPER
df0 <- read.csv("outputs//tables//simper_phyla_summary(adjusted).csv")

#Electing the  important genera for vizualisation
source("pipelines//simper//electing_dissimilar.r")
ranking_phyla <- ranking

###### RANKING OF MAIN CONTRIBUTORS GENERA
df0 <- read.csv("outputs//tables//simper_genus_summary(adjusted).csv")
source("pipelines//simper//electing_dissimilar.r")
ranking_genus <- ranking

###### RANKING OF MAIN CONTRIBUTORS FUNCTIONS
df0 <- read.csv("outputs//tables//simper_funclvl4_summary(adjusted).csv")
source("pipelines//simper//electing_dissimilar.r")
ranking_func <- ranking
