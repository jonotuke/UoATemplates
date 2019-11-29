RMDS:=$(wildcard *.Rmd)
BEAMER:=$(RMDS:.Rmd=_BEAMER.pdf)
HANDOUT:=$(RMDS:.Rmd=_HANDOUT.pdf)
TEACHER:=$(RMDS:.Rmd=_TEACHER.pdf)

all: $(BEAMER) $(HANDOUT) $(TEACHER)

%_BEAMER.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'beamer_presentation', output_file = '$@')"

%_HANDOUT.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'pdf_document', output_file = '$@',params = list(teacher = FALSE))"

%_TEACHER.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'pdf_document', output_file = '$@',params = list(teacher = TRUE))"

show:
	open $(BEAMER) $(HANDOUT) $(TEACHER)
