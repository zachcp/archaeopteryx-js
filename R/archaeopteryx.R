#' archaeopteryx
#'
#' create an interactive HTML widget using the archaeopteryx JS library
#'
#' @param  phyJ Required.  A \link{phyloJ} class object.
#' @param width Optional. HTMLWidget width.
#' @param height Optional. HTMLWidget height.
#' @param elementID Optional. DOM element.
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @seealso \url{https://sites.google.com/site/cmzmasek/home/software/archaeopteryx-js}
#' @export
archaeopteryx <- function(phyJ, width = NULL, height = NULL, elementId = NULL) {

  if (!inherits(phyJ, "phyloJ")) stop("you must use a phyloJ object to use this function")

  # annotate nodes and create corresponding node vizualizations

  phyJ    <- annotate_tree(phyJ)
  nodeviz <- create_node_visualizations(phyJ)

  # forward options using x
  params = list(
    treestring = write_phyloXML(phyJ),
    nodevisualizations = nodeviz,
    maincontrols = "hidden",
    colorcontrols = "hidden",
    width = width,
    height = height,
    options = get_default_options(),
    settings = get_default_settings()
  )

  # customize toJSON() argument values
  attr(params, 'TOJSON_ARGS') <- list(auto_unbox = TRUE, null = 'null')

  # create widget
  htmlwidgets::createWidget(
    name = 'archaeopteryx',
    x = params,
    width = width,
    height = height,
    package = 'archaeopteryx',
    elementId = elementId
  )
}

#' Shiny bindings for archaeopteryx
#'
#' Output and render functions for using archaeopteryx within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a archaeopteryx
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name archaeopteryx-shiny
#'
#' @export
archaeopteryxOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'archaeopteryx', width, height, package = 'archaeopteryx')
}

#' @rdname archaeopteryx-shiny
#' @export
renderArchaeopteryx <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, archaeopteryxOutput, env, quoted = TRUE)
}



archaeopteryx_html <- function(id, style, class, width, height, ...) {
  list(tags$div(id = id, class = class, style = style),
       tags$div(id = sprintf("%s-controls0", id), style='visibility:hidden;', class='ui-widget-content'),
       tags$div(id = sprintf("%s-controls1", id), style='visibility:hidden;', class='ui-widget-content'))

}



