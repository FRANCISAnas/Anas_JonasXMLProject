<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" />
    <!--
         le directeur aimerait visualiser tous les conseillers
         Pour chaque conseiller il aimerait savoir
         le nom et prenom de ce conseiller ainsi que son Id
         la liste ordonnée par nombre de contrats des clients qu'ils conseillent
         la somme de tous les contrats des clients de ce conseiller
     -->
<xsl:template match="CampagnieAssurance">

    <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>liste des conseillé avec leur clients</title>
            <link rel="stylesheet" href="./css/w3.css"/>
            <link rel="stylesheet" href="./css/scenario3.css"/>
        </head>

        <body>
            <xsl:apply-templates select="Conseillers/Conseiller"/>

            <div class="w3-container w3-teal">
                <center><p>Copright Francis-Jonas 2019-2020 </p></center>
            </div>
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
                <xsl:value-of select="translate(Nom, $smallcase, $uppercase)"/><xsl:text> </xsl:text><xsl:value-of select="Prenom"/>
            </div></th>
        </tr>
        <tr style="height:250px;">
            <td width="35%">
                <img src="images/conseiller.png" alt="Client" style="width:80%; height:330px"/>
            </td>
            <td width="35%">

                <h4 style="text-shadow:1px 1px 0 #444">Id: <xsl:value-of select="@id"/></h4>

                <h4 style="text-shadow:1px 1px 0 #444">Nombre de clients rattaché:
                    <xsl:value-of  select="count(../../Clients/Client[ConseillerAssocie/@idConseiller=$conseillerId])"/>
                </h4><h4 style="text-shadow:1px 1px 0 #444">Nombre totale de contrats de ses clients:
                <xsl:value-of  select="count(../../Clients/Client[ConseillerAssocie/@idConseiller=$conseillerId]/ContratsAssocies/ContratClient)"/>
            </h4>
        </td>
            <td width="30%">
                <table style="width:100%;max-height: 210px;overflow-y:scroll" >

                    <caption><h3>liste des  client(s) auquel il est rattaché</h3></caption>

                    <tbody style="display: block; height: 210px; overflow-y: scroll">
                        <tr>
                            <th style="width:40%;">Nom</th>
                            <th style="width:40%;">Prenom</th>
                            <th style="width:20%;">Contrats</th>
                        </tr>
                        <xsl:apply-templates select="../../Clients/Client[ConseillerAssocie/@idConseiller=$conseillerId]"/>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</xsl:template>

<xsl:template  match="Client">
    <tr>
        <td style="width:40%; text-align:center;"><xsl:value-of select="Nom"/></td>
        <td style="width:40%; text-align:center;"><xsl:value-of select="Prenom"/></td>
        <td style="width:20%; text-align:center;"><xsl:value-of select="count(ContratsAssocies/ContratClient)"/></td>
    </tr>
</xsl:template>
    <xsl:template match="Risque">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
