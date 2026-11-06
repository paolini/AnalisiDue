TYPST ?= typst

.PHONY: all pdf html

# Evita due compilazioni simultanee, anche con make -j.
.NOTPARALLEL:

all: pdf html

pdf:
	$(TYPST) compile AnalisiDue.typ AnalisiDue.pdf

html:
	$(TYPST) compile --features html AnalisiDueHtml.typ AnalisiDue.html
	
