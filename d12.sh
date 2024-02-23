#!/bin/bash

# Execute bash script from link
# curl https://raw.githubusercontent.com/smakphp/dev/main/d12.sh | bash -s arg1 arg2
# curl -O https://raw.githubusercontent.com/smakphp/dev/main/d12.sh && nano d12.sh

# Editing in nano editor
# CTRL + O / CTRL + X

echo "nameserver 192.168.2.1"
# > /etc/resolv.conf

echo "
auto enp1s0
iface enp1s0 inet static
  address 192.168.2.2
  netmask 255.255.255.0
  gateway 192.168.2.1
  dns-nameservers 192.168.2.1
"
# >> /etc/network/interfaces

# systemctl restart networking

# Display double quotes in echo in unix > \"
echo "deb http://deb.debian.org/debian bookworm contrib main
"
# > /etc/apt/sources.list

#
# WireGuard 
#

# apt install wireguard
# cp test.conf /etc/wireguard/
# wg-quick up test
# wg show

curl ipinfo.io/ip; echo

#
# Privoxy http://p.p/
#

# apt install privoxy

# sed -i 's/^listen-address  1.*/listen-address  192.168.1.1/g' /etc/privoxy/config
# sed -i 's/^#log-messages   1.*/log-messages   1/g' /etc/privoxy/config
# sed -i 's/^#debug     1.*/debug     1/g' /etc/privoxy/config

# systemctl restart privoxy
# systemctl enable privoxy
