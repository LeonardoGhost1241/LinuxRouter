#!/bin/bash

extInterface="$1"
intInterface="$2"

# iptables rules (NAT)
echo "Setting firewall rules..."
iptables -t nat -A POSTROUTING -o $intInterface -j MASQUERADE
iptables -A FORWARD -i $extInterface -o $intInterface -j ACCEPT
iptables -A FORWARD -i $intInterface -o $extInterface -j ACCEPT

if [ $? -ne 0 ]; then
	echo "[!] Some rule firewall went wrong..."
fi

# add more iptables rules if you need








