% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/temps.R
\name{convert_wind_speed}
\alias{convert_wind_speed}
\title{Convert between wind speed metrics}
\usage{
convert_wind_speed(wind_speed, old_metric, new_metric, round = 1)
}
\arguments{
\item{wind_speed}{A numerical vector of wind speeds to be converted.}

\item{old_metric}{The metric from which you want to convert. Possible options
are:
\itemize{
      \item \code{knots}: Knots
      \item \code{mph}: Miles per hour
      \item \code{mps}: Meters per second
      \item \code{ftps}: Feet per second
      \item \code{kmph}: Kilometers per hour
}}

\item{new_metric}{The metric to which you want to convert. The same options
are possible as for \code{old_metric}.}

\item{round}{An integer indicating the number of decimal places to
round the converted value.}
}
\value{
A numeric vector with wind speed converted to the metric specified
   by the argument \code{new_metric}.
}
\description{
This function allows you to convert among the following wind speed metrics:
knots,  miles per hour, meters per second, feet per second, and kilometers per
hour.
}
\examples{
data(beijing)
beijing$knots <- convert_wind_speed(beijing$kmph,
   old_metric = "kmph", new_metric = "knots")
beijing

data(foco)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mph", round = 0)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mps", round = NULL)
foco$kmph <- convert_wind_speed(foco$mph, old_metric = "mph",
   new_metric = "kmph")
foco
}
\author{
Joshua Ferreri \email{joshua.m.ferreri@gmail.com},
Brooke Anderson \email{brooke.anderson@colostate.edu}
}
