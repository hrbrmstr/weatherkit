#' Determine the data sets available for the specified location.
#'
#' @param latitude The latitude of the desired location. Minimum Value: -90. Maximum Value: 90.
#' @param longitude The longitude of the desired location. Minimum Value: -180. Maximum Value: 180.
#' @param country The [ISO Alpha-2 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) for the requested location. This parameter is necessary for air quality and weather alerts.
#' @param ... passed to calls to `{httr}` functions.
#' @param auth See [wxkit_auth()]
#' @param references <https://developer.apple.com/documentation/weatherkitrestapi/get_api_v1_availability_latitude_longitude>
#' @return list of [values](https://developer.apple.com/documentation/weatherkitrestapi/dataset).
#' @export
#' @return See: <https://developer.apple.com/documentation/weatherkitrestapi/weather>
#' @examples
#' wxkit_availability(43.2683199, -70.8635506, "US")
wxkit_availability <- function(latitude, longitude, country, ..., auth = wxkit_auth()) {

  latitude <- latitude[1]
  longitude <- longitude[1]
  country <- country[1]

  httr::GET(

    url = sprintf(
      fmt = "https://weatherkit.apple.com/api/v1/availability/%s/%s",
      latitude, longitude
    ),

    query = list(
      country = country
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

  jsonlite::fromJSON(out)

}

