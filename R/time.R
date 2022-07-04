#' Format a Datetime object: ISO 8601
#'
#' @name iso8601
#' @rdname iso8601
#' @export
#' @importFrom anytime iso8601
#' @usage iso8601(anytime("2016-09-01 10:11:12.123456"))
#' @param pt A `POSIXt` Datetime or a `Date` object
#' @return A character object formatted according to ISO 8601
NULL

#' Parse POSIXct or Date objects from input data
#'
#' These function use the Boost Date_Time library to parse datetimes
#' (and dates) from strings, integers, factors or even numeric values
#' (which are cast to strings internally). They return a vector of
#' POSIXct objects (or Date objects in the case of anydate). POSIXct
#' objects represent dates and time as (possibly fractional) seconds
#' since the ‘epoch’ of January 1, 1970. A timezone can be set, if
#' none is supplied ‘UTC’ is set.
#'
#' @name anytime
#' @rdname anytime
#' @export
#' @importFrom anytime anytime
#' @usage anytime("2016-09-01 10:11:12.123456")
#' @param x A vector of type character, integer or numeric with date(time)
#' expressions to be parsed and converted.
#' @param tz A string with the timezone, defaults to the result of the (internal)
#' \code{getTZ} function if unset. The \code{getTZ} function returns the timezone
#' values stored in local package environment, and set at package load time. Also
#' note that this argument applies to the \emph{output}: the returned object will
#' have this timezone set. The timezone is \emph{not} used for the parsing which
#' will always be to localtime, or to UTC is the \code{asUTC} variable is set (as
#' it is in the related functions \code{\link{utctime}} and \code{\link{utcdate}}).
#' So one can think of the argument as \sQuote{shift parsed time object to this
#' timezone}. This is similar to what \code{format()} in base R does, but our
#' return value is still a \code{POSIXt} object instead of a character value.
#' @param asUTC A logical value indicating if parsing should be to UTC; default
#' is false implying localtime.
#' @param useR A logical value indicating if conversion should be done via code
#' from R (via \code{Rcpp::Function}) instead of the default Boost routines. The
#' default value is the value of the option \code{anytimeUseRConversions} with a
#' fallback of \code{FALSE} if the option is unset. In other words, this will
#' be false by default but can be set to true via an option.
#' @param oldHeuristic A logical value to enable behaviour as in version 0.2.2 or earlier:
#' interpret a numeric or integer value that could be seen as a YYYYMMDD as a date. If
#' the default value \code{FALSE} is seen, then numeric values are used as offsets
#' dates (in \code{anydate} or \code{utcdate}), and as second offsets for datetimes
#' otherwise. A default value can also be set via the \code{anytimeOldHeuristic} option.
#' @param calcUnique A logical value with a default value of \code{FALSE} that tells the
#' function to perform the \code{anytime()} or \code{anydate()} calculation only once for
#' each unique value in the \code{x} vector. It results in no difference in inputs or
#' outputs, but can result in a significant speed increases for long vectors where each
#' timestamp appears more than once. However, it will result in a slight slow down for
#' input vectors where each timestamp appears only once.
#' @return A vector of POSIXct elements, or, in the case of anydate, a vector of Date objects.
NULL

#' Parse POSIXct or Date objects from input data
#'
#' These function use the Boost Date_Time library to parse datetimes
#' (and dates) from strings, integers, factors or even numeric values
#' (which are cast to strings internally). They return a vector of
#' POSIXct objects (or Date objects in the case of anydate). POSIXct
#' objects represent dates and time as (possibly fractional) seconds
#' since the ‘epoch’ of January 1, 1970. A timezone can be set, if
#' none is supplied ‘UTC’ is set.
#'
#' @name anydate
#' @rdname anydate
#' @export
#' @importFrom anytime anydate
#' @usage anydate("2016-09-01")
#' @param x A vector of type character, integer or numeric with date(time)
#' expressions to be parsed and converted.
#' @param tz A string with the timezone, defaults to the result of the (internal)
#' \code{getTZ} function if unset. The \code{getTZ} function returns the timezone
#' values stored in local package environment, and set at package load time. Also
#' note that this argument applies to the \emph{output}: the returned object will
#' have this timezone set. The timezone is \emph{not} used for the parsing which
#' will always be to localtime, or to UTC is the \code{asUTC} variable is set (as
#' it is in the related functions \code{\link{utctime}} and \code{\link{utcdate}}).
#' So one can think of the argument as \sQuote{shift parsed time object to this
#' timezone}. This is similar to what \code{format()} in base R does, but our
#' return value is still a \code{POSIXt} object instead of a character value.
#' @param asUTC A logical value indicating if parsing should be to UTC; default
#' is false implying localtime.
#' @param useR A logical value indicating if conversion should be done via code
#' from R (via \code{Rcpp::Function}) instead of the default Boost routines. The
#' default value is the value of the option \code{anytimeUseRConversions} with a
#' fallback of \code{FALSE} if the option is unset. In other words, this will
#' be false by default but can be set to true via an option.
#' @param oldHeuristic A logical value to enable behaviour as in version 0.2.2 or earlier:
#' interpret a numeric or integer value that could be seen as a YYYYMMDD as a date. If
#' the default value \code{FALSE} is seen, then numeric values are used as offsets
#' dates (in \code{anydate} or \code{utcdate}), and as second offsets for datetimes
#' otherwise. A default value can also be set via the \code{anytimeOldHeuristic} option.
#' @param calcUnique A logical value with a default value of \code{FALSE} that tells the
#' function to perform the \code{anytime()} or \code{anydate()} calculation only once for
#' each unique value in the \code{x} vector. It results in no difference in inputs or
#' outputs, but can result in a significant speed increases for long vectors where each
#' timestamp appears more than once. However, it will result in a slight slow down for
#' input vectors where each timestamp appears only once.
#' @return A vector of POSIXct elements, or, in the case of anydate, a vector of Date objects.
NULL
