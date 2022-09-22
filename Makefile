all: install build
.SILENT: clean
.PHONY: clean install build serve

install:
	npm install argparse markdown-it katex

build:
	./markdown-it.js body.md > body.html
	cat header.html body.html > index.html
	rm body.html

serve:
	python -m http.server

clean:
	rm -r node_modules index.html