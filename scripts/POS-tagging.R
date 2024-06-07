# I siger bare til hvis I skal bruge navneord


library(tidyverse)
library(tidytext)

library(spacyr)
spacy_initialize(model = "da_core_news_lg")


df <- dan_filter_meta %>% 
  select(title_1:title_7) %>% 
  pivot_longer(title_1:title_7, values_to = "titel",
               names_to = "noget") %>% 
  select(titel) %>% 
  filter(!is.na(titel)) %>% 
  slice(1:10)


spacy_parse(df$titel, lemma = FALSE, entity = TRUE, nounphrase = TRUE) %>% 
  filter(pos == "NOUN") %>% 
  count(token) %>% 
  arrange(desc(n))
