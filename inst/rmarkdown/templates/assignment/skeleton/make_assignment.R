pacman::p_load(tidyverse, UoATemplates)
questions <- c(
  "inst/rmarkdown/templates/assignment/skeleton/questions/linear_combination.Rmd",
  "inst/rmarkdown/templates/assignment/skeleton/questions/linear_regression.Rmd"
)
header <- c("inst/rmarkdown/templates/assignment/skeleton/skeleton.Rmd")
make_assignment(
  questions = questions,
  header = header,
  coursename = "PSII",
  assignment = 1,
  lecturer = "Jono Tuke",
  semester = 1, year = 2020,
  duedate = "Friday 1 June 2020, 5pm",
  outfile = "inst/rmarkdown/templates/assignment/skeleton/tmp.Rmd",
  solution = FALSE
)
