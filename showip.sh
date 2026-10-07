#!/bin/bash
echo "Show Network interface"
netif=$(ip a | grep up | grep -v lo | cut -d ":" -f 2)
echo "$netif"
echo "Enter name of Interface:"
read net
echo "$net"

IP=$(ip -4 addr show "$net" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "IP = $IP"

echo "You need PS1 for root or other:"
read user

if [ "$user" = "root" ]; then
    export PS1="\u@$IP \W# "
else
    export PS1="\u@$IP \W\$ "
fi

echo "PS1 set to: $PS1"
