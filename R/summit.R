#' Summarizes var column in data
#' @param data df
#' @param var col in df
#' @return A [tibble][tibble::tibble-package] with the summarized data
#' @export
#' @autoglobal
#' @examples
#' dplyr::tibble(
#'    a = rnorm(5),
#'    b = rnorm(5),
#'    c = rnorm(5),
#'    d = rnorm(5),
#'    e = 1:5) |>
#'   dplyr::group_by(e) |>
#'   summit(a)
summit <- function(data, var) {
  data |> dplyr::summarize(
    min         = min({{ var }}, na.rm = TRUE),
    median      = stats::median({{ var }}, na.rm = TRUE),
    mean        = mean({{ var }}, na.rm = TRUE),
    max         = max({{ var }}, na.rm = TRUE),
    iqr         = stats::IQR({{ var }}, na.rm = TRUE),
    rng         = max({{ var }}, na.rm = TRUE) - min({{ var }}, na.rm = TRUE),
    sd          = stats::sd({{ var }}, na.rm = TRUE),
    mad         = stats::mad({{ var }}, na.rm = TRUE),
    obs         = dplyr::n(),
    miss        = sum(is.na({{ var }})),
    skewness    = skew({{ var }}),
    skewed      = dplyr::if_else(skewness < 0,
                                 "right-leaning",
                                 "left-leaning"),
    kurtosis    = kurt({{ var }}),
    tailedness  = dplyr::if_else(kurtosis < 3,
                                 "broad (platykurtic)",
                                 "slender (leptokurtic)"),
    .groups     = "drop")
}
