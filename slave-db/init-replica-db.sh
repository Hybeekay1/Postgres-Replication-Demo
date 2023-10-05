#!/bin/bash


until ping -c 1 -W 1 master-db
do
echo “Waiting for master to ping…”
    sleep 4s
done

until pg_basebackup -h master-db -D ${PGDATA} -U ${PG_REP_USER} -vP -R -X stream -C -S pgstandby1 -W
do
echo “Waiting for master to connect…”
    sleep 4s
done

set -e
chown postgres. ${PGDATA} -R
chmod 700 ${PGDATA} -R

exec "$@"