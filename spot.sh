#!/bin/bash

export AWS_PROFILE=guanbo
aws_region=$(aws configure get region)
echo "spot on ${aws_region}"

function get_instance_id()
{
  aws ec2 describe-instances --filter Name=instance-lifecycle,Values=spot > instances.json
  instance_id=`python -c 'import sys,json;data=json.load(sys.stdin);print(data["Reservations"][0]["Instances"][0]["InstanceId"]);' < instances.json`
}

function get_public_ip()
{
  aws ec2 describe-addresses > addresses.json
  public_ip=`python -c 'import sys,json;data=json.load(sys.stdin);print(data["Addresses"][0]["PublicIp"]);' < addresses.json`
}

aws ec2 request-spot-fleet --spot-fleet-request-config file://${aws_region}.json

# get_public_ip
# get_instance_id
aws ec2 wait instance-running --instance-ids $instance_id

# echo "associate-address $public_ip to $instance_id "
# aws ec2 associate-address --instance-id $instance_id --public-ip $public_ip