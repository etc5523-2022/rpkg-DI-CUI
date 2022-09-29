#' @title Extract country servings
#'
#' @description This function is used to obtain a list of countries in this
#' alcohol servings range in descending order of this alcohol servings.
#'
#' @param range Vector. The set range of alcohol servings
#' The max servings of beer is _376_, the max servings of spirit is _438_,
#' and the max servings of wine is _370_.
#'
#' @param type Character. The type of alcohol servings, one of "beer_servings",
#'        "spirit_servings" and "wine_servings".
#'
#'
#'@return A data.frame. Country servings.
#' \itemize{
#'   \item \code{country} : Country name.
#'   \item \code{rank} : Ranking of the country's (beer/spirit/wine) servings.
#'   \item \code{beer/spirit/wine servings} : (Beer/Spirit/Wine) servings of the country.
#' }
#'
#'@examples
#'# countries with beer servings in the range (0,100)
#'extract_country_servings(range = c(0,100), type = "beer_servings")
#'
#'
#' @export
extract_country_servings <- function(range, type){

  country <- beer_servings <- spirit_servings <- wine_servings <- servings<- NULL

  `%>%` <- magrittr::`%>%`

alcohol <- asdata::alcohol

alcohol_servings <- alcohol %>%
  tidyr::pivot_longer(cols = beer_servings:wine_servings,
               names_to = "alcohol",
               values_to = "servings")

alcohol_servings <- alcohol_servings %>%
  dplyr::filter(alcohol == type)  %>%
  dplyr::filter( servings >= range[1] &
            servings <= range[2]) %>%
  dplyr::select(country, alcohol, servings) %>%
  dplyr::arrange(-servings) %>%
  dplyr::mutate(rank = rank(-servings, ties.method = "min", na.last = TRUE)) %>%
  tidyr::pivot_wider(names_from = alcohol, values_from = servings)

return(alcohol_servings)

}






