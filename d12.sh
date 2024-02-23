#!/bin/bash

# Execute bash script from link
# curl -s https://.../d12.txt | bash -s arg1 arg2

# Editing in nano editor
# CTRL + O / CTRL + X

# > /etc/resolv.conf
echo "nameserver 192.168.2.1"

# >> /etc/network/interfaces
echo "
auto enp1s0
iface enp1s0 inet static
  address 192.168.2.2
  netmask 255.255.255.0
  gateway 192.168.2.1
  dns-nameservers 192.168.2.1
"

systemctl restart networking

# Display double quotes in echo in unix > \"
# > /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bookworm contrib main
"
