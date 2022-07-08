#!/usr/local/bin/Rscript
#
# This is a sample cmdline weather reporter based on Apple's WeatherKit -----------------------
#
# Suggested way to run this is to alias the following:
#
# Rscript $(Rscript -e "cat(system.file('scripts', 'wx.R', package='weatherkit'))") --lat 43.2 --lon -70.8 --lang en --iso2c US
#
# at a command-line.

suppressPackageStartupMessages({
  library(weatherkit, quietly = TRUE)
  library(argparser, quietly = TRUE)
})

# I run with these set to TRUE, but that's noisy
options(
  warnPartialMatchArgs = FALSE,
  warnPartialMatchAttr = FALSE,
  warnPartialMatchDollar = FALSE
)

p <- arg_parser("Display a colorful weather forecast on the cmdline")
p <- add_argument(p, "--lat", help = "decimal latitude (e.g. 43.2683199, the default)", type = "numeric", default = 43.2683199)
p <- add_argument(p, "--lon", help = "decimal longitude (e.g. -70.8635506, the default)", type = "numeric", default = -70.8635506)
p <- add_argument(p, "--lang", help = "language (e.g. 'en', the default)", type = "character", default = "en")
p <- add_argument(p, "--iso2c", help = "ISO 2-char country code (e.g. 'US', the default)", type = "character", default = "US")
p <- add_argument(p, "--metric", help = "Enable metric values (not the default)", type = "logical", flag = TRUE)

argv <- parse_args(p)

wx_tidy(
  wxkit_weather(
    latitude = argv$lat,
    longitude = argv$lon,
    language = argv$lang,
    countryCode = argv$iso2c
  )
) -> wx

lutz::tz_lookup_coords(
  lat = wx$forecastDaily$metadata$latitude,
  lon = wx$forecastDaily$metadata$longitude,
  method = "fast",
  warn = FALSE
) -> tzone

with_tz(
  time = wx$currentWeather$asOf,
  tzone = tzone
) -> wx$currentWeather$asOf

cat(
  paste0(
    apple_weather_trademark,
    " forecast & current conditions for ", "(",
    wx$currentWeather$metadata$latitude, ", ",
    wx$currentWeather$metadata$longitude, ")",
    " as of ", wx$currentWeather$asOf
  ), "\n\n",
  sep = ""
)

current_conditions(wx, metric = argv$metric, incl_legal = FALSE)

cat("\n", sep="")

hourly_forecast(wx, metric = argv$metric, incl_legal = FALSE)

cat("\n", sep="")

daily_forecast(wx, metric = argv$metric, incl_legal = FALSE)

cat("\n", sep="")

cat(wx$currentWeather$metadata$attributionURL, "\n", sep="")

