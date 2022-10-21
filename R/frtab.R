#' Frequency Table
#'
#' Creates a nicely formatted frequency table with percentage and n in parentheses.
#'
#' @param df A data frame
#' @param x A variable in the data frame
#'
#' @return A nicely formatted table
#' @export
#'
#' @examples
#' frtab(infert, education)
#'
frtab <- function(df, x) {
  tmp <- df %>%
    select({{x}}) %>%
    ftable() %>%
    as.data.frame() %>%
    mutate(
      pct = scales::percent(Freq/sum(Freq), accuracy = 0.1),
      `Percent (N)` = paste0(pct, " (", Freq, ")")
    ) %>%
    select(-Freq, -pct) %>%
    kable()

  tmp
}
