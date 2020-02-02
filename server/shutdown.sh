#!/bin/bash

set -e

pid=`ps -ef|grep shadow|grep -v grep|awk '{print $2}'`
if [ $pid ] 
then
  kill -9 $pid
  echo "===Shut Down Shadow Socks Server==="
fi
