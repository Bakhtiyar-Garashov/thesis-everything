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

### Connect to Postgis via Geoserver

1. Go to stores section from the left sidebar
2. Add new store
3. Choose PostGIS data store
4. Fill in the following fields:
    * Name: ``
    * Database: ``
    * Host: `localhost`
    * Port: `5432`
    * Username: `postgres`
    * Password: `postgres`
    * Schema: `public` (For EstSoil dataset schema name is different, for Topographic dataset it is default public)

5. Then simply publish the layer.