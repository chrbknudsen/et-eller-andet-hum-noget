# Datatræk til Asger
# Træk af places, udgivere og forfattere mhp konsolidering af navneformer

library(tidyverse)


dan_filter_meta %>% 
  select(place) %>% 
  distinct() %>% 
  write_csv("data_out/distinct_places.csv")


temp_emnekoder <- read_csv("data/kb_emnekoder.csv") %>% 
  distinct(`Subject code`, .keep_all = T)

dan_filter_meta %>% 
  select(author1:author2, year, `Subject code` ) %>% 
  pivot_longer(author1:author2, names_to = "type",
               values_to = "forfatternavn") %>% 
  select(-type) %>% 
  filter(!is.na(forfatternavn)) %>%
  left_join(temp_emnekoder) %>% 
  
  write_csv("data_out/forfatternavne.csv")


dan_filter_meta %>% 
  select(publisher, place) %>% 
  filter(!is.na(place)) %>% 
  write_csv("data_out/udgivernavne.csv")
  
