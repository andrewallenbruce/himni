#' Calculate the percentage change between two values
#'
#' @description The change in value is divided by the original value and then
#'    multiplied by 100. If the result is positive, then it is an increase.
#'    If the result is negative, then it is a decrease.
#'
#' @param x newer value
#' @param y older value
#' @return vector
#' @autoglobal
#' @export
#' @examples
#' pct_change(265, 471)
#'
#' pct_change(471, 265)
pct_change <- function(x, y) {(x - y) / y}
