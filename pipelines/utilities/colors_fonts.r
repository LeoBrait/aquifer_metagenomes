
#**************** LOADING FUNCTIONS AND SETTINGS *******************************
#*******************************************************************************
#Description: "color_plot_nmds" stands for the CCA and NMDS analysis.
#"Stacked_color" is for the stacked bars, fun_color and tax_color stands for
#boxplots. Here we also load font sizes for all plots. The functions hull() and
#normalize are necessary for extract hull data for the CCA plots and to norma-
#lize environmental variables. The function get_only_legend() to get common
#legend for pannels.
#*******************************************************************************


color_plot_nmds <- c(
                  "#43cd80", #Geyser
                  "#9400d3", #karst P.
                  "#c2c212",  #Mine
                  "#7e3c03", #P. Contaminated
                  "#3eb5bf",
                  "#0f0476" #S. Saline

                )

stacked_color <- c(
                    "#4575b4",
                    "#1a9850",
                    "#fdae61",
                    "#9a44b4",
                    "#f46d43",
                    "#7f3b08",
                    "#b8e186",
                    "#b2182b",
                    "#c7eae5",
                    "#a94c4c",
                    "#fddbc7",
                    "#d73027",
                    "#1a1a1a",
                    "#a6d96a",
                    "#ffffbf"
                    )

  func_color <- "#a94c4c"
  tax_color <- "#4ca9a2"

  tag_size <- unit(25, "cm")
  axis_text <- unit(20, "cm")
  inside_plot <- unit(7, "cm")



### Functions

#Function to extract hull data for CCA plots
hull <- function(a) {
        lvls <- unique(a)
        hull.data <- list()
        for (
              i in 1:length(lvls)
            ) {
                hull.data[[i]] <- data.scores[
                                      a == lvls[i],
                                             ][
                                            chull(
                                              data.scores[
                                              a == lvls[i],
                                              c("NMDS1", "NMDS2")
                                                       ]
                                                 ),
                                               ]
                }
          (hull.data)
          hull.data <- do.call(rbind, hull.data)
          return(hull.data)
                      }

## Function to Normalize environmental variables
normalize <- function(var) {
        (var - mean(var)) / sd(var)
                           }

## Function to get plot legends
get_only_legend <- function(plot) {
        plot_table <- ggplot_gtable(
                              ggplot_build(plot)
                                   )
        legend_plot <- which(
                          sapply(
                            plot_table$grobs, 
                            function(x) x$name
                                ) == "guide-box"
                            )

        legend <- plot_table$grobs[[legend_plot]]
        return(legend)
                                  }