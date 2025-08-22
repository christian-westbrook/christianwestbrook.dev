# -----------------------------------------------------------------------------
# System   : christianwestbrook.dev
# File     : Makefile
# Engineer : Christian Westbrook
# Abstract : This file defines the build processes available for
#            christianwestbrook.dev.
# -----------------------------------------------------------------------------

.DEFAULT_GOAL := site

.PHONY: clean site

public/css:
	mkdir -p public/css

public/css/index.css: public/css src/scss/index.scss
	sass src/scss/index.scss public/css/index.css

public/index.html: public src/html/index.html
	cp src/html/index.html public/

site: public/css/index.css public/index.html

clean:
	rm -rf public