<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:d="http://docbook.org/ns/docbook"
		version="1.0"
		exclude-result-prefixes="d">

<xsl:param name="fop.extensions" select="1"/>
<xsl:param name="fop1.extensions" select="1"/>
<xsl:param name="axf.extensions" select="0"/>

<xsl:param name="paper.type">A4</xsl:param>

<!-- Отступы сверху -->
<xsl:param name="page.margin.top">10mm</xsl:param>
<xsl:param name="region.before.extent">13mm</xsl:param>
<xsl:param name="body.margin.top">20mm</xsl:param>

<!-- Отступы с боков -->
<xsl:param name="page.margin.inner">35mm</xsl:param>
<xsl:param name="page.margin.outer">13mm</xsl:param>
<xsl:param name="body.start.indent">0pt</xsl:param>

<!-- Отступы для фигур -->
<xsl:attribute-set name="figure.properties">
	<xsl:attribute name="margin-left">0pt</xsl:attribute>
	<xsl:attribute name="margin-right">0pt</xsl:attribute>
</xsl:attribute-set>

<!-- Enlarge your Header :) --> 
<xsl:attribute-set name="book.titlepage.recto.style">
  <xsl:attribute name="font-family">
      <xsl:value-of select="$title.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-size">24pt</xsl:attribute>
  <!-- <xsl:attribute name="text-align">center</xsl:attribute> -->
</xsl:attribute-set>


<xsl:param name="page.margin.bottom">10mm</xsl:param>
<xsl:param name="body.margin.bottom">15mm</xsl:param>

<!-- Шрифты -->
<xsl:param name="body.font.family">alter30</xsl:param>
<xsl:param name="title.font.family">alter70</xsl:param>
<xsl:param name="monospace.font.family">Courier</xsl:param>
<xsl:param name="dingbat.font.family">Noto Sans</xsl:param>
<xsl:param name="table.font.size">8pt</xsl:param>

<!-- Normal -->
<xsl:param name="line-height">1.5</xsl:param>

<xsl:attribute-set name="table.table.properties">
  <xsl:attribute name="border-before-width.conditionality">retain
	</xsl:attribute>
  <xsl:attribute name="border-collapse">collapse</xsl:attribute>
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
</xsl:attribute-set>

<!-- put captions under -->
<xsl:param name="formal.title.placement">
figure before
example after
equation after
table before
procedure after
task after
</xsl:param>

<!-- make captions smaller -->
<xsl:attribute-set name="formal.title.properties"
	use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 0.8"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
</xsl:attribute-set>
<!-- number sections -->
<!--
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
-->
<!--
<xsl:param name="admon.graphics" select="1"/>
-->

<xsl:attribute-set name="admonition.properties">
  <xsl:attribute name="font-size">8pt</xsl:attribute>
  <xsl:attribute name="padding-left">1cm</xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">10pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<!-- Set link color to blue -->
<xsl:attribute-set name="xref.properties">
  <xsl:attribute name="color">blue</xsl:attribute>
</xsl:attribute-set>

<xsl:template match="sect1[@toc = 'no']"  mode="toc" />
<xsl:param name="generate.toc">
/appendix toc,title
article/appendix  nop
/article  toc,title
book      toc,title
/chapter  toc,title
part      toc,title
/preface  toc,title
reference toc,title
/sect1    toc
/sect2    toc
/sect3    toc
/sect4    toc
/sect5    toc
/section  toc
set       toc,title
</xsl:param>

<xsl:param name="local.l10n.xml" select="document('local.l10n.xml')"/>

</xsl:stylesheet>

