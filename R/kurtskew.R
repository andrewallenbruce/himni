#' Compute kurtosis
#' @param x vector
#' @param na.rm remove NAs
#' @return vector
#' @export
#' @autoglobal
#' @examples
#' kurt(cars$speed)
#' kurt(cars$dist)
kurt <- function(x, na.rm = TRUE){
  if (na.rm) x <- x[!is.na(x)]
  n <- length(x)
  n * sum((x - mean(x))^4)/(sum((x - mean(x))^2)^2)
}

#' Compute skewness
#' @param x vector
#' @param na.rm remove NAs
#' @return vector
#' @export
#' @autoglobal
#' @examples
#' skew(cars$speed)
#' skew(cars$dist)
skew <- function(x, na.rm = TRUE){
  if (na.rm) x <- x[!is.na(x)]
  n <- length(x)
  (sum((x - mean(x))^3) / n) / (sum((x - mean(x))^2) / n)^(3/2)
}

#' Rescales vector to a range from 0 to 1
#' @param x vector
#' @return vector with rescaled values
#' @export
#' @autoglobal
#' @examples
#' rescale01(c(-10, 0, 10))
#' rescale01(c(1:10, Inf, NA))
#' df <- tibble::tibble(
#' a = rnorm(5),
#' b = rnorm(5),
#' c = rnorm(5),
#' d = rnorm(5))
#' df |> dplyr::mutate(
#' a = rescale01(a),
#' b = rescale01(b),
#' c = rescale01(c),
#' d = rescale01(d))
#' df |> dplyr::mutate(dplyr::across(a:d, rescale01))
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
