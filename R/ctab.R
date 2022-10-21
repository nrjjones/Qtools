#' Title
#'
#' @param df A data frame
#' @param x A row variable
#' @param y A col variable
#'
#' @return A nicely formatted table of x by y with output formatted as % (N)
#' @export
#'
#' @examples
#' ctab(infert, Education, induced)
ctab <- function(df, x, y) {

  tmp <- df %>%
    select( {{x}}, {{y}} ) %>%
    ftable() %>%
    as.data.frame() %>%
    group_by({{y}}) %>%
    mutate(
      pct = scales::percent(Freq/sum(Freq), accuracy = 0.1),
      `Percent (N)` = paste0(pct, " (", Freq, ")")
    ) %>%
    select(-Freq, -pct) %>%
    pivot_wider(
      everything(),
      names_from = {{y}},
      values_from = `Percent (N)`
    ) %>%
    kable()

  tmp
}
