# 100 lignes random pour INSEE
# Auteur : E.P.
# Date  20/02/2024

#library to load
library(tidyverse)
library(readxl)#pour ouvrir les excels
library(lubridate)#pour dates
library(data.table)#pour fread car plus rapide
#--------------------- Base de données ####

base_2015_16 <- read_excel("./base2015_16.xlsx") %>%
  mutate(VOY_MOTIF = str_replace_all(VOY_MOTIF, " – ", " - "))#pas le meme tiret du 6... longueur differente

set.seed(10)
base_pour_insee <- base_2015_16[sample(nrow(base_2015_16), 100), ]

write_excel_csv2(base_pour_insee, file="echantillon_bdd_enpa_insee.csv")
