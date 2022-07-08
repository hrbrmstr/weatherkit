#' @name command_line_forecast_script
#' @title Command Line Forecast Script
#' @description How to use the batteries-included command line forecast script
#' @details
#' This package ships with a batteries-included command line forecast script
#' that you can use to display a current conditions, hourly forecast, and daily
#' forecast.
#'
#' It is highly suggested you alias or shove the following into a script that you
#' then run it via:
#'
#' ```
#' Rscript $(Rscript -e "cat(system.file('scripts', 'wx.R', package='weatherkit'))") --lat 43.2 --lon -70.8 --lang en --iso2c US
#' ````
#'
#' The inner call to `Rscript` (assuming it is on your `PATH`) finds the path to the installed
#' script. The second one calls it with set parameters. All parameters default to
#' ones I care about since it's my package. 😎
#'
#' It will look something like this:
#'
#' \if{html}{
#' \figure{sample-forecast.png}{options: width="100\%" alt="Figure: sample-forecast.png"}
#' }
#'
#' \if{latex}{
#' \figure{sample-forecast.png}{options: width=10cm}
#' }
NULL