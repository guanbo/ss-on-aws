#!/bin/bash

aws_region=${1:-us-west-2}

echo "spot on ${aws_region}"

export AWS_PROFILE=guanbo

aws ec2 request-spot-fleet --spot-fleet-request-config file://${aws_region}.json --region ${aws_region}