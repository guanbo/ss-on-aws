#!/bin/bash

host=$1
user_host=ec2-user@${host}

ssh-keyscan -H ${host}
python -c 'import sys,json;data=json.load(sys.stdin);data["server"]=sys.argv[1];print json.dumps(data)' ${host} < config.tpl > server/config.json
scp server/* ${user_host}:.
ssh ${user_host} ./install_ss.sh ${host}