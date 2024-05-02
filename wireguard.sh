#!/bin/bash

# Свой VPN сервер на Wireguard (Ubuntu 20)
# https://igancev.ru/2022-03-13-simple-and-fast-install-vpn-wireguard-docker
# https://igancev.ru/2021-02-21-vpn-wireguard-docker
# https://habr.com/ru/articles/738890/

# sh -c "$(wget https://raw.githubusercontent.com/igancev/install-wireguard-docker/master/installVpn.sh -O -)"
# docker exec -it wireguard /app/show-peer 1

# cat ~/wireguard/config/peer1/peer1.conf
# curl -s icanhazip.com

# sshpass -p 'pwd' ssh -D 1080 root@192.168.2.5 -f -N

apt install wireguard
cp test.conf /etc/wireguard/
wg-quick up test
wg show

curl ipinfo.io/ip; echo
