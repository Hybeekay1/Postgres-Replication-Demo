FROM postgres:latest

COPY ./init-master-db.sh /entrypoint-initdb.d/init-master-db.sh

RUN chmod 0666 /entrypoint-initdb.d/init-master-db.sh
