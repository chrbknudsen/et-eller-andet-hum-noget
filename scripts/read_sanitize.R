# Sanitering af data
# kolonnenavne...

library(tidyverse)
library(janitor)


emnekoder <- read_csv("data/kb_emnekoder.csv") %>% 
  clean_names()

# konverterer . til , i subject_code
emnekoder <- emnekoder %>% 
  filter(!str_detect(subject_code, ",")) %>% 
  mutate(subject_code = str_replace_all(subject_code, "\\.", ",")) %>% 
  rbind(emnekoder %>% 
          filter(str_detect(subject_code, ","))) 
# enkelte steder optræder der ", " i emnekoden. whitespace fjernes
emnekoder <- emnekoder %>% 
  mutate(subject_code = str_replace(subject_code, ", ", ","))

# subject heading tilføjet
emnekoder <- emnekoder %>% 
  mutate(subject_heading = str_extract(subject_code, "^[\\d:]+(?=[, ])"),
         .before = subject_code)

dan_filter <- read_csv("data/metadata-dan-filtered-2.csv", guess_max = Inf) %>% 
  clean_names()

dan_filter_meta <- read_csv("data/metadata-dan-filtered-emnekoder-csv.csv", guess_max = Inf) %>% 
  clean_names()


dan_filter %>% 
  select(year, year_st) %>% 
  mutate(aar = as.numeric(year)) %>% 
  filter(is.na(aar)) %>% 
  view()

