#!/bin/bash


echo "$ZK_SERVER_ID / $MAX_SERVERS" 
if [ ! -z "$ZK_SERVER_ID" ] && [ ! -z "$MAX_SERVERS" ]; then
  echo "$ZK_SERVER_ID" > /opt/zookeeper/data/myid
  echo "" >> conf/zoo.cfg
  #Find the servers exposed in env.
  for i in $( eval echo {1..$MAX_SERVERS});do

    HOST=$(eval echo \$ZK_PEER_${i}_SERVICE_HOST)
    PEER=$(eval echo \$ZK_PEER_${i}_SERVICE_PORT_PEER)
    ELECTION=$(eval echo \$ZK_PEER_${i}_SERVICE_PORT_ELECTION)

    if [ -z "$HOST" ] || [ -z "$PEER" ] || [ -z "$ELECTION" ] ; then
      #if a server is not fully defined stop the loop here.
      break
    elif [ "$ZK_SERVER_ID" = "$i" ] ; then
      echo "server.$i=0.0.0.0:$PEER:$ELECTION" >> conf/zoo.cfg
    else
      echo "server.$i=$HOST:$PEER:$ELECTION" >> conf/zoo.cfg
    fi

  done
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground
