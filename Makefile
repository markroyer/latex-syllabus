name=syllabus

dockerimage:=registry.gitlab.com/mark.e.royer/texlive-full-with-emacs:20210611
dockeropts:=-u 1000:1000 -w /test \
            -v $(CURDIR):/test \
            -v /etc/group:/etc/group:ro \
            -v /etc/passwd:/etc/passwd:ro \
            -it --rm


.PHONY: clean squeaky-clean startdocker startdocker-build startdocker-build-html

$(name).pdf: $(name).tex
	latexmk -pdf -shell-escape $(name).tex

$(name).html: $(name).tex $(name)-style.css
	htlatex syllabus.tex "xhtml,NoFonts"
	cp style.css $(name).css
	cat $(name)-style.css >> $(name).css

# Start docker and leave open
startdocker:
	docker run $(dockeropts) $(dockerimage)

# If you don't want to keep the container alive, build the default
# make target and exit.
startdocker-build:
	docker run $(dockeropts) $(dockerimage) make

startdocker-build-html:
	docker run $(dockeropts) $(dockerimage) make $(name).html

clean:
	latexmk -c $(name).tex
	rm -rf *~ auto/ svg-inkscape/ \
	$(addprefix $(name),.4ct .4tc .css .dvi .fdb_latexmk .fls.html .idv .lg .tmp .xref)
squeaky-clean: clean
	rm -f $(name).pdf $(name).html
