# db config
import os


DATABASE = {
    'user':     os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host':     os.getenv('DB_HOST'),
    'port':     '5432',
    'database': os.getenv('DB_NAME')
    }

# source data table
TABLE = {
    'table':       os.getenv('DB_TABLE'),
    'srid':        '3301',
    'geomColumn':  'wkb_geometry',
    'attrColumns': 'fid, lxtype1' # add more non-spatial columns here if you need them
    }  
