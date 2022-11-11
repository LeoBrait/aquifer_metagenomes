


#Creating a list of correspondences and then abreviating aquifer Names
aquifer_names <- data.frame(
                    a <- c("Karst-Porous",
                           "Porous Contaminated",
                           "Subsurface saline",
                           "Mine",
                           "Geyser",
                           "Porous"
                           ),
                    b <- c(
                          "Karst P.",
                          "P. Contaminated",
                          "S. Saline",
                          "Mine",
                          "Geyser",
                          "Porous"))

functions0$category <- aquifer_names$b[
                        match(functions0$category, aquifer_names$a)
                                      ]
genus0$category <- aquifer_names$b[
                        match(genus0$category, aquifer_names$a)
                                  ]
phyla0$category <- aquifer_names$b[
                        match(phyla0$category, aquifer_names$a)
                                  ]
proteo0$category <- aquifer_names$b[
                        match(proteo0$category, aquifer_names$a)
                                   ]
metadata0$level_3 <- aquifer_names$b[
                        match(metadata0$level_3, aquifer_names$a)
                                    ]
amb0$level_3 <- aquifer_names$b[
                        match(amb0$level_3, aquifer_names$a)
                               ]

#Transforming category names in factors and correcting capital letter
functions0$category <- as.factor(functions0$category)
genus0$category <- as.factor(genus0$category)
phyla0$category <- as.factor(phyla0$category)
proteo0$category <- as.factor(proteo0$category)
metadata0$level_3 <- as.factor(metadata0$level_3)
amb0$level_3 <- as.factor(amb0$level_3)
colnames(functions0)[2] <- "samples"


#Transforming into numeric

#1. Functions
func_numeric <- functions0
row.names(func_numeric) <- functions0$samples

func_numeric[, 1:2] <- list(NULL)
func_numeric <- sapply(func_numeric, as.numeric)
func_numeric <- as.data.frame(func_numeric)
row.names(func_numeric) <- functions0$samples

#2. Genera
genus_numeric <- genus0
row.names(genus_numeric) <- genus0$samples

genus_numeric[, 1:4] <- list(NULL)
genus_numeric <- sapply(genus_numeric, as.numeric)
genus_numeric <- as.data.frame(genus_numeric)
row.names(genus_numeric) <- genus0$samples

#3. Phyla
phyla_numeric <- phyla0
row.names(phyla_numeric) <- phyla0$samples

phyla_numeric[, 1:4] <- list(NULL)
phyla_numeric <- sapply(phyla_numeric, as.numeric)
phyla_numeric <- as.data.frame(phyla_numeric)
row.names(phyla_numeric) <- phyla0$samples

#4. Proteo
proteo_numeric <- proteo0
row.names(proteo_numeric) <- proteo0$samples

proteo_numeric[, 1:4] <- list(NULL)
proteo_numeric <- sapply(proteo_numeric, as.numeric)
proteo_numeric <- as.data.frame(proteo_numeric)
row.names(proteo_numeric) <- proteo0$samples

metadata0$level_3 <- factor(metadata0$level_3, # Reordering group factor levels
                                     levels = c("Karst P.",
                                                "Porous",
                                                "P. Contaminated",
                                                "S. Saline",
                                                "Geyser",
                                                "Mine"
                                                )
                            )

#5. Ambiental
amb0 <- amb0[match(genus0$samples, amb0$samples),]
row.names(amb0) <- NULL
amb0[1] <- NULL
amb0$PubName <- metadata0$PubName
amb_numeric <- amb0
row.names(amb_numeric) <- amb0$samples
amb_numeric[1:19] <- list(NULL)
amb_numeric <- sapply(amb_numeric, as.numeric)
amb_numeric <- as.data.frame(amb_numeric)
row.names(amb_numeric) <- amb0$samples


amb0$level_3 <- factor(metadata0$level_3, # Reordering group factor levels
                                     levels = c("Karst P.",
                                                "Porous",
                                                "P. Contaminated",
                                                "S. Saline",
                                                "Geyser",
                                                "Mine"
                                                )
                      )

ambiental_clustered <- cbind(clust_dist = amb0$clust_dist,
                                          category = amb0$level_3,
                                          amb_numeric
                            )



# Getting the order of names for the forward plots
kp <- metadata0[metadata0$level_3 == "Karst P.", ]
p <- metadata0[metadata0$level_3 == "Porous", ]
pc <- metadata0[metadata0$level_3 == "P. Contaminated", ]
ss <- metadata0[metadata0$level_3 == "S. Saline", ]
g <- metadata0[metadata0$level_3 == "Geyser", ]
m <- metadata0[metadata0$level_3 == "Mine", ]





# This will be latter used for the stacked bars.
position <- c(kp$PubName,
              p$PubName,
              pc$PubName,
              ss$PubName,
              g$PubName,
              m$PubName)
print("Your data is now clean!")
