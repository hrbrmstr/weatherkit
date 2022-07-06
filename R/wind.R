#' Converts wind direction angle to the corresponding value of the 16-wind compass rose composed of the cardinal directions—north, east, south, and west—and its intercardinal directions
#'
#' @param wind_direction wind direction angle
#' @export
#' @return length 1 character vector
#' @examples
#' wx <- wxkit_weather(43.2683199, -70.8635506)
#' wind_direction_label(wx$currentWeather$windDirection)
wind_direction_label <- function(wind_direction) {

  c(
    "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE",
    "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"
  ) -> wind_labels

  wind_labels[as.integer(((as.double(wind_direction[1]) + 11.25) %% 360.0) / 22.5) + 1]

}

