<?xml version="1.0"?>
<!DOCTYPE info [
  <!ENTITY % entities SYSTEM "Entities.ent">
  %entities;
  <!ENTITY laquo "«">
  <!ENTITY raquo "»">

]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d"
		version="1.0">

<!-- Custom footer -->
<xsl:attribute-set name="footer.content.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 0.8"/><xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
<xsl:param name="footer.rule" select="0"/>

<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>
    <xsl:choose>
      <xsl:when test="$pageclass='hptitlepage' and $sequence='first'">
      </xsl:when>
      <xsl:when test="$position='left'">
        <xsl:text>&confidentiality;</xsl:text>
      </xsl:when>
      <xsl:when test="$position='center'">
      </xsl:when>
      <xsl:when test="$position='right'">
        <fo:page-number/>
      </xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>
</xsl:stylesheet>

