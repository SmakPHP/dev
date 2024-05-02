#!/bin/bash

# Display run privoxy: http://p.p/
echo "Run privoxy: ..."

apt install privoxy

sed -i 's/^listen-address  1.*/listen-address  192.168.1.1/g' /etc/privoxy/config
sed -i 's/^#log-messages   1.*/log-messages   1/g' /etc/privoxy/config
sed -i 's/^#debug     1.*/debug     1/g' /etc/privoxy/config

systemctl restart privoxy
systemctl enable privoxy
