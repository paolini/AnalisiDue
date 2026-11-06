TYPST ?= typst
TYPST_JOBS ?= 1
ALT_MARGINS ?= true
PAGINE ?= 221
COPERTINA_OPZIONI ?=

.PHONY: all pdf html copertina

# Evita due compilazioni simultanee, anche con make -j.
.NOTPARALLEL:

all: pdf html

pdf:
	$(TYPST) compile --jobs $(TYPST_JOBS) --input alt-margins=$(ALT_MARGINS) AnalisiDue.typ AnalisiDue.pdf

copertina:
	$(TYPST) compile --jobs $(TYPST_JOBS) --input pagine=$(PAGINE) $(COPERTINA_OPZIONI) copertina.typ copertina.pdf

html:
	$(TYPST) compile --jobs $(TYPST_JOBS) --features html AnalisiDueHtml.typ AnalisiDue.html
	
