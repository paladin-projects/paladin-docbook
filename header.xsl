<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d"
		version="1.0">

<!-- Custom header -->
<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 0.8"/><xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
<xsl:param name="header.rule">0</xsl:param>

<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>
   <xsl:choose>
    <xsl:when test="$pageclass='hptitlepage' and $sequence='first'">
    </xsl:when>
    <xsl:when test="$position='left'">
     <xsl:value-of select="ancestor-or-self::d:book/d:info/d:title">
     </xsl:value-of>
    </xsl:when>
    <xsl:when test="$position='center'">
      <fo:block>
        <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'PrepDate'"/>
          </xsl:call-template>
       <!--	<xsl:text>Дата: </xsl:text> -->
        <xsl:value-of select="ancestor-or-self::d:book/d:info/d:pubdate">
	</xsl:value-of>
        </fo:block>
        <fo:block>
          <xsl:call-template name="gentext">
              <xsl:with-param name="key" select="'Version'"/>
            </xsl:call-template>
          <!--	<xsl:text>Версия: </xsl:text> -->
        <xsl:value-of select="ancestor-or-self::d:book/d:info/d:edition">
	</xsl:value-of>
       </fo:block>
    </xsl:when>
    <xsl:when test="$position='right'">
      <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'DocName'"/>
        </xsl:call-template>
        <!--      <xsl:text>Технический отчёт</xsl:text> -->
    </xsl:when>
   </xsl:choose>
  </fo:block>
</xsl:template>
</xsl:stylesheet>
