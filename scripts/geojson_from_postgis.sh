#!/bin/bash

# change the input database credentials with your own

ogr2ogr -dim 2 -f GeoJSON -s_srs EPSG:3301 -t_srs EPSG:4326 geojson_out/eesti_soilmap_12c.geojson PG:"host=host user=user dbname=dbname password=dbpassword"