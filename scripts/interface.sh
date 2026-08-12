#!/bin/bash

#nameiface=ip link | grep -E --color "^$numiface:" | cut -d ":" -f 2


ip link | grep -E "^[[:digit:]]:"
echo ""

# This interface will be the NAT connection 
read -p "Nombre de la Interfaz externa (NAT): " extInterface

# This interface provides internet connection 
read -p "Nombre de la Interfaz interna (LAN): " intInterface


# Setting the nat interface
echo "Changing the interface mode..."
iw dev $extInterface set type __ap

if [ $? -ne 0 ]; then
	echo "Something wrong with mode Acces Point $extInterface"
	exit 1 
fi

# Set a ip addr
# By default, 24 bits for network
echo "Setting a ip address to interface..."
ip addr add 10.0.0.1/24 dev $extInterface


# Call iptables.sh file 
. ./iptables.sh "$extInterface" "$intInterface"






