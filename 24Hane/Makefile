GENERATE = tuist generate
FETCH = tuist fetch
BUILD = tuist build
CLEAN = tuist clean
CURRENT_DATE = $(shell run scripts/current_date.swift)

generate:
	 TUIST_ROOT_DIR=${PWD} $(GENERATE)

build: $(CLEAN) $(FETCH) $(FETCH) TUIST_ROOT_DIR=${PWD} $(GENERATE)

clean:
	$(CLEAN)

fetch:
	$(FETCH)

module:
	tuist scaffold Module \
	 --name ${name} \
	 --author "hoslim"

.PHONY: generate, build, clean, fetch, module