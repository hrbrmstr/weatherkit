
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

# current version
packageVersion("weatherkit")
## [1] '0.1.0'
```

``` r
wxkit_availability(43.2683199, -70.8635506, "US")
## [1] "currentWeather"   "forecastDaily"    "forecastHourly"   "forecastNextHour" "weatherAlerts"
```

``` r
wxkit_weather(43.2683199, -70.8635506) |> 
  str()
## List of 4
##  $ currentWeather  :List of 18
##   ..$ name                  : chr "CurrentWeather"
##   ..$ metadata              :List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T11:45:08Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T11:40:08Z"
##   .. ..$ reportedTime  : chr "2022-07-04T09:18:23Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ asOf                  : chr "2022-07-04T11:40:08Z"
##   ..$ cloudCover            : num 0.4
##   ..$ conditionCode         : chr "PartlyCloudy"
##   ..$ daylight              : logi TRUE
##   ..$ humidity              : num 0.65
##   ..$ precipitationIntensity: num 0
##   ..$ pressure              : num 1019
##   ..$ pressureTrend         : chr "rising"
##   ..$ temperature           : num 18.7
##   ..$ temperatureApparent   : num 18.4
##   ..$ temperatureDewPoint   : num 12
##   ..$ uvIndex               : int 2
##   ..$ visibility            : num 30009
##   ..$ windDirection         : int 308
##   ..$ windGust              : num 21.3
##   ..$ windSpeed             : num 8.61
##  $ forecastDaily   :List of 3
##   ..$ name    : chr "DailyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T12:40:08Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T11:40:08Z"
##   .. ..$ reportedTime  : chr "2022-07-04T09:18:23Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ days    :'data.frame': 10 obs. of  26 variables:
##   .. ..$ forecastStart      : chr [1:10] "2022-07-04T04:00:00Z" "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" "2022-07-07T04:00:00Z" ...
##   .. ..$ forecastEnd        : chr [1:10] "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" "2022-07-07T04:00:00Z" "2022-07-08T04:00:00Z" ...
##   .. ..$ conditionCode      : chr [1:10] "MostlyClear" "Rain" "Rain" "PartlyCloudy" ...
##   .. ..$ maxUvIndex         : int [1:10] 7 5 7 6 5 7 6 7 6 7
##   .. ..$ moonPhase          : chr [1:10] "waningCrescent" "waningCrescent" "firstQuarter" "firstQuarter" ...
##   .. ..$ moonrise           : chr [1:10] "2022-07-04T14:17:06Z" "2022-07-05T15:22:33Z" "2022-07-06T16:29:11Z" "2022-07-07T17:38:12Z" ...
##   .. ..$ moonset            : chr [1:10] "2022-07-05T03:51:55Z" NA "2022-07-06T04:12:14Z" "2022-07-07T04:32:48Z" ...
##   .. ..$ precipitationAmount: num [1:10] 0 4.08 2.31 0 0.98 ...
##   .. ..$ precipitationChance: num [1:10] 0 0.68 0.69 0.11 0.38 0.36 0.12 0.31 0.47 0.36
##   .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "clear" ...
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
##   .. ..$ temperatureMax     : num [1:10] 27.2 26.6 26.5 25.7 26.5 ...
##   .. ..$ temperatureMin     : num [1:10] 13.4 13.9 17.3 14 14.6 ...
##   .. ..$ daytimeForecast    :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T11:00:00Z" "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" "2022-07-07T11:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" "2022-07-07T23:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.37 0.87 0.41 0.42 0.72 0.32 0.35 0.5 0.67 0.57
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" "Drizzle" "PartlyCloudy" "PartlyCloudy" ...
##   .. .. ..$ humidity           : num [1:10] 0.43 0.61 0.65 0.57 0.64 0.58 0.51 0.58 0.64 0.66
##   .. .. ..$ precipitationAmount: num [1:10] 0 0.76 0.28 0 0.19 1.26 0 0.71 1.6 14
##   .. .. ..$ precipitationChance: num [1:10] 0 0.39 0.25 0.05 0.23 0.22 0.05 0.17 0.28 0.3
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "rain" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 308 147 349 175 175 60 107 189 209 3
##   .. .. ..$ windSpeed          : num [1:10] 12.26 5.95 12.11 7.85 9.82 ...
##   .. ..$ overnightForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" "2022-07-07T23:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" "2022-07-07T11:00:00Z" "2022-07-08T11:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.61 0.78 0.44 0.52 0.52 0.28 0.14 0.52 0.51 NA
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" "Rain" "PartlyCloudy" "PartlyCloudy" ...
##   .. .. ..$ humidity           : num [1:10] 0.71 0.87 0.77 0.76 0.83 0.73 0.76 0.78 0.79 NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 5.36 0 0 2.97 ...
##   .. .. ..$ precipitationChance: num [1:10] 0.01 0.74 0.05 0.12 0.32 0.09 0.08 0.33 0.25 NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "rain" "clear" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 NA
##   .. .. ..$ windDirection      : int [1:10] 310 209 331 192 307 6 223 198 202 NA
##   .. .. ..$ windSpeed          : num [1:10] 4.61 11.52 4.75 7.56 5.93 ...
##   .. ..$ restOfDayForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-04T11:40:08Z" NA NA NA ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-05T04:00:00Z" NA NA NA ...
##   .. .. ..$ cloudCover         : num [1:10] 0.44 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" NA NA NA ...
##   .. .. ..$ humidity           : num [1:10] 0.47 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationChance: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" NA NA NA ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windDirection      : int [1:10] 310 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windSpeed          : num [1:10] 10.1 NA NA NA NA ...
##  $ forecastHourly  :List of 3
##   ..$ name    : chr "HourlyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T12:40:08Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-04T11:40:08Z"
##   .. ..$ reportedTime  : chr "2022-07-04T09:18:23Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ hours   :'data.frame': 243 obs. of  20 variables:
##   .. ..$ forecastStart         : chr [1:243] "2022-07-04T02:00:00Z" "2022-07-04T03:00:00Z" "2022-07-04T04:00:00Z" "2022-07-04T05:00:00Z" ...
##   .. ..$ cloudCover            : num [1:243] 0.15 0.03 0.02 0.01 0 0 0 0.06 0.15 0.26 ...
##   .. ..$ conditionCode         : chr [1:243] "MostlyClear" "Clear" "Clear" "Clear" ...
##   .. ..$ daylight              : logi [1:243] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..$ humidity              : num [1:243] 0.6 0.67 0.7 0.72 0.74 0.76 0.77 0.75 0.75 0.71 ...
##   .. ..$ precipitationAmount   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationChance   : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationType     : chr [1:243] "clear" "clear" "clear" "clear" ...
##   .. ..$ pressure              : num [1:243] 1016 1017 1017 1018 1018 ...
##   .. ..$ pressureTrend         : chr [1:243] "rising" "rising" "rising" "rising" ...
##   .. ..$ snowfallIntensity     : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ temperature           : num [1:243] 19.5 18.1 16.9 16 15 ...
##   .. ..$ temperatureApparent   : num [1:243] 19.1 17.7 16.5 15.6 14.5 ...
##   .. ..$ temperatureDewPoint   : num [1:243] 11.6 11.8 11.4 10.9 10.3 ...
##   .. ..$ uvIndex               : int [1:243] 0 0 0 0 0 0 0 0 0 1 ...
##   .. ..$ visibility            : num [1:243] 33869 29991 29467 28733 28204 ...
##   .. ..$ windDirection         : int [1:243] 301 307 301 298 299 330 295 310 310 309 ...
##   .. ..$ windGust              : num [1:243] 3.15 3.39 3.05 3.36 2.62 ...
##   .. ..$ windSpeed             : num [1:243] 3.15 3.39 3.05 3.36 2.62 2.03 2.67 8.93 8.55 8.44 ...
##  $ forecastNextHour:List of 6
##   ..$ name         : chr "NextHourForecast"
##   ..$ metadata     :List of 9
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-04T13:40:08Z"
##   .. ..$ language      : chr "en-US"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ providerName  : chr "US National Weather Service"
##   .. ..$ readTime      : chr "2022-07-04T11:40:08Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ summary      :'data.frame':    1 obs. of  4 variables:
##   .. ..$ startTime             : chr "2022-07-04T11:41:00Z"
##   .. ..$ condition             : chr "clear"
##   .. ..$ precipitationChance   : num 0
##   .. ..$ precipitationIntensity: num 0
##   ..$ forecastStart: chr "2022-07-04T11:41:00Z"
##   ..$ forecastEnd  : chr "2022-07-04T13:00:00Z"
##   ..$ minutes      :'data.frame':    79 obs. of  3 variables:
##   .. ..$ startTime             : chr [1:79] "2022-07-04T11:41:00Z" "2022-07-04T11:42:00Z" "2022-07-04T11:43:00Z" "2022-07-04T11:44:00Z" ...
##   .. ..$ precipitationChance   : num [1:79] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:79] 0 0 0 0 0 0 0 0 0 0 ...
```

## weatherkit Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| HTML |        1 | 0.03 | 306 | 0.31 |          35 | 0.13 |        2 | 0.00 |
| R    |       11 | 0.34 | 131 | 0.13 |          56 | 0.20 |      182 | 0.35 |
| YAML |        2 | 0.06 |  35 | 0.04 |          10 | 0.04 |        2 | 0.00 |
| Rmd  |        2 | 0.06 |  15 | 0.02 |          38 | 0.14 |       72 | 0.14 |
| SUM  |       16 | 0.50 | 487 | 0.50 |         139 | 0.50 |      258 | 0.50 |

clock Package Metrics for weatherkit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
