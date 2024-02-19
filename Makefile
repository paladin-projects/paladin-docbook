ROOTDIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DOCBOOKXSLURI := "http://docbook.sourceforge.net/release/xsl-ns/current/"
DOCBOOK_XSL := $(subst file://, ,$(shell xmlcatalog /etc/xml/catalog $(DOCBOOKXSLURI)fo/docbook.xsl))
DOCBOOK_SCH := $(shell xmlcatalog /etc/xml/catalog http://docbook.org/xml/5.0/rng/docbook.rng)
HTML_XSL := $(subst file://, ,$(shell xmlcatalog /etc/xml/catalog $(DOCBOOKXSLURI)html/docbook.xsl))
FOP_CFG = $(ROOTDIR)fop/fop.xconf
CUSTOM_XSL = $(ROOTDIR)docbook.xsl
.PHONY: all

all:

test:
	echo $(ROOTDIR) $(DOCBOOKXSLURI) $(CUSTOM_XSL)

%.pdf: %.fo $(FOP_CFG)
	fop -c $(FOP_CFG) $< $@

%.fo: %.xml $(CUSTOM_XSL)
	xsltproc --xinclude -o $@ --stringparam profile.condition "$(SYSFAMILY)" $(CUSTOM_XSL) $<

%.html: %.xml $(HTML_XSL)
	xsltproc --xinclude -o $@  --stringparam profile.condition "$(SYSFAMILY)" $(HTML_XSL) $<

clean:
	rm -rf *.fo *.pdf

