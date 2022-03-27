#!/bin/bash

# this script is used to convert geojson to mbtiles

# update homebrew repository
# for Macos
brew update && brew upgrade

# install tippecanoe

brew install tippecanoe

# for Ubuntu

git clone https://github.com/mapbox/tippecanoe.git
cd tippecanoe
make -j
make install

# convert geojson to mbtiles
tippecanoe --drop-densest-as-needed  --minimum-zoom=8 --maximum-zoom=16 --drop-fraction-as-needed --drop-smallest-as-needed --cluster-densest-as-needed --simplify-only-low-zooms --extend-zooms-if-still-dropping --no-tile-compression --output-to-directory soil_12c_drop_denser-8-16 geojson_out/eesti_soilmap_12c.geojson
