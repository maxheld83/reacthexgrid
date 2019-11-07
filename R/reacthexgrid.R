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
        hexagon(q = 0, r = -1, s = 1),
        hexagon(q = 0, r = 1, s = -1),
        hexagon(q = 1, r = -1, s = 0),
        hexagon(q = 1, r = 0, s = -1),
        hexagon(q = -1, r = 1, s = 0),
        hexagon(q = -1, r = 0, s = 1),
        hexagon(q = -2, r = 0, s = 1)
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


#' Create Hexagon Component
#'
#' @param ... child components
#'
#' @param q,r,s `[integer()]` giving axial coordinates, see [readblobgames](https://www.redblobgames.com/grids/hexagons/).
#' The axial coordinates are unitless integers; they need not correspond the SVG coordinate system of [Hexagon()].
#'
#' @family components
#'
#' @export
hexagon <- function(..., q, r, s) {
  # TODO input validation
  reactR::React$Hexagon(q = q, r = r, s = s, ...)
}

#' Create Layout Component
#'
#' @param ... child components
#'
#' @param size `[list(x = integer(), y = integer())]` giving sizes of the individual hexagons, relative to `viewBox` of the [hexgrid()].
#'
#' @param flat `[logical(1)]` giving whether the hexagons should flat (`TRUE`) or pointy-topped (`FALSE`).
#'
#' @param spacing `[numeric(1)]` giving the spacing between the hexagons as a *multiple* of `size` (probably; this is undocumented in the upstream library.)
#' Must be greater than 1 to avoid overplotting
#'
#' @param origin `[list(x = integer(), y = integer())]` giving the origin from which to draw the [hexgrid()] given the axial coordinates of [hexagon()]s.
#'
#' @family components
#'
#' @export
layout <- function(...,
                   size = list(x = 10, y = 10),
                   flat = TRUE,
                   spacing = 1.1,
                   origin = list(x = 0, y = 0)) {
  # TODO input validation
  reactR::React$Layout(
    size = size,
    flat = flat,
    spacing = spacing,
    origin = origin,
    ...
  )
}

#' Create Layout Component
#'
#' @param ... child components
#'
#' @param width,height `[integer(1)]` giving width and height of [outermost svg element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/svg) viewport, expressed in percentage of parent element or CSS length units.
#'
#' @param viewBox `[character(1)]` giving the cartesian dimensions of the [SVG viewport](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox) as four whitespace-separated numbers `"min-x min-y width height"`.
#'
#' @family components
#'
#' @export
hexgrid <- function(...,
                    width = "100%",
                    height = "100%",
                    viewBox = "-50 -50 100 100") {
  reactR::React$HexGrid(width = width, height = height, viewBox = viewBox, ...)
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
