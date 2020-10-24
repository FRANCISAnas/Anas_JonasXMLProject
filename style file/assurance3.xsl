<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" />
    <!--
         le directeur aimerait avoir la liste des conseillers ordonnés par le nombre de clients au total
         et les conseillé l'ensemble des risques que chaque conseiller gère
     -->
<xsl:template match="CampagnieAssurance">

    <xsl:variable name="contractsNumber" select="1"/>
    <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>liste des conseillé avec leur clients</title>
            <link rel="stylesheet" href="./css/w3.css"/>
            <link rel="stylesheet" href="./css/scenario3.css"/>
        </head>

        <body>
            <!--<h1 style="text-align:center;">Voici tous les clients ayant au moins <xsl:value-of select="$contractsNumber"/> contrat(s) dans la base de données</h1>-->

            <xsl:apply-templates select="Employees/Conseillers/Conseiller"/>
            <!--<div class="w3-container w3-teal">
                <center><p>Copright Francis-Jonas 2019-2020 </p></center>
            </div>-->


        </body>
    </html>
</xsl:template>

<xsl:template match="Conseiller">
    <xsl:variable name="conseillerId" select="@id"/>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <table style="width:100%" >
        <tr>
            <th colspan="3"><div class="w3-container w3-teal">
                <xsl:value-of select="Nom"/><xsl:text> </xsl:text><xsl:value-of select="Prenom"/>
            </div></th>
        </tr>
        <tr style="height:350px;">
            <td width="35%">
                <img src="images/conseiller.png" alt="Client" style="width:80%; height:330px"/>
            </td>
            <td width="35%">

                <h4 style="text-shadow:1px 1px 0 #444">Id: 3</h4>
                <h4 style="text-shadow:1px 1px 0 #444">Nombre totale de contrats des clients rattaché: 50</h4>
                <br/>
                <h4  style="text-shadow:1px 1px 0 #444">Listes des risques que contiennent les contrats: <xsl:value-of
                        select="$conseillerId"/></h4></td>
            <td width="30%">
                <table style="width:100%;max-height: 350px;overflow-y:scroll" >

                    <tbody style="display: block; height: 350px; overflow-y: scroll">
                        <xsl:apply-templates select="../../../Clients/Client[ConseillerAssocie/@idConseiller=$conseillerId]"/>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</xsl:template>

<xsl:template  match="Client">
    <tr><td><xsl:value-of select="Nom"/></td><xsl:text> </xsl:text><td><xsl:value-of select="Prenom"/></td></tr>
</xsl:template>

</xsl:stylesheet>
