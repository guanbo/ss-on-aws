#!/bin/bash

host=`python -c 'import sys,json;data=json.load(sys.stdin);print data["server"];' < server/config.json`
remote_script="./startup.sh"

if [ $1 ] 
then
  remote_script="./shutdown.sh"
fi

ssh ec2-user@${host} ${remote_script}
