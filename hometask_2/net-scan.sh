#!/bin/bash

number_of_parameters=$#
for ip in "$@"
do
  for port in 80 443
  do
    timeout 0.5s bash -c "2>/dev/null echo >/dev/tcp/$ip/$port " && echo "Connection to $ip $port port succeeded"
  done
done
