#' Takes line of form
#'
#' MARK: x
#'
#' and converts to latex mark
#'
#' @param txt
#' @param filename name of file that will be outputted to
#'
#' @return mark
#' @export
#'
#' @examples
#' pacman::p_load(tidyverse)
#' add_marks("MARK: 10")
add_marks <- function(txt, filename = NULL){
  mark <- as.numeric(str_extract(txt, "\\d+"))
  if(mark == 1){
    txt <- stringr::str_c("\\begin{flushright}[", mark, " mark]\\end{flushright}", collapse = "")
  } else {
    txt <- str_c("\\begin{flushright}[", mark, " marks]\\end{flushright}", collapse = "")
  }
  if(is.null(filename)){
    cat(txt, "\n")
  } else {
    cat(txt, file = filename, append = TRUE)
  }
  return(mark)
}
#' Takes question and converts it to markdown
#'
#' @param question question Rmd file
#' @param outfile file to put markdown
#' @param solution boolean of whether to include solutions or not
#'
#' @return nothing, cats out markdown
#' @export
#'
#' @examples
#' parse_question("inst/rmarkdown/templates/assignment/skeleton/questions/linear_regression.Rmd")
parse_question <- function(question, outfile = NULL, solution = FALSE){
  txt <- read_lines(question)
  part <- 1
  total <- 0
  omit <- FALSE
  for(i in 1:length(txt)){
    if(str_detect(txt[i], "SOL")){
      if(solution){
        cat("\\hrule\\textbf{Solutions:}\n\n", file = outfile, append = TRUE)
      } else {
        omit <- TRUE
      }
      next()
    }
    if(str_detect(txt[i], "END")){
      if(solution){
        cat("\\hrule", file = outfile, append = TRUE)
      } else {
        omit <- FALSE
      }
      next()
    }
    if(omit){
      next()
    }
    # Remove heading of question
    if(str_detect(txt[i], "^# ")){
      next()
    }
    # If part
    if(str_detect(txt[i], "^## ")){
      cat(letters[part], ".", sep = "", file = outfile, append = TRUE)
      part <- part + 1
      next()
    }
    # Add marks
    if(str_detect(txt[i], "MARK")){
      mark <- add_marks(txt[i], filename = outfile)
      total <- total + mark
      next()
    }
    if(is.null(outfile)){
      cat(txt[i],"\n")
    } else {
      cat(txt[i], "\n", file = outfile, append = TRUE)
    }
  }
  # Add question total
  question_mark <- str_c(
    "\\begin{flushright}[Question total: ",
    total, " marks]\\end{flushright}\n\n",
                         collapse = "")
  cat(question_mark, file = outfile, append = TRUE)
  return(total)
}
#' Makes assignment
#'
#' @param questions vector of questions
#' @param header header file
#' @param coursename coursename
#' @param assignment assignment number
#' @param lecturer lecturer
#' @param semester semester number
#' @param year year
#' @param duedate due date
#' @param outfile file to spit out Rmd
#' @param solution do you want solutions
#'
#' @return writes out Rmd
#' @export
#'
#' @examples
make_assignment <- function(questions, header,
                            coursename, assignment,
                            lecturer,
                            semester, year, duedate,
                            outfile,
                            solution = FALSE){
  # Open file
  cat(file = outfile)
  # Get header
  header <- read_lines(header)
  # Add metadata
  header <- str_replace_all(header, "COURSENAME", coursename)
  header <- str_replace_all(header, "ASSIGN", str_c("Assignment ", assignment, collapse = ""))
  header <- str_replace_all(header, "LECTURER", lecturer)
  header <- str_replace_all(header, "SEM", str_c("Semester ", semester, collapse = ""))
  header <- str_replace_all(header, "YEAR", as.character(year))
  header <- str_replace_all(header, "DUEDATE", duedate)
  for(i in header){
    cat(i, "\n", file = outfile, append = TRUE)
  }
  # Add questions
  total <- 0
  for(i in 1:length(questions)){
    cat("#### Q", i,"\n", sep = "", file = outfile, append = TRUE)
    QM <- parse_question(questions[i], outfile = outfile, solution = solution)
    cat("\n", file = outfile, append = TRUE)
    total <- total + QM
  }
  # Add assignment total
  AM <- str_c(
    "\\begin{flushright}[[Assignment total: ",
    total,
    " marks]\\end{flushright}\n\n",
    collapse = ""
  )
  cat(AM, file = outfile, append = TRUE)
}

