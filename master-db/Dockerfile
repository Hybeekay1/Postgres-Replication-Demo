FROM postgres:latest

COPY ./init-master-db.sh /entrypoint-initdb.d/init-master-db

RUN chmod 0666 /entrypoint-initdb.d/init-master-db