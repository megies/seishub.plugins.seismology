<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink" version="1.0">

    <xsl:output method="xml" encoding="utf-8" indent="yes" media-type="text/html"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        omit-xml-declaration="yes"/>

    <xsl:template match="/xseed/station_control_header/channel_identifier/channel_identifier">
        <xsl:value-of select="current()"/>
        <br/>
    </xsl:template>

    <xsl:template match="/xseed">
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <xsl:value-of
                        select="station_control_header/station_identifier/station_call_letters"/>
                </title>
                <link rel="stylesheet" type="text/css"
                    href="http://www.seishub.org/css/components.css"/>
                <script type="text/javascript" src="http://www.google.com/jsapi?key=ABQIAAAAIDhiU213jGUICTII1pgroxSm6VGAPp-deNb6gPN5c2KwQz-qtBQbZAUxnXbLVerGtrtmNRXZX-Fdog"></script>
                <script type="text/javascript">
                    <xsl:text>
<![CDATA[
    google.load("maps", "2.x");
    
    function initialize() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map_canvas"));
]]>
                    </xsl:text>
                    <xsl:text>var lat = </xsl:text>
                    <xsl:value-of select="station_control_header/station_identifier/latitude"/>
                    <xsl:text>; var long = </xsl:text>
                    <xsl:value-of select="station_control_header/station_identifier/longitude"/>
                    <xsl:text>;</xsl:text>
                    <xsl:text>
<![CDATA[
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl());
        map.addMapType(G_PHYSICAL_MAP);
        var center = new GLatLng(lat, long);
        map.setCenter(center, 13);
        var marker = new GMarker(center, {});
        map.addOverlay(marker);
      }
    }
]]>
                    </xsl:text>
                </script>
            </head>
            <body onload="initialize()" onunload="GUnload()">
                <h1>
                    <xsl:value-of
                        select="station_control_header/station_identifier/station_call_letters"/>
                </h1>

                <table>
                    <tr>
                        <th>Station call letters</th>
                        <td>
                            <xsl:value-of
                                select="station_control_header/station_identifier/station_call_letters"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Latitude</th>
                        <td>
                            <xsl:value-of
                                select="station_control_header/station_identifier/latitude"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Longitude</th>
                        <td>
                            <xsl:value-of
                                select="station_control_header/station_identifier/longitude"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Elevation</th>
                        <td>
                            <xsl:value-of
                                select="station_control_header/station_identifier/elevation"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Site name</th>
                        <td>
                            <xsl:value-of
                                select="station_control_header/station_identifier/site_name"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Channels</th>
                        <td>
                            <xsl:apply-templates
                                select="/xseed/station_control_header/channel_identifier/channel_identifier"
                            />
                        </td>
                    </tr>
                </table>

                <br/>
                <br/>

                <div id="map_canvas" style="width: 700px; height: 500px"/>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
