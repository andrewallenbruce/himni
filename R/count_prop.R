#' Count and compute proportion in data frame column
#'
#' @param df data frame
#' @param var column in data frame
#' @param sort sort count
#'
#' @return A [tibble][tibble::tibble-package] with the count and proportion
#'    of the column
#' @export
#' @autoglobal
#'
#' @examples
#' df <- tibble::tibble(
#'    a = rnorm(5),
#'    b = rnorm(5),
#'    c = rnorm(5),
#'    d = rnorm(5))
#'
#' df |> count_prop(a)
count_prop <- function(df, var, sort = FALSE) {
  df |>
    dplyr::count({{ var }}, sort = sort) |>
    dplyr::mutate(prop = n / sum(n))
}
