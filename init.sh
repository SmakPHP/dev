#!/bin/bash

# Network Manager (Disable IPv6)
# systemctl --type=service --state=running

# apt install ./name.deb
# echo "
# deb [trusted=yes] file:/media/user/Debian%20_/ bookworm contrib main non-free-firmware
# deb https://deb.debian.org/debian bookworm contrib main non-free-firmware
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

# https://wow-only.ru/2011-04-14-14-57-54/60-2011-07-22-18-49-04/1008-web-камера-зеркальное-изображение.html
# 