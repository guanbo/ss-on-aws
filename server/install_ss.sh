#!/bin/bash

sudo yum update -y
sudo yum install git golang
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server
nohup $PWD/go/bin/shadowsocks-server &
