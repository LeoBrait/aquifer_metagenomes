######RUN SIMPER FUNCTIONS
raw_simper <-  simper(input, groups, parallel = par, permutations = per)


######SAVING ALL TABLES OF SPECIFIC SIMPER
summ_simper <- summary(raw_simper)
source("pipelines//simper//save_simper_specific.r")
#################################################


###### SUMMARIZING ALL DATA
source("pipelines//simper//summary_simper.r")
#################################################

#filtering data to significant values
simper_results0 <- data.frame(read.csv(paste(to_filter)))
simper_results <- simper_results0[simper_results0$p < 0.05, ]
write.csv(simper_results, file = paste(result)) # Saving New data frame only with kruskal test significant values

rm(input, summ_simper, raw_simper, simper_results0, simper_results)

