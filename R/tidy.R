#' Tidy values in weather data
#'
#' @param wx object returned by [wxkit_weather()]
#' @export
#' @examples
#' wx_tidy(wxkit_weather(43.2683199, -70.8635506))
wx_tidy <- function(wx) {

  if (hasName(wx, "currentWeather")) {

    wx$currentWeather$asOf <-
      anytime::anytime(wx$currentWeather$asOf)

    if (hasName(wx$currentWeather, "metadata")) {

      c(
        "expireTime", "readTime", "reportedTime"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$currentWeather$metadata[[field]] <-
          anytime::anytime(wx$currentWeather$metadata[[field]])
      }

    }

  }

  if (hasName(wx, "forecastDaily")) {

    if (hasName(wx$forecastDaily, "metadata")) {

      c(
        "expireTime", "readTime", "reportedTime"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$forecastDaily$metadata[[field]] <-
          anytime::anytime(wx$forecastDaily$metadata[[field]])
      }

    }

    if (hasName(wx$forecastDaily, "days") &&
        inherits(wx$forecastDaily$days, "data.frame")) {

      c(
        "forecastStart", "forecastEnd", "moonrise", "moonset",
        "solarMidnight", "solarNoon", "sunrise", "sunriseCivil",
        "sunriseNautical", "sunriseAstronomical", "sunset",
        "sunsetCivil", "sunsetNautical", "sunsetAstronomical"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$forecastDaily$days[[field]] <- anytime::anytime(wx$forecastDaily$days[[field]])
      }

      if (hasName(wx$forecastDaily$days, "daytimeForecast") &&
          inherits(wx$forecastDaily$days$daytimeForecast, "data.frame")) {

        c(
          "forecastStart", "forecastEnd"
        ) -> posixct_fields

        for (field in posixct_fields) {
          wx$forecastDaily$days$daytimeForecast[[field]] <-
            anytime::anytime(wx$forecastDaily$days$daytimeForecast[[field]])
        }

      }

      if (hasName(wx$forecastDaily$days, "overnightForecast") &&
          inherits(wx$forecastDaily$days$overnightForecast, "data.frame")) {

        c(
          "forecastStart", "forecastEnd"
        ) -> posixct_fields

        for (field in posixct_fields) {
          wx$forecastDaily$days$overnightForecast[[field]] <-
            anytime::anytime(wx$forecastDaily$days$overnightForecast[[field]])
        }

      }

      if (hasName(wx$forecastDaily$days, "restOfDayForecast") &&
          inherits(wx$forecastDaily$days$restOfDayForecast, "data.frame")) {

        c(
          "forecastStart", "forecastEnd"
        ) -> posixct_fields

        for (field in posixct_fields) {
          wx$forecastDaily$days$restOfDayForecast[[field]] <-
            anytime::anytime(wx$forecastDaily$days$restOfDayForecast[[field]])
        }

      }

    }
  }

  if (hasName(wx, "forecastHourly")) {

    if (hasName(wx$forecastHourly, "metadata")) {

      c(
        "expireTime", "readTime", "reportedTime"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$forecastHourly$metadata[[field]] <-
          anytime::anytime(wx$forecastHourly$metadata[[field]])
      }

    }

    if (hasName(wx$forecastHourly, "hours") &&
        inherits(wx$forecastHourly$hours, "data.frame")) {

      c(
        "forecastStart"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$forecastHourly$hours[[field]] <-
          anytime::anytime(wx$forecastHourly$hours[[field]])
      }

    }
  }

  if (hasName(wx, "forecastNextHour")) {

    if (hasName(wx$forecastNextHour, "metadata")) {

      c(
        "expireTime", "readTime"
      ) -> posixct_fields

      for (field in posixct_fields) {
        wx$forecastNextHour$metadata[[field]] <-
          anytime::anytime(wx$forecastNextHour$metadata[[field]])
      }

    }


    if (hasName(wx$forecastNextHour, "summary")) {
      wx$forecastNextHour$summary$startTime <-
        anytime::anytime(wx$forecastNextHour$summary$startTime)
    }

    if (hasName(wx$forecastNextHour, "forecastStart")) {
      wx$forecastNextHour$forecastStart <-
        anytime::anytime(wx$forecastNextHour$forecastStart)
    }

    if (hasName(wx$forecastNextHour, "forecastEnd")) {
      wx$forecastNextHour$forecastEnd <-
        anytime::anytime(wx$forecastNextHour$forecastEnd)
    }

    if (hasName(wx$forecastNextHour, "minutes")) {
      wx$forecastNextHour$minutes$startTime <-
        anytime::anytime(wx$forecastNextHour$minutes$startTime)
    }

  }

  wx

}
