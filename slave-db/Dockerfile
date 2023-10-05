FROM postgres:latest

RUN apt-get update && apt install -y iputils

COPY ./init-reiplica-db.sh /entrypoint-initdb.d/init-reiplica-db.sh

RUN chmod +x /entrypoint-initdb.d/init-secondary.sh

ENTRYPOINT ["/entrypoint-initdb.d/init-reiplica-db.sh"]
# gosu once initialized, you run the final service without root privileges 
CMD ["gosu","postgres","postgres"]