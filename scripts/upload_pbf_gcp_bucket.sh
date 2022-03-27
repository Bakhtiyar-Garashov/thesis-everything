#!/bin/sh

# create a bucket and copy gsutil URI
# assuimg that you already have gsutil cli downloaded
# -m for uploading large files in parallel
# -r for recursive directory upload


gsutil -m cp -r soil_12c_drop_denser-8-16 gs://eesti-soil-vtiles

# URL to retrieve tiles 
# https://storage.googleapis.com/eesti-soil-vtiles/soil_12c_drop_denser-8-16/{z}/{x}/{y}.pbf
# no security - public access :)

# After download finished CORS issue will prevent accessing individual tiles from the browser

# Fix CORS issue

# create JSON file locally and add cors rules inside

touch cors.json

echo '[
    {
      "origin": ["*"],
      "method": ["*"]
    }
]' > cors.json # allow everything :)

gsutil cors set cors.json gs://eesti-soil-vtiles

# reload browser, move to study area and see tiles