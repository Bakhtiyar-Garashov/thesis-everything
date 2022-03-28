#!/bin/bash

# after Postgresql installation, you need to edit configs for remote connections

# Step 1. Edit postgresql.conf

# go to tile directory
cd /etc/postgresql/{your_version}/main

sudo nano postgresql.conf

# scroll down to listen_addresses = '*' line and uncomment it

# save and exit

# Step 2. Edit pg_hba.conf

cd /etc/postgresql/{your_version}/main

sudo nano pg_hba.conf

# scroll down to ipv4 line and add the following line
# IPv4 local connections:
# host    all             all              0.0.0.0/0            md5

# Please note that this drops all the security in terms of incoming connections.
# Do it only if you are sure what you are doing.

# And finally restart Postgresql service

sudo systemctl restart postgresql