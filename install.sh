#!/bin/bash

host=$1
user_host=ec2-user@${host}

ssh-keyscan -H ${host}
scp server/* ${user_host}:.
ssh ${user_host} ./install_ss.sh