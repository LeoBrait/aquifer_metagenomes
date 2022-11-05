
        metadata0 <- read_csv(
                              "inputs//october_annotated_groundwater_samples_metadata.csv"
                              )
        genus0 <- read_csv(
                              "inputs//october_genus_groundwater_annotated_matrix.csv"
                          )
        functions0 <- read_csv(
                              "inputs//october_functional_geral_matrix_lvl4.csv"
                              )
        phyla0 <- read_csv(
                              "inputs//october_phyla_groundwater_annotated_matrix.csv"
                          )
        proteo0 <- read_csv(
                              "inputs//october_proteobacteria.csv"
                           )
        amb0 <- read_csv(
                              "inputs//samples_metagenome_envi.csv"
                        )

        if (LOAD_RAW_FUNCTIONS == "yes") {
                functions_complete0 <- read_csv(
                                                "inputs//october_all_levels_and_functions_groundwater.csv",
                                                ) #Unused data.frame

                                         }
        save.image(
                    "images//starting_point.RData"
                  )