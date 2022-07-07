hasName <- \(x, name) match(name, names(x), nomatch = 0L) > 0L

sans_ext <- \(x, compression = FALSE) {
  if (compression)x <- sub("[.](gz|bz2|xz)$", "", x)
  sub("([^.]+)\\.[[:alnum:]]+$", "\\1", x)
}

as_posixct_from_utc <- function(x) {
  as.POSIXct(
    x = x,
    format = "%Y-%m-%dT%H:%M:%SZ",
    tz = "GMT"
  )
}

is_posixct <- \(x) inherits(x, "POSIXct")
is_posixlt <- \(x) inherits(x, "POSIXlt")

#' Get date-time in a different time zone
#'
#' Returns a date-time as it would appear in a different time zone. The actual moment
#' of time measured does not change, just the time zone it is measured in. with_tz
#' defaults to the Universal Coordinated time zone (UTC) when an unrecognized time
#' zone is inputted. See [Sys.timezone()] for more information on how R recognizes time
#' zones.
#'
#' @note Lifted from lubridate internals.
#' @param time a POSIXct, POSIXlt, Date, chron date-time object.
#' @param tzone a character string containing the time zone to convert to. R must
#'        recognize the name contained in the string as a time zone on your system.
#' @export
with_tz <- function(time, tzone = "") {

  out <- if (!is_posixct(time)) as.POSIXct(time) else time

  attr(out, "tzone") <- tzone

  if (is_posixlt(time)) out <- as.POSIXlt(out)

  out

}

make_jwt <- function(time_delta = 60*60*5, auth_components = wxkit_auth()) {

  now <- Sys.time()

  jose::jwt_encode_sig(

    claim = jose::jwt_claim(
      iss = auth_components[["team_id"]],
      iat = as.numeric(now),
      exp = as.numeric(now + time_delta),
      sub = auth_components[["service_id"]]
    ),

    key = openssl::read_key(auth_components[["private_key_path"]]),

    size = 256,

    header = list(
      alg = "ES256",
      kid = auth_components[["key_id"]],
      id = sprintf("%s.%s", auth_components[["team_id"]], auth_components[["service_id"]])
    )

  )
}

#' Create a sequence from a value range
#'
#' @param vals vector of values
#' @param by See [seq()]
#' @param na.rm remove `NA`'s? Default: `TRUE`
#' @param ... passed to [seq()] call
#' @export
seq_rng <- function(vals, by=1, na.rm = TRUE, ...) {
  r <- range(vals, na.rm=na.rm)
  seq(r[1], r[2], by=by, ...)
}

#' UV index to label
#'
#' @param uv_index uv index level
#' @param swatch if `TRUE` (default is `FALSE`) a color swatch emoji
#'        will be returned instead of the text label. 🟩 = `Low`, 🟨 = `Moderate`, 🟧 = `High`,
#'        🟥 = `Very High`,🟪 = `Extreme`
#' @return character vector
#' @export
uv_label <- function(uv_index, swatch = FALSE) {

  c(
    "Low" = "🟩",
    "Moderate" = "🟨",
    "High" = "🟧",
    "Very High" = "🟥",
    "Extreme" = "🟪"
  ) -> swatches

  ifelse(
    test = (uv_index < 3),
    yes = "Low",
    no = ifelse(
      test = (uv_index < 6),
      yes = "Moderate",
      no = ifelse (
        test = (uv_index < 8),
        yes = "High",
        no = ifelse(
          test = (uv_index < 11),
          yes = "Very High",
          no = "Extreme"
        )
      )
    )
  ) -> res

  if (swatch) swatches[res] else res

}

#' Converts `pressureTrend` string values to symbols
#'
#' @param trend `pressureTrend` character vector
#' @return character vector
#' @export
pressure_trend <- function(trend) {

  ifelse(
    test = (trend == "rising"),
    yes = "↑",
    no = ifelse(
      test = (trend == "falling"),
      yes = "↓",
      no = "—"
    )
  )

}

#' Converts `precipitationType` string values to symbols
#'
#' @param precip `precipitationType` character vector
#' @param daylight `daylight` string logical
#' @return character vector
#' @export
precip_type <- function(precip, daylight) {

    ifelse(
      test = (precip == "hail"),
      yes = "🧊",
      no = ifelse(
        test = (precip == "mixed"),
        yes = "🌂",
        no = ifelse(
          test = (precip == "sleet"),
          yes = "⛆",
          no = ifelse(
            test = (precip == "snow"),
            yes = "❄️",
            no = ifelse(
              test = daylight,
              yes = "☀️",
              no = "🌕"
            )
          )
        )
      )
    )

}

#' Convert meters to miles
#'
#' @param meters numeric
#' @param round round the return value? Default: `TRUE`
#' @return numeric
#' @export
meters_to_miles <- function(meters, round = TRUE) {
  miles <- meters * 0.000621
  if (round) round(miles) else miles
}