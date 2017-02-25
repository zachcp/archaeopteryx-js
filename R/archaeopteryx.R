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

  # annotate nodes
  phyJ <- annotate_tree(phyJ)

  # nodeVisualizations['nodenum'] = {
  #   label: 'nodenum',
  #   description: 'the host of the virus',
  #   field: null,
  #   cladeRef: decorator + 'nodenum',
  #   regex: false,
  #   shapes: ['square', 'diamond', 'triangle-up', 'triangle-down', 'cross', 'circle'],
  #   colors: 'category20',
  #   sizes: null
  # };

  nodeviz <- list()

  nodeviz["nodenum"] <-
    list(nodenum=list(
      label="nodenum",
      description="the host of the virus",
      field=NULL,
      cladeRef=paste0("ref:nodenum"),
      regex = FALSE,
      shapes =list('square', 'diamond', 'triangle-up', 'triangle-down', 'cross', 'circle'),
      colors = 'category20',
      sizes = NULL))



  #jsonlite::toJSON(nodeviz, auto_unbox = T, null = 'null')



  # forward options using x
  params = list(
    treestring=write_phyloXML(phyJ),
    nodevisualizations = nodeviz
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
       tags$div(id = "phylogram1"),
       tags$div(id = "controls0", class='ui-widget-content'),
       tags$div(id = "controls1", class='ui-widget-content'))
}

