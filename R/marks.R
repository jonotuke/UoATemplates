#' add marks in exam.
#'
#' Uses global variables - see the Rmarkdown exam template for an example
#'
#' @param core core mark
#' @param adv advanced mark
#' @param ms marking scheme
#'
#' @export
#' @examples
#' total  <- 0
#' marks(3)
#' total
marks  <- function(x){
  ## Add marks to exam page
  mark_str  <- str_c("\\marks{", x, "}")
  cat(mark_str, "\n\n")
  ## Update the marking table
  total  <<- total + x
}

