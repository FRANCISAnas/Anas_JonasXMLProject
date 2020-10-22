<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <!-- <xsl:output encoding="UTF-8" indent="yes" method="xml" />-->
<!-- Toto est un conseiller et il veut voir tous les contrats d'assurance de type automobile dans la base de données
 ou un aperçu de tous les contrats par type de contrats ainsi que le nombre total que chaque type de contrats contient
 pour les auto il aimerait savoir si ces auto sont de haute gamme ou pas pour les habitations si elles ont des dépendances ou pas
 et pour l'emprunt si la date d'échéance du client est tout proche ou dépassé-->
    <xsl:template match="CampagnieAssurance">
        <html>
            <head>
                <title>Contrat d'assurace automobile</title>
            </head>
            <style>
                .center{
                margin-left: auto;
                margin-right: auto;
                }
            </style>
            <body>
                <h1 style="text-align:center;">Voici tous les contrats automobile présente dans la base de données</h1>
                <table border="1" class="center">
                    <tr bgcolor="#2ecc71">
                        <th align="left">ID</th>
                        <th align="left">Date_permis</th>
                        <th align="left">Date_permis_conjoint</th>
                        <th align="left">date_mise_en_circu</th>
                        <th align="left">Marque</th>
                        <th align="left">NumImmarticulation</th>
                        <th align="left">Prix</th>
                        <th align="left">Bonus/Malus</th>
                    </tr>
                    <xsl:apply-templates select="Contrats/Contrat/Auto"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Auto">
        <xsl:element name="dates">
            <tr>
                <th align="left">
                    <xsl:value-of select="../@id"/>
                </th>

                <th align="left">
                    <xsl:value-of select="@date_permis"/>
                </th>

                <th align="left">
                    <xsl:value-of select="@date_permis_conjoint"/>
                </th>

                <th align="left">
                    <xsl:value-of select="@date_mise_en_circu"/>
                </th>
                <xsl:apply-templates select="Marque"/>
                <xsl:apply-templates select="NumImmarticulation"/>
                <xsl:apply-templates select="HautGamme/Prix"/>
                <xsl:apply-templates select="BonusMalus/Valeur"/>
            </tr>
        </xsl:element>
    </xsl:template>

    <xsl:template  match="Auto/Marque">
        <th align="left">
            <xsl:value-of select="."/>
        </th>
    </xsl:template>

    <xsl:template match="Auto/NumImmarticulation">
        <th align="left">
            <xsl:value-of select="."/>
        </th>
    </xsl:template>

    <xsl:template match="Auto/HautGamme/Prix">
        <th align="left">
            <xsl:value-of select="."/>
        </th>
    </xsl:template>

    <xsl:template match="Auto/BonusMalus/Valeur">
        <th align="left">
            <xsl:value-of select="."/>
        </th>
    </xsl:template>

</xsl:stylesheet>
