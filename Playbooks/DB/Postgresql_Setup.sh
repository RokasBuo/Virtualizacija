#!/bin/bash

dbuser=$USER
sudo -u postgres createuser -s -w $dbuser 2> /dev/null
createdb -U $dbuser -w callcenter 2> /dev/null
sudo -u postgres psql -f /tmp/CallCenterSetup/DB_Setup.sql -d callcenter -U postgres


exit 0
