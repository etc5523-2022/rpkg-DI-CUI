#' @title Mapping global alcohol consumption
#'
#' @description This function plots global alcohol consumption map in a total litres of pure alcohol range, and converts the plot to plotly object.
#'
#' @param Litres Vector. The range of total litres of pure alcohol.
#' The total litres of pure alcohol ranges from _0_ to _14.4_ liters.
#'
#'
#'@return A plotly object. Global alcohol consumption map.
#'
#'@examples
#'# Mapping global alcohol consumption with total litres of pure alcohol in range (0,10)
#'plotly_litres(c(0,10))
#'
#'
#' @export
plotly_litres <- function(Litres){


   group <- lat <- long <- map_data <- region <- total_litres_of_pure_alcohol <- NULL

  `%>%` <- magrittr::`%>%`

  map_data <- asdata::alcohol_map
  litres <- map_data %>%
    dplyr::filter(total_litres_of_pure_alcohol >= Litres[1] &
                    total_litres_of_pure_alcohol <= Litres[2])
  aes <- ggplot2::aes

  p1 <-litres%>%
    ggplot2::ggplot(aes(x = long, y = lat, group = group,
               text = sprintf("region: %s<br>total litres of pure alcohol: %s",
                              region, total_litres_of_pure_alcohol)))+
    ggplot2::geom_polygon(data = map_data, aes(x = long, y = lat, group = group),
                 fill = "white", colour = "#252525")+
    ggplot2::geom_polygon( aes(fill = total_litres_of_pure_alcohol), color = "#252525")+
    ggplot2::scale_fill_gradient(low = "#f7fcfd",
                        high = "#4d004b",
                        na.value = "grey",
                        breaks = c(0,2,4,6,8,10,12,14),
                        labels = c(0,2,4,6,8,10,12,14))+
    ggplot2::theme_void()+
    ggplot2::theme(panel.grid = ggplot2::element_blank(),
                    axis.line.x = ggplot2::element_blank(),
                    axis.line.y = ggplot2::element_blank())+
    ggplot2::labs(fill = "Litres",
                  title = "Global alcohol consumption")

  plotly::ggplotly(p1,tooltip = "text")

}
