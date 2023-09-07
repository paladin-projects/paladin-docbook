<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d"
		version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>
  <xsl:import href="params.xsl"/>
  <xsl:import href="header.xsl"/>
  <xsl:import href="footer.xsl"/>
  <xsl:import href="table.xsl"/>
  <xsl:import href="titlepage.xsl"/>
  <xsl:import href="pagemasters.xsl"/>

  <xsl:output method="xml" encoding="UTF-8"/>

  <!-- word "chapter" removal from numbering -->
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="ru">
      <l:context name="title-numbered"> 
        <l:template name="d:chapter" text="%n. %t"/>
      </l:context>    
    </l:l10n>
  </l:i18n>

  <xsl:template match="processing-instruction('linebreak')">
    <fo:block/>
  </xsl:template>

  <xsl:template match="d:phrase[@role='red']">
    <fo:inline color="red">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="d:phrase[@role='green']">
    <fo:inline color="green">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

</xsl:stylesheet>
