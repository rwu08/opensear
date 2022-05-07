
#' OpenSea official colors
opensea_colors <- c(
  `dark sea` = "#1868B7",
  `sea blue` = "#2081E2",
  `marina blue` = "#E2E6EF",
  `aqua` = "#2BCDE4"
)

#' Function to extract OpenSea colors as hex codes
#' @param ... Character names of opensea_colors
opensea_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(opensea_colors)
  }

  opensea_colors[cols]
}


opensea_palettes <- list(
  `main` = opensea_cols("aqua", "marina blue", "sea blue", "dark sea"),
  `light` = opensea_cols("aqua", "marina blue", "sea blue"),
  `dark` = opensea_cols("marina blue", "sea blue", "dark sea")
)


#' Return function to interpolate an OpenSea color palette
#' @param palette Character name of palette in OpenSea color palette
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @importFrom grDevices colorRampPalette
#'
opensea_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- opensea_palettes[[palette]]
  if (reverse == TRUE) {
    pal <- rev(pal)
  }

  colorRampPalette(pal, ...)
}

#' Color scale constructor for OpenSea colors
#'
#' @param palette Character name of palette in OpenSea
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#'
scale_color_opensea <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- opensea_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("opensea_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for OpenSea colors
#'
#' @param palette Character name of palette in opensea_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#'
scale_fill_opensea <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- opensea_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("opensea_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' Get logo PNG
#'
#' @param filename File name of logo in PNG format
#'
get_png <- function(filename) {
  grid::rasterGrob(png::readPNG(filename), interpolate = TRUE)
}

#' Place logo PNG
#' @param filename File name of logo in PNG format
#' @param ... Additional arguments
#' @importFrom ggplot2 ggplot
#'

opensea_logo <- function(filename, ...) {
  logo <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void() +
    annotation_custom(get_png(filename), xmin = .8, xmax = 1)
  print(logo)
}

#' Arrange logo on graph
#' @param p1 ggplot2 plot to add logo on
#' @param ... Additional arguments
#' @export
add_logo <- function(p1, ...) {
  gridExtra::grid.arrange(
    p1,
    opensea_logo(system.file("logo.png", package = "opensear")),
    heights = c(.93, .07)
  )
}
