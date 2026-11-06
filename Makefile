TYPST ?= typst

.PHONY: all pdf html

# Evita due compilazioni simultanee, anche con make -j.
.NOTPARALLEL:

all: pdf html

pdf:
	$(TYPST) compile AnalisiDueTyp.typ AnalisiDueTyp.pdf

html:
	$(TYPST) compile --features html AnalisiDueHtml.typ AnalisiDueTyp.html
