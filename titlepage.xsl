<?xml version="1.0"?>
<!DOCTYPE stylesheet [
  <!ENTITY % colors SYSTEM "colors.ent">
  %colors;
  ]
>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:d="http://docbook.org/ns/docbook"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version="1.0" exclude-result-prefixes="d">
<xsl:template name="book.titlepage.recto">
  <fo:block-container border-style="solid" border-width="10pt"
	border-color="&Color_1st;" top="15mm"
	left="15mm" width="18cm" height="26.5cm" absolute-position="fixed">

    <fo:block margin-left="7mm" margin-top="7mm">
      <fo:table inline-progression-dimension="100%" table-layout="fixed">
        <fo:table-column column-width="50%"/>
        <fo:table-column column-width="50%"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell>
              <fo:block><fo:external-graphic src="{$basedir}/media/paladin-logo.svg"/></fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block>
<xsl:if test="$customer-logo != ''">
      <fo:external-graphic src="{$customer-logo}" margin-left="10mm"/>
</xsl:if>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>

    <fo:block space-before="5cm">
      <xsl:choose>
	<xsl:when test="d:bookinfo/d:title">
	  <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
		select="d:bookinfo/d:title"/>
        </xsl:when>
        <xsl:when test="d:info/d:title">
          <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
		select="d:info/d:title"/>
        </xsl:when>
        <xsl:when test="d:title">
          <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
		select="d:title"/>
        </xsl:when>
      </xsl:choose>
    </fo:block>

    <fo:block space-before="3cm" font-size="12pt" font-weight="bold"
		text-align="left">
      <fo:table inline-progression-dimension="100%" table-layout="fixed">
        <fo:table-column column-width="40%"/>
        <fo:table-column column-width="60%"/>
          <fo:table-body>
<!-- author row -->
            <fo:table-row>
	      <fo:table-cell>
		<fo:block margin-left="7mm" margin-top="4mm">
		  <xsl:call-template name="gentext">
			  <xsl:with-param name="key" select="'Author'"/>
		  </xsl:call-template>
		  <xsl:text>: </xsl:text>
		</fo:block>
	       </fo:table-cell>
	
	<fo:table-cell>
	  <fo:block>
		  <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
			select="d:info/d:author"/>
	  </fo:block>
	</fo:table-cell>
       </fo:table-row>
<!-- end author -->
<!-- ASM row -->
  <fo:table-row>
   <fo:table-cell>
    <fo:block margin-left="7mm">
        <xsl:text>Менеджер технической поддержки:</xsl:text>
    </fo:block>
   </fo:table-cell>
   <fo:table-cell>
    <fo:block>
	<xsl:apply-templates mode="book.titlepage.recto.auto.mode"
			select="d:info/d:asm" />
    </fo:block>
   </fo:table-cell>
  </fo:table-row>
<!--
        <xsl:with-param name="content">
	  <xsl:value-of select="/d:book/d:info/d:asm"/>
	</xsl:with-param>
      </xsl:call-template> -->
<!-- end ASM row -->
            <fo:table-row >
	      <fo:table-cell margin-left="7mm">
	        <fo:block>
            <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'PrepDate'"/>
        </xsl:call-template>
        <!--      <xsl:text>Дата:</xsl:text> -->
		</fo:block>
              </fo:table-cell>
	      <fo:table-cell>
	        <fo:block>
		  <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
			select="d:info/d:pubdate"/>
		</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:block>
  </fo:block-container>
</xsl:template>

<xsl:template name="book.titlepage.verso">
  <fo:block>
<!--
  <fo:block break-after="page">
    <fo:block xsl:use-attribute-sets="section.title.properties">
      <fo:block xsl:use-attribute-sets="section.title.level4.properties">
        <xsl:text>Информация о документе</xsl:text>
      </fo:block>
    </fo:block>
-->
<!--    <fo:table xsl:use-attribute-sets="table.table.properties">
      <xsl:call-template name="table.frame"/>
      <fo:table-column column-width="25%"/>
      <fo:table-column column-width="75%"/>
      <fo:table-body>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Название</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:title"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Автор</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:author/d:personname"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Менеджер проекта</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:editor/d:personname"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Дата создания</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:date"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Дата изменения</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:pubdate"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="create.docinfo.table.row">
        <xsl:with-param name="title"><xsl:text>Версия</xsl:text></xsl:with-param>
	<xsl:with-param name="content"><xsl:value-of select="/d:book/d:info/d:edition"/></xsl:with-param>
      </xsl:call-template>
      </fo:table-body>
    </fo:table>
-->
<!--
      <fo:block xsl:use-attribute-sets="formal.title.properties">
        <xsl:text>Последняя версия данного документа хранится в электронном виде. Актуальность созданных твердых копий не поддерживается.</xsl:text>
      </fo:block>

    <fo:block xsl:use-attribute-sets="section.title.properties">
      <fo:block xsl:use-attribute-sets="section.title.level4.properties">
        <xsl:text>Список распространения</xsl:text>
      </fo:block>
    </fo:block>
-->
<!--
    <fo:table  xsl:use-attribute-sets="table.table.properties">
        <fo:table-column column-width="40%"/>
        <fo:table-column column-width="22%"/>
        <fo:table-column column-width="38%"/>
          <fo:table-header>
            <fo:table-row >
	      <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	        <fo:block font-weight="bold">
	        <xsl:text>Кому</xsl:text>
		</fo:block>
	      </fo:table-cell>
	      <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	        <fo:block font-weight="bold">
	        <xsl:text>Действие</xsl:text>
		</fo:block>
	      </fo:table-cell>
	      <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	        <fo:block font-weight="bold">
	        <xsl:text>Контактная информация</xsl:text>
		</fo:block>
	      </fo:table-cell>
	    </fo:table-row>
	  </fo:table-header>
	  <fo:table-body>
	    <xsl:apply-templates select="d:info/d:othercredit" mode="hpe.titlepage.verso"/>
      </fo:table-body>
    </fo:table>
-->
<!--
    <fo:block xsl:use-attribute-sets="section.title.properties">
      <fo:block xsl:use-attribute-sets="section.title.level4.properties">
        <xsl:text>История изменений</xsl:text>
      </fo:block>
    </fo:block>  
    <fo:table  xsl:use-attribute-sets="table.table.properties">
        <fo:table-column column-width="10%"/>
        <fo:table-column column-width="20%"/>
        <fo:table-column column-width="70%"/>
        <fo:table-header>
          <fo:table-row >
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block font-weight="bold">
	        <xsl:text>Номер версии</xsl:text>
	      </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block font-weight="bold">
	        <xsl:text>Дата</xsl:text>
              </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block font-weight="bold">
	        <xsl:text>Описание изменений</xsl:text>
	      </fo:block>
	    </fo:table-cell>
	  </fo:table-row>
        </fo:table-header>
      <fo:table-body>
        <xsl:for-each select="d:info/d:revhistory/d:revision">
          <fo:table-row >
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block>
	        <xsl:value-of select="d:revnumber" />
	      </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block>
	        <xsl:value-of select="d:date" />
              </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
	      <fo:block>
	        <xsl:value-of select="d:revremark" />
	      </fo:block>
	    </fo:table-cell>
	  </fo:table-row>
	</xsl:for-each>
      </fo:table-body>
    </fo:table>
-->
<!--
  </fo:block>

  <fo:block>
-->
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:legalnotice"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:legalnotice"/>
  </fo:block>
</xsl:template>



<xsl:template match="d:othercredit" mode="hpe.titlepage.verso">
  <fo:table-row>
      <xsl:choose>
        <xsl:when test="d:personname">
	  <xsl:apply-templates select="d:personname"
		mode="hpe.titlepage.verso"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="d:orgname" mode="hpe.titlepage.verso"/>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="d:contrib" mode="hpe.titlepage.verso"/>
      <xsl:apply-templates select="d:email" mode="hpe.titlepage.verso"/>
  </fo:table-row>
</xsl:template>

<xsl:template match="d:othercredit/*" mode="hpe.titlepage.verso">
  <fo:table-cell  xsl:use-attribute-sets="table.cell.padding"
	border-style="solid" border-width="0.5pt">
    <fo:block>
      <xsl:value-of select="."/>
    </fo:block>
  </fo:table-cell>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
	text-align="left" font-size="24pt" space-before="18.6624pt"
	font-weight="bold" font-family="{$title.fontset}"
	margin-left="7mm" margin-right="5mm">
    <xsl:call-template name="division.title">
      <xsl:with-param name="node" select="ancestor-or-self::d:book[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>
<!-- author template -->
<xsl:template match="d:author" mode="book.titlepage.recto.auto.mode">
  <fo:block>
    <xsl:apply-templates select="." mode="hpe.test.mode"/>
  </fo:block>
</xsl:template>
<xsl:template match="d:author/d:personname" mode="hpe.test.mode">
  <fo:block>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
<xsl:template match="d:author/d:affiliation" mode="hpe.test.mode">
  <fo:block>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="d:pubdate" mode="book.titlepage.recto.auto.mode">
  <fo:block>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
<xsl:template name="create.docinfo.table.row">
  <xsl:param name="title"/>
  <xsl:param name="content"/>

  <fo:table-row>
    <xsl:call-template name="table.row.properties"/>
    <fo:table-cell xsl:use-attribute-sets="table.cell.padding"
	border-style="solid" border-width="0.5pt">
      <fo:block font-weight="bold"><xsl:value-of select="$title"/></fo:block>
    </fo:table-cell>
    <fo:table-cell xsl:use-attribute-sets="table.cell.padding" border-style="solid" border-width="0.5pt">
      <fo:block><xsl:value-of select="$content"/></fo:block>
    </fo:table-cell>
  </fo:table-row>
</xsl:template>
</xsl:stylesheet>


