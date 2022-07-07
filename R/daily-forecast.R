#' Function to display daily forecast for a given weather data retrieval
#'
#' By default this uses an API call and is the weather for the package author's
#' location. You likely want to specify `wx`.
#'
#' @param wx an object retrieved by [wxkit_weather()] and pre-tidied with [wx_tidy()]
#' @param tzone if not specified, this function will use [lutz::tz_lookup_coords()]
#'       "fast" method on the `forecastHourly$metadata` `latitude` and `longitude` values
#'       to guess the timezone.
#' @param metric if `TRUE` (default is `FALSE`) data is in metric.
#' @param incl_legal if `FALSE` (default is `TRUE`) do not include Apple's required legal bits
#' @return nothing (side effect is printing to stdout)
#' @export
daily_forecast <- function(wx = wx_tidy(wxkit_weather(43.2683199, -70.8635506)), tzone, metric = FALSE, incl_legal = TRUE) {

  if (missing(tzone)) {

    lutz::tz_lookup_coords(
      lat = wx$forecastDaily$metadata$latitude,
      lon = wx$forecastDaily$metadata$longitude,
      method = "fast",
      warn = FALSE
    ) -> tzone

  }

  with_tz(
    time = wx$currentWeather$asOf,
    tzone = tzone
  ) -> wx$currentWeather$asOf

  daily_days <- wx$forecastDaily$days

  if (!metric) {
    daily_days$temperatureMin <- C2F(daily_days$temperatureMin)
    daily_days$temperatureMax <- C2F(daily_days$temperatureMax)
  }

  mins <- round(daily_days$temperatureMin)
  maxs <- round(daily_days$temperatureMax)

  temps_rng <- range(sort(unique(c(mins, maxs))))

  starts <- round(scales::rescale(mins, to = c(1, 30), from = temps_rng))
  ends <- round(scales::rescale(maxs, to = c(1, 30), from = temps_rng))

  rep(
    list(rep(cli::col_br_black("▆"), 30)),
    length(daily_days$temperatureMin)
  ) -> chart

  for (i in 1:length(daily_days$temperatureMin)) {
    chart[[i]][starts[i]:ends[i]] <- cli::col_yellow("▆")
  }

  day_pad <- stri_pad_left(ifelse(as.Date(daily_days$forecastStart, tz = tzone) == Sys.Date(), "Today", strftime(daily_days$forecastStart, "%a", tz = tzone)), width = 5)

  stri_pad_right(
    readable_conditions(daily_days$conditionCode),
    max(nchar(readable_conditions(daily_days$conditionCode)))
  ) -> daily_days$conditionCode

  if (incl_legal) {
    cat(
      paste0(apple_weather_trademark, " daily forecast for ", "(", wx$currentWeather$metadata$latitude, ", ",  wx$currentWeather$metadata$longitude, ")", " as of ", wx$currentWeather$asOf), "\n\n",
      sep = ""
    )
  }

  cat(
    paste0(
      day_pad, " ",
      stri_pad_left(mins, max(nchar(mins))), "°", " ",
      sapply(chart, paste0, collapse = ""), " ",
      stri_pad_right(maxs, max(nchar(maxs))), "°", " ",
      uv_label(daily_days$maxUvIndex, swatch = TRUE), " ",
      daily_days$conditionCode
    ),
    sep = "\n"
  )

  if (incl_legal) {
    cat(
      "\n", paste0(wx$currentWeather$metadata$attributionURL), "\n",
      sep = ""
    )
  }

}
