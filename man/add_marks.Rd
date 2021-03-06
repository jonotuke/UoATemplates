% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignment_marks.R, R/make_assignment.R
\name{add_marks}
\alias{add_marks}
\title{Adds marks to part of question.}
\usage{
add_marks(txt, filename = NULL)

add_marks(txt, filename = NULL)
}
\arguments{
\item{filename}{name of file that will be outputted to}

\item{x}{number of marks}
}
\value{
add marks

mark
}
\description{
MARK: x
}
\details{
and converts to latex mark
}
\examples{
Q_total  <- 0
add_marks(1)
add_marks(10)
pacman::p_load(tidyverse)
add_marks("MARK: 10")
}
