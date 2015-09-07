Overview
========
Build a Docker image for Kafka, the image is supposed to automatically scale up without hard coded broker id.
The broker id is automatically assigned using last two portions of the container IP address.

Kubernetes will create service for Zookeeper client request so there is no need to know each Zookeeper server
in Kafka server as the Kubernetes service will automatically pick one Zookeeper server to respond to client request. 
Zookeeper connection string is generated using client service `$ZK_CLIENT_SERVICE_HOST:$ZK_CLIENT_SERVICE_PORT`

Deploy
------

`$ kubectl create -f k8s/kafka.yaml`

Connect to Kafka service
------------------------

List Kubernetes services by running `$ kubectl get svc`, the kafka service will in the list, the IP address 
and port information is also listed. 