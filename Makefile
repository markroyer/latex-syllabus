NAME=syllabus

pdf: $(NAME).pdf

$(NAME).pdf: $(NAME).tex
	pdflatex $(NAME).tex
	# Run latex twice for references
	pdflatex $(NAME).tex

clean:
	@rm -f *~ $(NAME).aux $(NAME).log $(NAME).out $(NAME).pdf 