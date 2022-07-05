#' Obtain Historical, Current, and Predictive Weather Data
#'
#' Apple's WeatherKit REST API (<https://developer.apple.com/documentation/weatherkit>)
#' provides timely weather information including current conditions, minute precipitation, along
#' with hourly, and daily forecasts. It also provides severe weather alerts. Tools are provided to
#' obtain historical, current, and predictive weather data.
#' Also includes a set of weather icons by Erik Flowers.
#'
#' @md
#' @name weatherkit
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr openssl jose
#' @importFrom jsonlite fromJSON unbox
#' @importFrom htmltools html_print HTML
"_PACKAGE"
