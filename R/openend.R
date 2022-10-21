#' Open ended variable helper
#'
#' Exports comments and formats file name nicely for delivery.  Use with a for loop to run through all OE vars.
#'
#' @param oe
#' @param x
#' @param pnum
#'
#' @return
#' @export
#'
#' @examples
#'
#' for(i in 1:length(names(oe))) {
#'     openend(oe, i, "P9999")
#' }
openend <- function(oe, x, pnum) {
  tmp <- oe[x]
  names(tmp) <- "Verbatim Response"
  tmp <- tmp %>% filter(`Verbatim Response` != "")
  write_csv(tmp, paste0("./out/", pnum, " ", oev$var[x], " Responses ", Sys.Date(), ".csv"), na="")

}
