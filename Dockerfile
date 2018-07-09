FROM java:8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV KARAF_VERSION=4.2.0

ENV IDEMPIERE_MICRO_VERSION=0.0.1

RUN wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    wget https://github.com/iDempiere-micro/idempiere-micro/blob/master/runtime/etc/idempiere.properties; \
    mv idempiere.properties /opt/karaf/etc; \
    mkdir /deploy; \
    wget https://github.com/iDempiere-micro/idempiere-micro/releases/download/v${IDEMPIERE_MICRO_VERSION}/v${IDEMPIERE_MICRO_VERSION}.tgz; \
    tar -C /deploy -xzf v${IDEMPIERE_MICRO_VERSION}.tgz; \
    rm v${IDEMPIERE_MICRO_VERSION}.tgz; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]

