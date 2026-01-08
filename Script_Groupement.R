## Importation des packages 

library(vegan)
library(readxl)
library(BiodiversityR)
library(indicspecies)


##importation des données 

setwd("~/Projet IA")

data1 <- read_xlsx("~/Projet IA/Matrice d'abondance-dominance.xlsx")

##données environnementales 

env <- read_xlsx("~/Projet IA/Matrice secondaire.xlsx")

env <- as.data.frame(env)

rownames(env) <- env$Sites

env$Sites <- NULL

env$Sol <- as.factor(env$Sol)

env$Humidite <- factor(env$Humidite)

## préparation de la base de données 

data1 <- as.data.frame(data1)

rownames(data1) <- data1$Sites

data1$Sites <- NULL

data_hel <- decostand(data1, method = "hellinger") ##standardisation


## Analyse préliminaires 

nmds <- metaMDS(data_hel, distance = "bray") ##NMDS, stress = 0,12 donc acceptable 

plot(nmds)


## Groupement 

dist <- vegdist(data_hel, method = "bray") ##distance entre sites 

clust <- hclust(dist, method = "ward.D2") ##groupement proprement dit 

plot(clust) ##graphique 

groups <- cutree(clust, k = 4) ##K est égal à 4 ici 

## Interprétation écologique 

res <- multipatt(data1, groups, func = "IndVal.g", control = how(nperm = 999)) ##association des espèces au groupement

summary(res, indvalcomp = TRUE) ## tri des espèces significatives 

## Différence entre groupement 

adonis2(data1~groups, method = "bray", permutations = 999)


## Intégration des variables 

envfit(nmds, env)

## Variances expliquées 

adonis2(data1~groups + Couv_ligneux + Coupe_bois+Feu+Paturage+
          Agriculture, data = env)

## Partitionner la variance 

varpart(data1, ~groups, ~ Couv_ligneux + Couv_herbe + Coupe_bois + Feu + Paturage + Agriculture + Sol + Humidite, data = env)


## DCA 

dca <- decorana(data1)

sites_scores <- scores(dca, display = "sites")

gradient <- max(sites_scores[,1]) - min(sites_scores[,1])

gradient

## CCA 

cca_ar <- cca(data1~., data = env)

summary(cca_ar)

scores(cca_ar, display = "bp", scaling = 2)

## dESCRIPTION

data_group <- data1

data_group$cluster <- groups

## Indice de Shannonn

shannon_site <- diversity(data1, index = "shannon")
richesse_site <- specnumber(data1)
pielou <- shannon_site / log2(richesse_site)

res_div <- data.frame(
  site = rownames(data1),
  cluster = groups,
  shannon = shannon_site,
  richesse = richesse_site, 
  pielou = pielou
)

res_div %>%
  group_by(cluster) %>%
  summarise(
    shannon_moy = mean(shannon),
    shannon_sd = sd(shannon),
    richesse_moy = mean(richesse), 
    pielou = mean(pielou)
  )
