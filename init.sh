#!/bin/bash

# Network Manager
# systemctl --type=service --state=running

# apt install ./name.deb
echo "
# deb https://deb.debian.org/debian bookworm contrib main non-free-firmware
deb [arch=amd64 trusted=yes] file:/home/go/debian12.5 bookworm contrib main
# " > /etc/apt/sources.list

systemctl stop cups
systemctl disable cups
systemctl mask cups

systemctl stop cups-browsed
systemctl disable cups-browsed
systemctl mask cups-browsed

systemctl stop avahi-daemon
systemctl disable avahi-daemon
systemctl mask avahi-daemon

echo "# nameserver 192.168.2.1" > /etc/resolv.conf

echo "
auto enp1s0
iface enp1s0 inet static
  address 192.168.2.2
  netmask 255.255.255.0
#  gateway 192.168.2.1
#  dns-nameservers 192.168.2.1
" >> /etc/network/interfaces

systemctl restart networking

# https://wow-only.ru/2011-04-14-14-57-54/60-2011-07-22-18-49-04/1008-web-камера-зеркальное-изображение.html