
#Listing SIMPER Table names
tables <- c(
            "P. Contaminated_Karst P.",
            "P. Contaminated_Mine",
            "P. Contaminated_S. Saline",
            "P. Contaminated_Porous",
            "P. Contaminated_Geyser",
            "Karst P._Mine",
            "Karst P._S. Saline",
            "Karst P._Porous",
            "Karst P._Geyser",
            "Mine_S. Saline",
            "Mine_Porous",
            "Mine_Geyser",
            "S. Saline_Porous",
            "S. Saline_Geyser",
            "Porous_Geyser"
            )

#Initializind a empty list for receiving our dataframes
list <- list()

#reading and loading simper output in our list
for (table in seq_along(tables)){
            x <- tables[table]
            z <- summ_simper[[x]]
            list[[x]] <- read.csv(file = paste(
                                    path,
                                    tables[table],
                                    ".csv",
                                    sep = ""
                                  ),
                                )
                                }

#Filtering the data
simper <- list()
for(item in 1:15){
                #ambient setting
                df <- list[[item]]
                prev <- 0

                #getting the cumsums and converting to individual simper values
                for(rows in 1:nrow(df)){
                                df[rows, 9] <-  df[rows, 7] - prev
                                prev <-  df[rows, 7]
                                        }

                #setting names for the data.frame and setting comparisons
                df$comparison <- rep(tables[item], nrow(df))
                colnames(df) <- c(
                        "OTU", "average", "sd", "ratio", "ava",
                        "avb", "cumsum", "p", "contribution", "comparison"
                                 )
                simper[[item]] <- df
                }



#Reuniting all data in a single data.frame and saving
simper_clean <- data.table::rbindlist(
                                   list(
                                simper[[1]], simper[[2]], simper[[3]],
                                simper[[4]], simper[[5]], simper[[6]],
                                simper[[7]], simper[[8]], simper[[9]],
                                simper[[10]],simper[[11]], simper[[12]],
                                simper[[13]], simper[[14]], simper[[15]]
                                       )
                                      )
write.csv(file = paste(
                        "outputs//tables//",
                        output_name,
                        sep = ""
                      ),
          x = simper_clean
         )

rm(simper, list)
