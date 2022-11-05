#Functional
source(
  "pipelines//nmds//nmds_func.r"
      )

#Settings
tag <- "D"
title <- "Functional"
ord_df_nmds <- nmds_func
ord <- ord_func
danosim <- danosim_func
attach(ord_df_nmds)

source(
       "pipelines//nmds//plot_nmds_aes.r"
)


func_nmds <- plot_nmds

#Taxonomic
source(
  "pipelines//nmds//nmds_phyla.r"
      )
#Settings
tag <- "C"
title <- "Phyla"
ord_df_nmds <- nmds_phyla
ord <- ord_phyla
danosim <- danosim_phyla
attach(ord_df_nmds)

######
source(
       "pipelines//nmds//plot_nmds_aes.r"
)
phyla_nmds <- plot_nmds


#legend
source(
       "pipelines//nmds//nmds_legend.r"
)

legend <- get_only_legend(nmds_legend)

