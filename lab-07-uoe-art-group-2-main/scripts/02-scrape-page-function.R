# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# Exercise 5: Function: scrape_page --------------------------------------------

scrape_page <- function(url){
  
  # read page
  page <- read_html(url)
  
  # scrape titles
  titles <- page %>%
    html_nodes(".iteminfo") %>%
    html_node("h3 a") %>%
    html_text() %>%
    str_squish()
  
  # scrape links
  links <- page %>%
    html_nodes(".iteminfo") %>%
    html_node("h3 a") %>%
    html_attr("href") %>%
    str_replace(".", "https://collections.ed.ac.uk/art")
  
  # scrape artists 
  artists <- page %>%
    html_nodes(".iteminfo") %>%
    html_node(".artist") %>%
    html_text()
  
  # create and return tibble
  tibble(
    title = titles,
    artist = artists,
    link = links
  )
  
}

