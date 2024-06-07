# Datatræk til Asger
# Træk af places, udgivere og forfattere mhp konsolidering af navneformer

library(tidyverse)


dan_filter_meta %>% 
  select(place) %>% 
  distinct() %>% 
  write_csv("data_out/distinct_places.csv")


  

dan_filter_meta %>% 
  select(author1:author2, year, `Subject code` ) %>% 
  pivot_longer(author1:author2, names_to = "type",
               values_to = "forfatternavn") %>% 
  select(-type) %>% 
  filter(!is.na(forfatternavn)) %>% 
  write_csv("data_out/forfatternavne.csv")


dan_filter_meta %>% 
  select(publisher, place) %>% 
  filter(!is.na(place)) %>% 
  write_csv("data_out/udgivernavne.csv")
  
