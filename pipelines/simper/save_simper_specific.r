
#saving the individual outpus in .CSV
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

for (table in seq_along(tables)){
            x <- tables[table]
            z <- summ_simper[[x]]
            write.csv(file = paste(
                                    path,
                                    tables[table],
                                    ".csv",
                                    sep = ""
                                  ),
                       x = z
                      )
                                }

