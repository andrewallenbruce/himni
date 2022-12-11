#' Rescales vector to a range from 0 to 1
#'
#' @param x vector
#'
#' @return vector with rescaled values
#' @export
#' @autoglobal
#'
#' @examples
#' rescale01(c(-10, 0, 10))
#'
#' rescale01(c(1:10, Inf, NA))
#'
#' df <- tibble::tibble(
#' a = rnorm(5),
#' b = rnorm(5),
#' c = rnorm(5),
#' d = rnorm(5))
#'
#' df |> dplyr::mutate(
#' a = rescale01(a),
#' b = rescale01(b),
#' c = rescale01(c),
#' d = rescale01(d))
#'
#' df |> dplyr::mutate(dplyr::across(a:d, rescale01))
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
