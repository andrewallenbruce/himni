#' Count and compute proportion in data frame column
#'
#' @param df data frame
#' @param var column in data frame
#' @param sort sort count
#' @return A [tibble][tibble::tibble-package] with the count and proportion
#'    of the column
#' @export
#' @autoglobal
#' @examples
#' df <- tibble::tibble(
#'    a = rnorm(5),
#'    b = rnorm(5),
#'    c = rnorm(5),
#'    d = rnorm(5))
#'
#' df |> count_prop(a)
count_prop <- function(df, var, sort = FALSE) {
  df |> dplyr::count({{ var }}, sort = sort) |>
        dplyr::mutate(prop = n / sum(n))
}

#' Count and compute proportion in data frame column
#'
#' @param df data frame
#' @param rows rows in data frame
#' @param cols cols in data frame
#' @param sort sort count
#' @return A [tibble][tibble::tibble-package] with the count and proportion
#'    of the column
#' @export
#' @autoglobal
#' @examples
#' options(scipen = 999)
#' ggplot2::diamonds |>
#' count_prop_mult(c(clarity, color), cut, sort = TRUE) |> head()
count_prop_mult <- function(df, rows, cols, sort = FALSE) {
  df |>
    dplyr::count(dplyr::pick(c({{ rows }}, {{ cols }})), sort = sort) |>
    dplyr::mutate(prop = n / sum(n))
}
