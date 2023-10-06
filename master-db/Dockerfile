FROM postgres:latest

COPY ./init-master-db.sh /docker-entrypoint-initdb.d/init-master-db.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/init-master-db.sh
