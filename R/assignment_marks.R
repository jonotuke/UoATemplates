#' helper function to put text right
#'
#' @param x
#'
#' @return prints to right
#' @export
#'
#' @examples
#' flush_right("bob")
flush_right  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat=="html"){
    text  <- glue::glue("<div align='right'>{x}</div>")
  } else {
    text <- stringr::str_c("\\begin{flushright}", x, "\\end{flushright}")
  }
  return(text)
}
#' Adds marks to part of question.
#'
#' @param x number of marks
#'
#' @return add marks
#' @export
#'
#' @examples
#' Q_total  <- 0
#' add_marks(1)
#' add_marks(10)
add_marks <- function(x){
  if(x > 1){
    mark <- glue::glue("[{x} marks]")
  } else {
    mark <- glue::glue("[{x} mark]")
  }
  Q_total  <<- Q_total + x
  mark  <- flush_right(mark)
  cat(mark)
}
#' Adds question total and also updates assignment total
#'
#' @return adds Question total
#' @export
#'
#' @examples
#' Q_total  <- 0
#' A_total  <- 0
#' add_marks(10)
#' add_Q_total()
add_Q_total  <- function(){
  A_total <<- A_total + Q_total
  mark <- glue::glue("[Question total: {Q_total}]")
  Q_total <<- 0
  cat(flush_right(mark))
}
#' Adds assignment marks to assignment
#'
#' @return void
#' @export
#'
#' @examples
add_A_total  <- function(){
  mark <- str_c("[[Assignment total: ", A_total, "]]")
  Q_total <<- 0
  cat(flush_right(mark))
}

ms  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat == 'latex'){
    x  <- str_c("\\textcolor{red}{{\\bf Mark Scheme:} ",x,"}  ")
  }
  else if(outputFormat == 'html'){
    x  <- str_c("<font color='red'>Mark Scheme: ",x,"</font>  ")
  }
  cat(x)
}

am  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat == 'latex'){
    x  <- str_c("\\textcolor{red}{[",x,"]}  ")
  }
  else if(outputFormat == 'html'){
    x  <- str_c("[",x,"]")
  }
  if(!params$ms){
    return("")
  }
  return(x)
}
