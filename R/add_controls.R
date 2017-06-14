#' add_controls
#'
#' add_controls to the archaeopteryx htmlwidget
#'
#' @param arch Required.
#' @param control Optional. Default \code{"maincontrols"}. Can be either "maincontrols or "colorcontrols".
#' @export
add_controls <- function(arch, controls="maincontrols") {

  if (controls == "maincontrols") {

    arch$x$maincontrols <- "visible"

  } else if (controls == "colorcontrols") {

    arch$x$colorcontrols <- "visible"

  } else {

    stop("invalid control option.")
  }

  arch

}
