all: build serve
.PHONY: build serve
.SILENT: build serve

build:
	python -m markdown -x extra body.md > body.html
	python -m markdown -x extra appendix.md > appendix.html
	cat header.html body.html > index.html
	echo "</dt-article><dt-appendix>" >> index.html
	cat appendix.html bib.html >> index.html
	rm body.html appendix.html

serve:
	python -m http.server