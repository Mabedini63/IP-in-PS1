#!/bin/bash
# set-ps1.sh - Set PS1 prompt with current IP address
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=== Set PS1 Prompt ===${NC}"

echo -e "${YELLOW}Available interfaces:${NC}"
netif=$(ip -a 2>/dev/null | grep -E "UP|up" | grep -v lo | cut -d ":" -f 2 | tr -d ' ')
if [ -z "$netif" ]; then
    netif=$(ip -o link show up | awk -F': ' '{print $2}' | grep -v lo)
fi
echo "$netif"

read -rp "Enter interface name [default: eth0]: " net
net=${net:-eth0}

if ! ip link show "$net" &>/dev/null; then
    echo -e "${RED}Error: Interface '$net' not found${NC}"
    exit 1
fi

IP=$(ip -4 addr show "$net" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)

if [ -z "$IP" ]; then
    echo -e "${RED}Error: No IPv4 address on '$net'${NC}"
    exit 1
fi

echo -e "${GREEN}IP = $IP${NC}"

read -rp "Prompt type? (root/user) [default: auto]: " user
user=${user:-auto}

case "$user" in
    root) PS1_NEW="\u@$IP \W# " ;;
    user) PS1_NEW="\u@$IP \W\$ " ;;
    *)    PS1_NEW="\u@$IP \W\$ " ;;   
esac

export PS1="$PS1_NEW"
echo -e "${GREEN}PS1 set to: $PS1${NC}"
