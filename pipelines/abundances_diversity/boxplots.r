

### Genus
genus$category <- factor(genus$category, levels = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser")) #ordering data



P1 <- ggplot(genus, aes(x = category, y = richness), levels = cc("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser")) +
                  theme_pubr() +
                  geom_boxplot(fill = tax_color, width = 0.5) +
                  guides(fill = NULL) +
                  labs(y = "Number of Microbial \nGenera") +
                  #theme(axis.text.x = element_text(size = 13, angle = 45, hjust = 1, vjust = 1)) +
                  theme(axis.text.x = element_blank()) +
                  theme(axis.title.x = element_blank(),
                  axis.title.y = element_text(size = 20, face = "bold")) +
                  theme(axis.text.y = element_text(size = 18)) +
                  theme(panel.border = element_blank()) +
                  theme(panel.grid.major.x = element_blank()) +
                  theme(panel.grid.minor.y = element_blank()) +
                  labs(tag = "A", element_text(size =  tag_size, face = "bold")) +
                  theme(plot.tag = element_text(size =  tag_size, face = "bold")) +
                  labs( title = bquote(bold('PERANOVA:') ~ ' p-value < 0.05')) +
                  theme(plot.title = element_text(size = 20, hjust = 0.5, face = "bold")) +
                  geom_text(data = genus_rich_pair_letters, aes(y = y, x = type, label = groups), size = 7) +
                  #(geom="text", x=3, y = 1950, label= "PERANOVA:", fontface = 2, size = 8) +
                  #stat_compare_means(method = "anova") +
                  #stat_compare_means(comparisons = my_comparisons) +
                  theme(plot.margin = unit(c(1, 1, 1, 1), "pt")) +
                  theme(axis.line = element_line()) +
                  theme(panel.grid.major.y = element_blank())
P1 #<- ggplotGrob(P1)


P2 <- ggplot(genus, aes(x = category, y = diversity), levels = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser")) +
                  theme_pubr() +
                  geom_boxplot(fill = tax_color, width = 0.5) +
                  guides(fill = NULL) +
                  labs(y = "Shannon Diversity \n Index (Genus Level)") +
                  #theme(axis.text.x = element_text(size = 13, angle = 45, hjust = 1, vjust = 1)) +
                  theme(axis.text.x = element_blank()) +
                  theme(axis.title.x = element_blank(),
                  axis.title.y = element_text(size = 20, face = "bold")) +
                  theme(axis.text.y = element_text(size = 18)) +
                  theme(panel.border = element_blank()) +
                  theme(panel.grid.major.x = element_blank()) +
                  ggtitle("PERANOVA: p-value < 0.05") +
                  theme(panel.grid.minor.y = element_blank()) +
                  labs(tag = "B", element_text(size =  tag_size, face = "bold")) +
                  theme(plot.tag = element_text(size =  tag_size, face = "bold")) +
                  labs( title = bquote(bold('PERANOVA:') ~ ' p-value = ns')) +
                  theme(plot.title = element_text(size = 20, hjust = 0.5, face = "bold")) +
                  #geom_text(data = genus_div_pair_letters, aes(y = y, x= type, label = groups)) +
                  #stat_compare_means(method = "anova") +
                  #stat_compare_means(comparisons = my_comparisons) +
                  theme(plot.margin = unit(c(1, 1, 1, 1), "pt")) +
                  theme(axis.line = element_line()) +
                  theme(panel.grid.major.y = element_blank())
P2 


### Functions
functions$category <- factor(functions$category, levels = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser"))

P3 <- ggplot(functions, aes(x = category, y = richness), levels = c("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser")) +
                  theme_pubr() +
                  geom_boxplot(fill = func_color, width = 0.5) +
                  guides(fill = NULL) +
                  labs(x = "Category", y = "Number of functions \n(SEED Level 4)") +
                  theme(axis.text.x = element_text(size = 18, angle = 45, hjust = 1, vjust = 1)) +
                  theme(axis.title.x = element_blank(),
                  axis.title.y = element_text(size = 20, face = "bold")) +
                  theme(axis.text.y = element_text(size = 18)) +
                  theme(panel.border = element_blank()) +
                  theme(panel.grid.major.x = element_blank()) +
                  theme(panel.grid.minor.y = element_blank()) +
                  labs(tag = "C", element_text(size =  tag_size, face = "bold")) +
                  theme(plot.tag = element_text(size =  tag_size, face = "bold")) +
                  labs( title = bquote(bold('PERANOVA:') ~ ' p-value < 0.05')) +
                  theme(plot.title = element_text(size = 20, hjust = 0.5, face = "bold")) +
                  #stat_compare_means(method = "anova") +
                  #stat_compare_means(comparisons = my_comparisons) +
                  theme(plot.margin = unit(c(1, 1, 1, 1), "pt")) +
                  geom_text(data = func_rich_pair_letters, aes(y = y, x = type, label = groups), size = 7) +
                  theme(axis.line = element_line()) +
                  theme(panel.grid.major.y = element_blank())
P3 

P4 <- ggplot(functions, aes(x = category, y = diversity), levels = cc("Porous", "Mine", "Karst P.", "S. Saline", "P. Contaminated", "Geyser")) +
                  theme_pubr() +
                  geom_boxplot(fill = func_color, width = 0.5) +
                  guides(fill = NULL) +
                  labs(x = "Category", y = "Shannon Diversity Index\n(SEED Level 4)") +
                  theme(axis.text.x = element_text(size = 18, angle = 45, hjust = 1, vjust = 1)) +
                  theme(axis.title.x = element_blank(),
                  axis.title.y = element_text(size = 20, face = "bold")) +
                  theme(axis.text.y = element_text(size = 18)) +
                  theme(panel.border = element_blank()) +
                  theme(panel.grid.major.x = element_blank()) +
                  theme(panel.grid.minor.y = element_blank()) +
                  labs(tag = "D", element_text(size = 100, face = "bold")) +
                  theme(plot.tag = element_text(size =  tag_size, face = "bold")) +
                  labs( title = bquote(bold('PERANOVA:') ~ ' p-value < 0.05')) +
                  theme(plot.title = element_text(size =  tag_size, hjust = 0.5, face = "bold")) +
                  #stat_compare_means(method = "anova") +
                  #stat_compare_means(comparisons = my_comparisons) +
                  theme(plot.margin = unit(c(1, 1, 1, 1), "pt")) +
                  geom_text(data = func_div_pair_letters, aes(y = y, x= type, label = groups), size = 7) +
                  theme(axis.line = element_line()) +
                  theme(panel.grid.major.y = element_blank())
P4 


BoxPannel <- plot_grid(P1, P2, P3, P4, ncol = 2, nrow = 2, align = TRUE)

BoxPannel
ggsave(plot = BoxPannel, filename = paste("outputs//Figures//FinalBox.png", sep = ""), width = unit(19, "cm"), height = unit(19, "cm"), limitsize = FALSE)
ggsave(plot = BoxPannel, filename = paste("outputs//Figures//FinalBox.pdf", sep = ""), width = unit(19, "cm"), height = unit(19, "cm"), limitsize = FALSE)
ggsave(plot = BoxPannel, filename = paste("outputs//Figures//FinalBox.svg", sep = ""), width = unit(19, "cm"), height = unit(19, "cm"), limitsize = FALSE)

rm(functions, phyla, genus, P1, P2, P3, P4, pairwise_fun_div,
   pairwise_genus_rich)  #free memory