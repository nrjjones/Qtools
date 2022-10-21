#' Title
#'
#' @param x A file name to export report to
#' @param df A data file
#' @param varlist A list of variable names and labels
#'
#' @return
#' @export
#'
#' @examples
#' codebk("P9999 Frequency Report.qmd", df, varlist)
codebk <- function(x, df, varlist) {

  rpt <- x
  # Report generation
  sink(rpt)  # Sink redirects output to write a Rmd file

  # Report header
  cat("--- \n")
  tmp <- paste0("title: \"", str_remove(rpt, ".qmd"), "\"\n")
  cat(tmp)
  cat("output: word_document \n")
  cat("--- \n\n")

  # Report body

  cat("```{r , results='asis', echo=FALSE, message=FALSE, warning=FALSE} \n")
  cat("library(tidyverse) \n")
  cat("library(stringr) \n")
  cat("library(knitr) \n")
  cat("options(xtable.comment=FALSE) \n")
  cat("source(\"load_data.R\") \n")
  cat("\n\n")
  cat("# Add extra filters to df here \n")
  cat("\n\n")
  cat("``` \n\n")

  # Only categorical vars

  for(i in 1:length(df)) {

    tmp1 <- paste0("## ", varlist$var[i], ": " , varlist$labels[[i]])
    cat(tmp1)
    cat("\n\n")
    cat("```{r , echo=FALSE, message=FALSE} \n\n")
    cat("cbtab( df, ",i," ) \n")
    cat("``` \n\n")
  }

  sink()  # Return output to console
}
