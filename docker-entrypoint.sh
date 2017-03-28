#!/bin/bash

if [ "$1" = 'named' ]; then
  modprobe capability >/dev/null 2>&1 || true
  mkdir -p /var/run/named
  chmod 775 /var/run/named
  chown root:bind /var/run/named >/dev/null 2>&1 || true

  exec /usr/sbin/named -ubind -g
fi

exec "$@"
