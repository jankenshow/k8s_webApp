#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

mongo ${MONGO_INITDB_DATABASE} -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} ${SCRIPT_DIR}/replicate_db.js