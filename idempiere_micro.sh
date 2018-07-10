#!/bin/sh

wget https://github.com/iDempiere-micro/idempiere-micro/blob/master/runtime/etc/idempiere.properties && \
mv idempiere.properties /opt/karaf/etc && \
wget https://github.com/iDempiere-micro/idempiere-micro/releases/download/v${IDEMPIERE_MICRO_VERSION}/v${IDEMPIERE_MICRO_VERSION}.tgz && \
tar -C /opt/karaf/deploy -xzf v${IDEMPIERE_MICRO_VERSION}.tgz && \
rm v${IDEMPIERE_MICRO_VERSION}.tgz
