#' Compute skewness
#'
#' @param x vector
#' @param na.rm remove NAs
#' @return vector
#' @export
#' @autoglobal
#' @examples
#' skew(cars$speed)
#'
#' skew(cars$dist)
skew <- function(x, na.rm = TRUE){
  if (na.rm) x <- x[!is.na(x)]
  n <- length(x)
  (sum((x - mean(x))^3) / n) / (sum((x - mean(x))^2) / n)^(3/2)
}

