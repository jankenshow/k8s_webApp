#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
# Get primary db
PRIMARY_DB=$(mongo --eval "rs.isMaster().primary" --quiet)

echo "Primary DB server exists in : ${PRIMARY_DB}"

# Create user 
mongo --host ${PRIMARY_DB} weblog -u admin -p Passw0rd --authenticationDatabase admin ${SCRIPT_DIR}/adduser.js --quiet

# Create collection & insert initial data
mongo --host ${PRIMARY_DB} weblog -u admin -p Passw0rd --authenticationDatabase admin ${SCRIPT_DIR}/insert.js --quiet
