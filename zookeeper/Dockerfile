# Build Zookeeper 3.4.6

FROM oracle-java:1.7

MAINTAINER Yong Wang <yong.wang@thomsonreuters.com>

ENV ZOOKEEPER_VERSION 3.4.6

# Download Zookeeper 3.4.6
RUN curl --silent --retry 3 \
    -x http://webproxy.pln.corp.services:80 \
    http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
    | tar xz -C /opt  \
    && mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
	&& cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
	&& mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data", "/opt/zookeeper/log"]

COPY config-and-run.sh ./bin/
COPY zoo.cfg ./conf/

CMD ["/opt/zookeeper/bin/config-and-run.sh"]

