#!/bin/sh
./stop.sh
docker run --rm --name idempiere-micro-karaf -d -p 1099:1099 -p 8101:8101 -p 44444:44444 -p 8181:8181 naseukolycz/idempiere-micro:latest
sleep 10
docker exec -it idempiere-micro-karaf /tmp/setup_idempiere_micro_karaf.sh
