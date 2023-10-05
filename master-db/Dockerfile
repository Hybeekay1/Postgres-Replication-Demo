FROM postgres:latest

COPY ./init-master-db.sh /docker-entrypoint-initdb.d/init-master-db

RUN chmod 0666 /docker-entrypoint-initdb.d/init-master-db
