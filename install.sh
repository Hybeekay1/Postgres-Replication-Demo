#!/bin/bash
# ==========================================================
# install script for running the docker postgres replication scenario
# postgres containers are started without any password
# ===========================================================
echo "Building Master Image"
docker build -t postgres-master -f ./master/Dockerfile ./master-db
# ==========================================================
echo "Build Replica Image"
docker build -t postgres-slave -f ./slave/Dockerfile ./slave-db
# ==========================================================
echo "Creating Network"
docker network create -d bridge test
# ==========================================================
echo "Creating Volumes Directory"
docker volume create master-data
docker volume create slave-data
# ==========================================================
echo "Starting Master-db in Detached Mode"
docker run \
    --name master-db \
    --rm -d \
    --network test \
    -e POSTGRES_USER=test \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    -e POSTGRES_DB=test \
    -e PG_REP_USER=replicator \
    -v master-data:/var/lib/postgresql/data \
    -p 15432:5432 \
    postgres-master


echo "Starting slave in Detached Mode"
docker run \
    --name slave-db \
    --rm -d \
    --network test \
    -e POSTGRES_USER=test \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    -e POSTGRES_DB=test \
    -e PG_REP_USER=replicator \
    -v replica-data:/var/lib/postgresql/data \
    -p 15433:5432 \
    postgres-slave
