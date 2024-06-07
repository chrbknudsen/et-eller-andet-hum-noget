# geokoder
# Input:
# dataframe med originalt stednavn, normaliseret stednavn.
# Output
# Dataframe med originalt stednavn, normaliseret stednavn, lat og long.


library(tidygeocoder)
tidygeocoder::geo("København")
