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

#' Create Text Component
#'
#' @param x `[character(1)]` giving a string to be shown inside the hexagons.
#'
#' @family components
#'
#' @export
text <- function(x = NULL) {
  reactR::React$Text(x)
}