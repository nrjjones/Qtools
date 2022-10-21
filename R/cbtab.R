#' Frequency Table
#'
#' Creates a nicely formatted frequency table with percentage and n in parentheses.  Best used to create a codebook using a for loop.
#'
#' @param df A data frame
#' @param x The column number of a variable in df
#'
#' @details Here's a whole bunch of other things
#'
#' @return
#' @export
#'
#' @examples
#' # Table of infert data variable Education in column 1
#' cbtab(infert, 1)

cbtab <- function(df, x) {
  tmp <- df %>%
    select(names(df)[x]) %>%
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
