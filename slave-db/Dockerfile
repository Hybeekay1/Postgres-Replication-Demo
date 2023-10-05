FROM postgres:latest

RUN apt-get update && apt install -y iputils-ping

COPY ./init-reiplica-db.sh /docker-entrypoint-initdb.d/init-reiplica-db.sh

RUN chmod +x /docker-entrypoint-initdb.d/init-secondary.sh

ENTRYPOINT ["/docker-entrypoint-initdb.d/init-reiplica-db.sh"]
# gosu once initialized, you run the final service without root privileges 
CMD ["gosu","postgres","postgres"]
