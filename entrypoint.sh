#!/bin/bash
echo "HORACLIFIX GO Starting"
echo "Shipping HEP to: $HEP_HOST:$HEP_PORT"

horaclifix -H $HEP_HOST:$HEP_PORT
