##### Opening

df1  <- read.csv(paste(path, "Porous_Contaminated_Karst_Porous.csv", sep = ""))
df2 <- read.csv(paste(path, "Porous_Contaminated_Mine.csv", sep = ""))
df3 <- read.csv(paste(path, "Porous_Contaminated_Subsurface_saline.csv", sep = ""))

df4 <- read.csv(paste(path, "Porous_Contaminated_Porous.csv", sep = ""))
df5 <- read.csv(paste(path, "Porous_Contaminated_Geyser.csv", sep = ""))
df6 <- read.csv(paste(path, "Karst_Porous_Mine.csv", sep = ""))

df7 <- read.csv(paste(path, "Karst_Porous_Subsurface_saline.csv", sep = ""))
df8 <- read.csv(paste(path, "Karst_Porous_Porous.csv", sep = ""))
df9 <- read.csv(paste(path, "Karst_Porous_Geyser.csv", sep = ""))

df10 <- read.csv(paste(path, "Mine_Subsurface_saline.csv", sep = ""))
df11 <- read.csv(paste(path, "Mine_Porous.csv", sep = ""))
df12 <- read.csv(paste(path, "Mine_Geyser.csv", sep = ""))

df13 <- read.csv(paste(path, "Subsurface_saline_Porous.csv", sep = ""))
df14 <- read.csv(paste(path, "simper_results_Subsurface_saline_Geyser.csv", sep = ""))
df15 <- read.csv(paste(path, "simper_results_Porous_Geyser.csv", sep = ""))



list < list()
list <- list( df1, df2, df3, df4, df5,
              df6, df7, df8, df9, df10,
              df11, df12, df13, df14, df15)


simper <- list()
comparison <- c( "p.contaminated_k.porous",   "p.contaminated_mine",
                 "p.contaminated_s.saline",   "p.contaminated_porous",
                 "p.contaminated_geyser",     "k.porous_mine",
                 "k.porous_s.saline",         "k.porous_porous",
                 "k.porous_geyser",           "mine_s.saline",
                 "mine_porous",               "mine_geyser",
                 "s.saline_porous",           "s.saline_geyser",
                 "porous_geyser")


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
                table <- comparison[item]
                df$comparison <- rep(comparison[item], nrow(df))
                colnames(df) <- c("OTU", "average", "sd", "ratio", "ava", "avb", "cumsum", "p", "contribution", "comparison")
                simper[[table]] <- df
                }




simper_clean <- data.table::rbindlist(list( simper[[1]], simper[[2]], simper[[3]], simper[[4]], simper[[5]],
                            simper[[6]], simper[[7]], simper[[8]], simper[[9]], simper[[10]],
                            simper[[11]], simper[[12]], simper[[13]], simper[[14]], simper[[15]]))
write.csv(file = paste("outputs//tables//", output_name, sep = ""), x = simper_clean)

        rm(   df1, df2, df3, df4, df5,
              df6, df7, df8, df9, df10,
              df11, df12, df13, df14, df15, simper_clean)
