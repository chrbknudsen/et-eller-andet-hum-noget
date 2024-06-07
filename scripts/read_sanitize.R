# Sanitering af data
# kolonnenavne...

library(tidyverse)
library(janitor)


emnekoder <- read_csv("data/kb_emnekoder.csv") %>% 
  clean_names()

dan_filter <- read_csv("data/metadata-dan-filtered-2.csv", guess_max = Inf) %>% 
  clean_names()

dan_filter_meta <- read_csv("data/metadata-dan-filtered-emnekoder-csv.csv", guess_max = Inf) %>% 
  clean_names()
