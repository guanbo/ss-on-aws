#!/bin/bash

sudo yum update -y
sudo yum install git python3 -y
sudo amazon-linux-extras install golang1.9
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server
# go get -u -v github.com/shadowsocks/go-shadowsocks2
echo "===Install Done==="

mkdir -p .aws/
ec2_region=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/\(.*\)[a-z]/\1/'`
cat > .aws/config << EOF
[default]
output = json
region = $ec2_region
EOF

python3 app.py &

./startup.sh
