#!/bin/bash
# Copyright 2022 AutoCore
# 
# This program and the accompanying materials are made available under the
# terms of the AutoCore License v. 1.0

set -e

export AWS_PROFILE=guanbo
aws_region=$(aws configure get region)
echo "refersh on ${aws_region}"

instance=$(aws ec2 describe-instances| jq '.Reservations[0].Instances[0]')
instance_id=$(echo $instance |jq '.InstanceId' | sed 's/"//g')
associated_ip=$(echo $instance|jq '.NetworkInterfaces[0].Association.PublicIp' | sed 's/"//g')
allocated_id=$(aws ec2 describe-addresses| jq '.Addresses[0].AllocationId' | sed 's/"//g')

echo "instance_id: ${instance_id}"
echo "associated_ip: $associated_ip"
echo "allocated_id: $allocated_id"

# {
#     "PublicIp": "35.164.156.90",
#     "AllocationId": "eipalloc-087f3c6a093017c6a",
#     "PublicIpv4Pool": "amazon",
#     "NetworkBorderGroup": "us-west-2",
#     "Domain": "vpc"
# }
public_ip=$(aws ec2 allocate-address | jq '.PublicIp' | sed 's/"//g')
echo "public_ip: $public_ip"
echo "aws ec2 associate-address --instance-id $instance_id --public-ip $public_ip"
aws ec2 associate-address --instance-id $instance_id --public-ip $public_ip
aws ec2 release-address --allocation-id $allocated_id
aws ec2 describe-addresses