#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
archaeopteryx <- function(treestring, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    treestring=treestring
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'archaeopteryx',
    x,
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
       tags$div(id = "controls0", class='ui-widget-content'))
       # tags$div(id   = sprintf("phylogram", id),
       #          style = sprintf("width:%s", width),
       #          class = sprintf("%s-widget-content ui-widget-content", class),
       #          HTML(sprintf("<center><label style='padding-right:5px' for='%s-select'></label><select id='%s-select' style='visibility:visible;'></select></center>", id, id))))
}

