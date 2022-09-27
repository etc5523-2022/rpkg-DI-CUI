#' @title Difference in global alcohol consumption and servings
#'
#' @description This function calculates the country average alcohol consumption
#' and servings, as well as the difference between the average and the country.
#'
#' @param name Vector.Vector of country names.
#'
#' @param type Character. The type of alcohol value, one of "beer_servings",
#'        "spirit_servings", "wine_servings" and "total_litres_of_pure_alcohol".
#'
#'@return A value. Mean of alcohol value of selected country.
#'
#'@return A data.frame. Difference alcohol value between country.
#' \itemize{
#'   \item \code{country} : Country name.
#'   \item \code{diff} : Difference between alcohol value of country and average alcohol value of selected country.
#'   \item \code{beer_servings/ spirit_servings/ wine_servings/ total_litres_of_pure_alcohol} : value of beer_servings, spirit_servings, wine_servings or total_litres_of_pure_alcohol.
#' }
#'
#'
#'@examples
#'# Average wine servings of China, Japan, France, Australia and USA,
#'# a dataset of difference between wine_servings of each country with the average wine_servings.
#'country <- c("China","Japan","France", "Australia","USA")
#'calculate_country_alcohol(country, "wine_servings")
#'
#'
#' @export
calculate_country_alcohol<-function(name, type){

  beer_servings <- country <- total_litres_of_pure_alcohol <- value <- NULL

  `%>%` <- magrittr::`%>%`

  alcohol <- asdata::alcohol


  cal <- alcohol %>%
    dplyr::filter(country %in% name) %>%
    tidyr::pivot_longer(cols = beer_servings:total_litres_of_pure_alcohol,
                 names_to = "choose",
                 values_to = "value") %>%
    dplyr::filter(choose == type) %>%
    dplyr::mutate( diff = round(value - round(mean(value),2),2))

  mean <- print(paste("mean:",round(mean(cal$value),2)))

  diff_table <- tidyr::pivot_wider(data = cal, names_from = choose, values_from = value) %>%
    dplyr::arrange(-diff)

  mean
  diff_table
}






