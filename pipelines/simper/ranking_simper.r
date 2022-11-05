###### RANKING OF MAIN CONTRIBUTORS PHYLA
df0 <- read.csv("outputs//tables//simper_phyla_summary(adjusted).csv")     #input of data frame from SIMPER
source("pipelines//simper//electing_dissimilar.r") #Electing the 14 most important genera for vizualisation
ranking_phyla <- ranking



###### RANKING OF MAIN CONTRIBUTORS GENERA
df0 <- read.csv("outputs//tables//simper_genus_summary(adjusted).csv")     #input of data frame from SIMPER
source("pipelines//simper//electing_dissimilar.r") #Electing the 14 most important genera for vizualisation
ranking_genus <- ranking


###### RANKING OF MAIN CONTRIBUTORS FUNCTIONS
df0 <- read.csv("outputs//tables//simper_funclvl4_summary(adjusted).csv")     #input of data frame from SIMPER
source("pipelines//simper//electing_dissimilar.r") #Electing the 14 most important genera for vizualisation
ranking_func <- ranking
