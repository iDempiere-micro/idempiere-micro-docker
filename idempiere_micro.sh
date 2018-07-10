#!/bin/sh

curl -L -s -o "/tmp/idempiere.properties" "https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro/master/runtime/etc/idempiere.properties" && \
rm -rf /opt/karaf/etc/idempiere.properties && \
cp /tmp/idempiere.properties /opt/karaf/etc/ && \
curl -L -s -o "/tmp/idempire-micro.tgz" "https://github.com/iDempiere-micro/idempiere-micro/releases/download/v${IDEMPIERE_MICRO_VERSION}/v${IDEMPIERE_MICRO_VERSION}.tgz" && \
tar -C /opt/karaf/deploy -xzf /tmp/idempire-micro.tgz
