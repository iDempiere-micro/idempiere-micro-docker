#!/bin/sh
old_id="$(docker ps -aq --filter name=idempiere-micro-karaf)"

docker stop $old_id
docker rm $old_id
