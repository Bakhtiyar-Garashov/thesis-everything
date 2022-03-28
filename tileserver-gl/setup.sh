#!/bin/bash


TILESERVER_HOME=/tileserver-gl

DATA_DIR=${TILESERVER_HOME}/mbtiles/
CONFIG_DIR=${TILESERVER_HOME}/config/
STYLE_DIR=${TILESERVER_HOME}/styles/
SPRITES_DIR=${TILESERVER_HOME}/sprites/
FONT_DIR=${TILESERVER_HOME}/fonts/

docker stop tileserver-gl && docker rm tileserver-gl

# Tileserver has  a docker image with all dependencies

docker run --log-driver json-file --log-opt compress=true --log-opt max-size=100m --log-opt max-file=3 -d --name tileserver-gl --restart=always -v ${SPRITES_DIR}:/sprites -v ${DATA_DIR}:/data -v ${STYLE_DIR}:/styles -v ${FONT_DIR}:/fonts -v ${CONFIG_DIR}:/config -p 0.0.0.0:8080:80 maptiler/tileserver-gl:latest --verbose --config /config/config.json

