
## Analyse des données d'animés
## Introduction

#Il présente une analyse de données sur les animés. Je travaillerai sur les genres, les studios, les épisodes.

#**La base de données utilisée est: <https://www.kaggle.com/datasets/bangaru5/datasets-related-to-animation>.**

## Importation les library et données à utiliser

library(readr) 
library(readxl)
library(tidyverse)
library(ggplot2)
 
 Animation <- read_csv("C:/Users/user_/OneDrive/Documents/Enseignement R/data/Animation.csv")
 View(Animation)

## Analyse des genres
#comptons le nombre d'animés par genre et mettons sous forme de graphique les genres comptant plus de 200 Animés.

tmp<- Animation %>% 
  group_by(genre) %>% 
  tally() %>% 
  arrange(desc(n))%>% 
  filter(n>200)%>% 
            
  ggplot(aes(x = genre, y = n)) +
  geom_point()
tmp

## Analyse rang
#Listons les animés en fonction de leur position dans le classement et afficher les dix premiers du classement avec leur genre, les producteurs et les studios.

tmp<- Animation %>% 
  select(name,rank,genre,producers,studio) %>% 
  arrange((rank)) %>% 
  filter(rank<11)
tmp

## Analyse episodes
#Affichons le nom des animes dont le nombre d'épisode est supérieur à 1000.


tmp<- Animation %>% 
  select(name,episodes) %>% 
  arrange(desc(episodes)) %>% 
  filter(episodes>1000)
tmp

## Conclusion
#L'analyse a surtout pris en compte les genres. On peut constater que les genre Action et Comédie sont les plus populaires.
#TV tokyo et le studio Sunrise ont produits les animés les plus populaires.
