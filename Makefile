name=syllabus

dockerimage:=registry.gitlab.com/mark.e.royer/texlive-full-with-emacs:20210611
dockeropts:=-u 1000:1000 -w /test \
            -v $(CURDIR):/test \
            -v /etc/group:/etc/group:ro \
            -v /etc/passwd:/etc/passwd:ro \
            -it --rm


.PHONY: clean squeaky-clean

$(name).pdf: $(name).tex
	latexmk -pdf -shell-escape $(name).tex

# Start docker and leave open
startdocker:
	docker run $(dockeropts) $(dockerimage)

# If you don't want to keep the container alive, build the default
# make target and exit.
startdocker-build:
	docker run $(dockeropts) $(dockerimage) make

clean:
	latexmk -c $(name).tex
	rm -rf *~ auto/ svg-inkscape/ \
	$(addprefix $(NAME),.4ct .4tc .css .dvi .fdb_latexmk .fls.html .idv .lg .tmp .xref)
squeaky-clean: clean
	rm -f $(name).pdf
