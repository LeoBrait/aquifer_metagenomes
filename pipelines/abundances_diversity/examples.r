###### example of Dissimilar Genera Abundances
genus0 %>% group_by(category) %>% dplyr::summarise(mean(Candidatus.Altiarchaeum))
###### example of Dissimilar Rare Phyla Abundances
phyla_numeric %>% group_by(category) %>% dplyr::summarise(mean(Candidatus.Wolfebacteria))
###### example of Dissimilar Functions Abundances
func_numeric %>% group_by(functions0$category) %>% dplyr::summarise(mean(TonB.dependent_receptor))

phyla_numeric %>% dplyr::summarise(mean(Proteobacteria))
proteo_numeric %>% dplyr::summarise(mean(Gammaproteobacteria))
proteo_numeric %>% dplyr::summarise(mean(Alphaproteobacteria))
proteo_numeric %>% dplyr::summarise(mean(Deltaproteobacteria))
phyla_numeric %>% dplyr::summarise(mean(Actinobacteria))
phyla_numeric %>% dplyr::summarise(mean(Euryarchaeota))
genus_numeric %>% group_by(genus0$category) %>% dplyr::summarise(mean(Stenotrophomonas))