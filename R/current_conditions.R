#' Function to display current conditions for a given weather data retrieval
#'
#' By default this uses an API call and is the weather for the package author's
#' location. You likely want to specify `wx`.
#'
#' @param wx an object retrieved by [wxkit_weather()] and pre-tidied with [wx_tidy()]
#' @return nothing (side effect is printing to stdout)
#' @export
current_conditions <- function(wx = wx_tidy(wxkit_weather(43.2683199, -70.8635506))) {

  cat(
    paste0(apple_weather_trademark, " for ", "(", wx$currentWeather$metadata$latitude, ", ",  wx$currentWeather$metadata$longitude, ")", " as of ", wx$currentWeather$asOf), "",
    paste0(" Conditions: ", readable_conditions(wx$currentWeather$conditionCode)),
    paste0("Temperature: ", C2F(wx$currentWeather$temperature), "°F"),
    paste0(" Feels like: ", C2F(wx$currentWeather$temperatureApparent), "°F"),
    paste0("  Dew Point: ", C2F(wx$currentWeather$temperatureDewPoint), "°F"),
    paste0("       Wind: ", convert_wind_speed(wx$currentWeather$windSpeed, "kmph", "mph"), " mph (", wind_direction_label(wx$currentWeather$windDirection), ")"),
    paste0("   Pressure: ", wx$currentWeather$pressure, " mb (", wx$currentWeather$pressureTrend, ")"),
    paste0(" Visibility: ", meters_to_miles(wx$currentWeather$visibility), " miles"),
    paste0("   UV Index: ", uv_label(wx$currentWeather$uvIndex, swatch = TRUE), " ", wx$currentWeather$uvIndex, " (", uv_label(wx$currentWeather$uvIndex), ")"), "",
    paste0(wx$currentWeather$metadata$attributionURL),
    sep = "\n"
  )

}
