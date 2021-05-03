#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Get primary db
PRIMARY_DB=$(mongo --eval "rs.isMaster().primary" --quiet)

# Create user 
mongo --host ${PRIMARY_DB} weblog -u admin -p Passw0rd --authenticationDatabase admin ${SCRIPT_DIR}/adduser.js

# Create collection & insert initial data
mongo --host ${PRIMARY_DB} weblog -u admin -p Passw0rd --authenticationDatabase admin ${SCRIPT_DIR}/insert.js
