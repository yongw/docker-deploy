# Build Kafka 0.8

FROM oracle-java:1.7

MAINTAINER Yong Wang <yong.wang@thomsonreuters.com>

ENV KAFKA_VERSION="0.8.2.1" SCALA_VERSION="2.11"

# Download and extract Kafka
RUN curl --silent --retry 3 \
    -x http://webproxy.pln.corp.services:80 \
    http://www.us.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
    | tar xz -C /opt

EXPOSE 9092

VOLUME ["/kafka/data", "/kafka/log"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

WORKDIR /opt/${KAFKA_HOME}

CMD ["/opt/${KAFKA_HOME}/bin/kafka-server-start.sh"]

