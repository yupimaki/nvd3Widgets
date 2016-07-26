#' Line Chart
#'
#' Line Chart
#'
#' @import htmlwidgets
#'
#' @export
nvd3LineChart <- function(data, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = data
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'nvd3LineChart',
    x,
    width = width,
    height = height,
    package = 'nvd3LineChart',
    elementId = elementId
  )
}

#' Shiny bindings for nvd3LineChart
#'
#' Output and render functions for using nvd3LineChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a nvd3LineChart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name nvd3LineChart-shiny
#'
#' @export
nvd3LineChartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'nvd3LineChart', width, height, package = 'nvd3LineChart')
}

#' @rdname nvd3LineChart-shiny
#' @export
renderNvd3LineChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, nvd3LineChartOutput, env, quoted = TRUE)
}
