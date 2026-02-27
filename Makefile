PDF=build/main.pdf

all: pdf

pdf:
	latexmk -pdf -bibtex -quiet main.tex

watch:
	latexmk -pdf -pvc main.tex

clean:
	latexmk -C
	rm -rf build

