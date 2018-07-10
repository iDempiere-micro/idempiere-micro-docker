#!/bin/sh
./stop.sh

sudo docker volume create --name idempiere-micro-karaf-data
sudo docker volume create --name idempiere-micro-karaf-deploy
sudo docker volume create --name idempiere-micro-karaf-etc

./start.sh

sleep 10
docker exec -it idempiere-micro-karaf /tmp/setup_idempiere_micro_karaf.sh
sleep 10
docker exec -it idempiere-micro-karaf /opt/karaf/bin/client "system:shutdown -f -r"
