#' CATA Table
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
#' frtab(df, "Q23")
#'
catatab <- function(df, x, stub) {
  tmp <- df %>%
    select(contains(x)) %>%
    pivot_longer(
      everything(),
      names_to = "var",
      values_to = "val"
    ) %>%
    mutate(
      val = case_when(
        !is.na(val) ~ "Selected",
        is.na(val) ~ "Not selected"
      )
    ) %>%
    group_by(var, val) %>%
    tally() %>%
    group_by(var) %>%
    mutate(
      N=sum(n),
      perc = n/N,
      Percent = sprintf("%.1f%s", signif(perc*100, 3), "%"),
      `Percent(N)` = paste0(Percent, " (", n, ")")
    ) %>%
    select(-c(perc, n, N)) %>%
    ungroup()


  if(length(tmp$var) > 0) {

    tmp <- left_join(tmp, varlist) %>%
      select(Question=labels, val, `Percent(N)`) %>%
      ungroup()

    tmp$Question <- str_remove(tmp$Question, stub)

    tmp <- pivot_wider(
      tmp,
      names_from = val,
      values_from = `Percent(N)`
    ) %>%
      select(Question, Selected)

    names(tmp) <- paste0(names(tmp), " Percent(N)")
    names(tmp)[1] <- "Response"

    tmp[is.na(tmp)] <- "0.0%(0)"

    kable(tmp)
  }
}

