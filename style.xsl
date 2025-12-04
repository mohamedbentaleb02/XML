<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Tableau des Cours</title>
                <style>
                    table { border-collapse: collapse; width: 100%; font-family: Arial, sans-serif; }
                    th { background-color: #4CAF50; color: white; padding: 10px; }
                    td { border: 1px solid #ddd; padding: 8px; vertical-align: top; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                    .tag { background-color: #ddd; padding: 2px 5px; border-radius: 4px; font-size: 0.9em; margin-right: 3px; display: inline-block; margin-bottom: 3px;}
                </style>
            </head>
            <body>
                <h1 style="text-align:center;">Tableau Récapitulatif des Cours</h1>
                
                <table>
                    <thead>
                        <tr>
                            <th>Titre</th>
                            <th width="20%">Résumé</th>
                            <th>Objectifs &amp; Prérequis</th>
                            <th>Détails (Langue, Type, Durée)</th>
                            <th>Mots-clés</th>
                            <th>Équipe Pédagogique</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ListeCours/cours">
                            
                            <xsl:sort select="Titre" order="ascending"/> 

                            <tr>
                                <td>
                                    <b><xsl:value-of select="Titre"/></b><br/>
                                    <a href="{lienAcces}" target="_blank" style="font-size:0.8em; color:blue;">(Voir le site)</a>
                                </td>

                                <td><xsl:value-of select="Resume"/></td>

                                <td>
                                    <b>Objectifs :</b>
                                    <ul>
                                        <xsl:for-each select="objectifs/objectif">
                                            <li><xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </ul>
                                    <b>Prérequis :</b> <br/>
                                    <i><xsl:value-of select="prerequis"/></i>
                                </td>

                                <td>
                                    <b>Langue :</b> <xsl:value-of select="@LANG"/><br/>
                                    <b>Type :</b> <xsl:value-of select="type"/><br/>
                                    <b>Durée :</b> <xsl:value-of select="duree"/>
                                </td>

                                <td>
                                    <xsl:for-each select="motscles/motcle">
                                        <span class="tag"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </td>

                                <td>
                                    <u>Auteurs :</u><br/>
                                    <xsl:for-each select="auteurs/auteur">
                                        - <xsl:value-of select="."/><br/>
                                    </xsl:for-each>
                                    
                                    <br/>
                                    <xsl:if test="tuteurs/tuteur">
                                        <u>Tuteurs :</u><br/>
                                        <xsl:for-each select="tuteurs/tuteur">
                                            - <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>