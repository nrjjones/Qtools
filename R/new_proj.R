#' New project
#'
#' Creates folders for raw, out, and pst.
#'
new_proj <- function() {

  dir.create("./raw")
  dir.create("./out")
  dir.create("./pst")
  dir.create("./doc")

}


