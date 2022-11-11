###############################################
#################### PHYLA STACKED BAR ########

a_phyla <- ggplot(stacked_phyla, aes(x = samples, y = value, fill = variable)) +

  ## Theme
  theme_pubr() +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +

  ## Bars
  geom_bar(stat = "identity", width = barwidth) +
  guides(fill = guide_legend(reverse = FALSE)) +
  scale_fill_manual(values = stacked_color) +

  ## Titles
  theme(axis.title.x = element_text(size = titletext, face = "bold"), axis.title.y = element_text(size = titletext, face = "bold"), plot.title = element_blank()) +
  labs(title = element_blank(), x = "Samples", y = "Relative Abundance", fill = "Abundant Phyla") +

  ## Legends
  scale_color_discrete(name = "Phyla") +
  theme(legend.title = element_text(size = titletext, face = "bold")) +
  theme(legend.text = element_text(size = legendtext)) +
  guides(fill = guide_legend(ncol = 5, byrow = TRUE, , label.hjust = 0)) +
  theme(legend.justification = c(0.5, 0.5), legend.position = c("bottom"), legend.text.align = 0) +
  theme(legend.spacing.x = legend_space) +

  ## Facet Grid
  facet_grid(cols = vars(category), space = "free", scales = "free") +
  theme(panel.spacing = unit(pannel_spacing, "lines")) +
  theme(strip.text = element_text(margin = margin(t = 0, r = 0, b = 0, l = 0))) +
  theme(strip.background = element_blank(), strip.text = element_text(size = striptext, face = "bold")) +

  ## Axis Texts
  theme(axis.text.x = element_text(size = axistext, angle = 90, vjust = 0, hjust = 0)) +
  theme(axis.text.y = element_text(size = axistext)) +

  ## Lines and Ticks
  theme(axis.line = element_line()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.line.x = element_blank()) +
  theme(axis.line.y = element_blank()) +
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01,
                                                  decimal.mark = "."))


a_phyla

ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.png"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.pdf"), width = plotwidth, height = plotheight, dpi = dpi)
ggsave(plot = a_phyla, filename = ("outputs//Figures//abundant_phyla.svg"), width = plotwidth, height = plotheight, dpi = dpi)
