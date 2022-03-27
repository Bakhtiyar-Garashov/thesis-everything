#!/bin/bash

# mbtiles is a single packaged tilesets
# however we can extract it to directory .pb files via the tool called mbutil


# First install it

git clone git://github.com/mapbox/mbutil.git
cd mbutil
# manual how it works
./mb-util -h

sudo python setup.py install

# then you can run:
# in mbtuil directory

mb-util --image_format=pbf mbtiles/soil_all.mbtiles tiles/soil_map/