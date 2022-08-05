#' Returns the full path to the installed SVG weather icons
#'
#' @return character vector
#' @export
#' @examples
#' list.files(wx_icons_path())
wx_icons_path <- function() system.file("wx-icons", package = "weatherkit")

#' Preview the included SVG weather icons
#'
#' @export
#' @examples
#' wx_icons_preview()
wx_icons_preview <- function() {

  list.files(
    path = wx_icons_path(),
    full.names = TRUE
  ) -> icons

  htmltools::html_print(htmltools::HTML(sprintf(
    "<li><span style='margin:auto'><div style='height:30px; width:30px; display:inline-block;'>%s</div> <code>%s</code></span></li>",
    sapply(icons, function(f) paste0(readLines(f, warn = FALSE), collapse = "\n")),
    sans_ext(basename(icons))
  )))

}