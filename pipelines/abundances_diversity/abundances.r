########## Proteo Analysis
proteo_abundants <- proteo_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean > 1 / 100) %>%
             pull(key)


others <- dplyr::select(proteo_numeric, -proteo_abundants)
abundant_proteo <- dplyr::select(proteo_numeric, proteo_abundants)
abundant_proteo$others <- rowSums(others)
abundant_proteo <- rbind(abundant_proteo, colSums(select_if((abundant_proteo), is.numeric))/110)
abundant_proteo <- t(abundant_proteo)
abundant_proteo_ord <- abundant_proteo[order(abundant_proteo[,110], decreasing = T),]

abundant_proteo <- t(abundant_proteo_ord)
abundant_proteo <- as.data.frame(abundant_proteo[-110,])





########### Phyla Analysis Most Abundant
phyla_abundants <- phyla_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean > 1 / 100) %>%
             pull(key)


others <- dplyr::select(phyla_numeric, -phyla_abundants)
abundant_phyla <- dplyr::select(phyla_numeric, phyla_abundants)
abundant_phyla$others <- rowSums(others)
abundant_phyla %>% dplyr::summarise(mean(others)) #IMportance of low abundant
abundant_phyla <- rbind(abundant_phyla, colSums(select_if((abundant_phyla), is.numeric)) / 110)

abundant_phyla <- t(abundant_phyla)
abundant_phyla_ord <- abundant_phyla[order(abundant_phyla[,110], decreasing = T),]

abundant_phyla <- t(abundant_phyla_ord)
abundant_phyla <- as.data.frame(abundant_phyla[-110,])


########### Phyla Analysis Most rare
phyla_rares <- phyla_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean < 1 / 100) %>%
             pull(key)

0.0048
others <- dplyr::select(phyla_numeric, -phyla_rares)
rare_phyla <- dplyr::select(phyla_numeric, phyla_rares)
rare_phyla$others <- rowSums(others)
rare_phyla <- rbind(rare_phyla, colSums(select_if((rare_phyla), is.numeric))/110)
rare_phyla <- t(rare_phyla)
rare_phyla_ord <- rare_phyla[order(rare_phyla[,110], decreasing = T),]

rare_phyla <- t(rare_phyla_ord)
rare_phyla <- as.data.frame(rare_phyla[-110,])


########### Functional Analysis Most Abundant
func_abundants <- func_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean > 1 / 1000) %>%
             pull(key)


others <- dplyr::select(func_numeric, - func_abundants)
func_abundants <- dplyr::select(func_numeric, func_abundants)
func_abundants$others <- rowSums(others)
func_abundants %>% dplyr::summarise(mean(others)) #IMportance of low abundant
func_abundants <- rbind(func_abundants, colSums(select_if((func_abundants), is.numeric)) / 110)

func_abundants <- t(func_abundants)
abundant_func_ord <- func_abundants[order(func_abundants[,110], decreasing = T),]

func_abundants <- t(abundant_func_ord)
func_abundants <- as.data.frame(func_abundants[-110,])

########### Genus Most Abundant
gen_abundant <- genus_numeric %>% tidyr::gather() %>% dplyr::group_by(key) %>%
             dplyr::summarise(taxa_mean = mean(value)) %>%
             filter(taxa_mean > 1 / 1000) %>%
             pull(key)


others <- dplyr::select(genus_numeric, - gen_abundant)
gen_abundant <- dplyr::select(genus_numeric, gen_abundant)
gen_abundant$others <- rowSums(others)
gen_abundant %>% dplyr::summarise(mean(others)) #IMportance of low abundant
gen_abundant <- rbind(gen_abundant, colSums(select_if((gen_abundant), is.numeric)) / 110)

gen_abundant <- t(gen_abundant)
abundant_gen_ord <- gen_abundant[order(gen_abundant[,110], decreasing = T),]

gen_abundant <- t(abundant_gen_ord)
gen_abundant <- as.data.frame(gen_abundant[-110,])