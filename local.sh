#!/bin/bash

# Полезный софт
apt install xchm

# Ссылки для скачивания
# apt install ./name.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Просмотр установленных пакетов
apt list --installed | grep python
# Удаление программ
apt purge --auto-remove chromium-browser-stable

# Список запущенных сервисов
systemctl --type=service --state=running

# Отключение лишнего
systemctl mask --now cups
systemctl mask --now avahi-daemon
systemctl mask --now avahi-daemon.socket
systemctl mask --now wpa_supplicant
systemctl mask --now ufw

# Просмотр первых/последних 10 строк
head -10 /root/file.csv
tail -10 /root/file.csv

# Сводная информация
inxi -p -m -s -B

# Диск
lsblk





echo "
# deb https://deb.debian.org/debian bookworm contrib main non-free-firmware
deb [arch=amd64 trusted=yes] file:/home/go/debian12.5 bookworm contrib main
# " > /etc/apt/sources.list

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
