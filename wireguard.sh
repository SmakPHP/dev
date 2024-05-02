#!/bin/bash

# Display run wireguard
echo "Run wireguard: ..."

apt install wireguard
cp test.conf /etc/wireguard/
wg-quick up test
wg show

curl ipinfo.io/ip; echo
