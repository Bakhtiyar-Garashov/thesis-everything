### Geostyler

The SLD style file in this directory has been created via GeoStyler plugin of GeoServer.

Some learning materials:
1. https://youtu.be/bLYMTCV4tMw
2. https://youtu.be/UzEorIBgbQA


Steps to add plugin:

1. Go to GeoServer distributions repository: https://build.geoserver.org/geoserver/main/community-2022-03-27/
2. Taking into account that we are using SSH connection to remote server where Geoserver resides, we need to use `wget` command to download the plugin and `unzip` command to extract it.
3. Put the tile into `geoserver/webapps/geoserver/WEB-INF/lib/` directory.
4. Restart the server.