#' @title Get alcohol and alcohol_map dataset
#'
#' @description This function could get alcohol dataset and alcohol_map dataset,
#' which contain beer, spirit and wine servings, total litres of pure alcohol
#' and geometry information by country.
#'
#' @param data Character. Either "alcohol" or "alcohol_map" to get dataset.
#'              "alcohol" get alcohol dataset, which contains beer, spirit and
#'              wine servings and total litres of pure alcohol by country.
#'              "alcohol_map" get alcohol_map dataset, which contains alcohol dataset and world map.
#'
#' @return A data.frame. alcohol dataset or alcohol_map dataset.
#'
#'@examples
#' # Get alcohol dataset.
#'get_data(data = "alcohol")
#'
#' @export
get_data <- function(data){
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-06-26/week13_alcohol_global.csv'

`%>%` <- magrittr::`%>%`

alcohol <- readr::read_csv(url)

map <- ggplot2::map_data("world")

map$region <- gsub("Russia", "Russian Federation", map$region)

alcohol_map <- map %>%
  dplyr::left_join(alcohol, by = c("region"= "country"))

if (data == "alcohol"){
  return(alcohol)
} else if(data == "alcohol_map"){
  return(alcohol_map)
} else{
  print("please input right argument")
}

}

