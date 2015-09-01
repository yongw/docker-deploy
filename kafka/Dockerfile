# Build Kafka 0.8

FROM dockerlab.int.thomsonreuters.com:30000/oracle-java:1.7

MAINTAINER Yong Wang <yong.wang@thomsonreuters.com>

ENV KAFKA_VERSION="0.8.2.1" SCALA_VERSION="2.11"

# Download and extract Kafka
RUN curl --silent --retry 3 \
    -x http://webproxy.pln.corp.services:80 \
    http://www.us.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
    | tar xz -C /opt

EXPOSE 9092

VOLUME ["/kafka/log"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

WORKDIR ${KAFKA_HOME}

ADD config-and-run.sh $KAFKA_HOME/bin/config-and-run.sh
ADD config $KAFKA_HOME/config

CMD ["bin/config-and-run.sh"]

