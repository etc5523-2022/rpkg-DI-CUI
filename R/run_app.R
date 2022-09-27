#' Run shiny app
#'
#' Run shiny app: Global Alcohol Comsumption, which shows global beer, spirit and wine servings and total litres of pure alcohol.
#'
#' @return A shiny app.
#'
#' @examples run_app
#'
#' @export
run_app <- function() {
  app_dir <- system.file("myapp/app.R", package = "asdata")
  shiny::runApp(app_dir, display.mode = "normal")
}
