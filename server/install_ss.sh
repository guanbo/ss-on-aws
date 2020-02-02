#!/bin/bash

sudo yum update -y
sudo yum install git -y
sudo amazon-linux-extras install golang1.9
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server
echo "===Install Done==="

./startup.sh
