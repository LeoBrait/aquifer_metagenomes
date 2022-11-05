

#AMBIENT
df0 <- as.data.frame(cbind(df0$comparison, df0$contribution, df0$OTU))
colnames(df0) <- c("comparison", "contribution", "OTU")
df0$contribution <- as.numeric(df0$contribution)
levels <- unique(df0$comparison)
subset_phyla_contribution <- list(NULL)
firsts <- c()
seconds <- c()
thirds <- c()
fourths <- c()
fives <- c()
six <- c()
seven <- c()
eight <- c()
nine <- c()

#listing subset by ist factors and reordering and loading
for (x in 1:length(levels)){
        dummy <- subset(df0, comparison == levels[x])
        dummy <- arrange(dummy, -contribution)
        row.names(dummy) <- NULL
        subset_phyla_contribution[x] <- list(dummy)
                                                                            }




for (x in 1:length(subset_phyla_contribution)) {
        firsts[length(firsts) + 1] <- as.data.frame(subset_phyla_contribution[x])[1, 3]
        print(as.data.frame(subset_phyla_contribution[x])[1, 3])
                                                                                      }



for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[2, 3]
        if (dummy %in% firsts) {
                } else {
                        seconds[length(seconds) + 1] <- as.data.frame(subset_phyla_contribution[x])[2, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[2, 3])
                                                                                                        }
                                                                                                          }

for (x in 1:length(subset_phyla_contribution)) {
        dummy <- as.data.frame(subset_phyla_contribution[x])[3, 3]
        if (dummy %in% firsts || dummy %in% seconds) {
                } else {
                        thirds[length(thirds) + 1] <- as.data.frame(subset_phyla_contribution[x])[3, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[3, 3])
                                                                                                      }
                                                                                                        }

for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[4, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds) {
                } else {
                        fourths[length(fourths) + 1] <- as.data.frame(subset_phyla_contribution[x])[4, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[4, 3])
                                                                                                      }
                                                                                                        }


for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[5, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds || dummy %in% fourths) {
                } else {
                        fives[length(fives) + 1] <- as.data.frame(subset_phyla_contribution[x])[5, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[5, 3])
                                                                                                      }
                                                                                                        }
for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[6, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds || dummy %in% fourths || dummy %in% fives) {
                } else {
                        six[length(six) + 1] <- as.data.frame(subset_phyla_contribution[x])[6, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[6, 3])
                                                                                                      }
                                                                                                        }

for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[7, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds || dummy %in% fourths || dummy %in% fives || dummy %in% six) {
                } else {
                        seven[length(seven) + 1] <- as.data.frame(subset_phyla_contribution[x])[7, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[7, 3])
                                                                                                      }
                                                                                                        }
for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[8, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds || dummy %in% fourths || dummy %in% fives || dummy %in% six || dummy %in% seven) {
                } else {
                        eight[length(eight) + 1] <- as.data.frame(subset_phyla_contribution[x])[8, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[8, 3])
                                                                                                      }
                                                                                                        }
for (x in 1:length(subset_phyla_contribution)){
        dummy <- as.data.frame(subset_phyla_contribution[x])[9, 3]
        if (dummy %in% firsts || dummy %in% seconds || dummy %in% thirds || dummy %in% fourths || dummy %in% fives || dummy %in% six || dummy %in% seven || dummy %in% eight) {
                } else {
                        nine[length( nine) + 1] <- as.data.frame(subset_phyla_contribution[x])[9, 3]
                        print(as.data.frame(subset_phyla_contribution[x])[9, 3])
                                                                                                      }
                                                                                                        }


firsts <- as.data.frame(table(firsts))
colnames(firsts) <- c("OTU", "Freq")
firsts <- arrange(firsts, -Freq)
firsts$pos <- rep(1, nrow(firsts))

seconds <- as.data.frame(table(seconds))
colnames(seconds) <- c("OTU", "Freq")
seconds <- arrange(seconds, -Freq)
seconds$pos <- rep(2, nrow(seconds))

thirds <- as.data.frame(table(thirds))
colnames(thirds) <- c("OTU", "Freq")
thirds <- arrange(thirds, -Freq)
thirds$pos <- rep(3, nrow(thirds))

fourths <- as.data.frame(table(fourths))
colnames(fourths) <- c("OTU", "Freq")
fourths <- arrange(fourths, -Freq)
fourths$pos <- rep(4, nrow(fourths))

fives <- as.data.frame(table(fives))
colnames(fives) <- c("OTU", "Freq")
fives <- arrange(fives, -Freq)
fives$pos <- rep(5, nrow(fives))

six <- as.data.frame(table(six))
colnames(six) <- c("OTU", "Freq")
six  <- arrange(six, -Freq)
six$pos <- rep(6, nrow(six))

seven <- as.data.frame(table(seven))
colnames(seven) <- c("OTU", "Freq")
seven  <- arrange(seven, -Freq)
seven$pos <- rep(7, nrow(seven))

eight <- as.data.frame(table(eight))
colnames(eight) <- c("OTU", "Freq")
eight  <- arrange(eight, -Freq)
eight$pos <- rep(8, nrow(eight))

nine <- as.data.frame(table(nine))
colnames(nine) <- c("OTU", "Freq")
nine  <- arrange(nine, -Freq)
nine$pos <- rep(9, nrow(nine))

ranking <- data.table::rbindlist(list(firsts, seconds, thirds, fourths, fives, six, seven, eight, nine))
row.names(ranking) <- NULL
rm(firsts, seconds, thirds, fourths, levels, subset_phyla_contribution, df0)
