##### Functions ####
## Function to extract hull data for CCA plots
hull <- function(a) {
  lvls <- unique(a)
  hull.data <- list()
  for (i in 1:length(lvls)){
    hull.data[[i]] <- data.scores[a == lvls[i], ][chull(data.scores[a == lvls[i], c("NMDS1", "NMDS2")]), ]
  }
  (hull.data)
  hull.data <- do.call(rbind, hull.data)
  return(hull.data)
}

## Function to Normalize environmental variables
normalize <- function(var) {
  (var - mean(var)) / sd(var)
}

get_only_legend <- function(plot) {
plot_table <- ggplot_gtable(ggplot_build(plot))
legend_plot <- which(sapply(plot_table$grobs, function(x) x$name) == "guide-box")
legend <- plot_table$grobs[[legend_plot]]
return(legend)
}
