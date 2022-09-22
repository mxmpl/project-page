all: build serve
.PHONY: build serve
.SILENT: build serve

build:
	python -m markdown -x extra body.md > body.html
	cat header.html body.html > index.html
	rm body.html

serve:
	python -m http.server