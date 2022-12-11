#' Compute kurtosis
#'
#' @param x vector
#' @param na.rm remove NAs
#' @return vector
#' @export
#' @autoglobal
#' @examples
#' kurt(cars$speed)
#'
#' kurt(cars$dist)
kurt <- function(x, na.rm = TRUE){
  if (na.rm) x <- x[!is.na(x)]
  n <- length(x)
  n * sum((x - mean(x))^4)/(sum((x - mean(x))^2)^2)
}
