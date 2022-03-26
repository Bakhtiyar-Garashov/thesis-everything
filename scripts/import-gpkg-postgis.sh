#!/bin/bash

# this script imports a GeoPackage file into a PostGIS database
# it requires to be in the same directory as the GeoPackage file
# replace the postgres user and password with your own
# I am running this command in the same VM instance as the PostGIS database server. So, host is localhost

# import Estonian soilmap dataset
ogr2ogr -f PostgreSQL "PG:dbname=thesis-db user='postgres' password='password' host='localhost'" EstSoil-EH_v1.2c.gpkg

# import Estonian topographic database
ogr2ogr -f PostgreSQL "PG:dbname=thesis-db user='postgres' password='password' host='localhost'" ETAK_EESTI_GPKG.gpkg