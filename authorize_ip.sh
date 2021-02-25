#!/bin/bash

public_ip=$1
if [ !$public_ip ] 
then
  public_ip=`curl -L ip-api.com/line?fields=query`
fi

echo "===Authorize ${public_ip} to security groups ingress==="

export AWS_PROFILE=guanbo
aws ec2 authorize-security-group-ingress --group-name ss --protocol tcp --port 10200-10300 --cidr ${public_ip}/32
#aws ec2 authorize-security-group-ingress --group-name ss --protocol udp --port 10200-10300 --cidr ${public_ip}/32