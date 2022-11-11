
########################### RARE PHYLA WITHOUT NEALSON ########

rare_phyla_data <-    data.frame(phyla0$category,                            phyla0$samples, Others <- c(rep(NA, 109)),
                                 phyla0$Candidatus.Parcubacteria,            phyla0$Deinococcus.Thermus,
                                                              

                                 phyla0$Candidatus.Saccharibacteria,         phyla0$candidate.division.NC10,
                                 phyla0$Candidatus.Cloacimonetes,            phyla0$Candidatus.Dadabacteria,
                                 phyla0$Candidatus.Desantisbacteria,         phyla0$Cyanobacteria,

                                 phyla0$Candidatus.Roizmanbacteria,          phyla0$candidate.division.Zixibacteria,
                                 phyla0$Candidatus.Riflebacteria,            phyla0$Thaumarchaeota,
                                 phyla0$Fusobacteria,                        phyla0$Balneolaeota)

# Treating Data to more Friendly names
colnames(rare_phyla_data)[1:17] <- c("category",                        "samples", "Others",
                                 "Cand. Parcubacteria",                 "Deinococcus Thermus",

                                 "Cand. Saccharibacteria",             "Cand. div. NC10",
                                 "Cand. Cloacimonetes",                "Cand. Dadabacteria",
                                 "Cand. Desantisbacteria",             "Cyanobacteria",

                                 "Cand. Roizmanbacteria",              "Cand. div. Zixibacteria",
                                 "Cand. Riflebacteria",                 "Thaumarchaeota",
                                 "Fusobacteria",                         "Balneolaeota"
                                 )

# Forging number of Others
total_relevant <- rowSums(rare_phyla_data[, 4:17])
total_relevant
Others <-  0.10 - total_relevant
Others
total_relevant
rare_phyla_data$Others <- Others
rare_phyla_data

# Associating PubNames as sample names and melting data
rare_phyla_data$samples <- metadata0$PubName
df_phyla_rare <- melt(rare_phyla_data)

#reordering the factor levels
df_phyla_rare$category <- factor(df_phyla_rare$category,      # Reordering group factor levels
                         levels = c("Karst P.", "Porous", "P. Contaminated", "S. Saline", "Geyser", "Mine"))



###############################################
########################### RARE PHYLA ########


r_phyla <- ggplot(df_phyla_rare, aes(x = samples, y = value, fill = variable)) +

  ## Theme
  theme_pubr() +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +

  ## Bars
  geom_bar(stat = "identity", width =  barwidth) +
  guides(fill = guide_legend(reverse = FALSE)) +
  scale_fill_manual(values = stacked_color) +

  ## Titles
  theme(axis.title.x = element_blank(), axis.title.y = element_text(size = titletext, face = "bold"), plot.title = element_blank()) +
  labs(title = element_blank(), x = element_blank(), y = "Relative Abundance", fill = "Rare Phyla") +

  ## Legends
  scale_color_discrete(name = "Rare Phyla") +
  theme(legend.title = element_text(size = titletext, face = "bold")) +
  theme(legend.text = element_text(size = legendtext)) +
  guides(fill = guide_legend(ncol = 5, byrow = TRUE, , label.hjust = 0)) +
  theme(legend.justification = c(0.5, 0.5), legend.position = c("bottom"), legend.text.align = 0) +
  theme(legend.spacing.x = legend_space) +

  ## Facet Grid
  facet_grid(cols = vars(category), space = "free", scales = "free") +
  theme(panel.spacing = unit(pannel_spacing, "lines")) +
  theme(strip.background = element_blank(), strip.text = element_text(size = striptext, face = "bold")) +
  theme(strip.background = element_blank(), strip.text = element_text(size = striptext, face = "bold")) +
  #theme(strip.text = element_text(colour = "white")) +

  ## Axis Texts
  theme(axis.text.x = element_text(size = axistext, angle = 90, vjust = 0, hjust = 0)) +
  theme(axis.text.y = element_text(size = axistext)) +

  ## Lines and Ticks
  theme(axis.line = element_line()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.line.x = element_blank()) +
  theme(axis.line.y = element_blank()) +
  theme(axis.line.y = element_blank()) +
  #scale_y_continuous(labels = scales::number_format(accuracy = 0.001,
                                 #decimal.mark = ".")) +

  ## Plot Tag
  labs(tag = "A", element_text(size = 100, face = "bold")) +
  ylim(0, 0.11) +
  theme(plot.tag = element_text(size = 25, face = "bold"))

r_phyla

ggsave(plot = r_phyla, filename = ("outputs//Figures//nelson.png"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = r_phyla, filename = ("outputs//Figures//nelson.pdf"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = r_phyla, filename = ("outputs//Figures//nelson.svg"), width = plotwidth, height = plotheight, dpi = dpi)
