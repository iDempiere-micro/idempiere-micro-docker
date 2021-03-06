cd src
docker build --no-cache -t naseukolycz/idempiere-micro:1.0.0 .
docker run --name idempiere-micro-karaf-test -p 8181:8181 -d naseukolycz/idempiere-micro:1.0.0
sleep 10
docker exec -i idempiere-micro-karaf-test /tmp/setup_idempiere_micro_karaf.sh
sleep 10
docker exec -i idempiere-micro-karaf-test /opt/karaf/bin/client "system:shutdown -f -r"
sleep 10
wget "http://localhost:8181/idempiere/api/status"
str="works!"
value=`cat status`
if [[ "$value" != "$str" ]]; then exit 1; fi