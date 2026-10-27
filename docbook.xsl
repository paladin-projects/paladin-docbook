<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d"
		version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/profile-docbook.xsl"/>
  <xsl:import href="params.xsl"/>
  <xsl:import href="header.xsl"/>
  <xsl:import href="footer.xsl"/>
  <xsl:import href="table.xsl"/>
  <xsl:import href="titlepage.xsl"/>
  <xsl:import href="pagemasters.xsl"/>

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

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
