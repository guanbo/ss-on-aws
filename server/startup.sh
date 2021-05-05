#!/bin/bash

set -e 

./shutdown.sh

#nohup $PWD/go/bin/shadowsocks-server > nohup.out 2>/dev/null &
# nohup $PWD/go/bin/go-shadowsocks2 -s 'ss://AEAD_CHACHA20_POLY1305:E2E1D5DC37B54A40963AD100715127@:10264' -verbose 2> nohup.out &
nohup $PWD/go/bin/outline-ss-server -config config.yml > nohup.out 2>/dev/null &

echo "===StartUp ShadowSocks Server==="