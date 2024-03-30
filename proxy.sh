#!/bin/bash

# SSL Bumping in Squid
# https://notdev.ru/linux/proxy/squid-install.html

# watch -n 1 tail -10 /var/log/squid/access.log

apt install -y squid-openssl
sed -i 's/^#http_access a.*/http_access allow localnet/g' /etc/squid/squid.conf
sed -i 's/^# dns_nameservers.*/dns_nameservers 127.0.0.1/g' /etc/squid/squid.conf
systemctl restart squid
systemctl status squid

# TAG: udp_incoming_address
# udp_incoming_address 127.0.0.1

# access_log stdio:/var/log/squid/access.log squidguard
# cache_store_log stdio:/var/log/squid/store.log
# cache_log /var/log/squid/cache.log

apt install dnsmasq
systemctl enable dnsmasq

sed -i 's/^#domain-needed/domain-needed/g' /etc/dnsmasq.conf
sed -i 's/^#bogus-priv/bogus-priv/g' /etc/dnsmasq.conf
sed -i 's/^#cache-size.*/cache-size=1000/g' /etc/dnsmasq.conf
sed -i 's/^#interface.*/interface=lo/g' /etc/dnsmasq.conf
sed -i 's/^#bind-interfaces/bind-interfaces/g' /etc/dnsmasq.conf
sed -i 's/^#conf-file=\/e.*/conf-file=\/etc\/dnsmasq-hosts.conf/g' /etc/dnsmasq.conf
sed -i 's/^#expand-hosts/expand-hosts/g' /etc/dnsmasq.conf

# https://www.dmosk.ru/miniinstruktions.php?mini=dnsmasq
# https://russianpenguin.ru/2016/08/26/openwrt-блокировка-рекламы/
curl -SLso /etc/dnsmasq-hosts.conf https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnsmasq/dnsmasq.blacklist.txt

systemctl start dnsmasq
systemctl status dnsmasq

nslookup zzzzzzzzzzzzz.com 127.0.0.1
nslookup zzzzzzzzzzzzz.com

# Blocks half of the necessary sites :)
# https://github.com/maravento/blackweb
#
# wget -q -N https://raw.githubusercontent.com/maravento/blackweb/master/blackweb.tar.gz
# tar -xvzf blackweb.tar.gz -C /etc/squid
#
# # Check for repetitions !!!
# sed -i '/http_access deny manager/a\
# \
# # Domains Blacklist for Squid\
# acl blackweb dstdomain "/etc/squid/blackweb.txt"\
# http_access deny blackweb' /etc/squid/squid.conf
#
# https://adblockplus.org/
# https://github.com/jamesmacwhite/squidguard-adblock
# https://albertxyc.livejournal.com/10294.html


# Set start timeout
# mcedit /lib/systemd/system/squid.service
# TimeoutStartSec=5min
# systemctl daemon-reload
