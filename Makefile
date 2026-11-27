TYPST ?= typst
TYPST_JOBS ?= 1
ALT_MARGINS ?= true
PAGINE ?= 221
COPERTINA_OPZIONI ?=
PAGES_REMOTE ?= origin
GITHUB_REMOTE ?= github
VERSION := $(shell sed -n 's/^\#let version = "\(.*\)"/\1/p' lib.typ)
TAG ?= v$(VERSION)

.PHONY: all pdf html copertina pages github-release capitoli

# Evita due compilazioni simultanee, anche con make -j.
.NOTPARALLEL:

all: pdf html

pdf:
	$(TYPST) compile --jobs $(TYPST_JOBS) --input alt-margins=$(ALT_MARGINS) AnalisiDue.typ AnalisiDue.pdf

# Singoli capitoli: make capitolo-2.pdf, oppure make capitoli per tutti.
capitoli: $(patsubst %.typ,%.pdf,$(wildcard capitolo-*.typ))

capitolo-%.pdf: FORCE
	$(TYPST) compile --jobs $(TYPST_JOBS) --input alt-margins=$(ALT_MARGINS) capitolo-$*.typ $@

.PHONY: FORCE
FORCE:

copertina:
	$(TYPST) compile --jobs $(TYPST_JOBS) --input pagine=$(PAGINE) $(COPERTINA_OPZIONI) copertina.typ copertina.pdf

html:
	$(TYPST) compile --jobs $(TYPST_JOBS) --features html AnalisiDue.typ AnalisiDue.html

pages: html
	sh scripts/update-pages.sh "$(PAGES_REMOTE)"

github-release:
	sh scripts/github-release.sh "$(TAG)" "$(GITHUB_REMOTE)"
