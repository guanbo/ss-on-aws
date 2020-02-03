#!/bin/bash

host=$1
user_host=ec2-user@${host}
# passwd=`openssl rand -base64 48`
passwd=E2E1D5DC37B54A40963AD10071C55127

# generate configure file
python -c 'import sys,json;data=json.load(sys.stdin);data["server"]=sys.argv[1];data["password"]=sys.argv[2];print json.dumps(data)' ${host} ${passwd} < config.tpl > server/config.json

ssh-keyscan -H ${host}
scp server/* ${user_host}:.
ssh ${user_host} ./install_ss.sh ${host}

echo "ShadowSocks Server configuration following..."
cat server/config.json
