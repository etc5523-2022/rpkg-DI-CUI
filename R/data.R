#' Alcohol consumption
#'
#' A dataset that contains beer, spirit and wine servings and total litres of pure alcohol by country.
#'
#' @format A data frame with 193 rows and 5 variables.
#' \describe{
#'   \item{country}{Country name}
#'   \item{beer_servings}{beer servings of the country)}
#'   \item{spirit_servings}{spirit servings of the country}
#'   \item{wine_servings}{wine servings of the country}
#'   \item{total_litres_of_pure_alcohol}{the total (sum of recorded and unrecorded alcohol) amount of alcohol consumed per person (15 years of age or older) over a calendar year, in litres of pure alcohol, adjusted for tourist consumption. (The World Bank Group,2022)}
#' }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2018/2018-06-26/week13_alcohol_global.csv}
"alcohol"

#' The world map of alcohol consumption
#'
#' A dataset containing world map and alcohol consumption.
#'
#' The dataset is obtained via the following codes:\cr
#' \code{library(tidyverse)}\cr
#' \code{url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-06-26/week13_alcohol_global.csv'}\cr
#' \code{alcohol <- read_csv(url)}\cr
#' \code{map <- map_data("world")}\cr
#' \code{map$region <- gsub("Russia", "Russian Federation", map$region)}\cr
#' \code{alcohol_map <- map %>% left_join(alcohol, by = c("region"= "country")) %>% rename(country = region)}}\cr
#'
#' @format A data frame with 99338 rows and 10 variables.
#' \describe{
#'   \item{long}{longitude}
#'   \item{lat}{latitude}
#'   \item{group}{The group variable for each polygon}
#'   \item{order}{The order of connection of each point in each group}
#'   \item{region}{Name of country and region}
#'   \item{subregion}{Name of subregion}
#'   \item{beer_servings}{beer servings of the country)}
#'   \item{spirit_servings}{spirit servings of the country}
#'   \item{wine_servings}{wine servings of the country}
#'   \item{total_litres_of_pure_alcohol}{the total (sum of recorded and unrecorded alcohol) amount of alcohol consumed per person (15 years of age or older) over a calendar year, in litres of pure alcohol, adjusted for tourist consumption. (The World Bank Group,2022)}
#' }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2018/2018-06-26/week13_alcohol_global.csv}
#' @source \url{https://ggplot2.tidyverse.org}
"alcohol_map"
