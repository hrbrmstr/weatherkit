
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

-   `wxkit_alert`: Receive an active weather alert.
-   `wxkit_auth`: Authentication components necessary for creation of
    JSON Web Tokens
-   `wxkit_availability`: Determine the data sets available for the
    specified location.
-   `wxkit_weather`: Obtain weather data for the specified location.

## Installation

``` r
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
##   .. ..$ expireTime    : chr "2022-07-03T13:06:43Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-03T13:01:43Z"
##   .. ..$ reportedTime  : chr "2022-07-03T10:38:13Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ asOf                  : chr "2022-07-03T13:01:43Z"
##   ..$ cloudCover            : num 0.93
##   ..$ conditionCode         : chr "Cloudy"
##   ..$ daylight              : logi TRUE
##   ..$ humidity              : num 0.6
##   ..$ precipitationIntensity: num 0
##   ..$ pressure              : num 1014
##   ..$ pressureTrend         : chr "steady"
##   ..$ temperature           : num 22
##   ..$ temperatureApparent   : num 21.9
##   ..$ temperatureDewPoint   : num 13.9
##   ..$ uvIndex               : int 3
##   ..$ visibility            : num 34912
##   ..$ windDirection         : int 274
##   ..$ windGust              : num 25.3
##   ..$ windSpeed             : num 10.3
##  $ forecastDaily   :List of 3
##   ..$ name    : chr "DailyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-03T14:01:43Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-03T13:01:43Z"
##   .. ..$ reportedTime  : chr "2022-07-03T10:38:13Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ days    :'data.frame': 10 obs. of  26 variables:
##   .. ..$ forecastStart      : chr [1:10] "2022-07-03T04:00:00Z" "2022-07-04T04:00:00Z" "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" ...
##   .. ..$ forecastEnd        : chr [1:10] "2022-07-04T04:00:00Z" "2022-07-05T04:00:00Z" "2022-07-06T04:00:00Z" "2022-07-07T04:00:00Z" ...
##   .. ..$ conditionCode      : chr [1:10] "MostlyClear" "PartlyCloudy" "Drizzle" "Drizzle" ...
##   .. ..$ maxUvIndex         : int [1:10] 9 6 5 7 7 5 7 7 7 6
##   .. ..$ moonPhase          : chr [1:10] "waningCrescent" "waningCrescent" "waningCrescent" "firstQuarter" ...
##   .. ..$ moonrise           : chr [1:10] "2022-07-03T13:12:01Z" "2022-07-04T14:17:06Z" "2022-07-05T15:22:33Z" "2022-07-06T16:29:11Z" ...
##   .. ..$ moonset            : chr [1:10] "2022-07-04T03:30:29Z" "2022-07-05T03:51:55Z" NA "2022-07-06T04:12:14Z" ...
##   .. ..$ precipitationAmount: num [1:10] 0 0 2.07 3.41 0.08 5.98 1.29 0.19 0 0
##   .. ..$ precipitationChance: num [1:10] 0.04 0.02 0.59 0.58 0.1 0.47 0.42 0.31 0.21 0.24
##   .. ..$ precipitationType  : chr [1:10] "clear" "clear" "rain" "rain" ...
##   .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. ..$ solarMidnight      : chr [1:10] "2022-07-03T04:47:46Z" "2022-07-04T04:47:58Z" "2022-07-05T04:48:08Z" "2022-07-06T04:48:19Z" ...
##   .. ..$ solarNoon          : chr [1:10] "2022-07-03T16:47:46Z" "2022-07-04T16:47:57Z" "2022-07-05T16:48:07Z" "2022-07-06T16:48:17Z" ...
##   .. ..$ sunrise            : chr [1:10] "2022-07-03T09:08:25Z" "2022-07-04T09:09:01Z" "2022-07-05T09:09:39Z" "2022-07-06T09:10:19Z" ...
##   .. ..$ sunriseCivil       : chr [1:10] "2022-07-03T08:33:17Z" "2022-07-04T08:33:57Z" "2022-07-05T08:34:38Z" "2022-07-06T08:35:21Z" ...
##   .. ..$ sunriseNautical    : chr [1:10] "2022-07-03T07:47:27Z" "2022-07-04T07:48:13Z" "2022-07-05T07:49:01Z" "2022-07-06T07:49:52Z" ...
##   .. ..$ sunriseAstronomical: chr [1:10] "2022-07-03T06:50:53Z" "2022-07-04T06:51:54Z" "2022-07-05T06:52:59Z" "2022-07-06T06:54:06Z" ...
##   .. ..$ sunset             : chr [1:10] "2022-07-04T00:27:07Z" "2022-07-05T00:26:51Z" "2022-07-06T00:26:33Z" "2022-07-07T00:26:13Z" ...
##   .. ..$ sunsetCivil        : chr [1:10] "2022-07-04T01:02:13Z" "2022-07-05T01:01:53Z" "2022-07-06T01:01:31Z" "2022-07-07T01:01:06Z" ...
##   .. ..$ sunsetNautical     : chr [1:10] "2022-07-04T01:48:06Z" "2022-07-05T01:47:39Z" "2022-07-06T01:47:09Z" "2022-07-07T01:46:36Z" ...
##   .. ..$ sunsetAstronomical : chr [1:10] "2022-07-04T02:44:31Z" "2022-07-05T02:43:47Z" "2022-07-06T02:43:00Z" "2022-07-07T02:42:09Z" ...
##   .. ..$ temperatureMax     : num [1:10] 28.3 26.9 29.3 27 25.9 ...
##   .. ..$ temperatureMin     : num [1:10] 16.5 14.3 15 16.6 13.1 ...
##   .. ..$ daytimeForecast    :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-03T11:00:00Z" "2022-07-04T11:00:00Z" "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-03T23:00:00Z" "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.43 0.47 0.79 0.28 0.46 0.79 0.29 0.26 0.26 0.78
##   .. .. ..$ conditionCode      : chr [1:10] "PartlyCloudy" "PartlyCloudy" "Drizzle" "MostlyClear" ...
##   .. .. ..$ humidity           : num [1:10] 0.43 0.44 0.54 0.56 0.55 0.74 0.6 0.57 0.56 0.7
##   .. .. ..$ precipitationAmount: num [1:10] 0 0 0.27 0.09 0 5.33 0.66 0.07 0 0
##   .. .. ..$ precipitationChance: num [1:10] 0.01 0 0.31 0.17 0.04 0.37 0.27 0.13 0.09 0.12
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "clear" "rain" "rain" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 0
##   .. .. ..$ windDirection      : int [1:10] 292 302 210 17 149 176 73 139 229 165
##   .. .. ..$ windSpeed          : num [1:10] 13.52 11.4 13.7 10.31 9.64 ...
##   .. ..$ overnightForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-03T23:00:00Z" "2022-07-04T23:00:00Z" "2022-07-05T23:00:00Z" "2022-07-06T23:00:00Z" ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-04T11:00:00Z" "2022-07-05T11:00:00Z" "2022-07-06T11:00:00Z" "2022-07-07T11:00:00Z" ...
##   .. .. ..$ cloudCover         : num [1:10] 0.29 0.74 0.77 0.45 0.71 0.53 0.36 0.47 0.4 NA
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" "MostlyCloudy" "Drizzle" "PartlyCloudy" ...
##   .. .. ..$ humidity           : num [1:10] 0.63 0.71 0.85 0.73 0.76 0.85 0.78 0.77 0.76 NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 0 5.13 0 0.16 0.92 0.4 0 0 NA
##   .. .. ..$ precipitationChance: num [1:10] 0 0.06 0.65 0.02 0.14 0.37 0.21 0.12 0.12 NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" "clear" "rain" "clear" ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 0 0 0 0 0 0 0 0 NA
##   .. .. ..$ windDirection      : int [1:10] 316 299 233 334 198 15 5 220 252 NA
##   .. .. ..$ windSpeed          : num [1:10] 8.12 3.84 13.06 4.95 9 ...
##   .. ..$ restOfDayForecast  :'data.frame':   10 obs. of  11 variables:
##   .. .. ..$ forecastStart      : chr [1:10] "2022-07-03T13:01:43Z" NA NA NA ...
##   .. .. ..$ forecastEnd        : chr [1:10] "2022-07-04T04:00:00Z" NA NA NA ...
##   .. .. ..$ cloudCover         : num [1:10] 0.28 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ conditionCode      : chr [1:10] "MostlyClear" NA NA NA ...
##   .. .. ..$ humidity           : num [1:10] 0.43 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationAmount: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationChance: num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ precipitationType  : chr [1:10] "clear" NA NA NA ...
##   .. .. ..$ snowfallAmount     : num [1:10] 0 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windDirection      : int [1:10] 302 NA NA NA NA NA NA NA NA NA
##   .. .. ..$ windSpeed          : num [1:10] 12.8 NA NA NA NA ...
##  $ forecastHourly  :List of 3
##   ..$ name    : chr "HourlyForecast"
##   ..$ metadata:List of 8
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-03T14:01:43Z"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ readTime      : chr "2022-07-03T13:01:43Z"
##   .. ..$ reportedTime  : chr "2022-07-03T10:38:13Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ hours   :'data.frame': 243 obs. of  20 variables:
##   .. ..$ forecastStart         : chr [1:243] "2022-07-03T02:00:00Z" "2022-07-03T03:00:00Z" "2022-07-03T04:00:00Z" "2022-07-03T05:00:00Z" ...
##   .. ..$ cloudCover            : num [1:243] 0.05 0.02 0.02 0.01 0.02 0.13 0.06 0.09 0.11 0.97 ...
##   .. ..$ conditionCode         : chr [1:243] "Clear" "Clear" "Clear" "Clear" ...
##   .. ..$ daylight              : logi [1:243] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..$ humidity              : num [1:243] 0.81 0.82 0.86 0.87 0.83 0.83 0.78 0.8 0.77 0.73 ...
##   .. ..$ precipitationAmount   : num [1:243] 0.01 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:243] 0.01 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationChance   : num [1:243] 0.02 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationType     : chr [1:243] "rain" "clear" "clear" "clear" ...
##   .. ..$ pressure              : num [1:243] 1012 1012 1012 1012 1013 ...
##   .. ..$ pressureTrend         : chr [1:243] "rising" "rising" "rising" "steady" ...
##   .. ..$ snowfallIntensity     : num [1:243] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ temperature           : num [1:243] 22.5 21.5 20.3 19.2 18.5 ...
##   .. ..$ temperatureApparent   : num [1:243] 23.7 22.5 21.1 19.9 18.8 ...
##   .. ..$ temperatureDewPoint   : num [1:243] 19.1 18.3 18 17.1 15.5 ...
##   .. ..$ uvIndex               : int [1:243] 0 0 0 0 0 0 0 0 0 1 ...
##   .. ..$ visibility            : num [1:243] 24529 25592 23026 22865 25037 ...
##   .. ..$ windDirection         : int [1:243] 232 188 235 285 278 290 283 308 288 287 ...
##   .. ..$ windGust              : num [1:243] 0.83 1.93 2.2 2.33 3.16 ...
##   .. ..$ windSpeed             : num [1:243] 0.24 1.06 2.2 2.33 3.16 3.58 2.19 2.98 3.58 7.27 ...
##  $ forecastNextHour:List of 6
##   ..$ name         : chr "NextHourForecast"
##   ..$ metadata     :List of 9
##   .. ..$ attributionURL: chr "https://weather-data.apple.com/legal-attribution.html"
##   .. ..$ expireTime    : chr "2022-07-03T15:01:44Z"
##   .. ..$ language      : chr "en-US"
##   .. ..$ latitude      : num 43.3
##   .. ..$ longitude     : num -70.9
##   .. ..$ providerName  : chr "US National Weather Service"
##   .. ..$ readTime      : chr "2022-07-03T13:01:43Z"
##   .. ..$ units         : chr "m"
##   .. ..$ version       : int 1
##   ..$ summary      :'data.frame':    1 obs. of  4 variables:
##   .. ..$ startTime             : chr "2022-07-03T13:02:00Z"
##   .. ..$ condition             : chr "clear"
##   .. ..$ precipitationChance   : num 0
##   .. ..$ precipitationIntensity: num 0
##   ..$ forecastStart: chr "2022-07-03T13:02:00Z"
##   ..$ forecastEnd  : chr "2022-07-03T14:20:00Z"
##   ..$ minutes      :'data.frame':    78 obs. of  3 variables:
##   .. ..$ startTime             : chr [1:78] "2022-07-03T13:02:00Z" "2022-07-03T13:03:00Z" "2022-07-03T13:04:00Z" "2022-07-03T13:05:00Z" ...
##   .. ..$ precipitationChance   : num [1:78] 0 0 0 0 0 0 0 0 0 0 ...
##   .. ..$ precipitationIntensity: num [1:78] 0 0 0 0 0 0 0 0 0 0 ...
```

## weatherkit Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| HTML |        1 | 0.04 | 306 | 0.32 |          35 | 0.13 |        2 | 0.01 |
| R    |        9 | 0.32 | 129 | 0.13 |          54 | 0.20 |       71 | 0.24 |
| YAML |        2 | 0.07 |  35 | 0.04 |          10 | 0.04 |        2 | 0.01 |
| Rmd  |        2 | 0.07 |  15 | 0.02 |          38 | 0.14 |       72 | 0.24 |
| SUM  |       14 | 0.50 | 485 | 0.50 |         137 | 0.50 |      147 | 0.50 |

clock Package Metrics for weatherkit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
