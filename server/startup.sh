#!/bin/bash

set -e 

shutdown.sh

nohup $PWD/go/bin/shadowsocks-server > nohup.out 2>/dev/null &
echo "===StartUp ShadowSocks Server==="