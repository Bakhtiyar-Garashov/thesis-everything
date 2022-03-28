Source of knowledge:

1. https://stackoverflow.com/a/66267055/13852458 
2. TileServer-GL github repository: https://github.com/maptiler/tileserver-gl

Before all we need to create mbtiles for each layer.

1. Use ogr2ogr to create geojson for each layer.
2. Use tippecanoe to create mbtiles for each layer from geojson.