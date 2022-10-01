#' @title Difference between alcohol values and average
#'
#' @description function calculates the average alcohol consumption and servings of selected countries,
#' as well as the difference between the alcohol consumption and servings of each country  and the average.
#'
#' @param name Character. Country name. Note: For Russia, using "Russian Federation".
#'
#' @param type Character. The type of alcohol value, one of "beer_servings",
#'        "spirit_servings", "wine_servings" and "total_litres_of_pure_alcohol".
#'
#'@return A list. A list of length 2.
#'A Character. Mean of global alcohol value, and mean of alcohol value of selected country.
#'
#'A data.frame. Difference alcohol value between country in descending order of difference.
#' \itemize{
#'   \item \code{country} : Country name.
#'   \item \code{diff} : Difference between alcohol value of country and average alcohol value of selected country.
#'   \item \code{global_diff} : Difference between alcohol value of selected country and average of global alcohol value.
#'   \item \code{beer_servings/ spirit_servings/ wine_servings/ total_litres_of_pure_alcohol} : value of beer_servings, spirit_servings, wine_servings or total_litres_of_pure_alcohol.
#' }
#'
#'
#'@examples
#'# calculate average wine servings of China, Japan, France, Australia and USA,
#'# Calculate difference between wine_servings of each country with the average wine_servings.
#'country <- c("China","Japan","France", "Australia","USA")
#'calculate_country_alcohol(country, "wine_servings")
#'
#'
#' @export
calculate_country_alcohol<-function(name, type){

  beer_servings <- country <- total_litres_of_pure_alcohol <- value <- NULL

  `%>%` <- magrittr::`%>%`

  alcohol <- asdata::alcohol

  tab <- alcohol %>%
    tidyr::pivot_longer(cols = beer_servings:total_litres_of_pure_alcohol,
                        names_to = "choose",
                        values_to = "value") %>%
    dplyr::filter(choose == type)


  cal <- alcohol %>%
    dplyr::filter(country %in% name) %>%
    tidyr::pivot_longer(cols = beer_servings:total_litres_of_pure_alcohol,
                 names_to = "choose",
                 values_to = "value") %>%
    dplyr::filter(choose == type) %>%
    dplyr::mutate( diff = round(value - round(mean(value),2),2),
                   global_diff = round(value - round(mean(tab$value),2),2))

  global_mean <- paste("global mean:", round(mean(tab$value),2))
  choose_mean <- paste("mean:",round(mean(cal$value),2))

  mean <- paste(global_mean,"; " ,choose_mean)

  diff_table <- tidyr::pivot_wider(data = cal, names_from = choose, values_from = value) %>%
    dplyr::arrange(-diff)

  return (list(mean, diff_table))
}






