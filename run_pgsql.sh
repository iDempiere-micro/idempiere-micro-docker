#!/bin/sh

cd /tmp
mkdir idempiere-docker
cd idempiere-docker/

wget https://sourceforge.net/projects/idempiereksys/files/idempiere-docker-image/idempiere-docker-pgsql-5.1.0.latest.tar.gz

zcat idempiere-docker-pgsql-5.1.0.latest.tar.gz | docker load

docker volume create --name idempiere-pgsql-datastore

docker run -d --name="idempiere-pgsql" -v idempiere-pgsql-datastore:/data -p 5432:5432 -e PASS="postgres" idempiere/idempiere-docker-pgsql:5.1.0.latest
