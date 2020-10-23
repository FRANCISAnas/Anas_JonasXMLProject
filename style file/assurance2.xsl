<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Les clients qui ont au moins 2 contrat d'assurance dans la base de données -->
    <xsl:template match="CampagnieAssurance">

        <xsl:variable name="contractsNumber" select="1"/>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>Clients Ayant au moins <xsl:value-of select="$contractsNumber+1"/> contrat(s) dans la base </title>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        </head>

        <body>
            <h1 style="text-align:center;">Voici tous les clients ayant au moins <xsl:value-of select="$contractsNumber+1"/> contrat(s) dans la base de données</h1>
            <div class="w3-row-padding">
                <!--w3-col m8 l9-->
                <xsl:apply-templates select="Clients/Client[count(ContratsAssocies/ContratClient)>=$contractsNumber+1]"/>
            </div>
            <div class="w3-container w3-teal">
                <center><p>Copright Francis-Jonas 2019-2020 </p></center>
            </div>
        </body>
    </xsl:template>

    <xsl:template match="Client">
        <xsl:variable name="nContrats" select="count(ContratsAssocies/ContratClient)"/>
        <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
        <div class="w3-col s4">
            <div class="w3-container w3-teal">

                <h2><xsl:value-of select="translate(Nom, $smallcase, $uppercase)"/> <xsl:text> </xsl:text> <xsl:value-of select="Prenom"/>
                    <xsl:text> | </xsl:text>
                    <xsl:value-of select="$nContrats"/>
                    <xsl:choose>
                        <xsl:when test="$nContrats>0"><xsl:text> contrats</xsl:text></xsl:when>
                        <xsl:otherwise><xsl:text> contrat</xsl:text></xsl:otherwise>
                    </xsl:choose>

                </h2>
            </div>
            <center>
                <img src="../images/client.png" alt="Client" style="width:80%"/>
            </center>
            <div class="w3-container">
                <p>Id:
                    <xsl:value-of select="@id"/>
                <br/>
                    Date de naissance:
                    <xsl:value-of select="DateDeNaissance"/>
                <br/>
                    Adresse Postale:
                    <xsl:apply-templates select="AdressePostal"/>
                <br/>
                    RIB:
                    <xsl:value-of select="DonnesBancaire/RIB"/>
                </p>
            </div>
        </div>
    </xsl:template>

    <xsl:template  match="Client/AdressePostal">
        <!--<xsl:apply-templates select="Adresse" ></xsl:apply-templates>-->
            <xsl:value-of select="CodePostal"/>|<xsl:value-of select="Ville"/>|<xsl:value-of select="Pays"/>
    </xsl:template>

</xsl:stylesheet>
