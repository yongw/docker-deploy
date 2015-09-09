#!/bin/bash 

SCRIPT=`realpath $0`
SCRIPT_PATH=`dirname $SCRIPT`
http_proxy= ruby $SCRIPT_PATH/hello_world.rb -p 8001 -o 0.0.0.0 -e production
