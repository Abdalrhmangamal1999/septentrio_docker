#!/bin/bash
set -e
source /opt/ros/jazzy/setup.bash

# substituting ${RECEIVER_IP} into a writable copy (/cfg is mounted read-only).
: "${RECEIVER_IP:?RECEIVER_IP must be set (e.g. in .env)}"
if [ -f /cfg/rover.yaml ]; then
  mkdir -p /tmp/cfg
  envsubst '${RECEIVER_IP}' < /cfg/rover.yaml > /tmp/cfg/rover.yaml
fi

exec "$@"
