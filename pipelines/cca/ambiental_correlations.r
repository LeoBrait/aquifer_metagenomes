
pairs.panels(
             ambiental_clustered,
             method = "pearson",
             hist.col = "#00AFBB",
             density = FALSE,
             ellipses = FALSE,
             smooth = FALSE
             )
cor_amb <- cor(
              ambiental_clustered[, c(3:ncol(ambiental_clustered))],
              use = "na.or.complete"
              )
saveRDS(
        cor_amb,
        "outputs//other//correlation_environmental_variables.rds"
        )

#Ploting these correlations (bubble plot)
tiff(file = paste(
                  "outputs//other//correlation_environmental_variables.tiff",
                  sep = ""
                 ),
     width = 8600,
     height = 4600,
     compression = "lzw",
     res = 500
     )

corrplot(
         cor_amb,
         type = "upper",
         order = "hclust",
         tl.col = "black", tl.srt = 45
        )
dev.off()

#Ploting these correlations (number plot)
tiff(
    file = paste(
        "outputs//other//correlation_environmental_variables_num.tiff",
         sep = ""),
    width = 8600,
    height = 4600,
    compression = "lzw",
    res = 500
    )
corrplot(
        cor_amb,
        method = "number",
        type = "upper",
        order = "hclust",
        tl.col = "black",
        tl.srt = 45
        )
dev.off()
