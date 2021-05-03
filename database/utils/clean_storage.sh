#!/bin/bash

PROJECT_DIR=$(dirname $(dirname $(cd $(dirname $0); pwd)))


rm -rf ${PROJECT_DIR}/storage/pv00?/*
# cp ${PROJECT_DIR}/database/src/replicate_db.sh ${PROJECT_DIR}/storage/pv000/
# cp ${PROJECT_DIR}/database/src/replicate_db.sh ${PROJECT_DIR}/storage/pv001/
# cp ${PROJECT_DIR}/database/src/replicate_db.sh ${PROJECT_DIR}/storage/pv002/
# cp ${PROJECT_DIR}/database/src/replicate_db.js ${PROJECT_DIR}/storage/pv000/
# cp ${PROJECT_DIR}/database/src/replicate_db.js ${PROJECT_DIR}/storage/pv001/
# cp ${PROJECT_DIR}/database/src/replicate_db.js ${PROJECT_DIR}/storage/pv002
touch ${PROJECT_DIR}/storage/pv000/.gitkeep
touch ${PROJECT_DIR}/storage/pv001/.gitkeep
touch ${PROJECT_DIR}/storage/pv002/.gitkeep