#' Adds question total to exam
#'
#' @export
#' @examples
#' total  <- 0
#' exam_total  <- 0
#' marks(3)
#' marks(4)
#' question_total()
#' exam_total
question_total  <- function(){
  # Add to exam total
  exam_total  <<- exam_total + total
  # Add to number of questions
  number_Q <<- number_Q + 1
  mark_str  <- str_c(
    "\\begin{flushright}[Total: ",
    total,
    "]\\end{flushright}"
  )
  cat(mark_str)
  total  <<- 0
}

