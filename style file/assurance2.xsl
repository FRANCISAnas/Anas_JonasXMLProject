<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Les clients qui ont au moins 2 contrat d'assurance dans la base de données -->
    <xsl:template match="CampagnieAssurance">
        <head>
            <title>Cleints Ayant au moins 2 contrats dans la base </title>
        </head>

        <body>
            <h1>Voici tous les clients ayant au moins 2 contrat dans la base de données</h1>
            <table border="1">
                <tr bgcolor="#2ecc71">
                    <th align="left">ID</th>
                    <th align="left">Nom</th>
                    <th align="left">Prenom</th>
                    <th align="left">Date_de_naissance</th>
                    <th align="left">Adresse</th>
                    <th align="left">Tel</th>
                    <th align="left">Email</th>
                    <th align="left">RIB</th>
                </tr>
                <xsl:apply-templates select="Cleints/Client"></xsl:apply-templates>
            </table>
        </body>
    </xsl:template>

    <xsl:template match="Cleint">
        <tr>
            <th align="left">
                <xsl:value-of select="Cleint/@id"></xsl:value-of>
            </th>
            <th align="left">
                <xsl:value-of select="Cleint/Nom"></xsl:value-of>
            </th>
            <th align="left">
                <xsl:value-of select="Cleint/Prenom"></xsl:value-of>
            </th>
            <th align="left">
                <xsl:value-of select="Cleint/DateDeNaissance"></xsl:value-of>
            </th>
            <xsl:apply-templates select="Cleint/AdressePostal" ></xsl:apply-templates>
            <th align="left">
                <xsl:value-of select="Cleint/Tel"></xsl:value-of>
            </th>
            <th align="left">
                <xsl:value-of select="Cleint/DonnesBancaire/RIB"></xsl:value-of>
            </th>
        </tr>
    </xsl:template>

    <xsl:template  match="Cleint/AdressePostal">

        <!--<xsl:apply-templates select="Adresse" ></xsl:apply-templates>-->

        <th align="left">
            <xsl:value-of select="Cleint/AdressePostal/CodePostal"/>
        </th>
        <th align="left">
            <xsl:value-of select="Cleint/AdressePostal/Ville"/>
        </th>
        <th align="left">
            <xsl:value-of select="Cleint/AdressePostal/Pays"/>
        </th>



    </xsl:template>

</xsl:stylesheet>