#!/bin/bash

# Display run privoxy: http://p.p/
apt install privoxy

sed -i 's/^listen-address  1.*/listen-address  192.168.1.1/g' /etc/privoxy/config
sed -i 's/^#log-messages   1.*/log-messages   1/g' /etc/privoxy/config
sed -i 's/^#debug     1.*/debug     1/g' /etc/privoxy/config

systemctl restart privoxy
systemctl enable privoxy



#
# Dante v1.4.4
#

apt purge dante-server

wget -r -np -nH --cut-dirs=5 -R "index.html*" https://ftp.debian.org/debian/pool/main/d/dante/
rm -rf /root/dante/*_{arm64,i386,loong64,ppc64el,riscv64,s390x,armhf,armel,mips64el,mipsel}.deb

apt install ./dante-server_1.4.4+dfsg-1_*.deb

ifconfig -a
sudo ufw allow 1080/tcp

tee /etc/danted.conf <<EOF
logoutput: syslog
user.privileged: root
user.unprivileged: nobody

# Порт и интерфейс
internal: ens3 port = 1080
external: ens3

# Метод авторизации
socksmethod: username
clientmethod: none

client pass { from: 1.2.0.0/18 to: 0.0.0.0/0 }  # ...
client pass { from: 3.4.0.0/18 to: 0.0.0.0/0 }  # ...

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    command: connect
    log: error connect disconnect
}
EOF

systemctl restart danted
systemctl status danted

useradd -r -s /bin/false smak
passwd smak

curl --socks5-hostname smak:pw@1.2.3.4:1080 ipinfo.io

#
# Aвторизации Dante через отдельный файл PAM
#

apt install libpam-pwdfile whois

tee /etc/danted.conf <<EOF
# Метод авторизации PAM
socksmethod: pam.username
clientmethod: none

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    pamservicename: sockd
    command: connect
    log: error connect disconnect
}
EOF

# Заменить password на свой
# mkpasswd -m sha-512 password
# mkdir /etc/dante + 'EOF' для пароля
tee /etc/dante/passwd <<'EOF'
smak:$ ...
EOF

# Настройка PAM для Dante
tee /etc/pam.d/sockd <<EOF
auth    required pam_pwdfile.so pwdfile /etc/dante/passwd
account required pam_permit.so
EOF
