<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:d="http://docbook.org/ns/docbook"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version="1.0" exclude-result-prefixes="d">

  <xsl:template name="table.cell.block.properties">
    <!-- highlight this entry? -->
    <xsl:choose>
      <xsl:when test="ancestor::d:thead or ancestor::d:tfoot">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
      </xsl:when>
      <!-- Make row headers bold too -->
      <xsl:when
	test="ancestor::d:tbody and
	     (ancestor::d:table[@rowheader = 'firstcol'] or
	     ancestor::d:informaltable[@rowheader = 'firstcol']) and
	     ancestor-or-self::d:entry[1][count(preceding-sibling::d:entry)=0]">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <!-- use custom font size in tables -->
    <xsl:attribute name="font-size">
     <xsl:value-of select="$table.font.size"/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>


