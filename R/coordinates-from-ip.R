#' Get latitude and longitude coordinates from your/an IP address
#'
#' Uses [ipapi](https://ipapi.co/api/) (1,000/day; 30K/month free, no API key required)
#' to obtain the lat/lng of the caller's IP address or a specified one
#'
#' @param ip if `NULL` (the default) the caller's IP address will be used.
#' @return named numeric vector
#' @export
coordinates_from_ip <- function(ip = NULL) {

  if (is.null(ip)) {
    res <- jsonlite::fromJSON("https://ipapi.co/json/")[c("latitude", "longitude")]
  } else {
    res <- jsonlite::fromJSON(sprintf("https://ipapi.co/%s/json/", ip))[c("latitude", "longitude")]
  }

  unlist(res)

}