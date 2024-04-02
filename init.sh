#!/bin/bash

# Network Manager (Disable IPv6)
# systemctl --type=service --state=running

# apt install ./name.deb
# echo "
# deb [trusted=yes] file:/media/user/Debian%20_/ bookworm contrib main non-free-firmware
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
