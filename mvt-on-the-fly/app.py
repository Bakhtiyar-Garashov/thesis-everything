from fastapi import FastAPI, HTTPException, Response
from helpers import tile_is_valid, tile_to_envelope, envelope_to_sql, sql_to_pbf

app = FastAPI()


@app.get("/tiles/{zoom}/{x}/{y}.{format}")
def get_tile(zoom: int, x: int, y: int, format: str):
    tile = {"zoom": zoom, "x": x, "y": y, "format": format}

    if not tile_is_valid(tile) or not tile:
        raise HTTPException(
            status_code=400,
            detail=f"Bad request for the requested tile. Please check the tile parameters. Zoom: {zoom}, X: {x}, Y: {y}, Format: {format}",
        )
    
    envelope = tile_to_envelope(tile)
    sql = envelope_to_sql(envelope)
    tile = sql_to_pbf(sql)

    headers = {"Access-Control-Allow-Origin": "*", "Content-type": "application/vnd.mapbox-vector-tile"}

    return Response(content=tile, headers=headers)
