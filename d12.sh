#!/bin/bash

# Execute bash script from link
# curl https://raw.githubusercontent.com/smakphp/dev/main/d12.sh | bash -s arg1 arg2

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
