FILENAME = simulation_numerique_2-2

all: epub pdf html

epub: pdf
	mkdir -p output/$@
	pdftk output/pdf/${FILENAME}.pdf cat 1 output output/$@/cover.pdf
	convert output/$@/cover.pdf output/$@/une_cover.png
	rm -rf output/$@/cover.pdf
	convert output/$@/une_cover.png -crop 400x573+90+118 +repage output/$@/cover.png
	rm -rf output/$@/une_cover.png
	pandoc -S -s --toc --epub-cover-image=output/$@/cover.png title.md pitch.md ${FILENAME}.md -o output/$@/${FILENAME}.$@
	rm -rf output/$@/cover.png

html:
	mkdir -p output/$@
	./scripts/convertImages.sh images output/$@/images
	pandoc -s pitch.md ${FILENAME}.md -o output/$@/${FILENAME}.$@

pdf:
	mkdir -p output/$@
	pandoc -S -s --template=./podcastscience-template.latex --toc -V lang:french -V mainfont:Cambria -V fontsize:11pt -V geometry:a4paper -s --latex-engine xelatex title.md pitch.md ${FILENAME}.md -o output/pdf/${FILENAME}.$@

clean_epub:
	rm -rf output/epub

clean_html:
	rm -rf output/html

clean_pdf:
	rm -rf output/pdf

clean: clean_epub clean_html clean_pdf
	rm -rf output

generate:


verify:

	