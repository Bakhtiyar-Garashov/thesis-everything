## This is a small HTTP server written in Python (Fastapi). It serves the .pbf vector tiles generated by PostGIS. PostGIS natively supports generating vector tiles from the database table on the fly thanks to "ST_AsMVT". In the client side any library can be used to fetch the tiles based on /zoom/x/y/.pbf

### The project has been introduced in this [conference talk](https://www.youtube.com/watch?v=t8eVmNwqh7M)
### However I have made some minor changes in the implementation such as using FastApi instead of basic HTTP server

1. Create virtual env and install pyscopg2_binary and fastapi
2. Add db credentials to config.py
3. Run the server via `uvicorn main:app --reload`
4. Open http://localhost:8000/zoom/x/y.pbf