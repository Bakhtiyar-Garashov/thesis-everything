#!/bin/sh

# create a bucket and copy gsutil URI
# assuimg that you already have gsutil cli downloaded
# -m for uploading large files in parallel
# -r for recursive directory upload


gsutil -m cp -r soil_12c_drop_denser-8-16 gs://eesti-soil-vtiles
