import psycopg2
from config.config import DATABASE, TABLE

# validate if the tile is correct


def tile_is_valid(tile):
    if not ("x" in tile and "y" in tile and "zoom" in tile):
        return False
    if "format" not in tile or tile["format"] not in ["pbf", "mvt"]:
        return False
    size = 2 ** tile["zoom"]
    if tile["x"] >= size or tile["y"] >= size:
        return False
    if tile["x"] < 0 or tile["y"] < 0:
        return False
    return True


# calculate envelope for EPSG:3857
def tile_to_envelope(tile):
    # Width of world in EPSG:3857
    worldMercMax = 20037508.3427892
    worldMercMin = -1 * worldMercMax
    worldMercSize = worldMercMax - worldMercMin
    # Width in tiles
    worldTileSize = 2 ** tile["zoom"]
    # Tile width in EPSG:3857
    tileMercSize = worldMercSize / worldTileSize
    # Calculate geographic bounds from tile coordinates
    # XYZ tile coordinates are in "image space" so origin is
    # top-left, not bottom right
    env = dict()
    env["xmin"] = worldMercMin + tileMercSize * tile["x"]
    env["xmax"] = worldMercMin + tileMercSize * (tile["x"] + 1)
    env["ymin"] = worldMercMax - tileMercSize * (tile["y"] + 1)
    env["ymax"] = worldMercMax - tileMercSize * (tile["y"])
    return env


def envelope_to_bounds(env):
    DENSIFY_FACTOR = 4
    env["segSize"] = (env["xmax"] - env["xmin"]) / DENSIFY_FACTOR
    sql_tmpl = (
        "ST_Segmentize(ST_MakeEnvelope({xmin}, {ymin}, {xmax}, {ymax}, 3857),{segSize})"
    )
    return sql_tmpl.format(**env)


# generate a tile from a given envelope
def envelope_to_sql(env):
    tbl = TABLE.copy()
    tbl["env"] = envelope_to_bounds(env)

    # main logic: convert the envelope to a geometry, clip and return the tile
    sql_tmpl = """
            WITH 
            bounds AS (
                SELECT {env} AS geom, 
                       {env}::box2d AS b2d
            ),
            mvtgeom AS (
                SELECT ST_AsMVTGeom(ST_Transform(t.{geomColumn}, 3857), bounds.b2d) AS geom, 
                       {attrColumns}
                FROM {table} t, bounds
                WHERE ST_Intersects(t.{geomColumn}, ST_Transform(bounds.geom, {srid}))
            ) 
            SELECT ST_AsMVT(mvtgeom.*) FROM mvtgeom
        """
    return sql_tmpl.format(**tbl)


# Run tile query SQL and return error on failure conditions


def sql_to_pbf(sql):
    DATABASE_CONNECTION = None
    # Make and hold connection to database
    if not DATABASE_CONNECTION:
        try:
            DATABASE_CONNECTION = psycopg2.connect(**DATABASE)
        except (Exception, psycopg2.Error) as error:
            print("Error while connecting to PostgreSQL", error)
            return None

    # Query for MVT
    with DATABASE_CONNECTION.cursor() as cur:
        cur.execute(sql)
        if not cur:
            print("No data found")
            return None
        return cur.fetchone()[0]
