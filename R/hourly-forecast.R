#' Function to display hourly forecast for a given weather data retrieval
#'
#' By default this uses an API call and is the weather for the package author's
#' location. You likely want to specify `wx`.
#'
#' @param wx an object retrieved by [wxkit_weather()] and pre-tidied with [wx_tidy()]
#' @param n_hours how many hours to forecast ahead? Default is `12` hours
#' @param tzone if not specified, this function will use [lutz::tz_lookup_coords()]
#'       "fast" method on the `forecastHourly$metadata` `latitude` and `longitude` values
#'       to guess the timezone.
#' @param metric if `TRUE` (default is `FALSE`) data is in metric.
#' @return nothing (side effect is printing to stdout)
#' @export
hourly_forecast <- function(wx = wx_tidy(wxkit_weather(43.2683199, -70.8635506)), n_hours = 12, tzone, metric = FALSE) {

  if (missing(tzone)) {

    lutz::tz_lookup_coords(
      lat = wx$forecastHourly$metadata$latitude,
      lon = wx$forecastHourly$metadata$longitude,
      method = "fast",
      warn = FALSE
    ) -> tzone

  }

  with_tz(
    time = wx$currentWeather$asOf,
    tzone = tzone
  ) -> wx$currentWeather$asOf

  hrs <- wx$forecastHourly$hours

  with_tz(
    time = hrs$forecastStart,
    tzone = tzone
  ) -> hrs$forecastStart

  head(
    x = hrs[
      hrs$forecastStart >= Sys.time(),
      c(
        "forecastStart", "conditionCode", "daylight",
        "humidity", "precipitationType",
        "pressure", "pressureTrend", "temperature", "uvIndex"
      )
    ],
    n = 20
  ) -> display_hrs

  metric <- FALSE

  if (metric) {
    display_hrs$temperature <- paste0(round(display_hrs$temperature), "°C")
  } else {
    display_hrs$temperature <- paste0(round(C2F(display_hrs$temperature)), "°F")
  }

  paste0(
    stri_pad_left(round(display_hrs$pressure), width = 4),
    " mb ", pressure_trend(display_hrs$pressureTrend)
  ) -> display_hrs$pressure

  precip_type(
    precip = display_hrs$precipitationType,
    daylight = display_hrs$daylight
  ) -> display_hrs$precipitationType

  stri_pad_right(
    str = unname(readable_conditions(display_hrs$conditionCode)),
    width = max(nchar(unname(readable_conditions(display_hrs$conditionCode))))
  ) -> display_hrs$conditionCode

  stri_pad_left(
    str = scales::percent(display_hrs$humidity, 1),
    width = max(nchar(scales::percent(display_hrs$humidity, 1)))
  ) -> display_hrs$humidity

  display_hrs$uvIndex <- uv_label(display_hrs$uvIndex, swatch = TRUE)

  day_pad <- stri_pad_left(ifelse(as.Date(display_hrs$forecastStart, tz = tzone) == Sys.Date(), "Today", strftime(display_hrs$forecastStart, "%a", tz = tzone)), width = 5)
  day_pad[duplicated(day_pad)] <- gsub(".", " ", day_pad[duplicated(day_pad)])
  cat(
    paste0(apple_weather_trademark, " forecast for ", "(", wx$currentWeather$metadata$latitude, ", ",  wx$currentWeather$metadata$longitude, ")", " as of ", wx$currentWeather$asOf), "",
    sprintf(
      "%s @ %s │ 🌡 %s │ 💦 %s │ %s │ %s │ %s │ %s",
      day_pad,
      strftime(display_hrs$forecastStart, "%H:%M"),
      display_hrs$temperature,
      display_hrs$humidity,
      display_hrs$pressure,
      display_hrs$precipitationType,
      display_hrs$conditionCode,
      display_hrs$uvIndex
    ), "",
    paste0(wx$currentWeather$metadata$attributionURL),
    sep = "\n"
  )

}



