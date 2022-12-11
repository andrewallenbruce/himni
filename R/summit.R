#' Summarizes var column in data
#'
#' @param data df
#' @param var col in df
#'
#' @return A [tibble][tibble::tibble-package] with the summarized data
#' @export
#' @autoglobal
#'
#' @examples
#' df <- tibble::tibble(
#'    a = rnorm(5),
#'    b = rnorm(5),
#'    c = rnorm(5),
#'    d = rnorm(5),
#'    e = 1:5)
#'
#' df |>
#'   dplyr::group_by(e) |>
#'   summit(a)
summit <- function(data, var) {
  data |> dplyr::summarize(
    min = min({{ var }}, na.rm = TRUE),
    mean = mean({{ var }}, na.rm = TRUE),
    median = median({{ var }}, na.rm = TRUE),
    max = max({{ var }}, na.rm = TRUE),
    n = dplyr::n(),
    n_miss = sum(is.na({{ var }})),
    .groups = "drop"
  )
}
