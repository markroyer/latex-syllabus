name=syllabus

.PHONY=clean

$(name).pdf: $(name).tex
	latexmk -pdf -shell-escape $(name).tex


clean:
	latexmk -c $(name).tex
	rm -rf *~ auto/ svg-inkscape/ \
	$(addprefix $(NAME),.4ct .4tc .css .dvi .fdb_latexmk .fls.html .idv .lg .tmp .xref)
squeaky-clean: clean
	rm -f $(name).pdf
