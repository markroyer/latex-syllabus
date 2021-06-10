NAME=syllabus

.PHONY=clean

$(NAME).pdf: $(NAME).tex
	latexmk -pdf -shell-escape $(NAME).tex


clean:
	latexmk -c $(NAME).tex
	rm -f *~ $(NAME).aux $(NAME).log $(NAME).out

squeeky-clean: clean
	rm -f $(NAME).pdf
