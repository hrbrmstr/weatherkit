#' Obtain weather data for the specified location.
#'
#' @param latitude The latitude of the desired location. Minimum Value: -90. Maximum Value: 90.
#' @param longitude The longitude of the desired location. Minimum Value: -180. Maximum Value: 180.
#' @param language The language tag to use for localizing responses. Defaults to `Sys.getenv("LANG")`
#' @param timezone The name of the timezone to use for rolling up weather forecasts into daily forecasts.
#'     Defaults to `Sys.getenv("TZ")`.
#' @param dataSets A character vector of data sets to include in the response. Call and cache the response to
#'     [wxkit_availability()] for a list of [possible values](https://developer.apple.com/documentation/weatherkitrestapi/dataset)
#'     for the location you are querying data for. Defaults to all possible values.
#' @param countryCode OPTIONAL. The [ISO Alpha-2 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) for the requested location. This parameter is necessary for air quality and weather alerts.
#' @param currentAsOf OPTIONAL. The time to obtain current conditions. Defaults to now.
#' @param dailyEnd OPTIONAL. The time to end the daily forecast. If this parameter is absent, daily forecasts run for 10 days.
#' @param dailyStart OPTIONAL. The time to start the daily forecast. If this parameter is absent, daily forecasts start on the current day.
#' @param hourlyEnd OPTIONAL. The time to end the hourly forecast. If this parameter is absent, hourly forecasts run 24 hours or the length of the daily forecast, whichever is longer.
#' @param hourlyStart OPTIONAL. The time to start the hourly forecast. If this parameter is absent, hourly forecasts start on the current hour.
#' @param ... passed to calls to `{httr}` functions.
#' @param json if `TRUE` (default: `FALSE`), just return the JSON string
#' @param auth See [wxkit_auth()]
#' @param references <https://developer.apple.com/documentation/weatherkitrestapi/get_api_v1_weather_language_latitude_longitude>
#' @export
#' @note If you want weather alerts, you MUST populate the `countryCode` parameter as well as ensure `weatherAlerts` is in `dataSets`
#' @examples
#' wxkit_weather(43.2683199, -70.8635506, countryCode = "US")
wxkit_weather <- function(latitude, longitude,
                          language = Sys.getenv("LANG"),
                          timezone = Sys.getenv("TZ"),
                          dataSets = c("currentWeather", "forecastDaily", "forecastHourly", "forecastNextHour", "weatherAlerts"),
                          countryCode = NULL,
                          currentAsOf = NULL,
                          dailyEnd = NULL,
                          dailyStart = NULL,
                          hourlyEnd = NULL,
                          hourlyStart = NULL,
                          ...,
                          json = FALSE,
                          auth = wxkit_auth()) {

  latitude <- latitude[1]
  longitude <- longitude[1]

  httr::GET(

    url = sprintf(
      fmt = "https://weatherkit.apple.com/api/v1/weather/%s/%s/%s",
      language, latitude, longitude
    ),

    query = list(
      timezone = timezone[1],
      dataSets = paste0(dataSets, collapse=","),
      countryCode = countryCode[1],
      country= countryCode[1],
      currentAsOf = currentAsOf[1],
      dailyEnd = dailyEnd[1],
      dailyStart = dailyStart[1],
      hourlyEnd = hourlyEnd[1],
      hourlyStart = hourlyStart[1]
    ),

    httr::accept_json(),

    weatherkit:::.WEATHERKIT_UA,

    httr::add_headers(
      `Authorization` = sprintf("Bearer %s", weatherkit:::make_jwt())
    ),

    ...

  ) -> res

  httr::stop_for_status(res)

  out <- suppressMessages(httr::content(res, as = "text"))

  if (json) out else jsonlite::fromJSON(out)

}

