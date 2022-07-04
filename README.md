
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
weather data.

## What’s Inside The Tin

The following functions are implemented:

-   `anydate`: Parse POSIXct or Date objects from input data
-   `anytime`: Parse POSIXct or Date objects from input data
-   `celsius_to_fahrenheit`: Convert from Celsius to Fahrenheit
-   `fahrenheit_to_celsius`: Convert from Fahrenheit to Celsius
-   `iso8601`: Format a Datetime object: ISO 8601
-   `seq_rng`: Create a sequence from a value range
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

str(wx)
## List of 4
##  $ currentWeather  :List of 18
##   ..$ name                  : chr "CurrentWeather"
##   ..$ metadata              :List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T14:51:32Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T14:46:32Z"
##   .. ..$ reportedTime  : chr "2022-07-04T13:02:06Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ asOf                  : chr "2022-07-04T14:46:32Z"
##   ..$ cloudCover            : num 0.15
##   ..$ conditionCode         : chr "MostlyClear"
##   ..$ daylight              : logi TRUE
##   ..$ humidity              : num 0.43
##   ..$ precipitationIntensity: num 0
##   ..$ pressure              : num 1019
##   ..$ pressureTrend         : chr "steady"
##   ..$ temperature           : num 24.2
##   ..$ temperatureApparent   : num 23.7
##   ..$ temperatureDewPoint   : num 10.9
##   ..$ uvIndex               : int 6
##   ..$ visibility            : num 38659
##   ..$ windDirection         : int 308
##   ..$ windGust              : num 27.5
##   ..$ windSpeed             : num 12.2
##  $ forecastDaily   :List of 3
##   ..$ name    : chr "DailyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T15:46:32Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T14:46:32Z"
##   .. ..$ reportedTime  : chr "2022-07-04T13:02:06Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ days    :'data.frame': 10 obs. of  26 variables:
##   .. ..$ forecastStart      : chr [1:10] "2022-07-04T04:00:00Z" "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" "2022-07-07T04:00:00Z" ...
##   .. ..$ forecastEnd        : chr [1:10] "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" "2022-07-07T04:00:00Z" "2022-07-08T04:00:00Z" ...
##   .. ..$ conditionCode      : chr [1:10] "MostlyClear" "Drizzle" "Drizzle" "MostlyClear" ...
##   .. ..$ maxUvIndex         : int [1:10] 7 5 7 7 5 7 6 5 6 7
##   .. ..$ moonPhase          : chr [1:10] "waningCrescent" "waningCrescent" "firstQuarter" "firstQuarter" ...
##   .. ..$ moonrise           : chr [1:10] "2022-07-04T14:17:06Z" "2022-07-05T15:22:33Z" "2022-07-06T16:29:11Z" "2022-07-07T17:38:12Z" ...
##   .. ..$ moonset            : chr [1:10] "2022-07-05T03:51:55Z" NA "2022-07-06T04:12:14Z" "2022-07-07T04:32:48Z" ...
##   .. ..$ precipitationAmount: num [1:10] 0 3.51 2.59 0.12 0.87 ...
##   .. ..$ precipitationChance: num [1:10] 0 0.68 0.67 0.13 0.43 0.19 0.09 0.23 0.45 0.41
##   .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "rain" ...
##   .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. ..$ solarMidnight      : chr [1:10] "2022-07-04T04:47:58Z" "2022-07-05T04:48:08Z" "2022-07-06T04:48:19Z" "2022-07-07T04:48:29Z" ...
##   .. ..$ solarNoon          : chr [1:10] "2022-07-04T16:47:57Z" "2022-07-05T16:48:07Z" "2022-07-06T16:48:17Z" "2022-07-07T16:48:26Z" ...
##   .. ..$ sunrise            : chr [1:10] "2022-07-04T09:09:01Z" "2022-07-05T09:09:39Z" "2022-07-06T09:10:19Z" "2022-07-07T09:10:59Z" ...
##   .. ..$ sunriseCivil       : chr [1:10] "2022-07-04T08:33:57Z" "2022-07-05T08:34:38Z" "2022-07-06T08:35:21Z" "2022-07-07T08:36:06Z" ...
##   .. ..$ sunriseNautical    : chr [1:10] "2022-07-04T07:48:13Z" "2022-07-05T07:49:01Z" "2022-07-06T07:49:52Z" "2022-07-07T07:50:45Z" ...
##   .. ..$ sunriseAstronomical: chr [1:10] "2022-07-04T06:51:54Z" "2022-07-05T06:52:59Z" "2022-07-06T06:54:06Z" "2022-07-07T06:55:17Z" ...
##   .. ..$ sunset             : chr [1:10] "2022-07-05T00:26:51Z" "2022-07-06T00:26:33Z" "2022-07-07T00:26:13Z" "2022-07-08T00:25:50Z" ...
##   .. ..$ sunsetCivil        : chr [1:10] "2022-07-05T01:01:53Z" "2022-07-06T01:01:31Z" "2022-07-07T01:01:06Z" "2022-07-08T01:00:39Z" ...
##   .. ..$ sunsetNautical     : chr [1:10] "2022-07-05T01:47:39Z" "2022-07-06T01:47:09Z" "2022-07-07T01:46:36Z" "2022-07-08T01:46:01Z" ...
##   .. ..$ sunsetAstronomical : chr [1:10] "2022-07-05T02:43:47Z" "2022-07-06T02:43:00Z" "2022-07-07T02:42:09Z" "2022-07-08T02:41:14Z" ...
##   .. ..$ temperatureMax     : num [1:10] 27.2 26.2 26.6 25.6 25.1 ...
##   .. ..$ temperatureMin     : num [1:10] 13 13.9 17 13.9 13.8 ...
##   .. ..$ daytimeForecast    :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T11:00:00Z" "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" "2022-07-07T11:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" "2022-07-07T23:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.37 0.9 0.41 0.32 0.78 0.26 0.32 0.56 0.68 0.43
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" "Drizzle" "PartlyCloudy" "MostlyClear" ...
##   .. .. ..$ humidity           : num [1:10] 0.44 0.61 0.64 0.55 0.67 0.54 0.49 0.56 0.63 0.65
##   .. .. ..$ precipitationAmount: num [1:10] 0 0.89 0.15 0.04 0.85 ...
##   .. .. ..$ precipitationChance: num [1:10] 0 0.43 0.17 0.04 0.31 0.08 0.05 0.12 0.27 0.27
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "rain" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 305 152 336 191 149 52 30 170 197 234
##   .. .. ..$ windSpeed          : num [1:10] 11.62 6.61 11.66 9.68 7.05 ...
##   .. ..$ overnightForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" "2022-07-07T23:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" "2022-07-07T11:00:00Z" "2022-07-08T11:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.65 0.76 0.38 0.6 0.34 0.22 0.25 0.31 0.52 0.42
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyCloudy" "Drizzle" "PartlyCloudy" "PartlyCloudy" ...
##   .. .. ..$ humidity           : num [1:10] 0.71 0.86 0.79 0.77 0.84 0.69 0.74 0.76 0.8 0.83
##   .. .. ..$ precipitationAmount: num [1:10] 0 5.07 0.07 0.01 0.01 ...
##   .. .. ..$ precipitationChance: num [1:10] 0.02 0.76 0.06 0.13 0.27 0.05 0.06 0.27 0.26 0.26
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "rain" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 311 215 285 197 337 335 262 200 204 237
##   .. .. ..$ windSpeed          : num [1:10] 4.88 12.49 4.19 6.9 6.39 ...
##   .. ..$ restOfDayForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T14:46:32Z" NA NA NA ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-05T04:00:00Z" NA NA NA ...
##   .. .. ..$ cloudCover         : num [1:10] 0.51 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" NA NA NA ...
##   .. .. ..$ humidity           : num [1:10] 0.46 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationChance: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" NA NA NA ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windDirection      : int [1:10] 307 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windSpeed          : num [1:10] 9.94 NA NA NA NA NA NA NA NA NA
##  $ forecastHourly  :List of 3
##   ..$ name    : chr "HourlyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T15:46:32Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T14:46:32Z"
##   .. ..$ reportedTime  : chr "2022-07-04T13:02:06Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ hours   :'data.frame': 243 obs. of  20 variables:
##   .. ..$ forecastStart         : chr [1:243] "2022-07-04T02:00:00Z" "2022-07-04T03:00:00Z" "2022-07-04T04:00:00Z" "2022-07-04T05:00:00Z" ...
##   .. ..$ cloudCover            : num [1:243] 0.15 0.03 0.02 0.01 0 0 0 0 0.06 0.02 ...
##   .. ..$ conditionCode         : chr [1:243] "MostlyClear" "Clear" "Clear" "Clear" ...
##   .. ..$ daylight              : logi [1:243] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..$ humidity              : num [1:243] 0.61 0.67 0.7 0.72 0.73 0.77 0.79 0.79 0.78 0.74 ...
##   .. ..$ precipitationAmount   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationChance   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationType     : chr [1:243] "clear" "clear" "clear" "clear" ...
##   .. ..$ pressure              : num [1:243] 1016 1017 1017 1018 1018 ...
##   .. ..$ pressureTrend         : chr [1:243] "rising" "rising" "rising" "rising" ...
##   .. ..$ snowfallIntensity     : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ temperature           : num [1:243] 19.5 18.1 17.1 16.1 15.2 ...
##   .. ..$ temperatureApparent   : num [1:243] 19.1 17.7 16.8 15.7 14.7 ...
##   .. ..$ temperatureDewPoint   : num [1:243] 11.7 11.8 11.6 11.1 10.4 ...
##   .. ..$ uvIndex               : int [1:243] 0 0 0 0 0 0 0 0 0 1 ...
##   .. ..$ visibility            : num [1:243] 33471 29777 29500 28628 28232 ...
##   .. ..$ windDirection         : int [1:243] 302 307 302 298 299 331 282 318 291 317 ...
##   .. ..$ windGust              : num [1:243] 3.18 3.4 2.97 3.23 2.58 1.51 1.13 1.75 3.32 3.13 ...
##   .. ..$ windSpeed             : num [1:243] 3.18 3.4 2.97 3.23 2.58 0.88 1.13 1.75 3.32 3.13 ...
##  $ forecastNextHour:List of 6
##   ..$ name         : chr "NextHourForecast"
##   ..$ metadata     :List of 9
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T15:46:32Z"
##   .. ..$ language      : chr "en-US"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ providerName  : chr "US National Weather Service"
##   .. ..$ readTime      : chr "2022-07-04T14:46:32Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ summary      :'data.frame':    1 obs. of  4 variables:
##   .. ..$ startTime             : chr "2022-07-04T14:47:00Z"
##   .. ..$ condition             : chr "clear"
##   .. ..$ precipitationChance   : num 0
##   .. ..$ precipitationIntensity: num 0
##   ..$ forecastStart: chr "2022-07-04T14:47:00Z"
##   ..$ forecastEnd  : chr "2022-07-04T16:08:00Z"
##   ..$ minutes      :'data.frame':    81 obs. of  3 variables:
##   .. ..$ startTime             : chr [1:81] "2022-07-04T14:47:00Z" "2022-07-04T14:48:00Z" "2022-07-04T14:49:00Z" "2022-07-04T14:50:00Z" ...
##   .. ..$ precipitationChance   : num [1:81] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:81] 0 0 0 0 0 0 0 0 0 0 ...
```

``` r
library(ggtext)
library(ggforce)
library(hrbragg) # remotes::install_github("hrbrmstr/hrbragg")
library(ggplot2)
library(weatherkit)

wx <- wx_tidy(wxkit_weather(43.2683199, -70.8635506))

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
| HTML |        1 | 0.03 | 306 | 0.25 |          35 | 0.10 |        2 | 0.00 |
| R    |       12 | 0.35 | 210 | 0.17 |          85 | 0.25 |      195 | 0.36 |
| Rmd  |        2 | 0.06 |  66 | 0.05 |          43 | 0.12 |       74 | 0.14 |
| YAML |        2 | 0.06 |  35 | 0.03 |          10 | 0.03 |        2 | 0.00 |
| SUM  |       17 | 0.50 | 617 | 0.50 |         173 | 0.50 |      273 | 0.50 |

clock Package Metrics for weatherkit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
