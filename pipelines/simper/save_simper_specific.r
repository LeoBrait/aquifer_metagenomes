

z <- summ_simper[["P. Contaminated_Karst P."]]
write.csv(file = paste(path, "Porous_Contaminated_Karst_Porous.csv", sep = ""), x = z)

z <- summ_simper[["P. Contaminated_Mine"]]
write.csv(file = paste(path, "Porous_Contaminated_Mine.csv", sep = ""), x = z)

z <- summ_simper[["P. Contaminated_S. Saline"]]
write.csv(file = paste(path, "Porous_Contaminated_Subsurface_saline.csv", sep = ""), x = z)

z <- summ_simper[["P. Contaminated_Porous"]]
write.csv(file = paste(path, "Porous_Contaminated_Porous.csv", sep = ""), x = z)

z <- summ_simper[["P. Contaminated_Geyser"]]
write.csv(file = paste(path, "Porous_Contaminated_Geyser.csv", sep = ""), x = z)

z <- summ_simper[["Karst P._Mine"]]
write.csv(file = paste(path, "Karst_Porous_Mine.csv", sep = ""), x = z)

z <- summ_simper[["Karst P._S. Saline"]]
write.csv(file = paste(path, "Karst_Porous_Subsurface_saline.csv", sep = ""), x = z)

z <- summ_simper[["Karst P._Porous"]]
write.csv(file = paste(path,"Karst_Porous_Porous.csv", sep = ""), x = z)

z <- summ_simper[["Karst P._Geyser"]]
write.csv(file = paste(path, "Karst_Porous_Geyser.csv", sep = ""), x = z)

z <- summ_simper[["Mine_S. Saline"]]
write.csv(file = paste(path, "Mine_Subsurface_saline.csv", sep = ""), x = z)

z <- summ_simper[["Mine_Porous"]]
write.csv(file = paste(path, "Mine_Porous.csv", sep = ""), x = z)

z <- summ_simper[["Mine_Geyser"]]
write.csv(file = paste(path, "Mine_Geyser.csv", sep = ""), x = z)

z <- summ_simper[["S. Saline_Porous"]]
write.csv(file = paste(path, "Subsurface_saline_Porous.csv", sep = ""), x = z)

z <- summ_simper[["S. Saline_Geyser"]]
write.csv(file = paste(path, "simper_results_Subsurface_saline_Geyser.csv", sep = ""), x = z)

z <- summ_simper[["Porous_Geyser"]]
write.csv(file = paste(path, "simper_results_Porous_Geyser.csv", sep = ""), x = z)

