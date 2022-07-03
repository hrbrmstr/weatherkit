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
