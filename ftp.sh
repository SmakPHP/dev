#!/bin/bash

apt install -y vsftpd lftp

# Run script
# chmod 777 /home/trait/ftp.sh
# ls -l /home/trait/ftp.sh
# sh /home/trait/ftp.sh

# Check ftp
# lftp ftp://192.168.2.5
# login share share
# ls

username="share"
password="share"

sudo useradd -m -s /bin/bash "$username"
echo "${username}:${password}" | sudo chpasswd

# mkdir /home/$username
chmod 777 /home/$username

echo "
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
connect_from_port_20=YES

dual_log_enable=YES
log_ftp_protocol=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
xferlog_std_format=YES

chroot_local_user=YES
allow_writeable_chroot=YES
pam_service_name=vsftpd
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
" > /etc/vsftpd.conf

echo $username | tee -a /etc/vsftpd.userlist

systemctl restart vsftpd
systemctl status vsftpd
