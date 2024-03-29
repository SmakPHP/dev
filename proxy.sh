#!/bin/bash

# SSL Bumping in Squid
# https://notdev.ru/linux/proxy/squid-install.html


apt install -y squid-openssl
sed -i 's/^#http_access a.*/http_access allow localnet/g' /etc/squid/squid.conf
systemctl restart squid
systemctl status squid

# access_log stdio:/var/log/squid/access.log squidguard
# cache_store_log stdio:/var/log/squid/store.log
# cache_log /var/log/squid/cache.log


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


# https://adblockplus.org/
# https://github.com/jamesmacwhite/squidguard-adblock
# https://albertxyc.livejournal.com/10294.html

# Set start timeout
# mcedit /lib/systemd/system/squid.service
# TimeoutStartSec=5min
# systemctl daemon-reload
