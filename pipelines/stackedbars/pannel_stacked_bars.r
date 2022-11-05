
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
  geom_bar(stat = "identity",width =  barwidth) +
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
  theme(axis.text.x =  element_blank()) +
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
  theme(plot.tag = element_text(size = 25, face = "bold")) +
  ylim(0, 0.11)

r_phyla



###############################################
############################### GENERA ########


genus_stack <- ggplot(df_genus, aes(x = samples, y = value, fill = variable)) +

  ## Theme
  theme_pubr() +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +

  ## Bars
  geom_bar(stat = "identity",width =  barwidth) +
  guides(fill = guide_legend(reverse = FALSE)) +
  scale_fill_manual(values = stacked_color) +

  ## Titles
  theme(axis.title.x = element_blank(), axis.title.y = element_text(size = titletext, face = "bold"), plot.title = element_blank()) +
  labs(title = element_blank(), x = element_blank(), y = "Relative Abundance", fill = "Genera") +

  ## Legends
  scale_color_discrete(name = "Genera") +
  theme(legend.title = element_text(size = titletext, face = "bold")) +
  theme(legend.text = element_text(size = legendtext)) +
  guides(fill = guide_legend(ncol = 5, byrow = TRUE, , label.hjust = 0)) +
  theme(legend.justification = c(0.5, 0.5), legend.position = c("bottom"), legend.text.align = 0) +
  theme(legend.spacing.x = legend_space) +

  ## Facet Grid
  facet_grid(cols = vars(category), space = "free", scales = "free") +
  theme(panel.spacing = unit(pannel_spacing, "lines")) +
  theme(strip.background = element_blank(), strip.text = element_text(size = striptext, face = "bold")) +
  theme(strip.text = element_text(colour = "white")) +

  ## Axis Texts
  theme(axis.text.x =  element_blank()) +
  theme(axis.text.y = element_text(size = axistext)) +

  ## Lines and Ticks
  theme(axis.line = element_line()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.line.x = element_blank()) +
  theme(axis.line.y = element_blank()) +
  theme(axis.line.y = element_blank()) +
  scale_y_continuous(labels = scales::number_format(accuracy = 0.001,
                                 decimal.mark = ".")) +

  ## Plot Tag
  labs(tag = "B", element_text(size = 100, face = "bold")) +
  theme(plot.tag = element_text(size = 25, face = "bold"))

genus_stack


###############################################
############################ FUNCTIONS ########



fun_stack <- ggplot(df_func, aes(x = samples, y = value, fill = variable)) +
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
  theme(axis.title.x = element_text(size = titletext, face = "bold"), axis.title.y = element_text(size = titletext, face = "bold"), plot.title = element_blank()) +
  labs(title = element_blank(), x = "Samples", y = "Relative Abundance", fill = "Functions ") +

  ## Legends
  scale_color_discrete(name = "Functions") +
  theme(legend.title = element_text(size = titletext, face = "bold")) +
  theme(legend.text = element_text(size = legendtext)) +
  guides(fill = guide_legend(ncol = 5, byrow = TRUE, label.hjust = 0)) +
  theme(legend.justification = c(0.5, 0.5), legend.position = c("bottom"), legend.text.align = 0) +
  theme(legend.spacing.x = legend_space) +
  theme(legend.spacing.x = unit(3, "cm")) +

  # Facet Grid
  facet_grid(cols = vars(category), space = "free", scales = "free") +
  theme(panel.spacing = unit(pannel_spacing, "lines")) +
  theme(strip.text = element_text(margin = margin(t = 0, r = 0, b = 0, l = 0))) +
  theme(strip.background = element_blank(), strip.text = element_blank()) +

  ## Axis Texts
  theme(axis.text.x = element_text(size = axistext, angle = 90, vjust = 0, hjust = 0)) +
  theme(axis.text.y = element_text(size = axistext)) +

  ## Lines and Ticks
  theme(axis.line = element_line()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.line.x = element_blank()) +
  theme(axis.line.y = element_blank()) +
  scale_y_continuous(labels = scales::number_format(accuracy = 0.001,
                                                  decimal.mark = ".")) +

  ## Plot Tag
  labs(tag = "C", element_text(size = 100, face = "bold")) +
  theme(plot.tag = element_text(size = 25, face = "bold"))


fun_stack


######SAVE
Painel <- grid.arrange(r_phyla, genus_stack, fun_stack, nrow = 3, heights = c(2, 2, 2))
ggsave(plot = Painel, filename = ("outputs//Figures//pannel_simper.png"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = Painel, filename = ("outputs//Figures//pannelsimper.pdf"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = Painel, filename = ("outputs//Figures//pannel_simper.svg"), width = plotwidth, height = plotheight, dpi = dpi)
