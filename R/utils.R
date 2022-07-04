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
