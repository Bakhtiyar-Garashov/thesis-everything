#!/bin/sh

# change the input data for your own
ogr2ogr -dim 2 -f GeoJSON -s_srs EPSG:3301 -t_srs EPSG:4326 geojson_out/eesi_soilmap_12c_all.geojson EstSoil-EH_v1.2c.gpkg