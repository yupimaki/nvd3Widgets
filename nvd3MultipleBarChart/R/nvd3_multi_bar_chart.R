#' nvd3 - Multiple Bar Chart
#'
#' Takes several streams of data to create a multiple bar chart using nvd3
#'
#' @import htmlwidgets
#'
#' @export
nvd3_multi_bar_chart <- function(data, label, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = data,
    label = list(
      x = label$x,
      y = label$y
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'nvd3_multi_bar_chart',
    x = x,
    width = width,
    height = height,
    package = 'nvd3MultipleBarChart'
  )
}

#' Shiny bindings for nvd3_multi_bar_chart
#'
#' Output and render functions for using nvd3_multi_bar_chart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a nvd3_multi_bar_chart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name nvd3_multi_bar_chart-shiny
#'
#' @export
nvd3_multi_bar_chartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'nvd3_multi_bar_chart', width, height, package = 'nvd3MultipleBarChart')
}

#' @rdname nvd3_multi_bar_chart-shiny
#' @export
renderNvd3_multi_bar_chart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, nvd3_multi_bar_chartOutput, env, quoted = TRUE)
}

