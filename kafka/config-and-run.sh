#!/bin/bash -x

# If Zookeeper is running within Kubernetes cluster use it.
# Otherwise ZK_HOST will be used.
[ -n "$ZK_CLIENT_SERVICE_HOST" ] && ZK_HOST=$ZK_CLIENT_SERVICE_HOST
[ -n "$ZK_CLIENT_SERVICE_PORT" ] && ZK_PORT=$ZK_CLIENT_SERVICE_PORT

IP=$(cat /etc/hosts | head -n1 | awk '{print $1}')

# Use IP address as the broker Id if the KAFKA_BROKER_ID is not set
[ -z "$KAFKA_BROKER_ID" ] && KAFKA_BROKER_ID=$(echo $IP | sed -e "s/[0-9]*\.[0-9]*\.\([0-9]*\)\.\([0-9]*\)/\1\2/g")

# Kafka partitions setting
[ -z "$KAFKA_PARTITIONS" ] && KAFKA_PARTITIONS=1

# Kafka server port, default is 9092
[ -z "$KAFKA_SERVER_PORT" ] && KAFKA_SERVER_PORT=9092

# Zookeeper connection string
[ -z "$ZOOKEEPER_CONNECTION_STRING" ] && ZOOKEEPER_CONNECTION_STRING="${ZK_HOST}:${ZK_PORT:-2181}"

# Replace placeholder in server.properties file
sed -i "s/{{KAFKA_BROKER_ID}}/${KAFKA_BROKER_ID}/g" $KAFKA_HOME/config/server.properties
sed -i "s/{{KAFKA_PARTITIONS}}/${KAFKA_PARTITIONS}/g" $KAFKA_HOME/config/server.properties
sed -i "s/{{KAFKA_SERVER_PORT}}/${KAFKA_SERVER_PORT}/g" $KAFKA_HOME/config/server.properties
sed -i "s/{{ZOOKEEPER_CONNECTION_STRING}}/${ZOOKEEPER_CONNECTION_STRING}/g" $KAFKA_HOME/config/server.properties
sed -i "s/{{KAFKA_HOST_IP}}/${IP}/g" $KAFKA_HOME/config/server.properties

# Start Kafka server
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
