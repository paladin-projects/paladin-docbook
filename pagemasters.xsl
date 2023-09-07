<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d"
                version="1.0">

<xsl:template name="user.pagemasters">
  <!-- landscape pagemasters -->
  <fo:simple-page-master master-name="land-body-first"
                         page-width="{$page.height}"
                         page-height="{$page.width}"
                         margin-top="{$page.margin.top}"
                         margin-bottom="{$page.margin.bottom}">
    <xsl:attribute name="margin-{$direction.align.start}">
      <xsl:value-of select="$page.margin.inner"/>
      <xsl:if test="$fop.extensions != 0">
        <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
      </xsl:if>
      <xsl:if test="$fop.extensions != 0">
        <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
      </xsl:if>
    </xsl:attribute>
    <xsl:attribute name="margin-{$direction.align.end}">
      <xsl:value-of select="$page.margin.outer"/>
    </xsl:attribute>
    <xsl:if test="$axf.extensions != 0">
      <xsl:call-template name="axf-page-master-properties">
        <xsl:with-param name="page.master">land-body-first</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <fo:region-body margin-bottom="{$body.margin.bottom}"
                    margin-top="{$body.margin.top}"
                    column-gap="{$column.gap.body}"
                    column-count="{$column.count.body}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$body.margin.inner"/>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$body.margin.outer"/>
      </xsl:attribute>
    </fo:region-body>
    <fo:region-before region-name="xsl-region-before-first"
                      extent="{$region.before.extent}"
                      precedence="{$region.before.precedence}"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-first"
                     extent="{$region.after.extent}"
                      precedence="{$region.after.precedence}"
                     display-align="after"/>
    <xsl:call-template name="region.inner">
      <xsl:with-param name="sequence">first</xsl:with-param>
      <xsl:with-param name="pageclass">body</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="region.outer">
      <xsl:with-param name="sequence">first</xsl:with-param>
      <xsl:with-param name="pageclass">body</xsl:with-param>
    </xsl:call-template>
  </fo:simple-page-master>

  <fo:simple-page-master master-name="land-body-odd"
                         page-width="{$page.height}"
                         page-height="{$page.width}"
                         margin-top="{$page.margin.top}"
                         margin-bottom="{$page.margin.bottom}">
    <xsl:attribute name="margin-{$direction.align.start}">
      <xsl:value-of select="$page.margin.inner"/>
      <xsl:if test="$fop.extensions != 0">
        <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
      </xsl:if>
    </xsl:attribute>
    <xsl:attribute name="margin-{$direction.align.end}">
      <xsl:value-of select="$page.margin.outer"/>
    </xsl:attribute>
    <xsl:if test="$axf.extensions != 0">
      <xsl:call-template name="axf-page-master-properties">
        <xsl:with-param name="page.master">land-body-odd</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <fo:region-body margin-bottom="{$body.margin.bottom}"
                    margin-top="{$body.margin.top}"
                    column-gap="{$column.gap.body}"
                    column-count="{$column.count.body}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$body.margin.inner"/>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$body.margin.outer"/>
      </xsl:attribute>
    </fo:region-body>
    <fo:region-before region-name="xsl-region-before-odd"
                      extent="{$region.before.extent}"
                      precedence="{$region.before.precedence}"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-odd"
                      extent="{$region.after.extent}"
                      precedence="{$region.after.precedence}"
                      display-align="after"/>
     <xsl:call-template name="region.inner">
       <xsl:with-param name="pageclass">body</xsl:with-param>
       <xsl:with-param name="sequence">odd</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="region.outer">
       <xsl:with-param name="pageclass">body</xsl:with-param>
       <xsl:with-param name="sequence">odd</xsl:with-param>
     </xsl:call-template>
   </fo:simple-page-master>

   <fo:simple-page-master master-name="land-body-even"
                          page-width="{$page.height}"
                          page-height="{$page.width}"
                          margin-top="{$page.margin.top}"
                          margin-bottom="{$page.margin.bottom}">
     <xsl:attribute name="margin-{$direction.align.start}">
       <xsl:value-of select="$page.margin.outer"/>
       <xsl:if test="$fop.extensions != 0">
         <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
       </xsl:if>
     </xsl:attribute>
     <xsl:attribute name="margin-{$direction.align.end}">
       <xsl:value-of select="$page.margin.inner"/>
     </xsl:attribute>
     <xsl:if test="$axf.extensions != 0">
       <xsl:call-template name="axf-page-master-properties">
         <xsl:with-param name="page.master">land-body-even</xsl:with-param>
       </xsl:call-template>
     </xsl:if>
    <fo:region-body margin-bottom="{$body.margin.bottom}"
                     margin-top="{$body.margin.top}"
                     column-gap="{$column.gap.body}"
                     column-count="{$column.count.body}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$body.margin.outer"/>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$body.margin.inner"/>
      </xsl:attribute>
    </fo:region-body>
    <fo:region-before region-name="xsl-region-before-even"
                      extent="{$region.before.extent}"
                      precedence="{$region.before.precedence}"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-even"
                     extent="{$region.after.extent}"
                     precedence="{$region.after.precedence}"
                     display-align="after"/>
    <xsl:call-template name="region.outer">
      <xsl:with-param name="pageclass">body</xsl:with-param>
      <xsl:with-param name="sequence">even</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="region.inner">
      <xsl:with-param name="pageclass">body</xsl:with-param>
      <xsl:with-param name="sequence">even</xsl:with-param>
    </xsl:call-template>
  </fo:simple-page-master>
  <fo:page-sequence-master master-name="land-body">
    <fo:repeatable-page-master-alternatives>
      <fo:conditional-page-master-reference master-reference="blank"
                                            blank-or-not-blank="blank"/>
      <xsl:if test="$force.blank.pages != 0">
        <fo:conditional-page-master-reference master-reference="land-body-first"
                                              page-position="first"/>
      </xsl:if>
      <fo:conditional-page-master-reference master-reference="land-body-odd"
                                            odd-or-even="odd"/>
      <fo:conditional-page-master-reference 
                                            odd-or-even="even">
        <xsl:attribute name="master-reference">
          <xsl:choose>
            <xsl:when test="$double.sided != 0">land-body-even</xsl:when>
            <xsl:otherwise>land-body-odd</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </fo:conditional-page-master-reference>
    </fo:repeatable-page-master-alternatives>
  </fo:page-sequence-master>
</xsl:template>

<xsl:template name="select.user.pagemaster">
  <xsl:param name="element"/>
  <xsl:param name="pageclass"/>
  <xsl:param name="default-pagemaster"/>

  <xsl:choose>
    <xsl:when test="$element='chapter' and @role = 'landscape'">land-body</xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$default-pagemaster"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>
