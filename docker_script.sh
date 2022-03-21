#! /usr/bin/env bash

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
ADMINAPP="ampregistry:5000/admin_frontend:$TIMESTAMP"
RED='\033[0;31m'
NC='\033[0m' # No Color

docker build -f ./Dockerfile -t $ADMINAPP .
docker push $ADMINAPP
echo -e "$RED$ADMINAPP$NC"