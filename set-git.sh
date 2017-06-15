#!/bin/bash

# If running in the local playground and you need github outh
#  https://hyperledger.github.io/composer/managing/github-oauth.html
# change these values to match your own github details

GIT_CLIENTID=01123456789abcdef035
GIT_CLIENTSECRET=098bfc2345bbbacd43f6ef66f94d32aec

DOCKERID=$(docker ps | awk '$2 ~ /composer-playground/ {print $1}')

docker cp ${DOCKERID}:/usr/local/lib/node_modules/composer-playground/node_modules/composer-playground-api/config/.env.sample .
cat .env.sample | sed "s/CLIENT_ID=.*/CLIENT_ID=${GIT_CLIENTID}/" | sed "s/CLIENT_SECRET=.*/CLIENT_SECRET=${GIT_CLIENTSECRET}/" > .env
docker cp ./.env ${DOCKERID}:/usr/local/lib/node_modules/composer-playground/node_modules/composer-playground-api/config/.env
