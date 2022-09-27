





#' @export
plot_servings <- function(type){

  `%>%` <- magrittr::`%>%`

  alcohol <- asdata::alcohol

  alcohol_servings <- alcohol %>%
    tidyr::pivot_longer(cols = beer_servings:wine_servings,
                        names_to = "alcohol",
                        values_to = "servings")




}
