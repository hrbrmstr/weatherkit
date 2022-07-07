
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
-   `coordinates_from_ip`: Get latitude and longitude coordinates from
    your/an IP address
-   `current_conditions`: Function to display current conditions for a
    given weather data retrieval
-   `dewpoint_to_humidity`: Calculate relative humidity
-   `fahrenheit_to_celsius`: Convert from Fahrenheit to Celsius
-   `hourly_forecast`: Function to display hourly forecast for a given
    weather data retrieval
-   `humidity_to_dewpoint`: Calculate dew point temperature
-   `inches_to_metric`: Convert from inches to standard metric units of
    measure for precipitation
-   `iso8601`: Format a Datetime object: ISO 8601
-   `meters_to_miles`: Convert meters to miles
-   `metric_to_inches`: Convert between standard metric units of measure
    for precipitation to inches
-   `precip_type`: Converts precipitationType string values to symbols
-   `pressure_trend`: Converts pressureTrend string values to symbols
-   `readable_conditions`: Turns Apple’s smushed together condition code
    strings into proper words/phrases
-   `seq_rng`: Create a sequence from a value range
-   `uv_label`: UV index to label
-   `wind_direction_label`: Converts wind direction angle to the
    corresponding value of the 16-wind compass rose composed of the
    cardinal directions—north, east, south, and west—and its
    intercardinal directions
-   `with_tz`: Get date-time in a different time zone
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
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-07 12:26:29"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-07 12:21:29"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-07 09:45:32"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ asOf                  : POSIXct[1:1], format: "2022-07-07 12:21:29"
##   ..$ cloudCover            : num 0.29
##   ..$ conditionCode         : chr "MostlyClear"
##   ..$ daylight              : logi TRUE
##   ..$ humidity              : num 0.68
##   ..$ precipitationIntensity: num 0
##   ..$ pressure              : num 1018
##   ..$ pressureTrend         : chr "rising"
##   ..$ temperature           : num 19.4
##   ..$ temperatureApparent   : num 19.3
##   ..$ temperatureDewPoint   : num 13.4
##   ..$ uvIndex               : int 2
##   ..$ visibility            : num 29275
##   ..$ windDirection         : int 51
##   ..$ windGust              : num 11.7
##   ..$ windSpeed             : num 4.2
##  $ forecastDaily   :List of 3
##   ..$ name    : chr "DailyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-07 13:21:29"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-07 12:21:29"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-07 09:45:32"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ days    :'data.frame': 10 obs. of  26 variables:
##   .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-07 04:00:00" "2022-07-08 04:00:00" "2022-07-09 04:00:00" "2022-07-10 04:00:00" ...
##   .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-08 04:00:00" "2022-07-09 04:00:00" "2022-07-10 04:00:00" "2022-07-11 04:00:00" ...
##   .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" "PartlyCloudy" "MostlyClear" "Clear" ...
##   .. ..$ maxUvIndex         : int [1:10] 7 7 7 8 8 6 7 6 5 4
##   .. ..$ moonPhase          : chr [1:10] "firstQuarter" "firstQuarter" "waxingGibbous" "waxingGibbous" ...
##   .. ..$ moonrise           : POSIXct[1:10], format: "2022-07-07 17:38:12" "2022-07-08 18:50:47" "2022-07-09 20:07:35" "2022-07-10 21:27:35" ...
##   .. ..$ moonset            : POSIXct[1:10], format: "2022-07-07 04:32:48" "2022-07-08 04:54:51" "2022-07-09 05:20:27" "2022-07-10 05:51:50" ...
##   .. ..$ precipitationAmount: num [1:10] 0 0.49 0 0 0 1.32 0.24 3.44 5.07 8.35
##   .. ..$ precipitationChance: num [1:10] 0.01 0.17 0.05 0 0.07 0.39 0.37 0.4 0.47 0.44
##   .. ..$ precipitationType  : chr [1:10] "clear" "rain" "clear" "clear" ...
##   .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. ..$ solarMidnight      : POSIXct[1:10], format: "2022-07-07 04:48:29" "2022-07-08 04:48:39" "2022-07-09 04:48:49" "2022-07-10 04:48:58" ...
##   .. ..$ solarNoon          : POSIXct[1:10], format: "2022-07-07 16:48:26" "2022-07-08 16:48:35" "2022-07-09 16:48:44" "2022-07-10 16:48:53" ...
##   .. ..$ sunrise            : POSIXct[1:10], format: "2022-07-07 09:10:59" "2022-07-08 09:11:42" "2022-07-09 09:12:26" "2022-07-10 09:13:11" ...
##   .. ..$ sunriseCivil       : POSIXct[1:10], format: "2022-07-07 08:36:06" "2022-07-08 08:36:53" "2022-07-09 08:37:41" "2022-07-10 08:38:31" ...
##   .. ..$ sunriseNautical    : POSIXct[1:10], format: "2022-07-07 07:50:45" "2022-07-08 07:51:39" "2022-07-09 07:52:36" "2022-07-10 07:53:34" ...
##   .. ..$ sunriseAstronomical: POSIXct[1:10], format: "2022-07-07 06:55:17" "2022-07-08 06:56:30" "2022-07-09 06:57:46" "2022-07-10 06:59:04" ...
##   .. ..$ sunset             : POSIXct[1:10], format: "2022-07-08 00:25:50" "2022-07-09 00:25:26" "2022-07-10 00:24:59" "2022-07-11 00:24:30" ...
##   .. ..$ sunsetCivil        : POSIXct[1:10], format: "2022-07-08 01:00:39" "2022-07-09 01:00:10" "2022-07-10 00:59:38" "2022-07-11 00:59:04" ...
##   .. ..$ sunsetNautical     : POSIXct[1:10], format: "2022-07-08 01:46:01" "2022-07-09 01:45:23" "2022-07-10 01:44:42" "2022-07-11 01:43:58" ...
##   .. ..$ sunsetAstronomical : POSIXct[1:10], format: "2022-07-08 02:41:14" "2022-07-09 02:40:16" "2022-07-10 02:39:14" "2022-07-11 02:38:09" ...
##   .. ..$ temperatureMax     : num [1:10] 26 28.6 24.9 25.5 28.8 ...
##   .. ..$ temperatureMin     : num [1:10] 13.4 16.4 14.8 11.7 12.3 ...
##   .. ..$ daytimeForecast    :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-07 11:00:00" "2022-07-08 11:00:00" "2022-07-09 11:00:00" "2022-07-10 11:00:00" ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-07 23:00:00" "2022-07-08 23:00:00" "2022-07-09 23:00:00" "2022-07-10 23:00:00" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.4 0.46 0.27 0.11 0.49 0.68 0.41 0.61 0.84 0.88
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" "PartlyCloudy" "MostlyClear" "Clear" ...
##   .. .. ..$ humidity           : num [1:10] 0.57 0.59 0.54 0.47 0.5 0.62 0.6 0.62 0.68 0.66
##   .. .. ..$ precipitationAmount: num [1:10] 0 0.31 0 0 0 0.26 0.17 3.15 0.22 1.37
##   .. .. ..$ precipitationChance: num [1:10] 0 0.11 0.03 0 0.02 0.29 0.16 0.31 0.33 0.3
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "clear" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 162 259 130 284 228 225 245 195 75 63
##   .. .. ..$ windSpeed          : num [1:10] 8.56 9.34 7.13 6.16 10.4 ...
##   .. ..$ overnightForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-07 23:00:00" "2022-07-08 23:00:00" "2022-07-09 23:00:00" "2022-07-10 23:00:00" ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-08 11:00:00" "2022-07-09 11:00:00" "2022-07-10 11:00:00" "2022-07-11 11:00:00" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.46 0.45 0.11 0.3 0.45 0.4 0.67 0.58 0.79 NA
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" "PartlyCloudy" "Clear" "MostlyClear" ...
##   .. .. ..$ humidity           : num [1:10] 0.78 0.78 0.7 0.74 0.69 0.81 0.78 0.79 0.83 NA
##   .. .. ..$ precipitationAmount: num [1:10] 0.07 0.11 0 0 0 1.11 0.04 2.26 6.47 NA
##   .. .. ..$ precipitationChance: num [1:10] 0.05 0.07 0.01 0.02 0.1 0.27 0.24 0.31 0.31 NA
##   .. .. ..$ precipitationType  : chr [1:10] "rain" "rain" "clear" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 NA
##   .. .. ..$ windDirection      : int [1:10] 192 338 346 216 214 224 262 23 60 NA
##   .. .. ..$ windSpeed          : num [1:10] 10.07 7.36 6.75 5.93 10.7 ...
##   .. ..$ restOfDayForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : POSIXct[1:10], format: "2022-07-07 12:21:29" NA NA NA ...
##   .. .. ..$ forecastEnd        : POSIXct[1:10], format: "2022-07-08 04:00:00" NA NA NA ...
##   .. .. ..$ cloudCover         : num [1:10] 0.45 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" NA NA NA ...
##   .. .. ..$ humidity           : num [1:10] 0.6 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationChance: num [1:10] 0.01 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" NA NA NA ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windDirection      : int [1:10] 167 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windSpeed          : num [1:10] 9.6 NA NA NA NA NA NA NA NA NA
##  $ forecastHourly  :List of 3
##   ..$ name    : chr "HourlyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-07 13:21:29"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-07 12:21:29"
##   .. ..$ reportedTime  : POSIXct[1:1], format: "2022-07-07 09:45:32"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ hours   :'data.frame': 243 obs. of  20 variables:
##   .. ..$ forecastStart         : POSIXct[1:243], format: "2022-07-07 02:00:00" "2022-07-07 03:00:00" "2022-07-07 04:00:00" "2022-07-07 05:00:00" ...
##   .. ..$ cloudCover            : num [1:243] 0.02 0.01 0.02 0.31 0.44 0.73 0.3 1 0.34 0.33 ...
##   .. ..$ conditionCode         : chr [1:243] "Clear" "Clear" "Clear" "MostlyClear" ...
##   .. ..$ daylight              : logi [1:243] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..$ humidity              : num [1:243] 0.74 0.78 0.81 0.83 0.86 0.88 0.91 0.9 0.87 0.82 ...
##   .. ..$ precipitationAmount   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationChance   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationType     : chr [1:243] "clear" "clear" "clear" "clear" ...
##   .. ..$ pressure              : num [1:243] 1014 1015 1016 1016 1016 ...
##   .. ..$ pressureTrend         : chr [1:243] "rising" "rising" "rising" "rising" ...
##   .. ..$ snowfallIntensity     : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ temperature           : num [1:243] 18.3 17 16.1 15.5 14.7 ...
##   .. ..$ temperatureApparent   : num [1:243] 18.2 16.9 16 15.3 14.5 ...
##   .. ..$ temperatureDewPoint   : num [1:243] 13.6 13.1 12.8 12.7 12.4 ...
##   .. ..$ uvIndex               : int [1:243] 0 0 0 0 0 0 0 0 0 1 ...
##   .. ..$ visibility            : num [1:243] 28105 26514 24730 23883 23669 ...
##   .. ..$ windDirection         : int [1:243] 315 302 315 308 310 298 307 319 354 7 ...
##   .. ..$ windGust              : num [1:243] 2.93 2.56 2.92 3.26 3.35 ...
##   .. ..$ windSpeed             : num [1:243] 2.93 2.56 2.92 3.26 3.35 3.08 3.37 2.65 4.8 4.13 ...
##  $ forecastNextHour:List of 6
##   ..$ name         : chr "NextHourForecast"
##   ..$ metadata     :List of 9
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : POSIXct[1:1], format: "2022-07-07 13:21:29"
##   .. ..$ language      : chr "en-US"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ providerName  : chr "US National Weather Service"
##   .. ..$ readTime      : POSIXct[1:1], format: "2022-07-07 12:21:29"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ summary      :'data.frame':    1 obs. of  4 variables:
##   .. ..$ startTime             : POSIXct[1:1], format: "2022-07-07 12:22:00"
##   .. ..$ condition             : chr "clear"
##   .. ..$ precipitationChance   : num 0
##   .. ..$ precipitationIntensity: num 0
##   ..$ forecastStart: POSIXct[1:1], format: "2022-07-07 12:22:00"
##   ..$ forecastEnd  : POSIXct[1:1], format: "2022-07-07 13:40:00"
##   ..$ minutes      :'data.frame':    78 obs. of  3 variables:
##   .. ..$ startTime             : POSIXct[1:78], format: "2022-07-07 12:22:00" "2022-07-07 12:23:00" "2022-07-07 12:24:00" "2022-07-07 12:25:00" ...
##   .. ..$ precipitationChance   : num [1:78] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:78] 0 0 0 0 0 0 0 0 0 0 ...
```

``` r
current_conditions(wx)
##  Weather for (43.268, -70.864) as of 2022-07-07 08:21:29
## 
##  Conditions: Mostly Clear
## Temperature: 66.9°F
##  Feels like: 66.72°F
##   Dew Point: 56.17°F
##        Wind: 2.6 mph (NE)
##    Pressure: 1017.75 mb (rising)
##  Visibility: 18 miles
##    UV Index: 🟩 2 (Low)
## 
## https://weather-data.apple.com/legal-attribution.html
```

``` r
hourly_forecast(wx)
##  Weather forecast for (43.268, -70.864) as of 2022-07-07 08:21:29
## 
## Today @ 09:00 │ 🌡 69°F │ 💦 63% │ 1018 mb ↑ │ ️😎 │ Mostly Clear  │ 🟨
##       @ 10:00 │ 🌡 72°F │ 💦 58% │ 1018 mb — │ ️😎 │ Mostly Clear  │ 🟨
##       @ 11:00 │ 🌡 74°F │ 💦 55% │ 1018 mb — │ ️😎 │ Mostly Clear  │ 🟧
##       @ 12:00 │ 🌡 76°F │ 💦 52% │ 1017 mb — │ ️😎 │ Partly Cloudy │ 🟧
##       @ 13:00 │ 🌡 77°F │ 💦 51% │ 1017 mb ↓ │ ️😎 │ Partly Cloudy │ 🟧
##       @ 14:00 │ 🌡 78°F │ 💦 50% │ 1016 mb ↓ │ ️😎 │ Partly Cloudy │ 🟧
##       @ 15:00 │ 🌡 79°F │ 💦 50% │ 1016 mb ↓ │ ️😎 │ Partly Cloudy │ 🟨
##       @ 16:00 │ 🌡 78°F │ 💦 51% │ 1016 mb ↓ │ ️😎 │ Partly Cloudy │ 🟨
##       @ 17:00 │ 🌡 76°F │ 💦 55% │ 1015 mb ↓ │ ️😎 │ Partly Cloudy │ 🟩
##       @ 18:00 │ 🌡 75°F │ 💦 59% │ 1015 mb — │ ️😎 │ Partly Cloudy │ 🟩
##       @ 19:00 │ 🌡 73°F │ 💦 62% │ 1015 mb — │ ️😎 │ Mostly Clear  │ 🟩
##       @ 20:00 │ 🌡 70°F │ 💦 67% │ 1015 mb — │ ️😎 │ Mostly Clear  │ 🟩
##       @ 21:00 │ 🌡 69°F │ 💦 71% │ 1015 mb — │ 🌕 │ Partly Cloudy │ 🟩
##       @ 22:00 │ 🌡 68°F │ 💦 73% │ 1016 mb — │ 🌕 │ Partly Cloudy │ 🟩
##       @ 23:00 │ 🌡 67°F │ 💦 75% │ 1015 mb — │ 🌕 │ Mostly Cloudy │ 🟩
##   Fri @ 00:00 │ 🌡 66°F │ 💦 75% │ 1015 mb — │ 🌕 │ Partly Cloudy │ 🟩
##       @ 01:00 │ 🌡 65°F │ 💦 79% │ 1015 mb — │ 🌕 │ Partly Cloudy │ 🟩
##       @ 02:00 │ 🌡 64°F │ 💦 82% │ 1015 mb — │ 🌕 │ Mostly Clear  │ 🟩
##       @ 03:00 │ 🌡 63°F │ 💦 83% │ 1015 mb — │ 🌕 │ Partly Cloudy │ 🟩
##       @ 04:00 │ 🌡 62°F │ 💦 85% │ 1015 mb — │ 🌕 │ Partly Cloudy │ 🟩
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
    title = "Weather for Berwick, Maine"
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
| R    |       19 | 0.40 | 517 | 0.28 |         180 | 0.33 |      398 | 0.41 |
| HTML |        1 | 0.02 | 306 | 0.17 |          35 | 0.07 |        2 | 0.00 |
| Rmd  |        2 | 0.04 |  68 | 0.04 |          44 | 0.08 |       79 | 0.08 |
| YAML |        2 | 0.04 |  35 | 0.02 |          10 | 0.02 |        2 | 0.00 |
| SUM  |       24 | 0.50 | 926 | 0.50 |         269 | 0.50 |      481 | 0.50 |

clock Package Metrics for weatherkit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
