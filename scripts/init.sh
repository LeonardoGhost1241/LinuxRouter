#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
	echo "[!] Run as a root"
	exit 1
fi


# exist files hostapd and dnsmasq
if [ ! -e "hostapd.conf" ] && [ ! -f "hostapd.conf" ]; then
	echo "[!] hostapd.conf not found"
	exit 1
fi

if [ ! -e "dnsmasq.conf" ] && [ ! -f "dnsmasq.conf" ]; then
	echo "[!] dnsmasq.conf not found"
	exit 1
fi


# Enable forwarding package on linux 

if [ -e "linuxRouter.sh" ]; then
	. ./linuxRouter.sh 
fi


# iptables rules

if [ ! -e "iptables.sh" ]; then
	echo "[!] Archivo iptables.sh not found..."
fi


# interface configuration 

if [ -e "interface.sh" ]; then
	. ./interface.sh
fi

if [ $? -eq 0 ]; then
	echo "Done"
else
	echo "[!] Something went wrong..."
fi

