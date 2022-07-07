#' Obtain Historical, Current, and Predictive Weather Data
#'
#' Apple's WeatherKit REST API (<https://developer.apple.com/documentation/weatherkit>)
#' provides timely weather information including current conditions, minute precipitation, along
#' with hourly, and daily forecasts. It also provides severe weather alerts. Tools are provided to
#' obtain historical, current, and predictive weather data. Also includes a set of weather icons by
#' Erik Flowers.
#'
#' - Temperatures are in Celsius
#' - Precipitation intensity is in millimeters per hour.
#' - Sea level air pressure in millibars.
#'
#' @md
#' @note If your apps, web apps, or websites display any Apple weather data (other than weather
#'       alerts or value-added services or products, as described below), you must clearly display
#'       the Apple Weather trademark ( Weather), as well as the
#'       [legal link to other data sources](://weatherkit.apple.com/legal-attribution.html).
#' @name weatherkit
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr openssl jose lutz
#' @importFrom stringi stri_pad_left stri_pad_right
#' @importFrom jsonlite fromJSON unbox
#' @importFrom htmltools html_print HTML
#' @importFrom scales comma percent
#' @importFrom cli col_br_black col_yellow
"_PACKAGE"
