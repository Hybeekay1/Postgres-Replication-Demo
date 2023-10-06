#!/bin/bash
set -e 
echo "Stopping master Container"
docker stop master-db

echo "Stopping slave Container"
docker stop slave-db

echo "Deleting Test Network"
docker network rm test

echo "deleting volume"
docker volume rm master-data
docker volume rm slave-data

echo "Deleting Docker Images"
docker rmi postgres-slave
docker rmi postgres-master
