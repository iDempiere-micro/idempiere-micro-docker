#!/bin/sh
old_id="$(sudo docker ps -aq --filter name=idempiere-micro-karaf)"

sudo docker stop $old_id
sudo docker rm $old_id

sudo docker volume create --name idempiere-micro-karaf-data
sudo docker volume create --name idempiere-micro-karaf-deploy
sudo docker volume create --name idempiere-micro-karaf-etc

sudo docker run --rm --name idempiere-micro-karaf -d \
  --link idempiere-pgsql:idempiere-db \
  -p 1099:1099 -p 8101:8101 -p 44444:44444 -p 8181:8181 \
  -v idempiere-micro-karaf-deploy:/opt/karaf/deploy -v idempiere-micro-karaf-data:/opt/karaf/data -v idempiere-micro-karaf-etc:/opt/karaf/etc \
  naseukolycz/idempiere-micro:latest

sleep 10
sudo docker exec -i idempiere-micro-karaf /tmp/setup_idempiere_micro_karaf.sh
sleep 10
sudo docker exec -i idempiere-micro-karaf /opt/karaf/bin/client "system:shutdown -f -r"
