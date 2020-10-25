<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- on a une nouvelle structure qui ne gère que les assurance de types autos
on doit ecrire une transformation qui doit convertir nos données suivant cette structure
-->
<xsl:template match="CampagnieAssurance">
    <CompagnieAuto>
        <Contrats>
            <xsl:apply-templates select="Contrats/Contrat/Auto"/>
        </Contrats>
    </CompagnieAuto>
</xsl:template>
    <xsl:template match="Auto">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <!--<xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>-->

        <xsl:element name='Marque' ><xsl:value-of select="Marque" /></xsl:element> <!-- Une voiture est issue d'une seule marque-->
        <xsl:element name='NumImmarticulation'><xsl:value-of select="NumImmarticulation" /></xsl:element> <!-- Num imm est unique-->
        <xsl:element name='HautGamme'><xsl:value-of select="HautGamme" /></xsl:element>
        <xsl:element name='BonusMalus'><xsl:value-of select="BonusMalus" /></xsl:element>
        <xsl:element name='DatesSinistres'><xsl:value-of select="DatesSinistres" /></xsl:element>
        <xsl:element name='Depistages'><xsl:value-of select="Depistages" /></xsl:element>
        <xsl:element name="Risque"><xsl:value-of select="Risque" /></xsl:element>

        <xsl:attribute name='date_permis'><xsl:value-of select="date_permis" /></xsl:attribute>
        <xsl:attribute name='date_permis_conjoint'><xsl:value-of select="date_permis_conjoint" /></xsl:attribute>
        <xsl:attribute name='date_mise_en_circu'><xsl:value-of select="date_mise_en_circu" /></xsl:attribute>
        <xsl:attribute name='id' ><xsl:value-of select="../@id" /></xsl:attribute>
        <xsl:attribute name="date_debut_contrat"><xsl:value-of select="../@date_debut_contrat" /></xsl:attribute>
        <xsl:attribute name="date_fin_contrat"><xsl:value-of select="../@date_fin_contrat" /></xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
