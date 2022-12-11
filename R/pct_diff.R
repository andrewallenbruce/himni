#' Calculate the percent difference between two values
#'
#' @description Percent difference is obtained by dividing the absolute value
#'    of change by the average of the values and then multiplying it with 100.
#'    Since the absolute value is taken for the change (or difference) in
#'    values, the order of the numbers does not matter.
#'
#' @param x,y values to determine the percent difference between.
#' @return vector
#' @autoglobal
#' @export
#' @examples
#' pct_diff(265, 471)
#'
#' pct_diff(471, 265)
pct_diff <- function(x, y) {abs(x - y) / mean(c(x, y))}
