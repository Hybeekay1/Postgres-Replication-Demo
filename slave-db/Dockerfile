FROM postgres:latest

RUN apt-get update && apt install -y iputils-ping

COPY ./init-replica-db.sh /entrypoint-initdb.d/init-replica-db.sh
# give permission to init-replica-db.sh
RUN chmod +x /entrypoint-initdb.d/init-replica-db.sh

ENTRYPOINT ["/entrypoint-initdb.d/init-replica-db.sh"]
# gosu once initialized, you run the final service without root privileges 
CMD ["gosu","postgres","postgres"]
