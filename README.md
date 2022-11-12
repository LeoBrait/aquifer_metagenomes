# Aquifers Landscapes Defines Taxonomy and Functional Genes of Microbiomes 

This is a organized pipeline to analyse public metagenomic annotated data from aquifer microbiomes. Here we do Simper, CCA, NMDS, Anovas, peranovas and permanovas analysis to reveal patterns of the composition and diversity of functional genes and taxonomic units of different aquifer types around the world.

## Requiriments:
Here we use the R language on version 4.2.1 and the following libraries:  
<sub>Please observe if all of them are installed and its correspondent dependencies before running the codes.</sub>

### 1. For utilities and performance
- **devtools(2.5.5)**
- **parallel(base)**

### 2. For data wrangling
- **dplyr(1.1.10)**
- **plyr(1.8.7)**
- **tidyverse(1.3.2)**

### 3. For Geoprocessing:
- **geosphere(1.514)**
- **psych(2.2.9)**
- **raster(3.63)**

### 4. To perform statistical analysis
- **vegan(2.62)** 
- **lmPerm(2.1.0)**
- **stats(base)** 
- **rstatix(0.7.0)** 
- **EcolUtils(0.1)**
- **multcomp(1.4_20)** 

### 5. For data visualization
- **ggplot2(3.3.6)** 
- **cowplot(1.1.1)** 
- **ggpubr(0.4.0)** 
- **reshape(0.8.9)**
- **RColorBrewer(1.13)**
- **gridExtra(2.3)**
- **scales(1.2.1)**
- **evaluate(0.17)**
- **corrplot(0.92)**
- **ggplotify(0.1.0)**

## Folder structure:

```Markdown
aquifers_master
├─ README.md
├─ inputs
│  ├─ environmental.csv
│  ├─ functional_all_levels.csv
│  ├─ functional_lvl4.csv
│  ├─ Funçoes mais importantes e ordenadas 2.txt
│  ├─ genus.csv
│  ├─ metadata.csv
│  ├─ phyla.csv
│  ├─ proteobacteria.csv
│  └─ simper_ranking.csv
├─ outputs
│  ├─ Figures     
│  ├─ other
│  └─ tables
│     ├─ simper_complete
│     │  ├─ func_lvl4
│     │  ├─ taxonomic_gen
│     │  └─ taxonomic_phyla
│     ├─ simper_phyla_summary(adjusted).csv
│     └─ simper_phyla_summary.csv
└─ pipelines
   ├─ **master.r**
   ├─ utilities
   │  ├─ colors_fonts.r
   │  ├─ functions.r
   │  └─ libraries.r
   ├─ data_wrangling
   │  ├─ ambiental_data_whangling.r
   │  ├─ general_data_wrangling.r
   │  └─ load_inputs.r
   ├─ simper
   │  ├─ electing_dissimilar.r
   │  ├─ ranking_simper.r
   │  ├─ save_simper_specific.r
   │  ├─ simper.r
   │  └─ summary_simper.r
   ├─ cca
   │  ├─ ambiental_correlations.r
   │  ├─ cca_analysis.r
   │  ├─ cca_master.R
   │  ├─ f_model.r
   │  ├─ multiconstrained.r
   │  ├─ plot_cca_aes.r
   │  ├─ plot_cca_functions_data.r
   │  ├─ plot_cca_genus_data.r
   │  └─ plot_cca_phyla_data.r
   ├─ abundances_diversity
   │  ├─ abundances.r
   │  ├─ abundances_for_abstract.r
   │  ├─ boxplots.r
   │  ├─ examples.r
   │  └─ perma_peranova.r
   ├─ nmds
   │  ├─ nmds_func.r
   │  ├─ nmds_legend.r
   │  ├─ nmds_master.r
   │  ├─ nmds_phyla.R
   │  └─ plot_nmds_aes.r
   └─ stackedbars
      ├─ data_stacked.r
      ├─ nelson.r
      ├─ pannel_stacked_bars.r
      └─ stacked_abundant_phyla.r
```

## Getting started:
After installing R language and all libraries above, simply download all the project, go to pipelines/master.r and change the path of setwd() to the correspondent path of aquifers_master on your computer and run the code. As the example:

```r
setwd("my_example_path//aquifers_master")
```

## Contributors:

**Authors:** Brait LAS, Barbosa FAS, Ferreira CAM, Mkrull and Moreira EF.  
**Revised by:** Meirelles, PM

## Versions:
First submission on: 05/11/2022  
Last Update on: 11/11/2022
