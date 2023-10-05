### POSTGRES DOCKER REPLICATION
Mini Project to show Postgres Replication in docker containers.  


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

    docker exec -it master-db /bin/sh # install script


Create a Database

    psql -U test -c "CREATE DATABASE replicatest;"


Verify Replication by Accessing Slave Container

    docker exec -it replica-db /bin/sh # install script


Confirm DB is listed

    psql -U test -c "\l"

# Postgres-Replication-Demo
