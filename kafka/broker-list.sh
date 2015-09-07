#!/bin/bash
KUBE_TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
KAFKA_BROKER_PODS_API_URL=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods/?labelSelector=name=kafka
KAFKA_BROKER_IPS=$(curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" $KAFKA_BROKER_PODS_API_URL | grep podIP | awk -F '"' '{print $4}')
array=(${KAFKA_BROKER_IPS//:/ })
for ip in "${array[@]}" ; do
  if [ -z "$KAFKA_BROKER_LIST" ] ; then
    KAFKA_BROKER_LIST="$ip:9092"
  else
    KAFKA_BROKER_LIST="$KAFKA_BROKER_LIST,$ip:9092"
  fi
done
echo $KAFKA_BROKER_LIST
export KAFKA_BROKER_LIST