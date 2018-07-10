old_id="$(docker ps -aq --filter name=idempiere-micro-karaf)"

docker stop $(old_id)
docker rm $(old_id)
docker run --rm --name idempiere-micro-karaf -d -p 1099:1099 -p 8101:8101 -p 44444:44444 -p 8181:8181 naseukolycz/idempiere-micro:latest
sleep 10
docker exec -it idempiere-micro-karaf /opt/karaf/bin/client -r 7  "feature:install http; feature:install http-whiteboard; feature:install war; feature:install webconsole"
sleep 10
docker exec -it idempiere-micro-karaf /tmp/idempiere_micro.sh
