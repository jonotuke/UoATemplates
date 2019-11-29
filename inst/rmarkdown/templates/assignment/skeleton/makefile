COURSENAME := SAM
RMDS := $(wildcard $(COURSENAME)*.Rmd)
QS := $(RMDS:.Rmd=.pdf)
SOLS := $(RMDS:.Rmd=S.pdf)
MS := $(RMDS:.Rmd=MS.pdf)

all: $(QS) $(SOLS) $(MS)


%.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'pdf_document', params = list(sol = FALSE, marking = FALSE))"

%S.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@', output_format = 'pdf_document', params = list(sol = TRUE, marking = FALSE))"

%MS.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@', output_format = 'pdf_document', params = list(sol = TRUE, marking = TRUE))"

