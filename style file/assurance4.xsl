<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Une compagnie d’assurance ne gérant que les contrats de type auto souhaite exploiter nos données,
    pour cela il veut qu’on lui présente sous un nouveau format les données actuelles,
    ces données ne doivent comprendre que les contrats de type Auto,
    les client concernés ainsi que les conseillers qui sont chargés de ces clients.-->
<xsl:template match="CampagnieAssurance">
    <CompagnieAuto>
        <Clients>
            <xsl:apply-templates select="Clients/Client[ContratsAssocies/ContratClient/TypeContrat='Auto']"/>
        </Clients>
        <Conseillers>
            <xsl:apply-templates select="Conseillers/Conseiller"/>
        </Conseillers>
        <Contrats>
            <xsl:apply-templates select="Contrats/Contrat/Auto"/>
        </Contrats>
    </CompagnieAuto>
</xsl:template>
<xsl:template match="Conseiller">
    <xsl:variable name="testVal">
        <xsl:call-template name="ClientWithWaracteristics">
            <xsl:with-param name="idC" select="@id"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$testVal='1'">
        <xsl:copy-of select="."/>
    </xsl:if>
</xsl:template>
    <xsl:template name="ClientWithWaracteristics">
        <xsl:param name="idC"/>
       <xsl:value-of select="$idC"/>
    </xsl:template>
<xsl:template match="Client">
    <xsl:copy-of select="."/>
</xsl:template>
<xsl:template match="Auto">
    <xsl:element name="Contrat">
        <xsl:copy-of select="."/>
        <xsl:element name='id' ><xsl:value-of select="../@id" /></xsl:element>
        <xsl:element name="date_debut_contrat"><xsl:value-of select="../@date_debut_contrat" /></xsl:element>
        <xsl:element name="date_fin_contrat"><xsl:value-of select="../@date_fin_contrat" /></xsl:element>
    </xsl:element>
</xsl:template>
</xsl:stylesheet>
