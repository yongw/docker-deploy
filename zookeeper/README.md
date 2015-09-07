Overview
====================

Build a Docker image for Zookeeper. In order to make the multiple Zookeeper servers can 
communicate with each other, The host/ip, peer connection port and election 
connection port of each of servers should be added to `zoo.cfg` i.e. 
`server.i=<server i host>:<server i peer port>:<server i election port>`

In Kubernetes cluster, it is possible to create Service for each Zookeeper POD and the service contains
two ports one is peer port and another is election port. The service information will be
exposed to each Zookeeper POD as environment variables. The `config-and-run.sh` reads the 
environment variables to get other Zookeeper server's hots/ip, peer port and election port,
then write to `zoo.cfg` file.

Configuration
-------------
In this `config-and-run.sh`, the following environment variables are supposed to be present:
`$ZK_SERVER_ID`: The Zookeeper server id 
`$MAX_SERVERS`: Total number of Zookeeper servers in the cluster
`$ZK_PEER_${i}_SERVICE_HOST`: The Kubernetes service host name or IP address of the i Zookeeper server
`$ZK_PEER_${i}_SERVICE_PORT_PEER`: The peer port of the i Zookeeper server
`ZK_PEER_${i}_SERVICE_PORT_ELECTION`: The election port of the i Zookeeper server

Usage
-----
Build image: `$ sudo docker build -t dockerlab.int.thomsonreuters.com:30000/zookeeper .`

Deploy Zookeeper:`$ kubectl create -f k8s/zookeeper.yaml`

List the running PODs and get the name of one Zookeeper POD
`$ kubectl get po`

Then execute an interactive bash
`$ kubectl exec -it <pod name> /bin/bash`

Run Zookeeper client command in the opened bash terminate
`# bin/zkCli.sh -server $ZK_CLIENT_SERVICE_HOST:$ZK_CLIENT_SERVICE_HOST`

Verify the connection is successfully established.