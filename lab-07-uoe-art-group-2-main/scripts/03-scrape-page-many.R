# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# Exercise 7: List of urls to be scraped ---------------------------------------

root <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset="
numbers <- seq(from = 0, to = 2960, by = 10)
urls <- paste0(root, numbers)

# Exercise 8: Map over all urls and output a data frame ------------------------------------

uoe_art <- map_dfr(urls, scrape_page)

# Exercise 9: Write out data frame ---------------------------------------------------------

write_csv(uoe_art, file = "data/uoe-art.csv")


