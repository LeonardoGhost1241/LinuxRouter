#!/bin/bash

# Linux Router
# forwading enable in linux

echo "Enable forwarding in kernel linux..."

sysctl -w net.ipv4.ip_forward=1 > /dev/null

if [ $? -ne 0 ]; then
	echo "something wrong: net.ipv4.ip_forward"
	exit 1
fi



