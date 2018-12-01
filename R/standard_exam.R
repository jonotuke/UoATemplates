#' Standard School of Mathematical Science format.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @export
standard_exam = function(...) {
    template <- system.file("rmarkdown/templates/standard_exam/resources/template.tex",
                            package = "UoATemplates")
    rmarkdown::pdf_document(...,
                            template = template
    )
}
