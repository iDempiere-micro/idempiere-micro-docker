#!/bin/sh

curl -L -s -o "/tmp/idempiere.properties" "https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro/master/runtime/etc/idempiere.properties" && \
rm -rf /opt/karaf/etc/idempiere.properties && \
sed -i -- 's/localhost/idempiere-db/g' /tmp/idempiere.properties
sed -i -- 's/5433/5432/g' /tmp/idempiere.properties
cp /tmp/idempiere.properties /opt/karaf/etc/ && \
curl -L -s -o "/tmp/idempire-micro.tgz" "https://github.com/iDempiere-micro/idempiere-micro/releases/download/${IDEMPIERE_MICRO_VERSION}/v${IDEMPIERE_MICRO_VERSION}.tgz" && \
tar -C /opt/karaf/deploy -xzf /tmp/idempire-micro.tgz
