#!/bin/bash

sudo yum update -y
# sudo yum install git python3 -y
# sudo amazon-linux-extras install golang1.11
# go get github.com/Jigsaw-code/outline-ss-server
curl -LO https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v1.3.5/outline-ss-server_1.3.5_linux_x86_64.tar.gz
mkdir -p ~/.local/bin
pushd .local/bind
tar -zxvf ../../outline-ss-server_1.3.5_linux_x86_64.tar.gz
popd
echo "===Install Done==="

mkdir -p .aws/
ec2_region=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/\(.*\)[a-z]/\1/'`
cat > .aws/config << EOF
[default]
output = json
region = $ec2_region
EOF

./startup.sh

pip3 install boto3 --user
nohup python3 app.py 2>&1 > app.log &
