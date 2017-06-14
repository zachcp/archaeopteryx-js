#' add_controls
#'
#' add_controls to the archaeopteryx htmlwidget
#'
#' @param arch Required.
#' @param control Optional. Default \code{"maincontrols"}. Can be either "maincontrols or "colorcontrols".
#' @export
add_controls <- function(arch, control="maincontrols") {

  if (control == "maincontrols") {

    arch$x$maincontrols <- "visible"
    print("makign visible")

  } else if (control == "colorcontrols") {

    arch$x$colorcontrols <- "visible"

  } else {

    stop("invalid control option.")
  }

  arch

}
