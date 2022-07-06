
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R-CMD-check](https://github.com/hrbrmstr/weatherkit/workflows/R-CMD-check/badge.svg)](https://github.com/hrbrmstr/weatherkit/actions?query=workflow%3AR-CMD-check)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/weatherkit.svg?branch=master)](https://travis-ci.org/hrbrmstr/weatherkit)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/weatherkit/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/weatherkit)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-4.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# weatherkit

Obtain Historical, Current, and Predictive Weather Data

## Description

Apple’s WeatherKit REST API
(<https://developer.apple.com/documentation/weatherkit>) provides timely
weather information including current conditions, minute precipitation,
along with hourly, and daily forecasts. It also provides severe weather
alerts. Tools are provided to obtain historical, current, and predictive
weather data. Also includes a set of weather icons by Erik Flowers.

## What’s Inside The Tin

The following functions are implemented:

-   `anydate`: Parse POSIXct or Date objects from input data
-   `anytime`: Parse POSIXct or Date objects from input data
-   `apple_weather_trademark`: The Apple Weather Required Trademark
-   `celsius_to_fahrenheit`: Convert from Celsius to Fahrenheit
-   `condition_codes`: Condition Codes
-   `convert_wind_speed`: Convert between wind speed metrics
-   `current_conditions`: Function to display current conditions for a
    given weather data retrieval
-   `dewpoint_to_humidity`: Calculate relative humidity
-   `fahrenheit_to_celsius`: Convert from Fahrenheit to Celsius
-   `humidity_to_dewpoint`: Calculate dew point temperature
-   `inches_to_metric`: Convert from inches to standard metric units of
    measure for precipitation
-   `iso8601`: Format a Datetime object: ISO 8601
-   `meters_to_miles`: Convert meters to miles
-   `metric_to_inches`: Convert between standard metric units of measure
    for precipitation to inches
-   `readable_conditions`: Turns Apple’s smushed together condition code
    strings into proper words/phrases
-   `seq_rng`: Create a sequence from a value range
-   `uv_label`: UV index to label
-   `wind_direction_label`: Converts wind direction angle to the
    corresponding value of the 16-wind compass rose composed of the
    cardinal directions—north, east, south, and west—and its
    intercardinal directions
-   `wx_icons_path`: Returns the full path to the installed SVG weather
    icons
-   `wx_icons_preview`: Preview the included SVG weather icons
-   `wx_tidy`: Tidy values in weather data
-   `wxkit_alert`: Receive an active weather alert.
-   `wxkit_auth`: Authentication components necessary for creation of
    JSON Web Tokens
-   `wxkit_availability`: Determine the data sets available for the
    specified location.
-   `wxkit_weather`: Obtain weather data for the specified location.

## Installation

``` r
remotes::install_github("hrbrmstr/weatherkit")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## NOTE

Please reference the local [Authorization](authorization.md)
documentation or use `vignette("authorization", package="weatherkit")`
at an R console for information on how to obtain the necessary
authentication and signing components required to use the WeatherKit
REST API from this package.

If your apps, web apps, or websites display any Apple weather data
(other than weather alerts or value-added services or products, as
described below), you must clearly display the Apple Weather trademark
( Weather), as well as the [legal link to other data
sources](https://weatherkit.apple.com/legal-attribution.html).

## Usage

``` r
library(weatherkit)
library(ragg)

# current version
packageVersion("weatherkit")
## [1] '0.1.0'
```

``` r
wxkit_availability(43.2683199, -70.8635506, "US")
## [1] "currentWeather"   "forecastDaily"    "forecastHourly"   "forecastNextHour" "weatherAlerts"
```

``` r
wx <- wxkit_weather(43.2683199, -70.8635506)
wx <- wx_tidy(wx)
str(wx)
## List of 4
##  $ currentWeather  :List of 18
##   ..$ name                  : chr "CurrentWeather"
##   ..$ metadata              :List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-06 12:42:25"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-06 12:37:25"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-06 10:25:37"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ asOf                  : POSIXct[1:1], format: "2022-07-06 12:37:25"
##   ..$ cloudCover            : num 0.37
##   ..$ conditionCode         : chr "MostlyClear"
##   ..$ daylight              : logi TRUE
##   ..$ humidity              : num 0.59
##   ..$ precipitationIntensity: num 0
##   ..$ pressure              : num 1008
##   ..$ pressureTrend         : chr "rising"
##   ..$ temperature           : num 25.5
##   ..$ temperatureApparent   : num 26.3
##   ..$ temperatureDewPoint   : num 17
##   ..$ uvIndex               : int 7
##   ..$ visibility            : num 31023
##   ..$ windDirection         : int 324
##   ..$ windGust              : num 35.9
##   ..$ windSpeed             : num 17.8
##  $ forecastDaily   :List of 3
##   ..$ name    : chr "DailyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-06 13:37:25"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-06 12:37:25"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-06 10:25:37"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ days    :'data.frame': 10 obs. of  26 variables:
##   .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-06" "2022-07-07" "2022-07-08" "2022-07-09" ...
##   .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-07" "2022-07-08" "2022-07-09" "2022-07-10" ...
##   .. ..$ conditionCode      : chr [1:10] "Rain" "PartlyCloudy" "PartlyCloudy" "MostlyClear" ...
##   .. ..$ maxUvIndex         : int [1:10] 7 6 6 7 7 7 7 6 8 6
##   .. ..$ moonPhase          : chr [1:10] "firstQuarter" "firstQuarter" "firstQuarter" "waxingGibbous" ...
##   .. ..$ moonrise           : POSIXct[1:10], format: "2022-07-06 12:29:11" "2022-07-07 13:38:12" "2022-07-08 14:50:47" "2022-07-09 16:07:35" ...
##   .. ..$ moonset            : POSIXct[1:10], format: "2022-07-06 00:12:14" "2022-07-07 00:32:48" "2022-07-08 00:54:51" "2022-07-09 01:20:27" ...
##   .. ..$ precipitationAmount: num [1:10] 8.26 0.14 0.81 0 0 0 0.58 0.58 1.8 4.51
##   .. ..$ precipitationChance: num [1:10] 0.76 0.06 0.28 0.06 0.02 0.11 0.32 0.37 0.37 0.35
##   .. ..$ precipitationType  : chr [1:10] "rain" "rain" "rain" "clear" ...
##   .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. ..$ solarMidnight      : POSIXct[1:10], format: "2022-07-06 00:48:19" "2022-07-07 00:48:29" "2022-07-08 00:48:39" "2022-07-09 00:48:49" ...
##   .. ..$ solarNoon          : POSIXct[1:10], format: "2022-07-06 12:48:17" "2022-07-07 12:48:26" "2022-07-08 12:48:35" "2022-07-09 12:48:44" ...
##   .. ..$ sunrise            : POSIXct[1:10], format: "2022-07-06 05:10:19" "2022-07-07 05:10:59" "2022-07-08 05:11:42" "2022-07-09 05:12:26" ...
##   .. ..$ sunriseCivil       : POSIXct[1:10], format: "2022-07-06 04:35:21" "2022-07-07 04:36:06" "2022-07-08 04:36:53" "2022-07-09 04:37:41" ...
##   .. ..$ sunriseNautical    : POSIXct[1:10], format: "2022-07-06 03:49:52" "2022-07-07 03:50:45" "2022-07-08 03:51:39" "2022-07-09 03:52:36" ...
##   .. ..$ sunriseAstronomical: POSIXct[1:10], format: "2022-07-06 02:54:06" "2022-07-07 02:55:17" "2022-07-08 02:56:30" "2022-07-09 02:57:46" ...
##   .. ..$ sunset             : POSIXct[1:10], format: "2022-07-06 20:26:13" "2022-07-07 20:25:50" "2022-07-08 20:25:26" "2022-07-09 20:24:59" ...
##   .. ..$ sunsetCivil        : POSIXct[1:10], format: "2022-07-06 21:01:06" "2022-07-07 21:00:39" "2022-07-08 21:00:10" "2022-07-09 20:59:38" ...
##   .. ..$ sunsetNautical     : POSIXct[1:10], format: "2022-07-06 21:46:36" "2022-07-07 21:46:01" "2022-07-08 21:45:23" "2022-07-09 21:44:42" ...
##   .. ..$ sunsetAstronomical : POSIXct[1:10], format: "2022-07-06 22:42:09" "2022-07-07 22:41:14" "2022-07-08 22:40:16" "2022-07-09 22:39:14" ...
##   .. ..$ temperatureMax     : num [1:10] 26.4 24.6 28.1 25 25 ...
##   .. ..$ temperatureMin     : num [1:10] 16.9 13.3 15.4 14.8 11.6 ...
##   .. ..$ daytimeForecast    :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-06 07:00:00" "2022-07-07 07:00:00" "2022-07-08 07:00:00" "2022-07-09 07:00:00" ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-06 19:00:00" "2022-07-07 19:00:00" "2022-07-08 19:00:00" "2022-07-09 19:00:00" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.37 0.47 0.57 0.21 0.1 0.44 0.56 0.59 0.3 0.65
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" "PartlyCloudy" "PartlyCloudy" "MostlyClear" ...
##   .. .. ..$ humidity           : num [1:10] 0.65 0.61 0.64 0.52 0.47 0.51 0.59 0.66 0.6 0.63
##   .. .. ..$ precipitationAmount: num [1:10] 0.07 0.08 0.73 0 0 0 0.06 0.19 0.78 4.21
##   .. .. ..$ precipitationChance: num [1:10] 0.25 0.04 0.22 0.03 0 0.05 0.18 0.27 0.26 0.24
##   .. .. ..$ precipitationType  : chr [1:10] "rain" "rain" "rain" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 327 163 225 55 284 218 200 219 243 24
##   .. .. ..$ windSpeed          : num [1:10] 12.92 9.46 9.29 6.62 7.74 ...
##   .. ..$ overnightForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-06 19:00:00" "2022-07-07 19:00:00" "2022-07-08 19:00:00" "2022-07-09 19:00:00" ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-07 07:00:00" "2022-07-08 07:00:00" "2022-07-09 07:00:00" "2022-07-10 07:00:00" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.31 0.55 0.35 0.08 0.2 0.54 0.74 0.58 0.61 0.36
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" "PartlyCloudy" "MostlyClear" "Clear" ...
##   .. .. ..$ humidity           : num [1:10] 0.79 0.78 0.79 0.66 0.71 0.68 0.81 0.75 0.74 0.73
##   .. .. ..$ precipitationAmount: num [1:10] 0 0.06 0.09 0 0 0 0.92 0.18 0.84 0.31
##   .. .. ..$ precipitationChance: num [1:10] 0.01 0.09 0.14 0 0.04 0.09 0.29 0.18 0.28 0.22
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 343 186 344 334 226 207 200 244 312 300
##   .. .. ..$ windSpeed          : num [1:10] 5.61 9.26 7.4 7 6.53 ...
##   .. ..$ restOfDayForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-06 12:37:25" NA NA NA ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-07" NA NA NA ...
##   .. .. ..$ cloudCover         : num [1:10] 0.3 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" NA NA NA ...
##   .. .. ..$ humidity           : num [1:10] 0.6 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationAmount: num [1:10] 0.04 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationChance: num [1:10] 0.03 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationType  : chr [1:10] "rain" NA NA NA ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windDirection      : int [1:10] 338 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windSpeed          : num [1:10] 11.7 NA NA NA NA ...
##  $ forecastHourly  :List of 3
##   ..$ name    : chr "HourlyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-06 13:37:25"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-06 12:37:25"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-06 10:25:37"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ hours   :'data.frame': 243 obs. of  20 variables:
##   .. ..$ forecastStart         : POSIXct[1:243], format: "2022-07-05 22:00:00" "2022-07-05 23:00:00" "2022-07-06 00:00:00" "2022-07-06 01:00:00" ...
##   .. ..$ cloudCover            : num [1:243] 0.98 0.97 1 1 1 0.99 0.96 0.98 0.75 0.81 ...
##   .. ..$ conditionCode         : chr [1:243] "Rain" "Rain" "Rain" "Rain" ...
##   .. ..$ daylight              : logi [1:243] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..$ humidity              : num [1:243] 0.95 0.95 0.96 0.95 0.96 0.97 0.98 0.97 0.98 0.96 ...
##   .. ..$ precipitationAmount   : num [1:243] 1.43 1.85 4.17 3.2 0.26 0.13 0.03 0.01 0.4 0.02 ...
##   .. ..$ precipitationIntensity: num [1:243] 1.43 1.85 4.17 3.2 0.26 0.13 0.03 0.01 0.4 0.02 ...
##   .. ..$ precipitationChance   : num [1:243] 0.43 0.46 0.47 0.44 0.4 0.33 0.23 0.2 0.21 0.17 ...
##   .. ..$ precipitationType     : chr [1:243] "rain" "rain" "rain" "rain" ...
##   .. ..$ pressure              : num [1:243] 1011 1010 1008 1007 1006 ...
##   .. ..$ pressureTrend         : chr [1:243] "falling" "falling" "falling" "falling" ...
##   .. ..$ snowfallIntensity     : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ temperature           : num [1:243] 18.4 18.4 17.7 17 17.3 ...
##   .. ..$ temperatureApparent   : num [1:243] 19.1 19.2 18.3 17.4 17.8 ...
##   .. ..$ temperatureDewPoint   : num [1:243] 17.6 17.7 17 16.3 16.7 ...
##   .. ..$ uvIndex               : int [1:243] 0 0 0 0 0 0 0 0 0 1 ...
##   .. ..$ visibility            : num [1:243] 10311 11353 6435 9067 11465 ...
##   .. ..$ windDirection         : int [1:243] 140 179 158 154 171 175 197 224 229 232 ...
##   .. ..$ windGust              : num [1:243] 2.76 7.56 10.09 4.94 7.29 ...
##   .. ..$ windSpeed             : num [1:243] 2.56 2.89 3.42 4.41 3.18 2.13 0.85 0.23 0.52 2 ...
##  $ forecastNextHour:List of 6
##   ..$ name         : chr "NextHourForecast"
##   ..$ metadata     :List of 9
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-06 13:37:25"
##   .. ..$ language      : chr "en-US"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ providerName  : chr "US National Weather Service"
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-06 12:37:24"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ summary      :'data.frame':    1 obs. of  4 variables:
##   .. ..$ startTime             : POSIXct[1:1], format: "2022-07-06 12:38:00"
##   .. ..$ condition             : chr "clear"
##   .. ..$ precipitationChance   : num 0
##   .. ..$ precipitationIntensity: num 0
##   ..$ forecastStart: POSIXct[1:1], format: "2022-07-06 12:38:00"
##   ..$ forecastEnd  : POSIXct[1:1], format: "2022-07-06 13:55:00"
##   ..$ minutes      :'data.frame':    77 obs. of  3 variables:
##   .. ..$ startTime             : POSIXct[1:77], format: "2022-07-06 12:38:00" "2022-07-06 12:39:00" "2022-07-06 12:40:00" "2022-07-06 12:41:00" ...
##   .. ..$ precipitationChance   : num [1:77] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:77] 0 0 0 0 0 0 0 0 0 0 ...
```

``` r
current_conditions(wx)
##  Weather for (43.268, -70.864) as of 2022-07-06 12:37:25
## 
##  Conditions: Mostly Clear
## Temperature: 77.95°F
##  Feels like: 79.34°F
##   Dew Point: 62.62°F
##        Wind: 11 mph (NW)
##    Pressure: 1007.81 mb (rising)
##  Visibility: 19 miles
##    UV Index: 🟧 7 (High)
## 
## https://weather-data.apple.com/legal-attribution.html
```

``` r
library(ggtext)
library(ggforce)
library(hrbragg) # remotes::install_github("hrbrmstr/hrbragg")
library(ggplot2)
library(weatherkit)

data.frame(
  x = celsius_to_fahrenheit(wx$forecastDaily$days$temperatureMin),
  xend = celsius_to_fahrenheit(wx$forecastDaily$days$temperatureMax),
  y = as.integer(as.Date(wx$forecastDaily$days$forecastStart))
) -> xdf

xdf |>
  ggplot() +
  geom_link(
    aes(
      x, y, xend=xend, yend=y,
      colour = stat(index)
    ),
    linewidth = 4, # remotes::install_github("tidyverse/ggplot2")
    lineend = "round",
    show.legend = FALSE
  ) +
  scale_x_continuous(
    name = NULL,
    label = \(x) sprintf("%s°F", x),
    sec.axis = dup_axis()
  ) +
  scale_y_reverse(
    name = NULL,
    breaks = seq_rng(xdf$y),
    labels = \(x) {
      x <- as.Date(x, origin="1970-01-01")
      ifelse(x == Sys.Date(), "Today", strftime(x, "%a"))
    },
    sec.axis = dup_axis()
  ) +
  scale_colour_viridis_c(
    option = "cividis"
  ) +
  labs(
    title = "Weather for Berwick Maine"
  ) +
  theme_gs(grid="XY", axis_text_size = 12) +
  theme(
    axis.title.x.top = element_blank(),
    axis.text.y.left = element_markdown(family = "Inter"),
    axis.text.y.right = element_markdown(family = "Inter"),
    panel.grid.major.x = element_line(linetype = "dotted", size = 0.5),
    panel.grid.major.y = element_line(linetype = "dotted", size = 0.5)
  )
```

<img src="man/figures/README-temps-1.png" width="800" />

## weatherkit Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |       17 | 0.39 | 361 | 0.23 |         139 | 0.31 |      348 | 0.41 |
| HTML |        1 | 0.02 | 306 | 0.20 |          35 | 0.08 |        2 | 0.00 |
| Rmd  |        2 | 0.05 |  67 | 0.04 |          43 | 0.09 |       77 | 0.09 |
| YAML |        2 | 0.05 |  35 | 0.02 |          10 | 0.02 |        2 | 0.00 |
| SUM  |       22 | 0.50 | 769 | 0.50 |         227 | 0.50 |      429 | 0.50 |

clock Package Metrics for weatherkit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
