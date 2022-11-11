phyla_abundants <- phyla_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean > 1 / 100) %>%
             pull(key)


abundant_phyla <- dplyr::select(phyla_numeric, phyla_abundants)
others <- dplyr::select(proteo_numeric, -proteo_abundants)
abundant_phyla$others <- rowSums(others)
abundant_phyla$category <- metadata0$level_3

abundant_phyla[4:6] <- NULL
abundant_phyla["Elusimicrobia"] <- NULL
abundant_phyla["Spirochaetes"] <- NULL



geyser <- abundant_phyla[abundant_phyla$category == "Geyser",]
geyser$category <- NULL
geyser[110,] <- colMeans(geyser)
a <- as.numeric(geyser[110, ])
str(a)
b <- colnames(geyser)

df <- data.frame(a <- a,
                 b <- b )

p1 <- ggplot(df, aes(x = b, y = a)) +

  ## Theme
  theme_pubr() +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +
## Bars
  geom_bar(stat = "identity", width = barwidth) +
  scale_fill_manual(values = c("#4575b4", "#1a1a1a", "#ffffbf", "#fdae61",
                                "#f46d43", "#b8e186", "#b2182b", "#7f3b08",
                                "#c7eae5"))
p1


a_phyla

ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.png"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.pdf"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.svg"), width = plotwidth, height = plotheight, dpi = dpi)
p1

  

barplot(a ~ b)

