#' Receive an active weather alert.
#'
#' @param id The unique identifier for the weather alert.
#' @param language The language tag to use for localizing responses. Defaults to `Sys.getenv("LANG")`.
#' @param ... passed to calls to `{httr}` functions.
#' @param auth See [wxkit_auth()]
#' @param references <https://developer.apple.com/documentation/weatherkitrestapi/get_api_v1_weatheralert_language_id>
#' @return See: <https://developer.apple.com/documentation/weatherkitrestapi/weatheralert>
#' @export
wxkit_alert <- function(id, language = Sys.getenv("LANG"), ..., auth = wxkit_auth()) {

  id <- id[1]
  language <- language[1]

  httr::GET(

    url = sprintf(
      fmt = "https://weatherkit.apple.com/api/v1/weatherAlert/%s/%s",
      language, id
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

