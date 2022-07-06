#' Convert from Celsius to Fahrenheit
#'
#' @importFrom weathermetrics celsius.to.fahrenheit
#' @inherit weathermetrics::celsius.to.fahrenheit
#' @return double
#' @export
celsius_to_fahrenheit <- weathermetrics::celsius.to.fahrenheit

#' @rdname celsius_to_fahrenheit
#' @export
C2F <- celsius_to_fahrenheit

#' Convert from Fahrenheit to Celsius
#'
#' @importFrom weathermetrics fahrenheit.to.celsius
#' @inherit weathermetrics::fahrenheit.to.celsius
#' @return double
#' @export
fahrenheit_to_celsius <- weathermetrics::fahrenheit.to.celsius

#' @rdname fahrenheit_to_celsius
#' @export
F2C <- fahrenheit_to_celsius

#' Calculate relative humidity
#'
#' @importFrom weathermetrics dewpoint.to.humidity
#' @inherit weathermetrics::dewpoint.to.humidity
#' @return double
#' @export
dewpoint_to_humidity <- weathermetrics::dewpoint.to.humidity

#' @rdname dewpoint_to_humidity
#' @export
D2H <- dewpoint_to_humidity

#' Calculate dew point temperature
#'
#' @importFrom weathermetrics dewpoint.to.humidity
#' @inherit weathermetrics::humidity.to.dewpoint
#' @return double
#' @export
humidity_to_dewpoint <- weathermetrics::humidity.to.dewpoint

#' @rdname humidity_to_dewpoint
#' @export
H2D <- humidity_to_dewpoint

#' Convert between standard metric units of measure for precipitation to inches
#'
#' @importFrom weathermetrics metric_to_inches
#' @inherit weathermetrics::metric_to_inches
#' @return double
#' @export
metric_to_inches <- weathermetrics::metric_to_inches

#' @rdname metric_to_inches
#' @export
M2I <- metric_to_inches

#' Convert from inches to standard metric units of measure for precipitation
#'
#' @importFrom weathermetrics inches_to_metric
#' @inherit weathermetrics::inches_to_metric
#' @export
inches_to_metric <- weathermetrics::inches_to_metric

#' @rdname inches_to_metric
#' @export
I2M <- inches_to_metric

#' Convert between wind speed metrics
#'
#' @importFrom weathermetrics convert_wind_speed
#' @inherit weathermetrics::convert_wind_speed
#' @export
convert_wind_speed <- weathermetrics::convert_wind_speed
