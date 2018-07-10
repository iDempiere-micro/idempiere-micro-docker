sudo docker volume create --name idempiere-micro-karaf-deploy
sudo docker volume create --name idempiere-micro-karaf-data
sudo docker volume create --name idempiere-micro-karaf-etc

sudo docker run --rm -it \
    -v idempiere-micro-karaf-deploy:/opt/karaf/deploy \
    -v idempiere-micro-karaf-data:/opt/karaf/data \
    -v idempiere-micro-karaf-etc:/opt/karaf/etc \
    -e KARAF_INIT_COMMANDS="feature:install scr; feature:install http; feature:install http-whiteboard; feature:install war; feature:install webconsole;" naseukolycz/idempiere-micro:latest    
