
# ggplot2 CCA
cca_plot <- ggplot(ord_df) +

    # Points
    theme_pubr() +
    geom_point(
                data = ord_df[ord_df$species == "", ],
                mapping = aes(
                                x = CCA1,
                                y = CCA2
                             ),
                pch = 20,
                size = 5,
                color = "grey",
                alpha = 0.6
                ) +
        geom_point(
                data = ord_df[ord_df$species != "", ],
                mapping = aes(
                                x = CCA1,
                                y = CCA2
                             ),
                pch = 19,
                size = 5,
                color = points_color,
                alpha = 1
                ) +

    #Text of axis
    theme(plot.title = element_blank()) +
    theme(axis.title.x = element_text(face = "bold", size =  axis_text)) +
    theme(axis.title.y = element_text(face = "bold", size =  axis_text)) +
    theme(axis.text.x = element_text(size =  axis_text, color = "black")) +
    theme(axis.text.y = element_text(size =  axis_text, color = "black")) +

    # Labels


    ggrepel::geom_text_repel(
                              data = ord_df[ord_df$species != "", ],
                              mapping = aes(
                                            x = CCA1,
                                            y = CCA2,
                                            label = label[label != ""],
                                            ),
                                max.overlaps = Inf,
                                show.legend = FALSE,
                                #force        = force,
                                nudge_x      = start_x,
                                nudge_y      = start_y,
                                direction    = direction,
                                color = "#4e1bdb",
                                #segment.curvature = -1e-20,
                                #segment.angle = 20,
                                seed = 10,
                                hjust = "right",
                                fontface = "bold",
                                min.segment.length = 0.1,
                                segment.inflect = TRUE,
                                #segment.ncp = 1,
                                segment.size = 0.4,
                                #box.padding = 10,
                                alpha = 1,
                                max.time = 60,
                                size =  inside_plot
                                #max.iter = Inf

                            ) +

    # arrows
    geom_segment(
                    data = cca.amb,
                    aes(
                         x = 0,
                        xend = cca1 * mult_line,
                        y = 0,
                        yend = cca2 * mult_line
                        ),
                    arrow = arrow(
                    length = unit(0.5, "cm")
                        ),
                    size = .5,
                    colour = "black"
                ) +

    # Text of Arrows
    geom_text(
                data = cca.amb,
                aes(
                    x = cca1 * mult_text,
                    y = cca2 * mult_text,
                    label = variables
                    ),
                size = inside_plot,
                colour = "black"
            ) +

    # Titles and tags
    #scale_x_continuous(limits = axis_x_limits) +
    labs(
            title = title,
            tag = tag,
            fill = "Treatments",
            x = paste(
                      "CCA1 (",
                       round(exp[2, 1] * 100, digits = 2),
                        "%)"
                    ),
            y = paste(
                       "CCA2 (",
                        round(exp[2, 2] * 100, digits = 2),
                        "%)"
                    )
        ) +
    theme(plot.tag = element_text(face = "bold", size = 18)) +

    geom_hline(
                yintercept = 0,
                lty = "dashed",
                colour = "gray70"
               ) +
    geom_vline(
                xintercept = 0,
                lty = "dashed",
                colour = "gray70"
             ) +
    theme(legend.key = element_rect(fill = "white")) +
    theme(legend.key = element_rect(colour = "white")) +

   #Legend
    theme(
          legend.title = element_blank(),
          legend.text = element_blank()
        ) +

    #Cleaning grid lines
    theme(axis.line.x = element_blank()) +
    theme(axis.line.y = element_blank()) +
    theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA, size = .5)
    )