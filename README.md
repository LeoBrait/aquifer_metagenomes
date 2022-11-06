# Aquifers Landscapes Defines Taxonomy and Functional Genes of Microbiomes 

This is a organized pipeline to analyse public metagenomic annotated data from aquifer microbiomes. Here we do Simper, CCA, NMDS, Anovas, peranovas and permanovas analysis to reveal patterns of the composition and diversity of functional genes and taxonomic units of different aquifer types around the world.

## Requiriments:
Here we use the R language on version 4.2.1 and the following libraries:
<sub>Please observe if all of them are installed and its correspondent dependencies before running the codes.</sub>

### 1. For utilities and performance
- ** devtools(2.5.5)**
- ** parallel(base)**

### 2. For data wrangling
- **dplyr(1.1.10)**
- **plyr(1.8.7)**
- **tidyverse(1.3.2)**

### 3. For Geoprocessing:
- **geosphere(1.514)**
- **psych(2.2.9)**
- **raster(3.63)**

### 4. To perform statistic analysis
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

## Getting started:
After installing R language and all libraries above, simply download all the project, go to pipelines/master.r and change the path of setwd() to the correspondent path of aquifers_master on your computer and run the code. 

## Contributors:
**Authors:** Brait LAS, Barbosa FAS, Ferreira CAM, Mkrull and Moreira EF.
**Revised by:** Meirelles, PM

## Versions:
First submission on: 05/11/2022
Last Update on: 06/11/2022
