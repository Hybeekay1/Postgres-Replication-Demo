### POSTGRES DOCKER REPLICATION
Mini Project to show Postgres Replication in docker containers.  


### Install Docker Desktop
Recommended approach to install Docker Desktop on Ubuntu:

Set up Docker's package repository.  [See Install using the Apt repository]([https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository])
, step 1.

Download latest [DEB package]([https://openai.com](https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64&_gl=1*tylqiz*_ga*MTgwNjY4MDIwNC4xNjkxOTQ4MTc3*_ga_XJWPQMJYHQ*MTY5NjU4MzQxOC4xNS4xLjE2OTY1ODM2NTEuNTAuMC4w))

Install the package with apt as follows:

    sudo apt-get update
    sudo apt-get install ./docker-desktop-<version>-<arch>.deb


### Running the Containers
The Containers can be run by either the docker cli , Dockerfile or using docker-compose  

#### 1 to CLI RUN the install.sh with a user in docker group or a sudoer

Run chmod +x ./install.sh Add the permission to execute the script

    chmod +x ./install.sh

    ./install.sh 

install.sh will perform the following steps
- Builds master-db and relica-db images
- Creates the test network
- Creates docker volumes
- Starts the Containers

Run chmod +x ./cleanup.sh Add the permission to execute the script

    chmod +x ./cleanup.sh

Cleaning up after  the ./install script  

Run ./cleanup.sh to delete all resources used in the install script
    
    ./cleanup.sh
    
    

### Testing 
Access the master-db container

    docker exec -it master-db /bin/sh 


Create a Database name "test"

    psql -U test -c "CREATE DATABASE test;"


Verify Replication by Accessing Slave Container

    docker exec -it slave-db /bin/sh 


Confirm DB is listed

    psql -U test -c "\l"

# Postgres-Replication-Demo
