#!/bin/bash
echo "HORACLIFIX GO Starting..."

COMMAND="horaclifix "

if [[ $HEP_HOST =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Adding HEP target: $HEP_HOST:$HEP_PORT"
  COMMAND+="-H $HEP_HOST:$HEP_PORT "
else
  HEP_IP=$(ping -q -c 1 -t 1 $HEP_HOST | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
  echo "Adding HEP target: $HEP_IP:$HEP_PORT"
  COMMAND+="-H $HEP_IP:$HEP_PORT "
fi


if [[ ${GRAYLOG_URL:+1} ]] ; then
  echo "Adding Graylog target: $GRAYLOG_URL"
  COMMAND+="-g $GRAYLOG_URL "
fi


if [[ ${STATSD_URL:+1} ]] ; then
  echo "Adding Statsd target: $STATSD_URL"
  COMMAND+="-s $STATSD_URL "
fi

echo "Executing: $COMMAND "
/bin/bash -c "$COMMAND"
