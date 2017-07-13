#!/bin/bash
echo "HORACLIFIX GO Starting..."

if [[ $HEP_HOST =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Shipping HEP to: $HEP_HOST:$HEP_PORT"
  horaclifix -H $HEP_HOST:$HEP_PORT
else
  HEP_IP=$(ping -q -c 1 -t 1 $HEP_HOST | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
  echo "Shipping HEP to: $HEP_IP:$HEP_PORT"
  horaclifix -H $HEP_IP:$HEP_PORT
fi
