#!/bin/bash

# Execute bash script from link
# wget -O - https://raw.githubusercontent.com/smakphp/dev/main/d13.sh | bash
# sshpass -p "12345" ssh -D 127.0.0.1:1080 root@1.2.3.4

# Активация SSH-сервера
# systemctl start|enable sshd
apt install openssh-server
# PermitRootLogin yes
# PasswordAuthentication yes
# PermitEmptyPasswords no
mcedit /etc/ssh/sshd_config

apt update -y
apt install htop atop mc -y

sed -i 's/^#*ClientAliveInterval.*/ClientAliveInterval 20/g' /etc/ssh/sshd_config
sed -i 's/^#*ClientAliveCountMax.*/ClientAliveCountMax 10/g' /etc/ssh/sshd_config
systemctl restart sshd

# Отключение IPv6
# удалить из /etc/resolv.conf
mcedit /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"
update-grub & reboot



"""

# Использование journalctl для просмотра и анализа логов
# https://habr.com/ru/companies/ruvds/articles/533918/
# https://losst.pro/shpargalka-po-journalctl-v-linux

# Указание кода важности:
# journalctl -p 0

Для уровней важности, приняты следующие обозначения:

0: emergency (неработоспособность системы)
1: alerts (предупреждения, требующие немедленного вмешательства)
2: critical (критическое состояние)
3: errors (ошибки)
4: warning (предупреждения)
5: notice (уведомления)
6: info (информационные сообщения)
7: debug (отладочные сообщения)

# Конкретный PID:
journalctl _PID=1

# Просмотреть логи от NetworkManager
journalctl -u NetworkManager.service

# Следить за появлением новых сообщений (аналог tail -f):
journalctl -p 7 -f

# Открыть журнал «перемотав» его к последней записи
journalctl -e

"""
