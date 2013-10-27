all: epub html pdf

epub:
	mkdir -p output/epub
	pandoc --toc titre.txt simulation_numerique_2-2.md -o output/epub/simulation_numerique_2-2.epub

html:
	mkdir -p output/html
	./scripts/convertImages.sh images output/html/images
	pandoc -s simulation_numerique_2-2.md -o output/html/simulation_numerique_2-2.html

pdf:
	mkdir -p output/pdf
	pandoc -s --latex-engine xelatex simulation_numerique_2-2.md -o output/pdf/simulation_numerique_2-2.pdf

clean_epub:
	rm -rf output/epub

clean_html:
	rm -rf output/html

clean_pdf:
	rm -rf output/pdf

clean: clean_epub clean_html clean_pdf
	rm -rf output