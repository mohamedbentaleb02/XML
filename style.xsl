<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Détail des Séances</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { border-collapse: collapse; width: 100%; margin-top: 20px; }
                    th { background-color: #003366; color: white; padding: 12px; text-align: left;}
                    td { border: 1px solid #ddd; padding: 10px; vertical-align: top; }
                    tr:nth-child(even) { background-color: #f9f9f9; }
                    .info-cours { background-color: #e3f2fd; padding: 15px; border-left: 5px solid #2196F3; }
                </style>
            </head>
            <body>
                <div class="info-cours">
                    <h1>Planning du cours : <xsl:value-of select="ListeCours/cours[Titre='Technologie XML']/Titre"/></h1>
                    <p><b>Intervenant principal :</b> <xsl:value-of select="ListeCours/cours[Titre='Technologie XML']/auteurs/auteur"/></p>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Séance</th>
                            <th>Infos (Type/Durée)</th>
                            <th>Tuteur</th>
                            <th>Objectifs de la séance</th>
                            <th>Support de cours</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ListeCours/cours[Titre='Technologie XML']/seances/seance">
                            <tr>
                                <td>
                                    <b><xsl:value-of select="titre"/></b>
                                </td>
                                
                                <td>
                                    <span style="color:green"><xsl:value-of select="type"/></span><br/>
                                    ⏱ <xsl:value-of select="duree"/>
                                </td>

                                <td>
                                    <xsl:value-of select="tuteur"/>
                                </td>

                                <td>
                                    <xsl:value-of select="objectifs_seance"/>
                                </td>

                                <td>
                                    <b><xsl:value-of select="support/titre_support"/></b><br/>
                                    <i><xsl:value-of select="support/resume_support"/></i><br/><br/>
                                    
                                    <a style="background:orange; color:white; padding:5px 10px; text-decoration:none; border-radius:3px;" 
                                       target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="support/lien_acces"/>
                                        </xsl:attribute>
                                        📄 Télécharger
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <xsl:if test="not(ListeCours/cours[Titre='Technologie XML']/seances/seance)">
                    <p style="color:red; margin-top:20px;">Aucune séance planifiée pour ce cours.</p>
                </xsl:if>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>