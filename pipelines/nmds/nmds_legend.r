nmds_legend <- ggplot(ord_df_nmds, aes(x = MDS1, y = MDS2, color = category, mapping = samples)) +

  theme_bw() +

  #Points
  geom_point(size = 5) +
  scale_colour_manual(
                      values = color_plot_nmds,
                      name = "Aquifer Types"
                     ) +

  #Tag and axis text
  labs(
       title = element_blank(),
       tag = tag
      ) +
  theme(
        plot.title = element_text(
                                  face = "bold",
                                  size = axis_text
                                 ),
        plot.tag = element_text(
                                face = "bold",
                                size = tag_size
                               )
       ) +
  theme(axis.title.x = element_text(face = "bold", size = axis_text)) +
  theme(axis.title.y = element_text(face = "bold", size = axis_text)) +
  theme(axis.text.x = element_text(size = axis_text, color = "black")) +
  theme(axis.text.y = element_text(size = axis_text, color = "black")) +

  #Legends
  theme(legend.text = element_text(size = axis_text)) +
  theme(legend.position = "bottom") +
  theme(legend.title = element_text(size = axis_text, face = "bold")) +
  theme(legend.spacing.x = unit(1, "cm")) +
  guides(fill = guide_legend(nrow = 1, label.hjust = 0)) +


  #Text inside plot
  annotate("text", x = max(ord_df_nmds$MDS1) - 0.21, y = max(ord_df_nmds$MDS2) - 0.05, label = paste(
                                                                                                    "Stress = ", round(ord$stress, digits = 3), "\n",
                                                                                                    "R² = ", round(danosim$statistic, digits = 3), "\n",
                                                                                                    "pvalue < 0.001"
                                                                                                    ), size = inside_plot) +
  #Lines
  theme(panel.border = element_rect(colour = "black", size = 1)) +
  theme(legend.key = element_rect(fill = "white")) +
  theme(legend.key = element_rect(colour = "white")) +
  theme(axis.line.x = element_blank()) +
  theme(axis.line.y = element_blank()) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank())
nmds_legend
