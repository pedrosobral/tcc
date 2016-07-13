MAIN=tcc

all: pdf

pdf:
	latexmk $(MAIN) -pdf -pv

watch:
	latexmk $(MAIN) -pdf -pvc

# usage: make diff OLD=HEAD~1 NEW=HEAD target
diff:
	./git-latexdiff --bibtex --ignore-latex-errors --latexmk $(OLD) $(NEW) --main $(MAIN).tex #--type FONTSTRIKE

clean:
	latexmk -c
	@echo ' > Removendo arquivos auxiliares...'
	rm -f textual/*.aux postextual/*.aux pretextual/*.aux
	@echo ' > Removendo arquivos aux bibtex...'
	rm -f $(MAIN).bbl $(MAIN).brf $(MAIN).nlo $(MAIN).nls
