#' Authentication components necessary for creation of JSON Web Tokens
#'
#' Helper function that retrieves necessary parameters from the environment
#' or supplied by direct parameters
#'
#' @param key_id 10-character key identifier
#' @param service_id service identifier
#' @param team_id Apple Developer account team idenfitier
#' @param private_key_path path to private signing key (will be [path.expand()]ed )
#' @references [Request authentication for WeatherKit REST API](https://developer.apple.com/documentation/weatherkitrestapi/request_authentication_for_weatherkit_rest_api)
#' @export
wxkit_auth <- function(key_id = Sys.getenv("WEATHERKIT_KEY_ID"),
                       service_id = Sys.getenv("WEATHERKIT_SERVICE_ID"),
                       team_id = Sys.getenv("WEATHERKIT_TEAM_ID"),
                       private_key_path = Sys.getenv("WEATHERKIT_KEY_PATH")) {

  invisible(list(
    key_id = key_id,
    service_id = service_id,
    team_id = team_id,
    private_key_path = path.expand(private_key_path)
  ))

}
