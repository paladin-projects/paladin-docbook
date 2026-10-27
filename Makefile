ROOTDIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
FOP_CFG = $(ROOTDIR)fop/fop.xconf
FO_XSL = $(ROOTDIR)docbook.xsl
DOCBOOKXSLURI := "http://docbook.sourceforge.net/release/xsl-ns/current/"
HTML_XSL := $(subst file://, ,$(shell xmlcatalog /etc/xml/catalog $(DOCBOOKXSLURI)html/docbook.xsl))

ifdef XML_CATALOG_FILES
XSLTPROCFLAGS := --catalogs $(XSLTPROCFLAGS)
EXPORTCAT := XML_CATALOG_FILES=$(XML_CATALOG_FILES)
endif

.PHONY: all

all:

test:
	echo $(XSLTPROCFLAGS)
	echo $(XML_CATALOG_FILES)

# Create XML Catalog
catalog.xml:
	xmlcatalog --noout --create $@
	xmlcatalog --noout --add delegateURI http://docbook.sourceforge.net/release/xsl-ns/ file:///etc/xml/catalog $@
	xmlcatalog --noout --add system Entities.ent file://$(ROOTDIR)Entities.ent $@

%.pdf: %.fo $(FOP_CFG)
	fop -c $(FOP_CFG) $< $@

%.fo: %.xml $(FO_XSL)
	$(EXPORTCAT) xsltproc --xinclude -o $@ $(XSLTPROCFLAGS) $(FO_XSL) $<

%.html: %.xml $(HTML_XSL)
	$(EXPORTCAT) xsltproc --xinclude -o $@ $(XSLTPROCFLAGS) $(HTML_XSL) $<

clean:
	rm -rf *.fo *.pdf

