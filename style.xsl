<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Exercice 2 - Liste des Cours</title>
            </head>
            <body>
                <h1>Liste des Cours</h1>
                
                <xsl:for-each select="ListeCours/cours">
                    
                    <div style="border-bottom: 1px solid gray; margin-bottom: 20px; padding-bottom: 10px;">
                        <h2 style="color: darkblue;">
                            <xsl:value-of select="Titre"/>
                        </h2>

                        <p>
                            <strong>Auteurs : </strong>
                            <xsl:for-each select="auteurs/auteur">
                                <xsl:value-of select="."/>
                                <xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>
                        </p>

                        <xsl:if test="tuteurs/tuteur">
                            <p>
                                <strong>Tuteurs : </strong>
                                <xsl:for-each select="tuteurs/tuteur">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>
                    </div>

                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>