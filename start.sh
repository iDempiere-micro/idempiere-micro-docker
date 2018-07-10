#!/bin/sh
docker run --rm --name idempiere-micro-karaf -d \
  -p 1099:1099 -p 8101:8101 -p 44444:44444 -p 8181:8181 \
  -v idempiere-micro-karaf-deploy:/opt/karaf/deploy -v idempiere-micro-karaf-data:/opt/karaf/data -v idempiere-micro-karaf-etc:/opt/karaf/etc \
  naseukolycz/idempiere-micro:latest
  