FILENAME = simulation_numerique_2-2

all: epub html pdf

epub:
	mkdir -p output/$@
	pandoc --toc titre.txt ${FILENAME}.md -o output/$@/${FILENAME}.$@

html:
	mkdir -p output/$@
	./scripts/convertImages.sh images output/$@/images
	pandoc -s ${FILENAME}.md -o output/$@/${FILENAME}.$@

pdf:
	mkdir -p output/$@
	pandoc -s --latex-engine xelatex ${FILENAME}.md -o output/pdf/${FILENAME}.$@

clean_epub:
	rm -rf output/epub

clean_html:
	rm -rf output/html

clean_pdf:
	rm -rf output/pdf

clean: clean_epub clean_html clean_pdf
	rm -rf output