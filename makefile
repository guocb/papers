SOURCES=$(shell echo *.tex)
TARGETS=$(SOURCES:%.tex=%.pdf)
DIA_FIGURES=$(shell ls figures/*.dia 2>/dev/null)
PDF_FIGURES=$(DIA_FIGURES:%.dia=%.pdf)
TIKZ_FIGURES=$(shell ls figures/*.tikz 2>/dev/null)

.PHONY: $(SOURCES)

all: pdf

pdf: $(TARGETS)

clean:
	latexmk -CA

$(TARGETS):%.pdf:%.tex
	latexmk -pdf --pdflatex="pdflatex -file-line-error -interaction=nonstopmode" -use-make $<

$(PDF_FIGURES):%.pdf:%.eps
	epspdf $<

