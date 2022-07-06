#' @name condition_codes
#' @title Condition Codes
#' @description seen in `conditionCode` list objects
#' @details
#'
#' - `Clear`
#' - `Cloudy`
#' - `Dust`
#' - `Fog`
#' - `Haze`
#' - `MostlyClear`
#' - `MostlyCloudy`
#' - `PartlyCloudy`
#' - `ScatteredThunderstorms`
#' - `Smoke`
#' - `Breezy`
#' - `Windy`
#' - `Drizzle`
#' - `HeavyRain`
#' - `Rain`
#' - `Showers`
#' - `Flurries`
#' - `HeavySnow`
#' - `MixedRainAndSleet`
#' - `MixedRainAndSnow`
#' - `MixedRainfall`
#' - `MixedSnowAndSleet`
#' - `ScatteredShowers`
#' - `ScatteredSnowShowers`
#' - `Sleet`
#' - `Snow`
#' - `SnowShowers`
#' - `Blizzard`
#' - `BlowingSnow`
#' - `FreezingDrizzle`
#' - `FreezingRain`
#' - `Frigid`
#' - `Hail`
#' - `Hot`
#' - `Hurricane`
#' - `IsolatedThunderstorms`
#' - `SevereThunderstorm`
#' - `Thunderstorm`
#' - `Tornado`
#' - `TropicalStorm`
#'
#' @export
#' @docType data
condition_codes <- c(
  "Clear", "Cloudy", "Dust", "Fog", "Haze", "MostlyClear", "MostlyCloudy",
  "PartlyCloudy", "ScatteredThunderstorms", "Smoke", "Breezy", "Windy",
  "Drizzle", "HeavyRain", "Rain", "Showers", "Flurries", "HeavySnow",
  "MixedRainAndSleet", "MixedRainAndSnow", "MixedRainfall", "MixedSnowAndSleet",
  "ScatteredShowers", "ScatteredSnowShowers", "Sleet", "Snow", "SnowShowers",
  "Blizzard", "BlowingSnow", "FreezingDrizzle", "FreezingRain", "Frigid",
  "Hail", "Hot", "Hurricane", "IsolatedThunderstorms", "SevereThunderstorm",
  "Thunderstorm", "Tornado", "TropicalStorm"
)

set_names(c(
  "Clear", "Cloudy", "Dust", "Fog", "Haze", "Mostly Clear", "Mostly Cloudy",
  "Partly Cloudy", "Scattered Thunderstorms", "Smoke", "Breezy", "Windy",
  "Drizzle", "Heavy Rain", "Rain", "Showers", "Flurries", "Heavy Snow",
  "Mixed Rain & Sleet", "Mixed Rain & Snow", "Mixed Rainfall", "Mixed Snow & Sleet",
  "Scattered Showers", "Scattered Snow Showers", "Sleet", "Snow", "Snow Showers",
  "Blizzard", "Blowing Snow", "Freezing Drizzle", "FreezingRain", "Frigid",
  "Hail", "Hot", "Hurricane", "Isolated Thunderstorms", "Severe Thunderstorm",
  "Thunderstorm", "Tornado", "Tropical Storm"
), condition_codes) -> conditions_with_spaces

#' Turns Apple's smushed together condition code strings into proper words/phrases
#'
#' @param condition_code character vector
#' @return character vector
#' @export
readable_conditions <- function(condition_code) {
  conditions_with_spaces[condition_code]
}