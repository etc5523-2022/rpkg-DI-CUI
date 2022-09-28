#' @title Mapping global servings of beer, spirit and wine
#'
#' @description This function maps global alcohol servings of beer, spirit and wine.
#'
#' @param type Character. The type of alcohol servings, one of "beer_servings",
#'        "spirit_servings" and "wine_servings".
#'
#' @returns A plot. Alcohol servings plot. The color grey means `NA`.
#'
#' @examples
#'# mapping global beer servings.
#'plot_servings("beer_servings")
#'
#' @export
plot_servings <- function(type){

  alcohol <- beer_servings <- group <- lat <- long <- servings <- wine_servings <- NULL

  `%>%` <- magrittr::`%>%`

  map_data <- asdata::alcohol_map

  alcohol_servings <- map_data %>%
      tidyr::pivot_longer(cols = beer_servings:wine_servings,
                          names_to = "alcohol",
                          values_to = "servings") %>%
      dplyr::filter(alcohol == type)

  aes <- ggplot2::aes

 alcohol_servings %>%
   ggplot2::ggplot( aes(x = long, y = lat, group = group))+
   ggplot2::geom_polygon(data = map_data, aes(x = long, y = lat, group = group),
                   fill = "white", colour = "#252525")+
   ggplot2::geom_polygon( aes(fill = servings), color = "#252525")+
   ggplot2::scale_fill_gradient(low = "#ffffcc",
                          high = "#800026",
                          na.value = "grey",
                          breaks = c(0,50,100,150,200,250,300,350,400,450),
                          labels = c(0,50,100,150,200,250,300,350,400,450))+
   ggplot2::theme_void()+
   ggplot2::theme(panel.grid = ggplot2::element_blank(),
            axis.line.x = ggplot2::element_blank(),
            axis.line.y = ggplot2::element_blank())+
   ggplot2::labs(fill = "Servings",
           title = type)

}
