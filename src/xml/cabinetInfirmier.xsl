<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:vds="http://myGame/voyageur_de_sante">
    <xsl:output method="html"/>

    <xsl:param name="id">001</xsl:param>
    <xsl:template match="/">
        <html>
            <head>
                <title>Profil</title>
            </head>
            
            <body>
                Bonjour
                <xsl:value-of select="vds:cabinet/vds:infirmiers/vds:infirmier[@id=$id]/vds:prénom"/>
                
                <br/><br/>

                Aujourd'hui, vous avez 
                <xsl:value-of select="count(vds:cabinet/vds:patients/vds:patient/vds:visite[@intervenant=$id])"/> 
                patients.

                <br/><br/>

                <xsl:for-each select="vds:cabinet/vds:patients/vds:patient/vds:visite[@intervenant=$id]">
                    <xsl:sort select="@date"/>

                    <xsl:value-of select="../vds:nom"/><xsl:text> </xsl:text><xsl:value-of select="../vds:prénom"/>

                    <br/>

                    <xsl:value-of select="../vds:adresse/vds:numéro"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="../vds:adresse/vds:rue"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="../vds:adresse/vds:ville"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="../vds:adresse/vds:codePostal"/>

                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
