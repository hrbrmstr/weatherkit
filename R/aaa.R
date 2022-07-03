httr::user_agent(
  sprintf(
    "weatherkit R package v%s: (<%s>)",
    utils::packageVersion("weatherkit"),
    utils::packageDescription("weatherkit")$URL
  )
) -> .WEATHERKIT_UA