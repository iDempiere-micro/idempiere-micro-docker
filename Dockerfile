FROM spalarus/java-kit:8

MAINTAINER spalarus <s.palarus@googlemail.com>

ARG KARAF_VERSION=4.1.5
ARG IDEMPIERE_MICRO_VERSION=0.0.1
ENV KARAF_HOME=/opt/karaf
ENV KARAF_BASE=/opt/karaf

ADD ./entrypoint.sh /entrypoint.sh
ADD ./initkaraf /opt/karaf/bin/initkaraf

RUN groupadd -r karaf -g 1001 && useradd -u 1001 -r -g karaf -m -d /opt/karaf -s /sbin/nologin \ 
    -c "Karaf user" karaf && chmod 755 /opt/karaf && \
    wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz && \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz && \
    rm apache-karaf-${KARAF_VERSION}.tar.gz && \
    #wget https://github.com/iDempiere-micro/idempiere-micro/releases/download/v${IDEMPIERE_MICRO_VERSION}/v${IDEMPIERE_MICRO_VERSION}.tgz && \
    #tar -C /opt/karaf/deploy -xzf v${IDEMPIERE_MICRO_VERSION}.tgz && \
    #rm v${IDEMPIERE_MICRO_VERSION}.tgz && \    
    chmod u+x /entrypoint.sh && \
    chmod u+x /opt/karaf/bin/initkaraf && \
    chown -R karaf /opt/karaf

USER karaf

WORKDIR ${KARAF_HOME}

ENV HOME=/opt/karaf
ENV OSGI_IMPLEMENTATION=KEEP
ENV FETCH_CUSTOM_URL=NONE
ENV KARAF_INIT_COMMANDS=NONE

VOLUME ["/opt/karaf/deploy","/opt/karaf/etc","/opt/karaf/data"]
EXPOSE 1099 8101 8181 44444
ENTRYPOINT ["/entrypoint.sh"]

# Define default command.
CMD ["/opt/karaf/bin/karaf"] 

