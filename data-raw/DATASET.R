## code to prepare `DATASET` dataset goes here


library(tidyverse)
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-06-26/week13_alcohol_global.csv'

alcohol <- read_csv(url)

map <- map_data("world")

map$region <- gsub("Russia", "Russian Federation", map$region)

alcohol_map <- map %>%
  left_join(alcohol, by = c("region"= "country"))

usethis::use_data(alcohol, overwrite = TRUE)

usethis::use_data(alcohol_map, overwrite = TRUE)

