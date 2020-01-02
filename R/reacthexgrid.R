#' Create hexagon grid
#'
#' Wraps the [react-hexgrid](https://www.npmjs.com/package/react-hexgrid) library.
#'
#' @import htmlwidgets
#'
#' @inheritParams htmlwidgets::createWidget
#'
#' @family wrappers
#'
#' @export
reacthexgrid <- function(width = NULL, height = NULL, elementId = NULL) {
  component <- reactR::reactMarkup(
    hexgrid(
      layout(
        hexagon(q = 0, r = 0, s = 0),
        hexagon(q = 0, r = -1, s = 1, fill = "pat-1")
        # hexagon(q = 0, r = 1, s = -1),
        # hexagon(
        #   # text(x = "1, -1, 0"),
        #   q = 1,
        #   r = -1,
        #   s = 0
        # ),
        # hexagon(q = 1, r = 0, s = -1),
        # hexagon(q = -1, r = 1, s = 0),
        # hexagon(q = -1, r = 0, s = 1),
        # hexagon(q = -2, r = 0, s = 1)
      ),
      # pattern(id = "pat-1", link = "index_files/empl_mistakes.svg")
      # pattern(id = "pat-1", link = "index_files/cat.jpeg"),
      htmltools::tag(
        `_tag_name` = "defs",
        varArgs = list(
          htmltools::tag(
            `_tag_name` = "pattern",
            varArgs = list(
              id = "pat-1",
              patternContentUnits = "objectBoundingBox",
              width = "100%",
              height = "100%",
              # viewBox = "0 0 1 1",
              # preserveAspectRatio = "xMidYMid slice",
              htmltools::tag(
                `_tag_name` = "image",
                varArgs = list(
                  `xlink:href` = "index_files/empl_mistakes.svg",
                  width = "1",
                  height = "1",
                  preserveAspectRatio = "none"
                )
              )
            )
          )
        )
      )
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'reacthexgrid',
    component,
    width = width,
    height = height,
    package = 'reacthexgrid',
    elementId = elementId
  )
}


#' Shiny bindings for reacthexgrid
#'
#' Output and render functions for using reacthexgrid within Shiny
#' applications and interactive Rmd documents.
#'
#' @inheritParams htmlwidgets::shinyWidgetOutput
#' @param expr An expression that generates a reacthexgrid
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name reacthexgrid-shiny
#'
#' @export
reacthexgridOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'reacthexgrid', width, height, package = 'reacthexgrid')
}

#' @rdname reacthexgrid-shiny
#' @export
renderReacthexgrid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, reacthexgridOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @param id,style,class attributes of the widget's root element
#' @inheritDotParams htmltools::tagList
#' @rdname reacthexgrid-shiny
reacthexgrid_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style, ...)
  )
}
