<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:d="http://docbook.org/ns/docbook"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version="1.0" exclude-result-prefixes="d">

  <xsl:template name="table.cell.block.properties">
    <xsl:choose>
      <xsl:when test="ancestor::d:thead or ancestor::d:tfoot">
        <xsl:attribute name="font-family">alter70</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>


